package org.joonzis.controller;

import java.io.IOException;
import java.net.Inet4Address;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joonzis.service.BService;
import org.joonzis.service.BServiceImpl;
import org.joonzis.vo.BVO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/BBSController")
public class BBSController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BBSController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 파일 업로드
		String realPath = request.getServletContext().getRealPath("/upload");
		// 파일 업로드 시 MultipartRequest 객체로 전달 받음
		MultipartRequest mr = null;
		// 분기 판단
		String cmd = request.getParameter("cmd");
		System.out.println("cmd경로 " + cmd);
		if(cmd == null) {
			// 파일 업로드 시 일반 request에서 받아올 수 없기 때문에 mr 객체 생성
			mr = new MultipartRequest(
					request,
					realPath,
					1024*1024*10,
					"utf-8",
					new DefaultFileRenamePolicy()
					);
			cmd = mr.getParameter("cmd");
		}
		
		// 화면 이동 / 서블릿 요청
		// 화면으로 즉 jsp파일로 이동하는 경우 forward로,
		// 서블릿을 태우고 싶은 경우에는 redirect 사용
		boolean isForward = true;
		// 이동 경로 paths
		String path = "";
		// VO 객 체 생성
		BVO bvo = null;
		// service 객체 생성
		BService bService = new BServiceImpl();
		// 리턴 객체
		int result = 0;
		List<BVO> list = null;
		
		switch(cmd) {
		case "allList" :
			list = bService.getList();
			request.setAttribute("list", list);
			path = "/bbs/allList.jsp";
			break;
			
		case "insertBBSPage" :
			path = "/bbs/insert_page.jsp";
			break;
			
		case "insertBBS" :
			bvo = new BVO();
			bvo.setWriter(mr.getParameter("writer"));
			bvo.setPw(mr.getParameter("pw"));
			bvo.setContent(mr.getParameter("content"));
			bvo.setTitle(mr.getParameter("title"));
			//bvo.setIp(request.getRemoteAddr());// IPv6
			bvo.setIp(Inet4Address.getLocalHost().getHostAddress()); // IPv4
			
			// 첨부 파일 유무에 따라서 filename 을 결정
			if(mr.getFile("filename") != null) {
				bvo.setFilename(mr.getFilesystemName("filename"));
			}else {
				bvo.setFilename("");
			}
			
			result = bService.InsertBBS(bvo);

			System.out.println("Insert result: " + result);
			
			isForward = false;
			path = "BBSController?cmd=allList";

			break;
		}
		
		if(isForward) {
			request.getRequestDispatcher(path).forward(request, response);
		}else {
			response.sendRedirect(path);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

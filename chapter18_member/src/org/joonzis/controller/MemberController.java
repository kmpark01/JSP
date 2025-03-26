package org.joonzis.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberController() {
        super();

    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String cmd = request.getParameter("cmd");
		System.out.println("cmd : " + cmd);
		
		if(cmd == null) {
			cmd = "mainPage";
		}
		
		// 화면 이동 / 서블릿 요청
		// 화면으로 즉 jsp파일로 이동하는 경우 forward로,
		// 서블릿을 태우고 싶은 경우에는 redirect 사용
		boolean isForward = true;
		// 이동 경로 path
		String path = "";
		
		// session 객체 생성
		HttpSession session = request.getSession();
		
		switch(cmd) {
		case "mainPage" :
			path = "index.jsp";
			break;

		case "myPage" :
			path = "member/myPage.jsp";
			break;
			
		case "loginPage" :
			path = "member/loginPage.jsp";
			break;
			
		case "joinPage" :
			path = "member/joinPage.jsp";
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

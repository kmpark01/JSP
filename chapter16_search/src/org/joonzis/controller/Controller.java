package org.joonzis.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joonzis.service.EmployeeService;
import org.joonzis.service.EmployeeServiceImpl;
import org.joonzis.vo.EmployeeVO;


@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Controller() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String cmd = request.getParameter("cmd");
		
		System.out.println("cmd" + cmd);
		
		// 공용 자원
		// 이동 경로
		String path = "";
		// service 객체 생성
		EmployeeService service = new EmployeeServiceImpl();
		// 리턴 객체
		List<EmployeeVO> list = null;
		EmployeeVO vo = new EmployeeVO();
		
		switch(cmd) {
		case "allList" :
			list = service.getAll();
			request.setAttribute("list", list);
			path = "allList.jsp";
			break;
		
		case "inputDept" :
			path = "inputDept.jsp";
			break;
		
		case "deptlist" :
			String departmentIdStr = request.getParameter("department_id");
			int departmentId = Integer.parseInt(departmentIdStr); 
			vo.setDepartment_id(departmentId);
			list = service.getDept(vo);
			request.setAttribute("list", list);
			request.setAttribute("vo", vo);
			path = "deptList.jsp";
			break;
		
		case "inputDynamic" :
			path = "inputDynamic.jsp";
			break;
		
		case "dynamiclist" :
            // 동적 검색 처리
            String searchType = request.getParameter("searchType");  // 검색 유형 (예: name, department, employee)
            String searchQuery = request.getParameter("searchQuery");  // 검색어
            
         // 로그로 파라미터 값 확인
            System.out.println("searchType: " + searchType + ", searchQuery: " + searchQuery);

            list = service.getDynamicSearch(searchType, searchQuery);
            request.setAttribute("list", list);
            request.setAttribute("searchType", searchType);
            request.setAttribute("searchQuery", searchQuery);
            path = "dynamicList.jsp";
            break;
		
		}
		request.getRequestDispatcher(path).forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

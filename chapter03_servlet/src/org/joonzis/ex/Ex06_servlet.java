package org.joonzis.ex;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* 서블릿 실행
 * 호스트이름:포트번호/프로젝트이름/서블릿
 * 호스트이름:포트번호/ContextPath/URLMapping
 * URLMapping의 가본 값은 서블릿이다
 * 서블릿 이름= 본명, URLMapping = 별명
 * ex) localhost:9090/chapter03_servlet/Ex01_sevlet
 * */

@WebServlet("/pagemove")
public class Ex06_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Ex06_servlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		request.setAttribute("id", id);
		request.setAttribute("pw", pw);
		
		request.getRequestDispatcher("Ex06_output.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

package org.joonzis.ex;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/* 서블릿 실행
 * 호스트이름:포트번호/프로젝트이름/서블릿
 * 호스트이름:포트번호/ContextPath/URLMapping
 * URLMapping의 가본 값은 서블릿이다
 * 서블릿 이름= 본명, URLMapping = 별명
 * ex) localhost:9090/chapter03_servlet/Ex01_sevlet
 * */

@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public login() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		
		response.sendRedirect("/chapter03_servlet/login/showUserInfo.jsp");
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

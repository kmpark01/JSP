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

@WebServlet("/Ex04_servlet")
public class Ex04_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Ex04_servlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String[] hobbies = request.getParameterValues("hobbies");
		
		System.out.println("아이디 : " + id);
		System.out.println("비밀번호 : " + password);
		System.out.println("이름 : " + name);
		System.out.println("이메일 : " + email);
		System.out.println("성별 : " + gender);
		for(int i = 0; i < hobbies.length; i++) {
			System.out.println("아이디 : " + hobbies[i]);			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

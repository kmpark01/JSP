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

@WebServlet("/Ex05_servlet")
public class Ex05_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Ex05_servlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");	
		
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int mat = Integer.parseInt(request.getParameter("mat"));
		String grade;
		
		double avg = (double)(kor + eng + mat)/3.0;
		
		if(avg >= 90) {
			grade = "A";
		}else if(avg >= 80) {
			grade = "B";
		}else if(avg >= 70) {
			grade = "C";
		}else if(avg >= 60) {
			grade = "D";
		}else {
			grade = "F";
		}
		System.out.println("이름 :" + name);
		System.out.println("평균 :" + avg);
		System.out.println("학점 : " + grade);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

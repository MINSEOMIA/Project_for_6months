package cookieTest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyCookie1
 */
@WebServlet("/MyCookie1")
public class MyCookie1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyCookie1() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String[] hobby = request.getParameterValues("hobby");
		
		//문자열 배열 요소를 하나의 문자열로 연결. ,는 구분자
		String hobbyStr = String.join("", hobby);
		System.out.println(hobbyStr);
		//쿠키에 정보 담기
		Cookie cookie1 = new Cookie("name", name);
		Cookie cookie2 = new Cookie("age", age);
		Cookie cookie3 = new Cookie("hobby", hobbyStr);

		//쿠키를 응답에 담아 클라이언트에 전송 => 클라이언트 컴퓨터에 쿠키 저장
		response.addCookie(cookie1);
		response.addCookie(cookie2);
		response.addCookie(cookie3);
		
		RequestDispatcher dis = request.getRequestDispatcher("/cookieTest/success.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

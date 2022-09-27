package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import member.Member;
import member.Service;

/**
 * Servlet implementation class IdCheck2Controller
 */
@WebServlet("/member/IdCheck2Controller")
public class IdCheck2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IdCheck2Controller() {
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
		
		Service service = new Service();
		String id = request.getParameter("id");
		System.out.println(id);
		Member m = service.getMember(id);
		boolean flag = false;
		if (m == null) {
			flag = true;
		}
		
		JSONObject json = new JSONObject();  //{} 빈 객체 생성

		// put some value pairs into the JSON object .
		json.put("flag", flag); // 추가("키이름", 값)
		json.put("id", id);
		
		String j = json.toJSONString();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append(j);
		
//		request.setAttribute("id", id);
//		request.setAttribute("flag", flag);
//		RequestDispatcher dis = request.getRequestDispatcher("/member/checkAjax.jsp");
//		dis.forward(request, response);
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

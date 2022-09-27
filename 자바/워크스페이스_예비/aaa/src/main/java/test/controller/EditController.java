package test.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.Member;
import test.Service;

/**
 * Servlet implementation class EditController
 */
@WebServlet("/test/EditController")
public class EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //수정폼 요청
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Service service = new Service();
		
		int num = Integer.parseInt(request.getParameter("num"));
		Member m = service.getMember(num);
		request.setAttribute("m", m);
		// 뷰 페이지로 이동
		RequestDispatcher dis = request.getRequestDispatcher("/test/editForm.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Service service = new Service();
		
		int num = Integer.parseInt(request.getParameter("num"));		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		service.editMember(new Member(num, id, pwd));
		response.sendRedirect("/aaa/test/ListController");
	}

}

package product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.Product;
import product.ProductService;

/**
 * Servlet implementation class InOutController
 */
@WebServlet("/InOutController")
public class InOutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InOutController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));
		
		ProductService service = new ProductService();
		ArrayList<Product> list = service.getAll());
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("/product/editForm.jsp");
		dis.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductService service = new ProductService();
		int num = Integer.parseInt(request.getParameter("num"));
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		String type = request.getParameter("inout");
		if(type.equals("out")) {
			cnt = -cnt;
		}
		service.editAmount(num, cnt);
		response.sendRedirect("/aaa/product/ListController");

	}

}

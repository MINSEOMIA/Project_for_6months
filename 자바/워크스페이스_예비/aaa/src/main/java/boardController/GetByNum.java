package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import board.Board;
import board.Service;

/**
 * Servlet implementation class GetByNum
 */
@WebServlet("/board/getByNum")
public class GetByNum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetByNum() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Service service = new Service();
		int num = Integer.parseInt(request.getParameter("num"));
		Board b = service.getBoard(num);
		
		JSONObject json = new JSONObject();//{}. 빈 json 객체 생성

		//json에 키와 값 추가
		json.put("num", b.getNum());
		json.put("w_date", b.getW_date().toString());
		json.put("writer", b.getWriter());
		json.put("title", b.getTitle());
		json.put("content", b.getContent()); 
		
		String j = json.toJSONString();//json을 문자열로 변환. {"num":3, "w_date":2022-03-02, "writer":"aaa", "title":...}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append(j);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

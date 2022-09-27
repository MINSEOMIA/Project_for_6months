package board;

import java.util.ArrayList;

public class Service {
	private Dao dao;
	
	public Service() {
		dao = new Dao();
	}
	
	//글작성
	public void addBoard(Board b) {
		dao.insert(b);
	}
	
	//글목록
	public ArrayList<Board> getAll(){
		return dao.selectAll();
	}
}

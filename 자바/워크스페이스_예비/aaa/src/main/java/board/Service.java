package board;

import java.util.ArrayList;

public class Service {
	private Dao dao;
	
	public Service() {
		dao = new Dao();
	}
	
	//���ۼ�
	public void addBoard(Board b) {
		dao.insert(b);
	}
	
	//�۸��
	public ArrayList<Board> getAll(){
		return dao.selectAll();
	}
}

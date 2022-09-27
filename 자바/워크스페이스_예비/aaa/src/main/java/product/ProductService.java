package product;

import java.util.ArrayList;

public class ProductService {
	private ProductDao dao;
	
	public ProductService() {
		dao = new ProductDao();
	}
	
	//제품추가
	public void addProduct(Product p) {
		dao.insert(p);
	}
	
	//제품 번호로 검색
	public Product getProductByNum(int num) {
		return dao.selectByNum(num);
	}
	
	//제품명으로 검색
	public ArrayList<Product> getProductsByName(String name){
		return dao.selectByName(name);
	}
	
	//전체검색
	public ArrayList<Product> getAll(){
		return dao.selectAll();
	}

	//번호를 기준으로 이름, 가격 수정
	public void editProduct(Product p) {
		dao.update(p);
	}
	
	//수량변경
	public void editAmount(int num, int amount) {
		dao.updateAmount(num, amount);
	}
}







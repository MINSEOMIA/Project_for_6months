package product;

import java.util.ArrayList;

public class ProductService {
	private ProductDao dao;
	
	public ProductService() {
		dao = new ProductDao();
	}
	
	//��ǰ�߰�
	public void addProduct(Product p) {
		dao.insert(p);
	}
	
	//��ǰ ��ȣ�� �˻�
	public Product getProductByNum(int num) {
		return dao.selectByNum(num);
	}
	
	//��ǰ������ �˻�
	public ArrayList<Product> getProductsByName(String name){
		return dao.selectByName(name);
	}
	
	//��ü�˻�
	public ArrayList<Product> getAll(){
		return dao.selectAll();
	}

	//��ȣ�� �������� �̸�, ���� ����
	public void editProduct(Product p) {
		dao.update(p);
	}
	
	//��������
	public void editAmount(int num, int amount) {
		dao.updateAmount(num, amount);
	}
}







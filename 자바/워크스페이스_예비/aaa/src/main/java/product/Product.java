package product;

//vo. ��ǰ �ϳ��� ���� ������ ��� Ŭ����
public class Product {
	private int num;// ��ǰ��ȣ
	private String name;// ��ǰ��
	private int amount;// ����
	private int price;// ����

	// ����� ������ ��ɿ��� ����� ������
	public Product() {
	}

	// ��ǰ ��Ͻ� ����� ������
	public Product(int num, String name, int amount, int price) {
		this.num = num;
		this.name = name;
		this.amount = amount;
		this.price = price;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Product [num=" + num + ", name=" + name + ", amount=" + amount + ", price=" + price + "]";
	}

}

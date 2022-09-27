package product;

//vo. 제품 하나가 갖는 정보를 담는 클래스
public class Product {
	private int num;// 제품번호
	private String name;// 제품명
	private int amount;// 수량
	private int price;// 가격

	// 등록을 제외한 기능에서 사용할 생성자
	public Product() {
	}

	// 제품 등록시 사용할 생성자
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

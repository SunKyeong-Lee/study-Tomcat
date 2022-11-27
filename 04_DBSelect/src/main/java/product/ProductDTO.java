package product;

public class ProductDTO {
	String name;
	int count;
	
	// DTO를 사용하여 객체를 만들 때, 값을 가지고 만들수 있도록 작성
	public ProductDTO(){
		super();
	}
	public ProductDTO(String name, int count){
		this.name = name;
		this.count = count;
	}
	
	// Getter, Setter 메소드
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}
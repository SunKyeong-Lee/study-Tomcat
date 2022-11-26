package book;

public class BookDTO {
	// 데이터베이스의 필드와 동일한 이름과 자료형으로 만들기
	String title;
	int count;
	
	// 제너레이터를 통해서 getter와 setter만들기
	// 우클릭 - Source - Generate Getters and Setters
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}
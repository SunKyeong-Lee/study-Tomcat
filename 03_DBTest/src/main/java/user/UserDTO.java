package user;

public class UserDTO {
	// 데이터베이스 테이블의 칼럼과 동일
	String UserID;
	String UserPassword;
	
	// 자동완성 : 우클릭 - Source - Generate Getters and Setters
	public String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		UserID = userID;
	}
	public String getUserPassword() {
		return UserPassword;
	}
	public void setUserPassword(String userPassword) {
		UserPassword = userPassword;
	}	
}

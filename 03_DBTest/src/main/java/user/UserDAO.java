package user;

// 임포트
import java.sql.Connection;
import java.sql.PreparedStatement;

import utill.DatabaseUtill;

// database와 연결해서 가져올 쿼리문 작성 : 메소드
public class UserDAO {
	// join메소드 : userID와 userPassword를 웹에서 받아와서 DB에 insert하는 메소드
	public int join(String userID, String userPassword) {
		String SQL = "insert into user values (?, ?)";
		
		try {
			// DB에 연결해서 SQL 구문을 사용
			Connection conn = DatabaseUtill.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2,  userPassword);
			return pstmt.executeUpdate(); // 성공시 1 반환, 실패시 0 반환
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1; // 오류가 났을 때 -1 반환
	}
}

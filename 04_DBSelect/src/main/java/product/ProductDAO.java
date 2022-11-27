package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet; // 임포트

import utill.DatabaseUtill;

public class ProductDAO {
	// 데이터베이스에 값을 넣어줄 쿼리문 작성 (insert)
	public int addProduct(String name, int count){
		// SQL구문 작성
		String SQL = "insert into product values (?,?)";
		try {
			Connection conn = DatabaseUtill.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			pstmt.setInt(2, count);
			// executeUpdate를 사용해서 DB에 쿼리문 실행
			return pstmt.executeUpdate(); // 성공 : 1, 실패(쿼리문오류) : 0
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	// 데이터베이스에 값을 select할 쿼리문 작성
	// 값을 찾아서 이름과 개수를 함께 전달하기위해 ProductDTO 사용
	// name의 값을 찾아서 들고오기위해 String name값을 받아옴(1개)
	public ProductDTO selectProduct(String name) {
		// select문 작성
		String SQL = "select * from product where name=?";
		ProductDTO dto = null;
		
		try {
			// DatabaseUtill을 이용하여 연결
			Connection conn = DatabaseUtill.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			ResultSet rset = pstmt.executeQuery(); // 쿼리문을 실행해서 값을 가져옴
			
			// rset 값을 꺼내서 DTO넣어서 전달
			if(rset.next()) {
				 dto = new ProductDTO(rset.getString(1),rset.getInt(2));
			}
			return dto; // dto로 값 전달
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // 값을 가져오지 못 했을 때 null값
	}
}
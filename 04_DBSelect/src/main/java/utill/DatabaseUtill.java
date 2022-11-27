package utill;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtill {
	public static Connection getConnection() {
		try {
			// 데이터베이스와 연결하기 위해서 데이터베이스 주소와 아이디, 비밀번호 연결
			String dbURL = "jdbc:mysql://localhost:3306/JAVA";
			String dbID = "root";
			String dbPassword = "0000";
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
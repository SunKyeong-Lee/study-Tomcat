package utill;

// 임포트
import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtill {
	public static Connection getConnection() {
		// try쪽에서 오류가 났을 때, catch쪽에서 오류를 받아서 실행
		// try-catch를 사용하면 시스템이 강제로 종료되지 않는다.
		try {
			// MySQL의 데이터베이스와 연결
			// jdbc:mysql://localhost:3306/(데이터베이스)
			String dbURL = "jdbc:mysql://localhost:3306/JAVA";
			String dbID = "root";
			String dbPassword = "0000"; // 사용할 때만 작성, git에 올릴 때는 빈칸으로
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}

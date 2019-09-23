package model;

import java.sql.*;

public class TitlesDao {
	public int selectTitlesRowCount() {
		int count = 0;
		
		//데이터베이스 연결을 위한변수 선언
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		//쿼리문 생성 변경 불가
		final String sql = "select count(*) cnt from titles";
		
		//try catch문으로 예외 처리
		try {
			
			//데이터베이스 연결
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
			
			//쿼리문 저장, 실행후 결과값 저장
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				//count에 cnt값 저장
				count = rs.getInt("cnt");
			}
		}
		catch (Exception e) {
			//예외 발생시 콜솔창에 출력
			e.printStackTrace();
		}
		finally {
			try {
				//무조건 실행
				rs.close();
				stmt.close();
				conn.close();
			}
			catch (Exception e) {
				//예외 발생시 콜솔창에 출력
				e.printStackTrace();
			}
		}
		
		return count;
	}
}

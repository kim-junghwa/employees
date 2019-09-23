package model;
import java.sql.*;
import java.util.*;
import vo.*;

public class EmployeesDao {

	public List<Employees> selectEmployeesList(int limit) {
		List<Employees> list = new ArrayList<Employees>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select emp_no, birth_date, first_name, last_name, gender, hire_date from employees limit ?";
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, limit);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				Employees employees = new Employees();
				employees.setEmpNo(rs.getInt("emp_no"));
				employees.setBirthDate(rs.getString("birth_date"));
				employees.setFirstName(rs.getString("first_name"));
				employees.setLastName(rs.getString("last_name"));
				employees.setGender(rs.getString("gender"));
				employees.setHireDate(rs.getString("hire_date"));
				list.add(employees);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	public List<Employees> selectEmployeesListOrderBy(String order) {
		List<Employees> list = new ArrayList<Employees>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = null;
		if(order.equals("asc")) {
			sql = "select emp_no, birth_date, first_name, last_name, gender, hire_date from employees order by first_name asc limit 50";
		}
		else if (order.equals("desc")) {
			sql = "select emp_no, birth_date, first_name, last_name, gender, hire_date from employees order by first_name desc limit 50";
		}
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				Employees employees = new Employees();
				employees.setEmpNo(rs.getInt("emp_no"));
				employees.setBirthDate(rs.getString("birth_date"));
				employees.setFirstName(rs.getString("first_name"));
				employees.setLastName(rs.getString("last_name"));
				employees.setGender(rs.getString("gender"));
				employees.setHireDate(rs.getString("hire_date"));
				list.add(employees);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return list;
	}
	
	
	public int selectEmployeesRowCount() {
		int count = 0;
		
		//데이터베이스 연결을 위한변수 선언
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		//쿼리문 생성 변경 불가
		final String sql = "select count(*) cnt from employees";
		
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

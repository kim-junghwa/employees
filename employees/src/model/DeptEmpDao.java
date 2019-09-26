package model;

import java.sql.*;
import java.util.*;
import db.*;
import vo.Departments;
import vo.DeptEmp;
import vo.Employees;

public class DeptEmpDao {
	public int selectDeptEmpRowCount() {
		int count = 0;
		
		//데이터베이스 연결을 위한변수 선언
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		//쿼리문 생성 변경 불가
		final String sql = "select count(*) cnt from dept_emp";
		
		//try catch문으로 예외 처리
		try {
			
			//데이터베이스 연결
			conn = DBHelper.getConnection();
			
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
			DBHelper.close(rs, stmt, conn);
		}
		
		return count;
	}
	
	public List<Map<String, Object>> selectDepartmentsCountByDeptNo() {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		//데이터베이스 연결을 위한변수 선언
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		//쿼리문 생성 변경 불가
		final String sql = "select d.dept_no, d.dept_name, count(d.dept_no) " + 
							"from dept_emp de inner join departments d " + 
							"on de.dept_no = d.dept_no " + 
							"where de.to_date = '9999-01-01' " +
							"group by d.dept_no " +
							"order by count(d.dept_no) desc";
		
		//try catch문으로 예외 처리
		try {
			
			//데이터베이스 연결
			conn = DBHelper.getConnection();
			
			//쿼리문 저장, 실행후 결과값 저장
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("deptNo", rs.getString("d.dept_no"));
				map.put("deptName", rs.getString("d.dept_name"));
				map.put("cnt", rs.getInt("count(d.dept_no)"));
				list.add(map);
			}
		}
		catch (Exception e) {
			//예외 발생시 콜솔창에 출력
			e.printStackTrace();
		}
		finally {
			DBHelper.close(rs, stmt, conn);
		}

		return list;
	}
	
	public List<DeptEmp> selectDeptEmpInnerJoinList(int currentPage, int rowPerPage) {
		List<DeptEmp> list = new ArrayList<DeptEmp>();
		
		int beginRow = (currentPage - 1) * rowPerPage;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT d.dept_no, d.dept_name, e.emp_no, CONCAT(e.first_name, ' ', e.last_name) 'name', de.to_date " + 
				"FROM dept_emp de INNER JOIN employees e INNER JOIN departments d " + 
				"ON e.emp_no = de.emp_no AND de.dept_no = d.dept_no " + 
				"ORDER BY to_date asc " +
				"LIMIT ?,?";
		try {
			conn = DBHelper.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				DeptEmp deptEmp = new DeptEmp();
				deptEmp.setEmployees(new Employees());
				deptEmp.setDepartments(new Departments());
				deptEmp.getEmployees().setEmpNo(rs.getInt("e.emp_no"));
				deptEmp.getEmployees().setFirstName(rs.getString("name"));
				deptEmp.getDepartments().setDeptNo(rs.getString("d.dept_no"));
				deptEmp.getDepartments().setDeptName(rs.getString("d.dept_name"));
				deptEmp.setToDate(rs.getString("de.to_date"));
				list.add(deptEmp);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				DBHelper.close(rs, stmt, conn);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public int lastPage(int rowPerPage) {
		int lastPage = 0;
		int cnt = this.selectDeptEmpRowCount();
		
		if (cnt%rowPerPage == 0) {
			lastPage = cnt/rowPerPage;
		}
		else {
			lastPage = cnt/rowPerPage+1;
		}
		
		//System.out.println("lastPage : " + lastPage);
		
		return lastPage;
	}

	
}

package model;

import java.sql.*;
import java.util.*;
import db.*;

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
}

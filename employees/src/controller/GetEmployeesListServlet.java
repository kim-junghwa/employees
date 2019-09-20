package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vo.*;
import model.*;
import java.util.*;

@WebServlet("/employees/getEmployeesList")
public class GetEmployeesListServlet extends HttpServlet {
	private EmployeesDao employeesDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//employees 객체 생성
		employeesDao = new EmployeesDao();
		int limit = 10;
		
		//넘어온 limit값이 null이면 실행
		if (request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
		}
		//넘어온 값 확인
		//System.out.println("GetEmployeesListServelet param limit : " + limit);
		
		//List<Employees>타입의 list를 생성하고 employeesDao.selectEmployeesList(limit)값을 저장한다.
		List<Employees> list = employeesDao.selectEmployeesList(limit);
		
		//request에 넘어가는 값중 list의 이름으로 list값 저장
		request.setAttribute("list", list);
		
		//호출
		request.getRequestDispatcher("/WEB-INF/views/employees/employeesList.jsp").forward(request, response);
	}
}

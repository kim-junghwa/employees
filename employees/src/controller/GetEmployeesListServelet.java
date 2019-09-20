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

@WebServlet("/getEmployeesList")
public class GetEmployeesListServelet extends HttpServlet {
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
		System.out.println("GetEmployeesListServelet param limit : " + limit);
		
		List<Employees> list = employeesDao.selectEmployeesList(limit);
		
		request.setAttribute("limit", limit);
		request.getRequestDispatcher("/WEB-INF/views/employees/employeesList.jsp").forward(request, response);
	}
}

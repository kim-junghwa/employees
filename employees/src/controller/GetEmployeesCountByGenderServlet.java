package controller;

import model.*;
import java.util.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/employees/getEmployeesCountByGender")
public class GetEmployeesCountByGenderServlet extends HttpServlet {
	private EmployeesDao employeesDao; 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("sessionEmpNo") == null) {
			request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
			return;
		}
		employeesDao = new EmployeesDao();
		List<Map<String, Object>> list = employeesDao.selectEmployeesCountGroupByGender();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/employees/employeesCountByGender.jsp").forward(request, response);
		
	}
}

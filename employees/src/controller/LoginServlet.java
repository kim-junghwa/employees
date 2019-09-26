package controller;

import vo.*;
import model.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private EmployeesDao employeesDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		employeesDao = new EmployeesDao();
		int empNo = Integer.parseInt(request.getParameter("empNo"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		
		//System.out.println(sessionEmpNo);
		//System.out.println(firstName);
		//System.out.println(lastName);
		
		Employees employees = new Employees();
		employees.setEmpNo(empNo);
		employees.setFirstName(firstName);
		employees.setLastName(lastName);
		
		String sessionEmpNo = employeesDao.login(employees);
		
		//System.out.println(sessionEmpNo);
		
		HttpSession session = request.getSession();
		session.setAttribute("sessionEmpNo", sessionEmpNo);
		
		if (sessionEmpNo == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		response.sendRedirect(request.getContextPath() + "/");
	}
}

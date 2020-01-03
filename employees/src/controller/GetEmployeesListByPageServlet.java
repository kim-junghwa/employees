package controller;

import vo.*;
import model.*;
import java.util.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/employees/getEmployeesListByPage")
public class GetEmployeesListByPageServlet extends HttpServlet {
    private EmployeesDao employeesDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("sessionEmpNo") == null) {
			request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
			return;
		}
		employeesDao = new EmployeesDao();
		int rowPerPage = 10;
		if(request.getParameter("rowPerPage") != null) {
			rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		}
		
		int currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		if(currentPage == 0) {
			currentPage = 1;
		}
		
		List<Employees> list = employeesDao.selectEmployeesListByPage(currentPage, rowPerPage);
		int lastPage = employeesDao.lastPage(rowPerPage);
		
		int start = currentPage/10*10;
		int end = currentPage/10*10+9;
		if(start == 0) {
			start = 1;
		}
		//System.out.println("start : "+ start);
		//System.out.println("end : "+ end);
		
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("rowPerPage", rowPerPage);
		request.setAttribute("list", list);
		request.setAttribute("lastPage", lastPage);
		
		request.getRequestDispatcher("/WEB-INF/views/employees/employeesListByPage.jsp").forward(request, response);
	}
}

package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.*;
import java.util.*;
import model.*;

@WebServlet("/employees/employeesListOrderBy")
public class GetEmployeesListOrderByServlet extends HttpServlet {
	private EmployeesDao employeesDao ;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("sessionEmpNo") == null) {
			request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
			return;
		}
		//employeesDao 객체 생성
		employeesDao = new EmployeesDao();
		
		//order값 받아서 order에 저장하기
		String order = request.getParameter("order");
		//System.out.println(order);
		
		//List<Employees>타입의 변수 list에 selectEmployeesListOrderBy(order)메소드 실행후 값 저장
		List<Employees> list = employeesDao.selectEmployeesListOrderBy(order);
		
		//request에 list값 포함
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/views/employees/employeesListOrderBy.jsp").forward(request, response);
	}
}

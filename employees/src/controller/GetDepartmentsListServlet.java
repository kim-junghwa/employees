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

@WebServlet("/departments/getDepartmentsList")
public class GetDepartmentsListServlet extends HttpServlet {
	private DepartmentsDao departmentsDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		departmentsDao = new DepartmentsDao();
		
		List<Departments> list = departmentsDao.selectDepartmentsList();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/views/departments/departmentsList.jsp").forward(request, response);

	}
}

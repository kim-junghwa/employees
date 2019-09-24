package controller;

import model.*;
import java.util.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/departments/getDepartmentsCountByDeptNo")
public class GetDepartmentsCountByDeptNoServlet extends HttpServlet {
	private DeptEmpDao deptEmpDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		deptEmpDao = new DeptEmpDao();
		
		List<Map<String, Object>> list = deptEmpDao.selectDepartmentsCountByDeptNo();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/departments/departmentsCountByDeptNo.jsp").forward(request, response);
	}
}

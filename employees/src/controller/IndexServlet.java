package controller;

import model.*;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/index","/"})
public class IndexServlet extends HttpServlet {	
	private EmployeesDao employeesDao;
	private DepartmentsDao departmentsDao;
	private DeptEmpDao deptEmpDao;
	private DeptManagerDao deptManagerDao;
	private SalariesDao salariesDao;
	private TitlesDao titlesDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("/index RUL 요청");
		
		employeesDao = new EmployeesDao();
		departmentsDao = new DepartmentsDao();
		deptEmpDao = new DeptEmpDao();
		deptManagerDao = new DeptManagerDao();
		salariesDao = new SalariesDao();
		titlesDao = new TitlesDao();
		
		int employeesRowCount = employeesDao.selectEmployeesRowCount();
		int departmentsRowCount = departmentsDao.selectDepartmentsRowCount();
		int deptEmpRowCount = deptEmpDao.selectDeptEmpRowCount();
		int deptManagerRowCount = deptManagerDao.selectDeptManagerRowCount();
		int salariesRowCount = salariesDao.selectSalariesRowCount();
		int titlesRowCount = titlesDao.selectTitlesRowCount();
		
		request.setAttribute("employeesRowCoutn", employeesRowCount);
		request.setAttribute("departmentsRowCount", departmentsRowCount);
		request.setAttribute("deptEmpRowCount", deptEmpRowCount);
		request.setAttribute("deptManagerRowCount", deptManagerRowCount);
		request.setAttribute("salariesRowCount", salariesRowCount);
		request.setAttribute("titlesRowCount", titlesRowCount);
		
		// /WEB-INF/views/index.jsp
		// request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response); <- 가능
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
		rd.forward(request, response);
	}
}
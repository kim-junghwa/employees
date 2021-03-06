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
		
		//dao객체 생성
		employeesDao = new EmployeesDao();
		departmentsDao = new DepartmentsDao();
		deptEmpDao = new DeptEmpDao();
		deptManagerDao = new DeptManagerDao();
		salariesDao = new SalariesDao();
		titlesDao = new TitlesDao();
		
		//각각의 RowCount값 저장
		int employeesRowCount = employeesDao.selectEmployeesRowCount();
		int departmentsRowCount = departmentsDao.selectDepartmentsRowCount();
		int deptEmpRowCount = deptEmpDao.selectDeptEmpRowCount();
		int deptManagerRowCount = deptManagerDao.selectDeptManagerRowCount();
		int salariesRowCount = salariesDao.selectSalariesRowCount();
		int titlesRowCount = titlesDao.selectTitlesRowCount();
		int max = employeesDao.selectEmpNo("max");
		int min = employeesDao.selectEmpNo("min");
		
		/*
		 * System.out.println(employeesRowCount);
		 * System.out.println(departmentsRowCount); System.out.println(deptEmpRowCount);
		 * System.out.println(deptManagerRowCount);
		 * System.out.println(salariesRowCount); System.out.println(titlesRowCount);
		 * System.out.println(max); System.out.println(min);
		 */
		
		//request에 전송될 내용 포함
		request.setAttribute("employeesRowCount", employeesRowCount);
		request.setAttribute("departmentsRowCount", departmentsRowCount);
		request.setAttribute("deptEmpRowCount", deptEmpRowCount);
		request.setAttribute("deptManagerRowCount", deptManagerRowCount);
		request.setAttribute("salariesRowCount", salariesRowCount);
		request.setAttribute("titlesRowCount", titlesRowCount);
		request.setAttribute("maxEmpNo", max);
		request.setAttribute("minEmpNo", min);
		
		// /WEB-INF/views/index.jsp
		// request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response); <- 가능
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
		rd.forward(request, response);
	}
}
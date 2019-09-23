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
		//departmentsDao 객체 생성
		departmentsDao = new DepartmentsDao();
		
		//List<Departments>타입의 list 변수 생성후 selectDepartmentsList()메소드 실행
		List<Departments> list = departmentsDao.selectDepartmentsList();
		
		//request에 list값 포함
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/views/departments/departmentsList.jsp").forward(request, response);

	}
}

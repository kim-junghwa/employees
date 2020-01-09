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

@WebServlet("/deptEmp/getDeptEmpInnerJoinList")
public class GetDeptEmpInnerJoinListServlet extends HttpServlet {
	private DeptEmpDao deptEmpDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("sessionEmpNo") == null) {//처음 접속,로그인x
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		
		int rowPerPage = 10;
		if (request.getParameter("rowPerPage") != null) {
			rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		}
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		List<DeptEmp> list = new ArrayList<DeptEmp>();
		deptEmpDao = new DeptEmpDao();
		
		
		list = deptEmpDao.selectDeptEmpInnerJoinList(currentPage, rowPerPage);
		int lastPage = deptEmpDao.lastPage(rowPerPage);
		int start = currentPage/10*10;
		int end = currentPage/10*10+9;
		if(start == 0) {
			start = 1;
		}
		//System.out.println("start : "+ start);
		//System.out.println("end : "+ end);
		
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		
		request.setAttribute("rowPerPage", rowPerPage);
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("list", list);
		request.setAttribute("currentPage", currentPage);
		request.getRequestDispatcher("/WEB-INF/views/deptEmp/deptEmpInnerJoinList.jsp").forward(request, response);
	}
}

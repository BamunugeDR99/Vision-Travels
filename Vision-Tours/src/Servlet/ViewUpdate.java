package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Class08.Tourist;
import DBUtil.TouristDBUtill;


public class ViewUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			List <Tourist> cusDetails1 = TouristDBUtill.check(username, password);
			
			request.setAttribute("cusDetails1", cusDetails1);
			RequestDispatcher dis = request.getRequestDispatcher("Update.jsp");
			
			dis.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	

}

package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Class08.Tourist;
import DBUtil.TouristDBUtill;


@WebServlet("/TouristVeiw")
public class TouristVeiw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			List <Tourist> cusDetails = TouristDBUtill.check(username, password);
			
			request.setAttribute("cusDetails", cusDetails);
			RequestDispatcher dis = request.getRequestDispatcher("Success.jsp");
			
			dis.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}

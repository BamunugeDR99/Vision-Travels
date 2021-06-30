package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Class08.Tour;
import DBUtil.TourDBUtill;
import DBUtil.TouristDBUtill;


@WebServlet("/TouristDelete")
public class TouristDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String username = request.getParameter("username");
	
		

		boolean isSuccess = TouristDBUtill.touristDelete(username);
		
		try {	
			
			if(isSuccess == true) {
				
				String message = "Profile successfully deleted";
				request.setAttribute("message", message);
				RequestDispatcher dis = request.getRequestDispatcher("tourist_register.jsp");
				dis.forward(request, response);
			}
			else {
				RequestDispatcher dis2 = request.getRequestDispatcher("login.jsp");
				dis2.forward(request, response);
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	

}

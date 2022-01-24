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
import Class08.Tourist;
import DBUtil.TourDBUtill;
import DBUtil.TouristDBUtill;


@WebServlet("/TouristLogin")
public class TouristLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		

		List <Tour> tourDetails = TourDBUtill.getTour();
		boolean isSuccess = TouristDBUtill.loginvalidate(username, password);
		
		try {	
			
			if(isSuccess == true) {
				
				request.setAttribute("tourDetails", tourDetails);
				request.setAttribute("username", username);
				request.setAttribute("password", password);
				
				RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
				dis.forward(request, response);
			}
			else {
				String message = "User name or password is incorrect";
				request.setAttribute("message", message);
				RequestDispatcher dis2 = request.getRequestDispatcher("login.jsp");
				dis2.forward(request, response);
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
		
	

}

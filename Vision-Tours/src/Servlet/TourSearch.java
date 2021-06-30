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


@WebServlet("/TourSearch")
public class TourSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String destination = request.getParameter("desti");
		String month = request.getParameter("month");
		String person = request.getParameter("person");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		List <Tour> tourDetails = TourDBUtill.searchTour(destination, month, person);
		boolean isSuccess = TourDBUtill.validateSearch(destination, month, person);

	
		try {	
			
			if(isSuccess == true) {
				
				request.setAttribute("tourDetails", tourDetails);
				request.setAttribute("username", username);
				request.setAttribute("password", password);
				
				RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
				dis.forward(request, response);
			}
			else {
				String message = "There are no available tours";
				request.setAttribute("message", message);
				request.setAttribute("username", username);
				request.setAttribute("password", password);
				RequestDispatcher dis2 = request.getRequestDispatcher("home.jsp");
				dis2.forward(request, response);
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	

}

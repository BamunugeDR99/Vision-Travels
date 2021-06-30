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


@WebServlet("/previous")
public class previous extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		List <Tour> tourDetails = TourDBUtill.getTour();
		
		try {	
			
				request.setAttribute("tourDetails", tourDetails);
				request.setAttribute("username", username);
				request.setAttribute("password", password);
				
				RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
				dis.forward(request, response);
			
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}

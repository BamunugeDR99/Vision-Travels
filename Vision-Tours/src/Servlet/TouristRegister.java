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


@WebServlet("/TouristRegister")
public class TouristRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fName = request.getParameter("first_name");
		String lName = request.getParameter("last_name");
		String email = request.getParameter("email");
		String userName = request.getParameter("userName");
		String mobile = request.getParameter("mobile");
		String image = request.getParameter("image");
		String postal = request.getParameter("postal");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		
		

		List <Tour> tourDetails = TourDBUtill.getTour();
		boolean isTrue = TouristDBUtill.insertTourist(fName, lName, email, userName, address, mobile, image, postal, password);
		
		if(isTrue == true) {
			try {
				request.setAttribute("tourDetails", tourDetails);
				request.setAttribute("username", userName);
				request.setAttribute("password", password);
				
				RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
				
				dis.forward(request, response);
			}
			
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		else {
			String message = "Username or email already taken";
			request.setAttribute("message", message);
			RequestDispatcher dis2 = request.getRequestDispatcher("tourist_register.jsp");
			dis2.forward(request, response);
		}
		
		
		
		
	}

}

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



@WebServlet("/TouristUpdate")
public class TouristUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fName = request.getParameter("fname");
		String lName = request.getParameter("lname");
		String email = request.getParameter("email");
		String userName = request.getParameter("username");
		String mobile = request.getParameter("mobile");
		String image = request.getParameter("image");
		String postal = request.getParameter("postal");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		
		boolean isTrue = TouristDBUtill.updateTourist(fName, lName, email, userName, address, mobile, image, postal, password);
		
		if(isTrue == true) {
			try {
			List <Tourist> cusDetails = TouristDBUtill.getTouristDetails(userName);
			request.setAttribute("cusDetails", cusDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("Success.jsp");
			dis.forward(request, response);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		else {
			List <Tourist> cusDetails = TouristDBUtill.getTouristDetails(userName);
			request.setAttribute("cusDetails", cusDetails);
			
			
			RequestDispatcher dis = request.getRequestDispatcher("Success.jsp");
			dis.forward(request, response);
		}
		
	}

}

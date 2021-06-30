package DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Class08.Tour;

public class TourDBUtill {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null; 
	
public static List <Tour> getTour(){
		
		ArrayList <Tour> tour = new ArrayList<>();
		
		con = DBConnect.getConnection();
		try {
			stmt = con.createStatement();
			String sql = "SELECT * FROM tour";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				String id = rs.getString(1);
				String name = rs.getString(2);
				String destination = rs.getString(3);
				String description = rs.getString(4);
				String price = rs.getString(5);
				String travellers = rs.getString(6);
				String days = rs.getString(7);
				String month = rs.getString(8);
				String depdate = rs.getString(9);
				String agency = rs.getString(10);
				String guide = rs.getString(11);
				String image = rs.getString(12);
				
				Tour c = new Tour(id ,name, destination, description , price, travellers, days,  depdate, month, agency, guide, image);
				tour.add(c); 
				
			}

		}
		catch(Exception e) {
			e.printStackTrace();
		}
			
		return tour;
		
	}
		

public static List <Tour> searchTour(String dest, String mon, String person){
	
	ArrayList <Tour> tour = new ArrayList<>();
	
	con = DBConnect.getConnection();
	try {
		stmt = con.createStatement();
		String sql = "SELECT * FROM tour where Destination = '"+dest+"' AND AvailableMonth = '"+mon+"' AND MaxTravellers >= '"+person+"'";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			
			String id = rs.getString(1);
			String name = rs.getString(2);
			String destination = rs.getString(3);
			String description = rs.getString(4);
			String price = rs.getString(5);
			String travellers = rs.getString(6);
			String days = rs.getString(7);
			String month = rs.getString(8);
			String depdate = rs.getString(9);
			String agency = rs.getString(10);
			String guide = rs.getString(11);
			String image = rs.getString(12);
			
			Tour c = new Tour(id ,name, destination, description , price, travellers, days,  depdate, month, agency, guide, image);
			tour.add(c); 
			
		}

	}
	catch(Exception e) {
		e.printStackTrace();
	}
		
	return tour;
	
	}

public static boolean validateSearch(String dest, String mon, String person) {
	boolean isSuccess = false;
	
	try {
		stmt = con.createStatement();
		String sql = "SELECT * FROM tour where Destination = '"+dest+"' AND AvailableMonth = '"+mon+"' AND MaxTravellers >= '"+person+"'";
		
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()) {
			isSuccess = true;
		}
		else {
			isSuccess = false; 
		}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	
	return isSuccess;
}

}

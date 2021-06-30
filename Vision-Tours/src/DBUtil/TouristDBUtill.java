package DBUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Class08.Tour;
import Class08.Tourist;

public class TouristDBUtill {

	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null; 
	private static ResultSet rs1 = null; 
	
	
	public static boolean  insertTourist(String fName, String lName, String email, String userName, String address, String mobile, String image, String postal, String password) {
		
		boolean isSuccess = false;
		
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
		
			String sql1 = "SELECT * FROM tourist WHERE UserName = '"+userName+"' ";
			rs1 =stmt.executeQuery(sql1);
			
			
			if(!rs1.next()) {
				String sql = "INSERT INTO tourist VALUES (0, '"+fName+"', '"+lName+"', '"+userName+"', '"+email+"', '"+password+"', '"+mobile+"', '"+address+"', '"+postal+"', '"+image+"' )";
				int rs = stmt.executeUpdate(sql);
				
				if(rs > 0) {
					isSuccess = true;
					
				}
				else {
					isSuccess = false;
				}
				
			}
			
			else {
				isSuccess =  false;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
		
	}
	
	
public static List<Tourist> validate (String username){
		
		ArrayList<Tourist> cus = new ArrayList<>();
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
		
			String sql = "select * from tourist where username='"+username+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			
			if(rs.next()) {
				
				String id = rs.getString(1);
				String fname = rs.getString(2);
				String lname = rs.getString(3);
				String uName = rs.getString(4);
				String email = rs.getString(5);
				String password = rs.getString(6);
				String mobileNo = rs.getString(7);
				String address = rs.getString(8);
				int postal = rs.getInt(9);
				String image = rs.getString(10);
				
				Tourist c = new Tourist(id ,fname, lname, uName ,email, password, mobileNo, address, postal, image);
				cus.add(c); 
				
			}	
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
			
		return cus;
		
	}
	
	

	public static boolean updateTourist(String fName, String lName, String email, String userName, String address, String mobile, String image, String postal, String password) {
		
		boolean isSuccess = false;
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "";
				
			if(image.isEmpty() == true) {
				sql = "UPDATE tourist set FirstName = '"+fName+"', LastName = '"+lName+"', Email = '"+email+"', Password = '"+password+"', MobileNo = '"+mobile+"', Address = '"+address+"',PostalCode = '"+postal+"' WHERE UserName = '"+userName+"'";
			}
			else if(image.isEmpty() == false) {
				sql = "UPDATE tourist set FirstName = '"+fName+"', LastName = '"+lName+"', Email = '"+email+"', Password = '"+password+"', MobileNo = '"+mobile+"', Address = '"+address+"',PostalCode = '"+postal+"', Image = '"+image+"' WHERE UserName = '"+userName+"'";
			
			}
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}
			
			else {
				isSuccess = false;
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		
		return isSuccess;
		
	}
	
	public static List<Tourist> getTouristDetails(String username){
		
		
		ArrayList <Tourist> cus = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM tourist WHERE UserName = '"+username+"'";
			
			rs =stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				String id = rs.getString(1);
				String fname = rs.getString(2);
				String lname = rs.getString(3);
				String uName = rs.getString(4);
				String email = rs.getString(5);
				String password = rs.getString(6);
				String mobileNo = rs.getString(7);
				String address = rs.getString(8);
				int postal = rs.getInt(9);
				String image = rs.getString(10);
				
				Tourist c = new Tourist(id ,fname, lname, uName ,email, password, mobileNo, address, postal, image);
				cus.add(c); 
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return cus;
	}
	
	
	public static List <Tourist> check(String username, String pwd){
		
		ArrayList <Tourist> cus = new ArrayList<>();
		
		con = DBConnect.getConnection();
		try {
			stmt = con.createStatement();
			String sql = "SELECT * FROM tourist WHERE UserName = '"+username+"' AND Password = '"+pwd+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				
				String id = rs.getString(1);
				String fname = rs.getString(2);
				String lname = rs.getString(3);
				String uName = rs.getString(4);
				String email = rs.getString(5);
				String password = rs.getString(6);
				String mobileNo = rs.getString(7);
				String address = rs.getString(8);
				int postal = rs.getInt(9);
				String image = rs.getString(10);
				
				Tourist c = new Tourist(id ,fname, lname, uName ,email, password, mobileNo, address, postal, image);
				cus.add(c); 
				
			}
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return cus;
	}
	
	public static boolean loginvalidate(String username, String password) {
		boolean isSuccess = false;
		
		try {
			stmt = con.createStatement();
			String sql = "SELECT * FROM tourist WHERE UserName = '"+username+"' AND Password = '"+password+"'";

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
	
	public static boolean touristDelete(String username) {
		boolean isSuccess = false;
		
		try {
			stmt = con.createStatement();
			String sql = "DELETE FROM tourist WHERE UserName = '"+username+"'";
			
			int rs = stmt.executeUpdate(sql);
			if(rs > 0) {
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

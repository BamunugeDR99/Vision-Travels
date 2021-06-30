package DBUtil;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	private static String url = "jdbc:mysql://localhost:3306/vision_travels";
	private static String user_name = "root";
	private static String Spassword = "hesoyam250450";
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, user_name, Spassword);
		}
		catch(Exception e) {
			System.out.println("Connection is not success");
		}
		
		return con;
	}

}

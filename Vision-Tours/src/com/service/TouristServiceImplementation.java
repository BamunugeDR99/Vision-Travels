package com.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;

import com.mysql.jdbc.PreparedStatement;

import DBUtil.DBConnect;

public class TouristServiceImplementation implements ITouristService {

	private static Connection connection;
	private static Statement statement;
	
	private PreparedStatement preparedStatement;
	
	public boolean createTourTable() {
		
		boolean success = false;
		
		connection = DBConnect.getConnection();
		try {
			
			statement = connection.createStatement();
			
			String sql = "CREATE TABLE `vision_travels`.`new_table` (\r\n" + 
					"  `TourID` INT NOT NULL,\r\n" + 
					"  `TourName` VARCHAR(45) NULL,\r\n" + 
					"  `Destination` VARCHAR(45) NULL,\r\n" + 
					"  `Description` VARCHAR(45) NULL,\r\n" + 
					"  `PerPersonPrice` VARCHAR(45) NULL,\r\n" + 
					"  `MaxTravellers` VARCHAR(45) NULL,\r\n" + 
					"  `NoOfDays` INT NULL,\r\n" + 
					"  `AvailableMonth` VARCHAR(45) NULL,\r\n" + 
					"  `DepartureDate` VARCHAR(45) NULL,\r\n" + 
					"  `AgencyID` VARCHAR(45) NULL,\r\n" + 
					"  `TourGuideID` VARCHAR(45) NULL,\r\n" + 
					"  `Image` VARCHAR(255) NULL,\r\n" + 
					"  PRIMARY KEY (`TourID`));";
			
			
			boolean rs = statement.execute(sql);
			
			if(rs == true) {
				success =true;
			}
			else {
				success = false;
			}
			
			
		} catch (SQLException e) {
		
			log.log(Level.SEVERE, e.getMessage());
			
		}
		
		return success;
		
	}
	
	

}

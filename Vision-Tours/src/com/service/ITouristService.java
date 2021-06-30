package com.service;

import java.util.logging.Logger;

public interface ITouristService {
	
	public static final Logger log = Logger.getLogger(ITouristService.class.getName());
	
	public boolean createTourTable();

}

package Class08;

public class Tour {

	private String tourid;
	private String name;
	private String destination;
	private String description;
	private String price;
	private String travellers;
	private String days;
	private String depday;
	private String month;
	private String agencyid;
	private String guideid;
	private String image;
	
	
	public Tour(String tourid, String name, String destination, String description, String price, String travellers,
			String days, String depday, String month, String agencyid, String guid, String image) {
		
		this.tourid = tourid;
		this.name = name;
		this.destination = destination;
		this.description = description;
		this.price = price;
		this.travellers = travellers;
		this.days = days;
		this.depday = depday;
		this.month = month;
		this.agencyid = agencyid;
		this.guideid = guid;
		this.image = image;
	}


	public String getTourid() {
		return tourid;
	}


	public String getImage() {
		return image;
	}
	
	public String getName() {
		return name;
	}


	public String getDestination() {
		return destination;
	}


	public String getDescription() {
		return description;
	}


	public String getPrice() {
		return price;
	}


	public String getTravellers() {
		return travellers;
	}


	public String getDays() {
		return days;
	}


	public String getDepday() {
		return depday;
	}


	public String getMonth() {
		return month;
	}


	public String getAgencyid() {
		return agencyid;
	}


	public String getGuideid() {
		return guideid;
	}
	
	
}

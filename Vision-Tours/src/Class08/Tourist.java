package Class08;

public class Tourist {
	private String id;
	private String fName;
	private String lName;
	private String userName;
	private String email;
	private String password;
	private String mobile;
	private String address;
	private int code;
	private String image;
	
	public Tourist(String id, String fname, String lname, String uName, String email, String password,
			String mobileNo, String address, int postal, String image) {
		this.id = id;
		this.fName = fname;
		this.lName = lname;
		this.userName = uName;
		this.email = email;
		this.password = password;
		this.mobile = mobileNo;
		this.address = address;
		this.code = postal;
		this.image = image;
	}

	public String getid() {
		return id;
	}
	
	public String getfName() {
		return fName;
	}
	public String getlName() {
		return lName;
	}
	public String getUserName() {
		return userName;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public String getMobile() {
		return mobile;
	}
	public String getAddress() {
		return address;
	}
	public int getCode() {
		return code;
	}
	public String getImage() {
		return image;
	}

	
	
	

	
}

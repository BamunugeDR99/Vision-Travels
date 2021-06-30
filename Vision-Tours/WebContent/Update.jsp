<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<title>Update Customized Tour</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
  


.form-control {
	border-color: #eee;
	min-height: 41px;
	box-shadow: none !important;
}
.form-control:focus {
	border-color: #5cd3b4;
}
.form-control, .btn {        
	border-radius: 3px;
}
.signup-form {
	width: 650px;
	margin: 0 auto;
	padding: 30px 0;
}
.signup-form h2 {
	color: #333;
	margin: 0 0 30px 0;
	display: inline-block;
	padding: 0 30px 10px 0;
	border-bottom: 3px solid #5cd3b4;
}
.signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #fff;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}
.signup-form .form-group row {
	margin-bottom: 20px;
}
.signup-form label {
	font-weight: normal;
	font-size: 14px;
	line-height: 2;
}
.signup-form input[type="checkbox"] {
	position: relative;
	top: 1px;
}
.signup-form .btn {        
	font-size: 16px;
	font-weight: bold;
	background: #5cd3b4;
	border: none;
	margin-top: 20px;
	min-width: 140px;
}
.signup-form .btn:hover, .signup-form .btn:focus {
	background: #41cba9;
	outline: none !important;
}
.signup-form a {
	color: #5cd3b4;
	text-decoration: underline;
}
.signup-form a:hover {
	text-decoration: none;
}
.signup-form form a {
	color: #5cd3b4;
	text-decoration: none;
}	
.signup-form form a:hover {
	text-decoration: underline;
}


img {
	border-radius : 40%;
	width : 200px;
	height : 200px;
}


body {
	color: #fff;
	background-image: url("images/jose-ignacio-garcia-zajaczkowski-JIkbGM9nRp4-unsplash.jpg");
	font-family: 'Roboto', sans-serif;
	background-size: cover;
	background-repeat: no-repeat;
  background-attachment: fixed;
}

.f1{
	margin-top:-85px;
	
}
</style>
</head>
<body>
  
 
<div class="signup-form">

<center>
 <h1 style = "color : white">Update Tourist</h1>
</center>


    <form action="update" method="post" class="form-horizontal">
    
      <c:forEach var="cus" items="${cusDetails1}">
			<div class="row">
        	<div class="col-8 offset-4">
				<h2>User profile</h2>
			</div>	
      	</div>

			<center><img src="images/${cus.image}" alt = "profile-image"></center><br><br>
			
                <center><input type="file"  name="image"></center><br>
          
              <div class="form-group row">
			<label class="col-form-label col-4">User Name</label>
			<div class="col-8">
                <input type="text" class="form-control" name="username" value = "${cus.userName}" required="required" readonly = "readonly">
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-4">First name</label>
			<div class="col-8">
                <input type="text" class="form-control" name="fname" value = "${cus.fName}"required="required">
            </div>        	
        </div>
		
		<div class="form-group row">
			<label class="col-form-label col-4">Last name</label>
			<div class="col-8">
                <input type="text" class="form-control" name="lname" value = "${cus.lName}" required="required">
            </div>        	
        </div>
		
		<div class="form-group row">
			<label class="col-form-label col-4">email</label>
			<div class="col-8">
                <input type="text" class="form-control" name="email" value = "${cus.email}" required="required" readonly = "readonly" >
            </div>        	
        </div>
 
	  
	         <div class="form-group row">
			<label class="col-form-label col-4">Mobile No</label>
			<div class="col-8">
                <input type="text" class="form-control" name="mobile" value = "${cus.mobile}" pattern = "[0-9]{9}" required="required">
            </div>        	
        </div>


	  
	         <div class="form-group row">
			<label class="col-form-label col-4">address</label>
			<div class="col-8">
                <input type="text" class="form-control" name="address" value = "${cus.address}" required="required">
            </div>        	
        </div>

	  
		     <div class="form-group row">
			<label class="col-form-label col-4">Postal code</label>
			<div class="col-8">
                <input type="text" class="form-control" name="postal" value = "${cus.code}" required="required">
            </div>        	
        </div>
		
		<div class="form-group row">
			<label class="col-form-label col-4">Password</label>
			<div class="col-8">
                <input type="text" class="form-control" name="password" value = "${cus.password}" required="required">
            </div>        	
        </div>
		

		
		<div class="form-group row">
			<div class="col-8 offset-4">
				<button type="submit" class="btn btn-primary btn-lg">Update</button>
				
			</div>  
		</div>	
		      
    </form>
    
    <form action = "delete" method = "post" class = "f1">
    		<input type="hidden" name="username" value = "${cus.userName}" required="required" readonly = "readonly">	
		<center><button type="submit" style = "background-color : red;  margin-left:-35px; " class="btn btn-primary btn-lg">Delete profile</button></center>
	</form>
	</c:forEach>	
	
</div>
 
</body>
</html>
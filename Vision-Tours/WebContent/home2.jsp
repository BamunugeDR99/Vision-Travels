<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.0.1/tailwind.min.css'>
  <title>CodePen - Multi-buttons</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="images/style.css">
  <link rel="stylesheet" href="images/style1.css/"> 


<style>

body {
	color: #fff;
	background-image: url("images/198425.jpg");
	font-family: 'Roboto', sans-serif;
	background-size: cover;
	background-repeat: no-repeat;
  background-attachment: fixed;
}


img {
	border-radius : 50%;
	width : 100px;
	height : 100px;
}

input[type=button],
      input[type=submit] {
        background-color: #62529c;
        border: none;
        color: #fff;
        padding: 15px 30px;
        text-decoration: none;
        margin: 4px 2px;
        cursor: pointer;
        cursor: pointer;
  		float: left;
  		border-radius:10px;
		width:400px;
		font-size:17px;
		padding:15px;
		margin-left:100px;
        
      }
 
 input[type=button],
      input[type=submit]:hover{
      background-color: #3e8e41;
      }     
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
}

.stylename {
 font-family: Georgia, 'Roboto', sans-serif;
 font-size: 15px;
 font-style: italic;
 font-weight: bold;
 font-variant: small-caps;
 color: #006;
}

</style>




</head>
<body style = "background-color : #D0D0D0">

<c:forEach var="cus" items="${cusDetails}">
	
		<c:set var = "id" value = "${cus.id}"/>
		<c:set var = "fname" value = "${cus.fName}"/>
		<c:set var = "lname" value = "${cus.lName}"/>
		<c:set var = "uname" value = "${cus.userName}"/>
		<c:set var = "mobile" value = "${cus.mobile}"/>
		<c:set var = "email" value = "${cus.email}"/>
		<c:set var = "address" value = "${cus.address}"/>
		<c:set var = "password" value = "${cus.password}"/>
		<c:set var = "code" value = "${cus.code}"/>
		<c:set var = "image" value = "${cus.image}"/>
</c:forEach>

<p>                             </p>
<c:url value = "Success.jsp" var = "tourUpdate">
		<c:param name = "id" value = "${id}"/>
		<c:param name = "fname" value = "${fname}"/>
		<c:param name = "lname" value = "${lname}"/>
		<c:param name = "uname" value = "${uname}"/>
		<c:param name = "mobile" value = "${mobile}"/>
		<c:param name = "email" value = "${email}"/>
		<c:param name = "password" value = "${password}"/>
		<c:param name = "image" value = "${image}"/>
		<c:param name = "code" value = "${code}"/>
		<c:param name = "address" value = "${address}"/>
</c:url>


<center><h1 style = "font-size : 80px;">VISION TRAVELS</h1></center>

<div class="multi-button">


 
   <form action = "veiw" method = "post">
   	    <input type = "hidden" value = "${username}" name = "username">
   	    <input type = "hidden" value = "${password}" name = "password">
   		<input type = "submit" value = "View your profile" style = "text-transform : uppercase">
   </form>

  
  
</div>
<!-- partial -->

<br> <br>
	<table>
	<% int i = 0; %>
	
		<tr>
		<c:forEach var="tour" items="${tourDetails}">
		
		
	
		<%i = i+1;%>
		<c:set var = "id" value = "${tour.tourid}"/>
		<c:set var = "name" value = "${tour.name}"/>
		<c:set var = "destination" value = "${tour.destination}"/>
		<c:set var = "description" value = "${tour.description}"/>
		<c:set var = "price" value = "${tour.price}"/>
		<c:set var = "travellers" value = "${tour.travellers}"/>
		<c:set var = "days" value = "${tour.days}"/>
		<c:set var = "depday" value = "${tour.depday}"/>
		<c:set var = "month" value = "${tour.month}"/>
		<c:set var = "agencyid" value = "${tour.agencyid}"/>
		<c:set var = "guideid" value = "${tour.guideid}"/>
		<c:set var = "image" value = "${tour.image}"/>
	<td>
		<br><br>
		
        <div class="max-w-md md:max-w-2xl px-2">
            <div class="bg-white shadow-xl rounded-lg overflow-hidden md:flex">
                <div class="bg-cover bg-bottom h-56 md:h-auto md:w-56" style="background-image: url(images/${tour.image})">
                </div>
                <div>
                    <div class="p-4 md:p-5">
                        <p class = "stylename">${tour.name}</p>
                        <p class="text-gray-700 md:text-lg">${tour.description}</p>
                    </div>
                    <div class="p-4 md:p-5 bg-gray-100">
                        <div class="sm:flex sm:justify-between sm:items-center">
                            <div>
                                <div class="text-lg text-gray-700"><span class="text-gray-900 font-bold"> ${tour.price}</span> per person</div>
                                <div class="flex items-center">
                             
                                    <div class="text-gray-600 ml-2 text-sm md:text-base mt-1"></div>
                                </div>
                            </div>
                            <button class="button">Book Tour</button>
                        </div>
                        <div class="mt-3 text-gray-600 text-sm md:text-base">*Prices may vary depending on selected date.</div>
                    </div>
                </div>
            </div>
        </div>
		</td>
		
		<%if(i == 2){%>
			</tr>
			<tr>
			<% 
			i = 0;
			
		} %>
	
	
 </c:forEach>
 </table>
  
</body>
</html>

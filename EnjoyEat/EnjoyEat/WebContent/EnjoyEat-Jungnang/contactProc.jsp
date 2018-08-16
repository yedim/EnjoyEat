<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<style>

section.contact{
	background-color: white;
	margin:50px;
	color:#002833;
}
body{
	background-color:#fffbf2;
}

.row{

}
.column {
    float: left;
    padding: 0px 10px;
    height: 650px; 
}

.left {
  width: 50%;
  padding:80px;
  padding-top:120px;
}

.right {
  width: 50%;
  background-repeat: no-repeat;
  background-image: url("gif/contact01.gif");
  background-size: 100% 100%;
}

.row:after {
    content: "";
    display: table;
    clear: both;
}
.column>.image{
	cursor:pointer;
	width:100%;
	height:100%;
	transition:all .2s ease-in-out;
	-webkit-transition:all .2s ease-in-out;
	-moz-transition:all .2s ease-in-out;
	-ms-transition:all .2s ease-in-out;
	-o-transition:all .2s ease-in-out;
}

.column>.image:hover {
	transition:all .4s ease-in-out;
	-webkit-transition:all .4s ease-in-out;
	-moz-transition:all .4s ease-in-out;
	-ms-transition:all .4s ease-in-out;
	-o-transition:all .4s ease-in-out;
	moz-border-radius:50%;-webkit-border-radius:50%;-o-border-radius:50%;border-radius:50%
}

.title{
	font-size:1.5em; 
	font-weight:bold;
}
.smallTitle{
	font-weight:bold;
	padding-top:40px;
	padding-bottom:20px;
}
.contactForm input[type=text]{
	width:48%;
	border-radius: 4px;
	border: 1px solid #ccc;
	padding:2%;
	margin-bottom:3%;
}
.contactForm textarea{
	border-radius: 4px;
	height:200px;
	width:97%;
	padding:2%;
	border: 1px solid #ccc;
}
.contactForm input[type=button]{
	background-color:#002833;
	color:white;
	border:none;
	margin-top:5%;
	padding:10px;
	border-radius: 3px;
	cursor:pointer;
	
}
</style>
</head>
<body>
<section class="contact" style="padding-top:40px">            
  	  <div class="row">
  	  <div class="column left" >
  	  	<div class="title">Get in Touch</div>
  	  	<div class="smallTitle">Here to Answer your questions</div>
		<form class="contactForm">
			<input type="text" placeholder="Name">
			<input type="text" placeholder="Email">
			<textarea type="text" placeholder="Message"></textarea>
			<input type="button" value="send">
		</form>
  	  
  	  </div>
  	  <div class="column right" style="border:1px solid #bbb;">
  	  
  	  
</section>
</body>
</html>
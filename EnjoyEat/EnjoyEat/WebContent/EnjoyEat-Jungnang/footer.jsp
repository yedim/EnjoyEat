<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="footer.css">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
</head>
<body>
	<hr class="hrStyle">
	<footer class="subscribe">
	  <p>Join My Community</p>
	  <form  method="post" enctype="text/plain" name ="mailform"><!-- action="mailto:someone@example.com?Subject=EnjoyEat%20Subscribe" -->
		  <input type="text" class="mailAddress" placeholder="Email Address" id="mailText"><br><br>
		  <input type="button" class="mailSendBtn" value="Subscribe" onclick="mailto()"><br><br>

	  </form>
	  <a href="https://github.com/yedim" class="linkImg"> <img src = "img/logo/github.png"></img></a>     
      <a href="https://www.instagram.com/yeliimii/" class="linkImg"> <img src = "img/logo/instagram.png"></img></a> 
      <a href="https://www.facebook.com/profile.php?id=100006249077481" class="linkImg"> <img src = "img/logo/facebook.png"></img></a>
	  
	</footer>
	
	
    <footer class="footer">
      <p>Copyright 2018. 이예림 All rights reserved.</p>
    </footer>

<script>
function mailto()
{
	var mailText =document.getElementById("mailText").value;
	document.mailform.action="mailto:"+mailText+"?Subject=EnjoyEat%20Subscribe";
	document.mailform.submit();
}
</script>
</body>
</html>
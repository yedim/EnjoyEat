<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="header.css">
<link rel="stylesheet" href="style.css">

<title>Insert title here</title>
</head>
<body>


<%
	request.setCharacterEncoding("utf-8");
	String likefilePath = request.getRealPath("/EnjoyEat-Jungnang/txtfile/likeStore.txt");
	BufferedReader likebr= new BufferedReader(new FileReader(likefilePath));

	String ss=null;
	int n=-1;

	try{
		while(true){
			ss = likebr.readLine();
			if(ss==null)break;
			n++;
		}
		likebr.close();
	}catch(Exception e){	
		e.getStackTrace();
	}
%>
    <nav class="topnav">
      <a href="myPage.jsp" class="linkImg heartImg"> <img src = "dislike.png"></img> <%=n %></a>     
      <a href="index.jsp" class="logo"><img src="img/logo/logo.png"></img></a>
      <a href="myPage.jsp">MyPage</a>
      <a href="restaurant.jsp">List</a>
      <a href="best.jsp">Best</a>
    </nav>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EnjoyEat</title>
</head>
<body>
<%
	String contentpage=request.getParameter("CONTENTPAGE");

%>
	<jsp:include page="header.jsp" flush="false"></jsp:include>
	<jsp:include page="<%=contentpage %>"></jsp:include> <!-- contentpage -->
	<jsp:include page="footer.jsp" flush="false"></jsp:include>

</body>
</html>
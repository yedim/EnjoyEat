<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String saveTitle=request.getParameter("saveTitle");
	String filePath = request.getRealPath("/EnjoyEat-Jungnang/txtfile/likeStore.txt");
	BufferedWriter bw=null;
	PrintWriter writer = null;	
	
	
	if(saveTitle!=null)
	{		
		try{
			bw = new BufferedWriter(new FileWriter(filePath,true));
			writer = new PrintWriter(bw,true);	
			
			writer.println(saveTitle);
			writer.flush();
			writer.close();
		}catch(Exception e){
			out.println("지정된 파일을 찾을 수 없습니다");
		}
	}
	

%>

</body>
</html>
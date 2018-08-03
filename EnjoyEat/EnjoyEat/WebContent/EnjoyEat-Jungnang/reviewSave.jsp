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
	String saveReviewName=request.getParameter("saveReviewName");
	String saveReviewText=request.getParameter("saveReviewText");
	String reviewPath = request.getRealPath("/EnjoyEat-Jungnang/txtfile/reviews.txt");
	BufferedWriter bw=null;
	PrintWriter writer;

	if(saveTitle!=null && saveReviewText!=null && saveReviewName!=null)
	{		
		try{
			bw = new BufferedWriter(new FileWriter(reviewPath,true));
			writer = new PrintWriter(bw,true);	
			
			writer.println(saveTitle+","+saveReviewText+","+saveReviewName);
			writer.flush();
			writer.close();
		}catch(Exception e){
			out.println("지정된 파일을 찾을 수 없습니다");
		}
	}

%>
</body>
</html>
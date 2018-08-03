<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String deleteTitle=request.getParameter("deleteTitle");
	String deleteReviewName=request.getParameter("deleteReviewName");
	String deleteReviewText=request.getParameter("deleteReviewText");

	String reviewPath = request.getRealPath("/EnjoyEat-Jungnang/txtfile/reviews.txt");
	BufferedReader reviewbr= new BufferedReader(new FileReader(reviewPath));
	ArrayList<String> reveiwList= new ArrayList<String>();
	BufferedWriter bw=null;
	PrintWriter writer = null;	
	String ss=null;
	String words[];
	
	if(deleteTitle!=null)
	{
		try{
			while(true){
				ss = reviewbr.readLine();
				words= ss.split(",");
				if(ss==null)break;
				if(words[0].contains(deleteTitle) && words[1].contains(deleteReviewText) && words[2].contains(deleteReviewName)){
					
				}
				else{
					reveiwList.add(ss);
				}
						
			}
			reviewbr.close();
		}catch(Exception e){	
			e.getStackTrace();
		}
		
		try{
			bw = new BufferedWriter(new FileWriter(reviewPath,false));
			writer = new PrintWriter(bw,false);	
			
			for(int i=0; i<reveiwList.size();i++){
				writer.println(reveiwList.get(i));
			}
			writer.flush();
			writer.close();
		}catch(Exception e){
			out.println("지정된 파일을 찾을 수 없습니다");
		}
	}
%>
</body>
</html>
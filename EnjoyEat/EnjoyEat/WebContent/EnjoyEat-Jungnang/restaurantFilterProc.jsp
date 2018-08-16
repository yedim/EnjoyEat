<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="grid.css">
<link rel="stylesheet" href="restaurant.css">
<script src="selectBox.js"></script>
<title>EnjoyEat</title>
</head>
<body onload="init(this.form)">
<jsp:include page="header.jsp" flush="false"></jsp:include>
 <%
 	request.setCharacterEncoding("utf-8");
	String firstSelect=request.getParameter("firstSelect");
	String secondSelect=request.getParameter("secondSelect");
 	
	int filterIdx=0;
	//'음식종류', '지역', '가격' , '맛', '분위기'
	if(firstSelect.equals("음식종류")){filterIdx=3;}
	else if(firstSelect.equals("지역")){filterIdx=4;}
	else if(firstSelect.equals("가격")){filterIdx=5;}
	else if(firstSelect.equals("맛")){filterIdx=6;}
	else if(firstSelect.equals("분위기")){filterIdx=7;}
	
	String filePath = request.getRealPath("/EnjoyEat-Jungnang/txtfile/storeInfo.txt");
	BufferedReader br= new BufferedReader(new FileReader(filePath));
	String ss=null;
	ArrayList<String[]> strList= new ArrayList<String[]>();
	String[] words;
	String[] info=new String[14];

	try{
		while(true){
			ss = br.readLine();
			if(ss==null)break;
			words= ss.split(",");
			if(words[filterIdx].contains(secondSelect)){
				strList.add(words);
			}
		}
		br.close();
	}catch(Exception e){	
		e.getStackTrace();
	}
	
 %>
  <div class="search-container">
      <form name="form" method="post" action="restaurantFilterProc.jsp">
	      <select id="firstSelect" name="firstSelect" onchange="itemChange(this.form);"></select>
	      <select id="secondSelect" name="secondSelect"></select>
	      <button type="submit">search</button>
      </form>
 </div>
       <form name="detail" method="post" action="detailRestaurantProc.jsp">
      	<input type="hidden" name="detailTitle" value="">
      </form>
<%
	int cnt=0;
	String tmp=null;
	int i;
	int lasti=strList.size()/9+1;
	for(i=0; i<lasti; i++)//4pages
	{
		if(i==0){%> <div id="page1" class="pagecontent" ><%}
		else if(i==1){%><div id="page2" class="pagecontent" > <%}
		else if(i==2){%><div id="page3" class="pagecontent" > <%}
		else if(i==3){%><div id="page4" class="pagecontent" > <%}
		
		for(int j=0; j<9;j++)//9grid
		{
			if(cnt>=strList.size()) break;
			info = strList.get(cnt);
			
			tmp=info[0].trim();
			if(cnt==0 || cnt%3==0){
				%>
			<section class="grid-container">
			<%}
			%>		
			  <article class="grid-item">
			  <%
			  	if(tmp.contains("원데이브레드"))
			  	{%>
			  		<img src="img/원데이브레드/1.jpg" class="image" alt="">
			  	<%}
			  	else
			  	{ %>
			  	<img src="img/<%=tmp%>/1.jpg" class="image" onclick="goToDetail('<%=info[0]%>');">	
			  	<%}
			  %>
			    <div class="grid">
			      <div class="grid-star-review"><img src="star.png"><%=info[1]%></div>
			      <div class="grid-title" onclick="goToDetail('<%=info[0]%>');"><%=info[0]%></div>
			      <div><%=info[2]%></div>
			      <div><%=info[4]%>,<%=info[3]%></div>
			    </div>
			  </article>
		  <%
		  if(cnt%3==2)
		  {%>
		</section>	  
		  <%}
		  cnt++;
		}%>
		</div>
	<%}
	%>
	<section>
	  <center>
	    <button class="pagebutton" onclick="openPage('page1',this)" id="defaultOpen">1</button>
	<%
	if(lasti==2)
	{%>
	    <button class="pagebutton" onclick="openPage('page2',this)">2</button>
	<%}
	else if(lasti==3)
	{%>
	    <button class="pagebutton" onclick="openPage('page3',this)">3</button>	
	<%}
	else if(lasti==4)
	{%>
	    <button class="pagebutton" onclick="openPage('page4',this)">4</button>	
	<%}
%>
	  </center>
	</section>
<script>
	function openPage(pageName,elmnt) {
	    var i, pagecontent, pagebuttons;
	    pagecontent = document.getElementsByClassName("pagecontent");
	    for (i = 0; i < pagecontent.length; i++) {
	    	pagecontent[i].style.display = "none";
	    }
	    pagebuttons = document.getElementsByClassName("pagebutton");
	    for (i = 0; i < pagebuttons.length; i++) {
	    	pagebuttons[i].style.backgroundColor = "";
	    }
	    document.getElementById(pageName).style.display = "block";
	    elmnt.style.background="#ff9166";
	}
	document.getElementById("defaultOpen").click();
	
	function goToDetail(title){
		 var form = document.detail;
	     form.detailTitle.value=title;
	     form.submit();
	}
</script>
	<jsp:include page="footer.jsp" flush="false"></jsp:include>

</body>
</html>
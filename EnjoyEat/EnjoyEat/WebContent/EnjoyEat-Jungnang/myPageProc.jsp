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
<title>EnjoyEat</title>
<style>


header.contentTitle{
  padding:3%;
  padding-left:5%;
  text-align:center;
  padding-top:70px;
  font-size:1.6em;
  font-weight:bold;
  
}

.contentTitle a:hover{
 	color:#ff9166;
}

section.myStore,.todayStore,.ateStore{
	background-color: white;
	margin:5%;
	color:#002833;
}

.row{
	padding:3% 5%;
	padding-bottom:4%;
}

.column {
    float: left;
    padding: 0px 10px;
    height: 300px; 
}

.left {
  width: 25%;
}

.right {
  width: 75%;
  padding:20px;
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

</style>
</head>
<body>

	
 <%
 	request.setCharacterEncoding("utf-8");	
	String filePath = request.getRealPath("/EnjoyEat-Jungnang/txtfile/storeInfo.txt");
	String likefilePath = request.getRealPath("/EnjoyEat-Jungnang/txtfile/likeStore.txt");
	String checkfilePath = request.getRealPath("/EnjoyEat-Jungnang/txtfile/checkStore.txt");

	BufferedReader br= new BufferedReader(new FileReader(filePath));
	BufferedReader likebr= new BufferedReader(new FileReader(likefilePath));
	BufferedReader checkbr= new BufferedReader(new FileReader(checkfilePath));

	String ss=null;
	ArrayList<String[]> strList= new ArrayList<String[]>();
	ArrayList<String> likestrList= new ArrayList<String>();
	ArrayList<String> checkstrList= new ArrayList<String>();
	ArrayList<String[]> strCheckList= new ArrayList<String[]>();

	String[] words;
	String[] info=new String[14];

	int n=0;
	String tmp=null;

	//likeStore에 있는거 다 넣어
	try{
		while(true){
			ss = likebr.readLine();
			if(ss==null)break;
			if(n!=0)
				likestrList.add(ss);	
			n++;
		}
		likebr.close();
	}catch(Exception e){	
		e.getStackTrace();
	}
	
	n=0;
	try{
		while(true){
			ss = checkbr.readLine();
			if(ss==null)break;
			if(n!=0)
				checkstrList.add(ss);	
			n++;
		}
		checkbr.close();
	}catch(Exception e){	
		e.getStackTrace();
	}
	
	try{
		while(true){
			ss = br.readLine();
			if(ss==null)break;
			words= ss.split(",");
			for(int i=0; i<likestrList.size(); i++)
			{
				if(words[0].contains(likestrList.get(i))){
					strList.add(words);
				}
			}	
			
			for(int i=0; i<checkstrList.size(); i++)
			{
				if(words[0].contains(checkstrList.get(i))){
					strCheckList.add(words);
				}
			}	
			
		}
	}catch(Exception e){	
		e.getStackTrace();
	}
	
	
 %>
      <form name="detail" method="post" action="detailRestaurantProc.jsp">
      	<input type="hidden" name="detailTitle" value="">
      </form>
      
        <section class="todayStore" style="padding-top:40px">
	      <header class="contentTitle" >
		         <p id="recommend"></p>
	      </header>
	      <script>
			var i = 0;
			var txt = '오늘의 추천 맛집';
			var speed = 50;
			
			function typeTitle() {
			  if (i < txt.length) {
			    document.getElementById("recommend").innerHTML += txt.charAt(i);
			    i++;
			    setTimeout(typeTitle, speed);
			  }
			}
			typeTitle();
			</script>
	      
	      
	      <div class="row">
			<%
				Random rand = new Random();
				int randNum;
				randNum= rand.nextInt(likestrList.size());
				info = strList.get(randNum);
				tmp=info[0].trim();
			%>
			  <div class="column left" >
			 
			  <%if(tmp.contains("원데이브레드"))
			  	{%>
			  		<img src="img/원데이브레드/1.jpg" class="image"  onclick="goToDetail('원데이브레드');">
			  	<%}
			  else
			  {
				  %>
				 	<img src="img/<%=tmp%>/1.jpg" class="image" onclick="goToDetail('<%=info[0]%>');">	
				  <%
			  }
			  %>
			  </div>
			  <div class="column right" style="border:1px solid #bbb;">
			   <div style="font-size:1.6em"><%=info[0]%></div>
			   	<div><%=info[2]%></div>
			   <div><%=info[4]%>,<%=info[3]%></div><br>
			   <div style="font-style:italic">" <%=info[14] %> "</div>
			  </div>
		</div>
      </section>
      
      
      <section class="myStore" >
      <header class="contentTitle" >
	         내가 담은 맛집
      </header>
      
<%
	int cnt=0;
	int i;
	int lasti=strList.size()/9+1;
	for(i=0; i<lasti; i++)//4pages
	{
		if(i==0){%> <div id="page1" class="pagecontent myPage" ><%}
		else if(i==1){%><div id="page2" class="pagecontent myPage" > <%}
		else if(i==2){%><div id="page3" class="pagecontent myPage" > <%}
		else if(i==3){%><div id="page4" class="pagecontent myPage" > <%}
		
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
	
	<section class="ateStore" >
      <header class="contentTitle" >
	         내가 먹어본 맛집
      </header>
      <div>
<%
	cnt=0;
		for(int j=0; j<9;j++)//9grid
		{
			if(cnt>=strCheckList.size()) break;
			info = strCheckList.get(cnt);
			
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
	
	function goToDetail(title)
	{
		 var form = document.detail;
	     form.detailTitle.value=title;
	     form.submit();
	}
	</script>
</body>
</html>
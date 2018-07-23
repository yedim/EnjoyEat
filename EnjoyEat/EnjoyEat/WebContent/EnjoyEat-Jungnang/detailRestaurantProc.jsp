<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="slideshow.css">
<link rel="stylesheet" href="detailRestaurant.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d0b3847034c27c026c1b898dfb931716"></script>
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
	String detailTitle=request.getParameter("detailTitle");
	System.out.println(detailTitle);

	String filePath = request.getRealPath("/EnjoyEat-Jungnang/txtfile/storeInfo.txt");
	String likefilePath = request.getRealPath("/EnjoyEat-Jungnang/txtfile/likeStore.txt");

	BufferedReader br= new BufferedReader(new FileReader(filePath));
	BufferedReader likebr= new BufferedReader(new FileReader(likefilePath));

	ArrayList<String> likestrList= new ArrayList<String>();

	String ss=null;
	String[] words;
	String[] info=new String[17];

	int n=0;
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
	
	if(detailTitle!=null)
	{
		try{
			while(true){
				ss = br.readLine();
				if(ss==null)break;
				words= ss.split(",");
				if(words[0].contains(detailTitle)){
					info=words;
					break;
				}
			}
			br.close();
		}catch(Exception e){	
			e.getStackTrace();
		}
	}	
%>
	<jsp:include page="header.jsp" flush="false"></jsp:include>

      <!--지도  -->
    <section id="map"></section>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(<%=info[15]%>, <%=info[16]%>), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
		
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(<%=info[15]%>, <%=info[16]%>); 
		
		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>
	
    <section>
      <article class="slideshow-container">
        <%
        	if(info[0].contains("원데이브레드")){
			 %>
			 <div class="mySlides fade">
			   <img src="img/원데이브레드/1.jpg">
			 </div>
			 <div class="mySlides fade">
	          <img src="img/원데이브레드/2.jpg">
	        </div>
	        <div class="mySlides fade">
	          <img src="img/원데이브레드/3.jpg" >
	        </div>
			<%}
        	else
		  	{ %>
          	 <div class="mySlides fade">
			   <img src="img/<%=info[0]%>/1.jpg">
			 </div>
			 <div class="mySlides fade">
	          <img src="img/<%=info[0]%>/2.jpg" >
	        </div>
	        <div class="mySlides fade">
	          <img src="img/<%=info[0]%>/3.jpg" >
	        </div>
		  	<%}
        %>
        
      <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
      <a class="next" onclick="plusSlides(1)">&#10095;</a>
      <div style="text-align:center">
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
      </div>
      </article>
    </section>

    <section class="info">
      <article class="storeInfo">
        <header><%=info[0]%></header>
        <div class="heartarea">
        <%
        boolean isLikeStore=false;
        	for(int i=0; i<likestrList.size();i++)
        	{
        		if(info[0].contains(likestrList.get(i))){
        			isLikeStore=true;
        		}
        	}
        	
        	if(isLikeStore==true){
        		%>
        		<img src="like.png" class="heart" name="heart" onclick="changeImage('<%=info[0]%>');">
        		<%
        	}
        	else{
        		%>
        		<img src="dislike.png" class="heart" name="heart" onclick="changeImage('<%=info[0]%>');">
        		<%
        	}
        	
        	String menuInfoData1[]=info[12].split(" ");
        	String menuInfoData2[]=info[13].split(" ");
        %>
        </div>
        <div><%=info[2]%></div>
        <div><%=info[4]%>,<%=info[3]%></div>
      </article>

      <article class="detailInfo">
        <header>맛집정보 </header>
        <table id="detailTable">
			  <tr><td>주소</td>      <td><%=info[8]%></td></tr>
			  <tr><td>전화번호</td>   <td><%=info[9]%></td></tr>
			  <tr><td>영업시간</td>   <td><%=info[10]%></td></tr>
			  <tr><td>가격대</td>    <td><%=info[5]%></td></tr>
			  <tr><td>맛</td>       <td><%=info[6]%></td></tr>
			  <tr><td>분위기</td>     <td><%=info[7]%></td></tr>
			  <tr><td>태그</td>       <td><%=info[11]%></td></tr>
		  </table> 
			
      </article>

      <article class="menuinfo">
      <header>메뉴정보</header>
      <table id="menuTable">
		  <tr>
		    <th>메뉴</th>
		    <th>가격</th>
		  </tr>
		  <tr>
		    <td><%=menuInfoData1[0] %></td>
		    <td><%=menuInfoData1[1] %></td>
		  </tr>
		  <tr>
		    <td><%=menuInfoData2[0] %></td>
		    <td><%=menuInfoData2[1] %></td>
		  </tr>
	</table>
      </article>

      <article class="review">
      <header>솔직한 평가</header>
		<table class="reveiwTable">
			<tr>
			    <td rowspan="3"><img src="images.jpg" class="reviewer"></td>
			    <td class="reviewTd">작성자</td>
			    <td>이예림</td>
			</tr>
			<tr>
			    <td class="reviewTd"><img src="star.png"></td>
			    <td><%=info[1]%></td>
			</tr>
			<tr>
			   <td class="reviewTd">리뷰 </td>
			   <td><%=info[14] %></td>
			</tr>
		</table>
      </article>

		<form name="fileSend" method="post" action="likeSave.jsp">
			<input type="hidden" name="saveTitle" value="" />
		</form>
		<iframe id="hidden" name="hiddenifr" src="likeSave.jsp">	
		</iframe>
		
		<form name="fileDelete" method="post" action="likeDelete.jsp">
			<input type="hidden" name="deleteTitle" value="" />
		</form>
		<iframe id="hidden" name="deletehiddenifr" src="likeDelete.jsp">	
		</iframe>

    </section>

    
    <script>
    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
      showSlides(slideIndex += n);
    }

    function currentSlide(n) {
      showSlides(slideIndex = n);
    }

    function showSlides(n) {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("dot");
      if (n > slides.length) {slideIndex = 1}
      if (n < 1) {slideIndex = slides.length}
      for (i = 0; i < slides.length; i++) {
          slides[i].style.display = "none";
      }
      for (i = 0; i < dots.length; i++) {
          dots[i].className = dots[i].className.replace(" active", "");
      }
      slides[slideIndex-1].style.display = "block";
      dots[slideIndex-1].className += " active";
    }

    var form;
    var heartState=document.heart.src;
    function changeImage(title)
    {
        if(heartState.includes("dislike.png")){
          document.heart.src="like.png";
          form=document.fileSend;
          form.saveTitle.value=title;
          form.target="hiddenifr";
          form.submit();
          alert("음식이 저장되었습니다");
        }
        else if(heartState.includes("like.png")){
            document.heart.src="dislike.png";
            form=document.fileDelete;
            form.deleteTitle.value=title;
            form.target="deletehiddenifr";
            form.submit();
            alert("음식이 삭제되었습니다 ");
        }        
 		window.location.reload();
 	}
    </script>
    <jsp:include page="footer.jsp" flush="false"></jsp:include>
    
</body>
</html>
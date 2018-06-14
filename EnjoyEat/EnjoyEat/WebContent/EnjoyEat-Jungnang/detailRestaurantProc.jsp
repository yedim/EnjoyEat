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

<title>Insert title here</title>
</head>

<body>
<%
	request.setCharacterEncoding("utf-8");
	String detailTitle=request.getParameter("detailTitle");
	System.out.println(detailTitle);

	String filePath = request.getRealPath("/EnjoyEat-Jungnang/txtfile/storeInfo.txt");
	BufferedReader br= new BufferedReader(new FileReader(filePath));
	String ss=null;
	String[] words;
	String[] info=new String[15];

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
	for(int i=0; i<info.length;i++)
	{
		System.out.println(i+" "+info[i]);
	}
	
%>
	<jsp:include page="header.jsp" flush="false"></jsp:include>

      <!--지도  -->
    <section class="map">
      <div class="">지도</div>
    </section>
    <!-- slideshow  -->
    <section>
      <div class="slideshow-container">
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
      </div>
    </section>

    <section class="info">
      <article class="storeInfo">
        <div class="grid-title"><%=info[0]%></div>
        <div class="heartarea">
          <img src="dislike.png" class="heart" name="heart" onclick="changeImage();">
        </div>
        <div class=""><%=info[2]%></div>
        <div class=""><%=info[4]%>,<%=info[3]%></div>
      </article>

      <article class="detailInfo">
        <header>맛집정보 </header>
          <div class="">주소 : <%=info[8]%></div>
          <div class="">전화번호 : <%=info[9]%></div>
          <div class="">영업시간 : <%=info[10]%></div>
          <div class="">가격대 : <%=info[5]%></div>
          <div class="">맛 : <%=info[6]%></div>
          <div class="">분위기 : <%=info[7]%></div>
          <div class="">태그 : <%=info[11]%></div>
      </article>

      <article class="menuinfo">
      <header>메뉴정보</header>
      <div><%=info[12]%></div>
      <div><%=info[13]%></div>

      </article>

      <article class="review">
      <header>솔직한 평가</header>
      <span>
        <img src="images.jpg" class="reviewer">
      </span>
      <span style="vertical-align:top">평점 : <%=info[1]%><%=info[14] %>
      </span>
      </article>

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

    var heartState=0;
    function changeImage()
    {
        if(heartState==0){
          document.heart.src="like.png";
          heartState=1;
        }
        else {
            document.heart.src="dislike.png";
            heartState=0;
        }
    }
    </script>
    <jsp:include page="footer.jsp" flush="false"></jsp:include>
    
</body>
</html>
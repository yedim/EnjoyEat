<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="index.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="grid.css">
<link rel="stylesheet" href="slideshow.css">
<!-- <script src="gotoTop.js"></script>-->
<title>Insert title here</title>
</head>
<body>

	<!--detailRestaurantProc.jsp 으로 값 전달 -->
	 <form name="detail" method="post" action="detailRestaurantProc.jsp">
	      	<input type="hidden" name="detailTitle" value="">
	  </form>
	  
	<section id="titleSection">
		<header>
		 <h1 class="title"><span>E</span><span>n</span><span>j</span><span>o</span><span>y</span><span> 
       </span><span>E</span><span>a</span><span>t</span></h1>
		</header>
       <button class="buttonStart" type="button" name="button" onclick ="location.href='restaurant.jsp'">Enjoy!</button>
    </section>
    
    <!--Best-->
    <section class="best" id="firstBest">
      <header class="contentTitle" >
         BEST
        <a href="best.jsp" class="contentDetails"> > show all</a>
      </header>
     
      <section class="grid-container" >
        <a class="bestPrev" onclick="plusBestSlides('firstBest')">&#10094;</a>
        <a class="bestNext" onclick="plusBestSlides('secondBest')">&#10095;</a>
	        <article class="grid-item">
		    <img src="img/스시고메이/1.jpg" onclick="goToDetail('스시고메이');">
		    <div class="grid">
		      <div class="grid-star-review"><img src="star.png">4.9</div>
		      <div class="grid-title" onclick="goToDetail('스시고메이');">1위 스시고메이</div>
		      <div>스시/아이스크림</div>
		      <div>묵동, 회/스시</div>
		    </div>
		  </article>
		  <article class="grid-item ">
		    <img src="img/와따곱창/1.jpg" onclick="goToDetail('와따곱창');">
		    <div class="grid">
		      <div class="grid-star-review"><img src="star.png">4.8</div>
		      <div class="grid-title"  onclick="goToDetail('와따곱창');">2위 와따곱창</div>
		      <div>야채곱창/순대곱창</div>
		      <div>묵동,고기</div>
		    </div>
		  </article>
		  <article class="grid-item">
		    <img src="img/동촌/1.jpg" onclick="goToDetail('동촌');">
		    <div class="grid">
		      <div class="grid-star-review"><img src="star.png">4.7</div>
		      <div class="grid-title" onclick="goToDetail('동촌');">3위 동촌</div>
		      <div >돈가스/비빔밥</div>
		      <div >중화동, 한식</div>
		    </div>
		  </article>
    	</section>
    </section>
 
	 <section class="best" id="secondBest" style="display:none">
	      <header class="contentTitle" >
	         BEST
	        <a href="best.jsp" class="contentDetails"> > show all</a>
	      </header>
	  	  <section class="grid-container" >
	  	  <a class="bestPrev" onclick="plusBestSlides('firstBest')">&#10094;</a>
	        <a class="bestNext" onclick="plusBestSlides('secondBest')">&#10095;</a>
		  <article class="grid-item">
			    <img src="img/스시남/1.jpg" onclick="goToDetail('스시남');">
			    <div class="grid">
			      <div class="grid-star-review"><img src="star.png">4.6</div>
			      <div class="grid-title" onclick="goToDetail('스시남');">4위  스시남</div>
			      <div>스시/우동</div>
			      <div>묵동, 회/스시</div>
			    </div>
			  </article>
			   <article class="grid-item">
			    <img src="img/애슐리/1.jpg" onclick="goToDetail('애슐리');">
			    <div class="grid">
			      <div class="grid-star-review"><img src="star.png">4.6</div>
			      <div class="grid-title" onclick="goToDetail('애슐리');">5위  애슐리</div>
			      <div >디저트/샐러드/피자</div>
			      <div >상봉동,뷔페</div>
			    </div>
			  </article> <article class="grid-item">
			    <img src="img/병규돈까스/1.jpg" onclick="goToDetail('병규돈까스');">
			    <div class="grid">
			      <div class="grid-star-review"><img src="star.png">4.6</div>
			      <div class="grid-title" onclick="goToDetail('병규돈까스');">6위  병규돈까스</div>
			      <div >돈까스/치즈</div>
			      <div >묵동, 한식</div>
			    </div>
			  </article>
		  </section>
	  </section>
	  
  	<section class="theme">
      <header class="contentTitle">
        THEME
        <a href="restaurant.jsp" class="contentDetails"> > show all</a>
      </header>

      <article class="grid-theme">
        <div onclick="goToFilter('음식종류','빵')">빵순이를 위한 맛집</div>
        <div onclick="goToFilter('맛','매콤')">매콤한 맛집</div>
        <div onclick="goToFilter('분위기','고급스런')">분위기 있는 맛집 </div>
        <div onclick="goToFilter('음식종류','한식')">든든한 한식 맛집</div>
        <div onclick="goToFilter('맛','달달')">달달한 디저트 맛집</div>
        <div onclick="goToFilter('가격','만원미만')">가성비 좋은 맛집</div>
        <div onclick="goToFilter('맛','건강')">건강한 친환경 맛집</div>
        <div onclick="goToFilter('지역','묵동')">집과 가까운 묵동 맛집</div>
      </article>
    </section>
    
      <form name="filterForm" method="post" action="restaurantFilterProc.jsp">
	      <input type="hidden" id="firstSelect" name="firstSelect" value=""></select>
	      <input type="hidden" id="secondSelect" name="secondSelect" value=""></select>
      </form>
    
    <button onclick="topFunction()" id="topBtn" title="Go to top"><img src = "top-arrow.png"></img></button>
    
  
<script>
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) { //스크롤하면 top으로 갈 수 있는 버튼 생김
        document.getElementById("topBtn").style.display = "block";
    }
    else{
        document.getElementById("topBtn").style.display = "none";
	}
}

function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}

function goToFilter(first,second){
	 var form = document.filterForm;
     form.firstSelect.value=first;
     form.secondSelect.value=second;
     form.submit();
}

function goToDetail(title){
	 var form = document.detail;
     form.detailTitle.value=title;
     form.submit();
}

var myIndex = 0;
autoslide();

function autoslide() {
    var i;
    var x = document.getElementById("titleSection");
    myIndex++;
    if (myIndex > 4) {myIndex = 0;}  
    
    if(myIndex==1){ x.style.backgroundImage = "url('gif/delicious01.gif')";}
    else if(myIndex==2){ x.style.backgroundImage = "url('gif/delicious02.gif')";}
    else if(myIndex==3){ x.style.backgroundImage = "url('gif/delicious03.gif')";}
    else if(myIndex==4){ x.style.backgroundImage = "url('gif/delicious04.gif')";}
    setTimeout(autoslide, 7000); // 7초마다
}

function plusBestSlides(id){
	var Slide = document.getElementById(id);
	if(id=='firstBest'){
		document.getElementById("firstBest").style.display = "block";
		document.getElementById("secondBest").style.display = "none";
	}
	else if(id=='secondBest'){
		document.getElementById("firstBest").style.display = "none";
		document.getElementById("secondBest").style.display = "block";
	}
}
</script>
	
</body>
</html>
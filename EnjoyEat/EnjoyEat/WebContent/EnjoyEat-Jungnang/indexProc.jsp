<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="index.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="grid.css">
<link rel="stylesheet" href="slideshow.css">

<title>Insert title here</title>
</head>
<body>
 <form name="detail" method="post" action="detailRestaurantProc.jsp">
      	<input type="hidden" name="detailTitle" value="">
  </form>
	<header class="title">
       <h1>EnjoyEat</h1>
       <button class="buttonStart" type="button" name="button" onclick ="location.href='restaurant.jsp'">Enjoy!</button>
    </header>
    
    <section class="best">
      <header class="contentTitle">
         BEST
        <a href="#" class="contentDetails"> >자세히 보기</a>
      </header>
     
      <section class="grid-container" >
       <a class="bestPrev" onclick="plusBestSlides(-1)">&#10094;</a>
        <a class="bestNext" onclick="plusBestSlides(1)">&#10095;</a>
	        <article class="grid-item">
		    <img src="img/스시고메이/1.jpg" onclick="goToDetail('스시고메이');">
		    <div class="grid">
		      <div class="grid-star-review">4.9</div>
		      <div class="grid-title" onclick="goToDetail('스시고메이');">1위 스시고메이</div>
		      <div>스시/아이스크림</div>
		      <div>묵동, 회/스시</div>
		    </div>
		  </article>
		  <article class="grid-item ">
		    <img src="img/와따곱창/1.jpg" onclick="goToDetail('와따곱창');">
		    <div class="grid">
		      <div class="grid-star-review">4.8</div>
		      <div class="grid-title"  onclick="goToDetail('와따곱창');">2위 와따곱창</div>
		      <div>야채곱창/순대곱창</div>
		      <div>묵동,고기</div>
		    </div>
		  </article>
		  <article class="grid-item">
		    <img src="img/동촌/1.jpg" onclick="goToDetail('동촌');">
		    <div class="grid">
		      <div class="grid-star-review">4.7</div>
		      <div class="grid-title"  onclick="goToDetail('동촌');">3위 동촌</div>
		      <div >돈가스/비빔밥</div>
		      <div >중화동, 한식</div>
		    </div>
		  </article>
    </section>
  </section>
    
  
  <section class="theme">
      <header class="contentTitle">
        THEME
        <a href="#" class="contentDetails"> >자세히 보기</a>
      </header>

      <article class="grid-theme">
        <div>시</div>
        <div>은</div>
        <div>사</div>
        <div>랑</div>
        <div>해</div>
        <div>영</div>
        <div>원</div>
        <div>히</div>
      </article>
    </section>
  
<script>
function goToDetail(title)
{
	 var form = document.detail;
     form.detailTitle.value=title;
     form.submit();
}
</script>
	

 
</body>
</html>
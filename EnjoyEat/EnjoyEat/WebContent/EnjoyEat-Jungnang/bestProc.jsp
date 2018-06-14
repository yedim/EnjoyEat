<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="grid.css">
<title>Insert title here</title>
</head>
<body>
 <form name="detail" method="post" action="detailRestaurantProc.jsp">
      	<input type="hidden" name="detailTitle" value="">
  </form>
<section class="grid-container" style="margin-top:70px;">
	  <article class="grid-item">
	    <img src="img/스시고메이/1.jpg" onclick="goToDetail('스시고메이');">
	    <div class="grid">
	      <div class="grid-star-review">4.9</div>
	      <div class="grid-title" onclick="goToDetail('스시고메이');">스시고메이</div>
	      <div>스시/아이스크림</div>
	      <div>묵동, 회/스시</div>
	    </div>
	  </article>
	  <article class="grid-item ">
	    <img src="img/와따곱창/1.jpg" onclick="goToDetail('와따곱창');">
	    <div class="grid">
	      <div class="grid-star-review">4.8</div>
	      <div class="grid-title"  onclick="goToDetail('와따곱창');"> 와따곱창</div>
	      <div>야채곱창/순대곱창</div>
	      <div>묵동,고기</div>
	    </div>
	  </article>
	  <article class="grid-item">
	    <img src="img/동촌/1.jpg" onclick="goToDetail('동촌');">
	    <div class="grid">
	      <div class="grid-star-review">4.7</div>
	      <div class="grid-title"  onclick="goToDetail('동촌');"> 동촌</div>
	      <div >돈가스/비빔밥</div>
	      <div >중화동, 한식</div>
	    </div>
	  </article>
	  
	 <article class="grid-item">
	    <img src="img/스시남/1.jpg" onclick="goToDetail('스시남');">
	    <div class="grid">
	      <div class="grid-star-review">4.6</div>
	      <div class="grid-title" onclick="goToDetail('스시남');"> 스시남</div>
	      <div >스시/우동</div>
	      <div >묵동, 회/스시</div>
	    </div>
	  </article>
	   <article class="grid-item">
	    <img src="img/애슐리/1.jpg" onclick="goToDetail('애슐리');">
	    <div class="grid">
	      <div class="grid-star-review">4.6</div>
	      <div class="grid-title" onclick="goToDetail('애슐리');"> 애슐리</div>
	      <div >디저트/샐러드/피자</div>
	      <div >상봉동,뷔페</div>
	    </div>
	  </article> <article class="grid-item">
	    <img src="img/병규돈까스/1.jpg" onclick="goToDetail('병규돈까스');">
	    <div class="grid">
	      <div class="grid-star-review">4.6</div>
	      <div class="grid-title" onclick="goToDetail('병규돈까스');"> 병규돈까스</div>
	      <div >돈까스/치즈</div>
	      <div >묵동, 한식</div>
	    </div>
	  </article>
	  
	  <article class="grid-item">
	    <img src="img/하루초밥/1.jpg" onclick="goToDetail('하루초밥');">
	    <div class="grid">
	      <div class="grid-star-review">4.5</div>
	      <div class="grid-title"  onclick="goToDetail('하루초밥');"> 하루초밥</div>
	      <div >초밥/피자/새우장</div>
	      <div >묵동, 회/스시</div>
	    </div>
	  </article>
	   <article class="grid-item">
	    <img src="img/라떼플로라/1.jpg" onclick="goToDetail('라떼플로라');">
	    <div class="grid">
	      <div class="grid-star-review">4.5</div>
	      <div class="grid-title" onclick="goToDetail('라떼플로라');"> 라떼플로라</div>
	      <div >꽃/커피/생초콜릿</div>
	      <div >묵동, 카페</div>
	    </div>
	  </article> <article class="grid-item">
	    <img src="img/명량핫도그/1.jpg"  onclick="goToDetail('명량핫도그');">
	    <div class="grid">
	      <div class="grid-star-review">4.5</div>
	      <div class="grid-title" onclick="goToDetail('명량핫도그');"> 명량핫도그</div>
	      <div>핫도그</div>
	      <div>신내동, 빵</div>
	    </div>
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
var f_selbox = new Array('음식종류', '지역', '가격' , '맛', '분위기');

var s_selbox = new Array();
s_selbox[0] = new Array("한식","분식","카페","고기","회/스시","뷔페","빵");
s_selbox[1] = new Array("묵동","신내동","중화동","상봉동","망우동","면목동");
s_selbox[2] = new Array("만원미만","1만원대","2만원대","3만원 이상");
s_selbox[3] = new Array('매콤', '달달', '담백','건강');
s_selbox[4] = new Array('조용한', '복잡한', '고급스런', '깔끔한','허름한');

function init(f){
	var f_sel = f.firstSelect;
	var s_sel = f.secondSelect;

	f_sel.options[0] = new Option("선택", "");
	s_sel.options[0] = new Option("선택", "");

	for(var i =0; i<f_selbox.length; i++){
		f_sel.options[i+1] = new Option(f_selbox[i], f_selbox[i]);
	}
}

function itemChange(f){
	var f_sel = f.firstSelect;
	var s_sel = f.secondSelect;

	var sel = f_sel.selectedIndex;
	for(var i=s_sel.length; i>=0; i--){
		s_sel.options[i] = null;
	}

	s_sel.options[0] = new Option("선택", "");

	if(sel != 0){
		for(var i=0; i<s_selbox[sel-1].length; i++){
			s_sel.options[i+1] = new Option(s_selbox[sel-1][i], s_selbox[sel-1][i]);
		}
	}
}


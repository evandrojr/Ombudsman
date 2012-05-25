window.onscroll = function(){
	var p = document.getElementById("janela") || document.all["janela"];
	var y1 = y2 = y3 = 0, x1 = x2 = x3 = 0;
	
	if (document.documentElement) y1 = document.documentElement.scrollTop || 0;
	if (document.body) y2 = document.body.scrollTop || 0;
	y3 = window.scrollY || 0;
	var y = Math.max(y1, Math.max(y2, y3));
	
	if (document.documentElement) x1 = document.documentElement.scrollLeft || 0;
	if (document.body) x2 = document.body.scrollLeft || 0;
	x3 = window.scrollX || 0;
	var x = Math.max(x1, Math.max(x2, x3));
	
	p.style.top = (parseInt(p.initTop) + y) + "px";
	p.style.left = (parseInt(p.initLeft) + x) + "px";
	p.style.marginLeft = (0) + "px";
	p.style.marginTop = (0) + "px";
	}
	window.onload = function(){
	var p = document.getElementById("janela") || document.all["janela"];
	p.initTop = p.offsetTop; p.initLeft = p.offsetLeft;
	window.onscroll();
}

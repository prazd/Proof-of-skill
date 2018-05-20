


document.addEventListener('DOMContentLoaded', function() {
	var elems = document.querySelectorAll('.sidenav');
	var instances = M.Sidenav.init(elems);

});

document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.parallax');
    var instances = M.Parallax.init(elems);
});


window.onload = function(){



	let table = document.getElementById('table')
	let header = document.getElementById('header_name')

	let match_but = document.getElementById('match')
	let match_but_s = document.getElementById('match_s')
	let match_cont = document.getElementById("content-match")

	let info_but = document.getElementById('info')
	let info_but_s = document.getElementById('info_s')
	let info_cont = document.getElementById("content-info")

	


	header.innerHTML = info_but.innerHTML

	match_but.onclick = function(){
		match_cont.setAttribute('visible','yes')
		info_cont.setAttribute('visible','none')
		header.innerHTML = match_but.innerHTML
		table.innerHTML = ''
		for (var i = 0; i < data.length; i++) {
			var srt = '<tr><td>'+data[i].team1+' - '+data[i].team2+'</td><td>'+data[i].coef1+'</td><td>'+data[i].coefX+'</td><td>'+data[i].coef2+'</td><td>' +button+'</td></tr>'
			table.innerHTML += srt
		}
	}
	match_but_s.onclick = match_but.onclick
	
	info_but.onclick = function(){
		match_cont.setAttribute('visible','none')
		info_cont.setAttribute('visible','yes')
		header.innerHTML = info_but.innerHTML
		
	}
	info_but_s.onclick = info_but.onclick


}






document.addEventListener('DOMContentLoaded', function() {
	var elems = document.querySelectorAll('.sidenav');
	var instances = M.Sidenav.init(elems);

});

window.onload = function(){
	let table = document.getElementById('table')

	
		for (var i = 0; i < data.length; i++) {
			var srt = '<tr><td>'+data[i].team1+' - '+data[i].team2+'</td><td>'+data[i].coef1+'</td><td>'+data[i].coefX+'</td><td>'+data[i].coef2+'</td></tr>'
			table.innerHTML += srt
		}
	


}


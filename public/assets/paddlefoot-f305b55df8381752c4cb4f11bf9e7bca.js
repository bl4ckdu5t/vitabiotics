$(document).ready(function(){
	//$(window).stellar();
	// Background Color preference preview
	$('[name="theme"]').click(function(){
		var color = $(this).prop('id');
		var rgb = color === 'pink'?'221, 17, 66':color==='purple'?'170, 85, 204':color==='blue'? '27, 186, 225':color==='orange'?
		'238, 102, 17':color==='iron'?'218, 219, 223':'0, 0, 0';
		$('header').css('background','rgba('+ rgb +',.9)');
		$('.board header a:hover').css('background', 'rgb('+rgb+')');
	});
});

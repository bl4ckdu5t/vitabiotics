$(document).ready(function(){
	// Background Color preference preview
	$('[name="theme"]').click(function(){
		var color = $(this).prop('id');
		var rgb = color === 'pink'?'221, 17, 66':color==='purple'?'170, 85, 204':color==='blue'? '27, 186, 225':color==='orange'?
		'238, 102, 17':color==='iron'?'218, 219, 223':'0, 0, 0';
		$('header').css('background','rgba('+ rgb +',.9)');
		$('.board header a:hover').css('background', 'rgb('+rgb+')');
	});
	// Accordion
	$('ul.accord-style>li[data-accord]').click(function(){
		var accordId = $(this).data('accord');
		$(this).siblings('ul#'+accordId).toggle();
	});
	// Fading out notifications
	$(".notifier").filter(":visible").delay(3000).fadeOut('slow');
	// Hiding and displaying edit entries for departments,
	$('.content>.fr span:first-of-type').click(function(){
		$(this).parents('.fr').siblings('aside').slideToggle();
	});
	// Department list pagination
	var deptList = new List('department-list', {
		valueNames: ['deptname'],
		page: 8,
		plugins: [ ListPagination({}) ]
	});
	// Adding a old password field on profile edit
	$('.delicate').keyup(function(){
		$('.former').fadeIn(function(){
			$(this).html('<label for="user_current">Current Password</label>'+
			'<input id="user_current" name="user[current]" required="true" type="password">');
		});
	});
});
$(document).ready(function(){
	// Background Color preference preview
	$('.themes').click(function(){
		var rgb = $(this).val();
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
	// User list pagination
	var userList = new List('user-list',{
		valueNames: ['user-data'],
		page: 4,
		plugins: [ ListPagination({}) ]
	});
	// Show input edit fields for users table listings
	$('.list>.user-data td span:first-of-type').click(function(){
		$(this).parents('tr').find('p').fadeToggle();
	});
	$('[type="date"]').pickadate();
	// Show Edit options for users
	$('.user-setting>span:first-child').click(function(){
		$(this).parents('.user-setting').siblings('.ghost').slideToggle();
	});
});
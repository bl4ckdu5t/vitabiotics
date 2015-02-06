var ready = function(){
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
	// Show input edit fields for users table listings
	$('.list>.user-data td span:first-of-type').click(function(){
		$(this).parents('tr').find('p').fadeToggle();
	});
	// Datepicker for dates and time
	$('[type="date"]').pickadate();
	$('[type="time"]').pickatime();
	// Show Edit options for users
	$('.user-setting>span:first-child').click(function(){
		$(this).parents('.user-setting').siblings('.ghost').slideToggle();
	});
	// Select 2 on page loads
	$('select').select2();
	// Twitter-like countdown for announcement
	var left = 50
    $('#text_counter').text(' ' + left);

        $('#status').keyup(function () {

        left = 50 - $(this).val().length;

        if(left < 0){
            $('#text_counter').addClass("overlimit");
        }
        if(left >= 0){
            $('#text_counter').removeClass("overlimit");
        }

        $('#text_counter').text(' ' + left);
    });
    var target = document.getElementById('el');
    var spinner = new Spinner({color:'#fff', lines: 12}).spin(target);
    $(document).on('click','a',function(){
    	$('.loader').toggle();
    });
    $('li').has('a').click(function(){
    	$('loader').toggle();
    })
};
// Ready Pages
$(document).ready(ready);
// Turbolinks
$(document).on('page:load', ready);

// Overriding rails confirm dialog boxes
/*
$.rails.confirm = function(message){
	return swal({
		title: message,
		text: 'you will not be able to undo this',
		showCancelButton: true,
		confirmButtonColor: "#DD6B55",
		confirmButtonText: "Yes, delete it!",
		closeOnConfirm: false 
	}, function(){
		swal("Deleted!", "Item has been deleted", "success");
		return false;
	});
}
*/
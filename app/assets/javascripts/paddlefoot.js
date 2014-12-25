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
	// Delete confirmation with sweet alert
	$('.content>.fr span:last-of-type').click(function(){
		swal({
			title: "Are you sure?",
			text: "You will not be able to undo this!",
			type: "warning",
			showCancelButton: true,
			confirmButtonColor: "#DD6B55",
			confirmButtonText: "Yes, delete it!",
			closeOnConfirm: false 
		}, function(){
			swal("Deleted!", "Department has been deleted.", "success"); 
		});
	});
	// Department list pagination
	var deptList = new List('department-list', {
		valueNames: ['deptname'],
		page: 8,
		plugins: [ ListPagination({}) ]
	});
});
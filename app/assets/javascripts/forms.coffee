$(document).ready ->
	$('.content aside>form').submit (e) ->
		e.preventDefault()
		url = $(this).prop('action')
		data = $(this).serialize()
		swal 'Someone clicked me', url
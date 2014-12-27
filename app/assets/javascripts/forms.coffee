$(document).ready ->
	$('[id^="edit_department"').on("ajax:success", (e, data, status, xhr) ->
		$(this).append "<p class='fr'>Updated Succesfully</p>"
		$(this).children('.fr').delay(2000).fadeOut()
	).on "ajax:error", (e, data, status, error) ->
		$(this).append "<p class='fr'>Failed to update</p>"
	###
	$('.content>.fr span:last-of-type>a').on "ajax:beforeSend", (xhr, settings) ->
		swal
		  title: "Are you sure?"
		  text: "You will not be able to undo this!"
		  type: "warning"
		  showCancelButton: true
		  confirmButtonColor: "#DD6B55"
		  confirmButtonText: "Yes, delete it!"
		  closeOnConfirm: false
		, ->
		  # should send the request here
		  swal "Deleted!", "Department has been deleted.", "success"
		  return
	###
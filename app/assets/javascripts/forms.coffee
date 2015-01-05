ready = ->
	$('[id^="edit_department"]').on("ajax:success", (e, data, status, xhr) ->
		$(this).append "<p class='fr'>Updated Succesfully</p>"
		$(this).children('.fr').delay(2000).fadeOut()
	).on "ajax:error", (e, data, status, error) ->
		$(this).append "<p class='fr'>Failed to update</p>"
		return
	$('.new_announcement').on("ajax:success", (e, data, status, xhr) ->
		console.log('great')
		$(this).append('<span class="fr">Broadcast Sent</span>')
		$(this).children('textarea').val('')
		$(this).children('.fr').delay(2000).fadeOut()
	).on "ajax:error", (e, data, status, error) ->
		console.log('failed')
		$(this).append('<span class="fr">Broadcast Failed to Send</span>')
		$(this).children('.fr').delay(2000).fadeOut()
		return

$(document).ready(ready)
$(document).on('page:load', ready)
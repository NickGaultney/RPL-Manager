App.printers = App.cable.subscriptions.create "PrintersChannel",
	connected: ->
		# Called when the subscription is ready for use on the server

	disconnected: ->
		# Called when the subscription has been terminated by the server

	received: (data) ->
		$('#printer-container').load <%= root_path %>


add_printer: (data) ->
	$('#printer-container').append data.printer
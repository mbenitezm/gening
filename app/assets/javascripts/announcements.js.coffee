$ ->
  $("#announcement_broadcast").click ->
    if ($(this).is(":checked"))
      $("#announcement_customer_id").prop('disabled', true)
      $("#announcement_customer_id").val("")
    else
      $("#announcement_customer_id").prop('disabled', false)

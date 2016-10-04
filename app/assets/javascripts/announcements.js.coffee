$ ->
  $("#announcement_broadcast").click ->
    if ($(this).is(":checked"))
      $("#announcement_company_id").prop('disabled', true)
      $("#announcement_company_id").val("")
    else
      $("#announcement_company_id").prop('disabled', false)

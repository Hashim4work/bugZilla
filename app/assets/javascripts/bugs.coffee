$(document).on 'click', '#bug_bug_type', ->
  value = $("#bug_bug_type").val()
  if value == "feature"
  	$('#type_bug').hide()
  	$('#type_feature').show()
  else
  	$('#type_bug').show()
  	$('#type_feature').hide()

$(document).on 'click', '#d_assigner', ->
  $("#d_assigner").hide()


$(document).on 'click', '#u_assigner', ->
  $("#u_assigner").hide()

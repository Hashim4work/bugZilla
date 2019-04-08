$(document).ready ->
  console.log("clicked")

$(document).on 'click', '#bug_bug_type', ->
  console.log("type bug_bug_type")
  value = $("#bug_bug_type").val()
  if value == "feature"
  	console.log("feature")
  	$('#type_bug').hide()
  	$('#type_feature').show()
  else
  	console.log("bug")
  	$('#type_bug').show()
  	$('#type_feature').hide()

$(document).on 'click', '#d_assigner', ->
  console.log("d_assigner")
  $("#d_assigner").hide()


$(document).on 'click', '#u_assigner', ->
  console.log("d_assigner")
  $("#u_assigner").hide()

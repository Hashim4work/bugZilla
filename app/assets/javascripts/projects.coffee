$(document).ready ->

$(document).on 'click', '#bug-link', ->
  console.log("clicked")
  $('#bugsN-section').toggle()

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  # user autocomplete
  user_name_field = $('#user_name')
  user_name_field.autocomplete
    select: (event, selected) -> 
      window.location = user_name_field.data("new-event-path").replace("user_id", selected.item.id)
    source: user_name_field.data 'user-autocomplete'
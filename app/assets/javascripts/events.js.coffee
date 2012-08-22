# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  user_name_field = $('#user_name')
  $('#event_service_tokens').tokenInput '/service_types.json'
    theme: 'facebook',
    propertyToSearch: 'title',
    preventDuplicates: true,
    prePopulate: $('#event_service_tokens').data('load')

  user_name_field.autocomplete
    select: (event, selected) -> 
      console.log selected
      # url = 
      window.location = user_name_field.data("new-event-path").replace("user_id", selected.item.id)
      # console.log url
    source: user_name_field.data 'user-autocomplete'
  
  $('#event_car_attributes_color').colorpicker().on 'changeColor', (ev) ->
    $('.add-on i').css('background-color', ev.color.toHex())
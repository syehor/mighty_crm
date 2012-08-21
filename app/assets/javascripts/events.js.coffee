# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#event_service_tokens').tokenInput '/service_types.json'
    theme: 'facebook',
    propertyToSearch: 'title',
    preventDuplicates: true,
    prePopulate: $('#event_service_tokens').data('load')

  $('#event_client_attributes_name').autocomplete
    source: $('#event_client_attributes_name').data 'user-autocomplete'
  
  $('#event_car_attributes_color').colorpicker().on 'changeColor', (ev) ->
    $('.add-on i').css('background-color', ev.color.toHex())
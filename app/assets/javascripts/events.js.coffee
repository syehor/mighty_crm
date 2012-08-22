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
      window.location = user_name_field.data("new-event-path").replace("user_id", selected.item.id)
    source: user_name_field.data 'user-autocomplete'
  
  $('#event_car_attributes_color').colorpicker().on 'changeColor', (ev) ->
    $('.add-on i').css('background-color', ev.color.toHex())

  # brands and car models

  car_models = $('#event_car_attributes_car_model').html()
  car_model_options = $(car_models)
  brand = $('#brand_id :selected').text()
  options = car_model_options.filter("optgroup[label='" + brand + "']").html()
  
  if brand == "Choose a Brand"
    $('#event_car_attributes_car_model').html('<option value="">Choose a Car Model</option>')
  
  if options
    $('#event_car_attributes_car_model').html(options)
    $('#event_car_attributes_car_model option[value='+brand+']').attr('selected', true)

  $('#brand_id').change ->
    brand = $('#brand_id :selected').text()
    options = car_model_options.filter("optgroup[label='#{brand}']").html()
    if options
      $('#event_car_attributes_car_model').html(options)
    else
      $('#event_car_attributes_car_model').html('<option value="">Choose a Car Model</option>')
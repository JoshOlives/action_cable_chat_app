App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

    # Called when there's incoming data on the websocket for this channel
  received: (data) ->
    
    alert("You have a new mention from @#{data.from}") if data.mention
    
    #remember both channels go through here
    if data.message && !data.message.blank?
      $('#messages-table').append data.message
      scroll_bottom()
      background_color(data.background) if data.background
  
$(document).on 'turbolinks:load', ->
  submit_message()
  scroll_bottom()
  
background_color = (message) ->
  $('#messages-table').children().last().children().last().css("background-color","rgba(#{message.join(", ")})")
  #console.log($('#messages-table p:first-of-type').html())
  #console.log($('#messages-table').children().last().html())
  console.log($('#messages-table').children().last().children().last().html())
  console.log(message.join(", "))
  
submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13 && !event.shiftKey
      console.log(event)
      $('input').click()
      event.target.value = ""
      #works without()
      event.preventDefault()
    
#how would i do it to do the same ^ when clicking the submit button

#meh undertand like 50% lol
scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)
  

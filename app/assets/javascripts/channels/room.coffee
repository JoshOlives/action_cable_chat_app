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
  
$(document).on 'turbolinks:load', ->
  submit_message()
  scroll_bottom()
  
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
  

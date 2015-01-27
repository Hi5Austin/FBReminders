require 'selenium-webdriver'
require 'pry'

#SETUPS THE VIRTUALS ASSISTANT 
def setup

  #SETS UP THE TIME GETTING VARIABLE
  $time = Time.new
  $reminder = 0
  $index
  
  #DEFINES DRIVER, THEN GOES TO FACEBOOK
  $driver = Selenium::WebDriver.for :chrome 
  $driver.navigate.to 'https://www.facebook.com/'

  #FINDS EMAIL TEXT FIELD, THEN THE PASSWORD TEXT FIELD, THEN THE SUBMIT BUTTON
  email_bar = $driver.find_element(:id,"email") 
  password_bar = $driver.find_element(:id,"pass") 
  login_button = $driver.find_element(:id,"u_0_n") 

  #RESIZES THE WINDOW
  $driver.manage.window.resize_to(1300,940)

  #INPUTS THE VA'S EMAIL, THEN IT'S PASSWORD, THE CLICKS THE LOGIN BUTTON
  email_bar.send_keys "YOUREMAIL" 
  password_bar.send_keys "YOURPASSWORD"
  login_button.click 

  #FINDS YOUR PICTURE IN THE CHAT SIDEBAR, THEN CLICKS IT
  sleep(3)
  users = $driver.find_elements(:class,"_55ln") 
  users[0].click  

  #FINDS THE CHAT TEXT FIELD
  ui_options = $driver.find_elements(:class, "_552m") 
  $chat = ui_options[0] 
   
  #DECLARES VARIABLES: 1. STORE ALL MESSAGES, 2. FIND THE MESSAGES IN THE DOM, 3. PLACE TO STORE THE LAST COMMAND BEFORE EXECUTION, 4.PLACE TO STORE THE LAST COMMAND AFTER EXECUTION
  $new_messages = [] 
  $selenium_messages = $driver.find_elements(:class,"_5yl5") 
  $last_message = ""
  $last_message_copy = ""

end

#THIS WAS THE FIRST MESSAGE I SENT TO TEST OUT SENDING MESSAGES
def send_default_message
  $chat.send_keys ";-;7 I am not a human being" 
  $chat.send_keys :return 

  $chat.send_keys ";-;7 But I will still help you" 
  $chat.send_keys :return 
end

#THIS WILL SEND A WHATEVER MESSAGE YOU WANT PLUS THE VA TOKEN
def send_message message
	$chat.send_keys ";-;7 " + message
	$chat.send_keys :return
end

#THIS WILL GET THE MESSAGES FROM THE USER, DECIDE IF IT SHOULD EXECUTE IT
def get_messages

  #FINDS THE ALL MESSAGES IN THE DOM
  $selenium_messages = $driver.find_elements(:class,"_5yl5") 
  
  # IF THE MESSAGE DOES NOT HAVE THE VA TOKEN ";-;7" THEN ADD IT TO THE USER MESSAGE ARRAY
  $selenium_messages.each do |mes| 
	  text = mes.text
	  if !text.include? ";-;7" 
		  $new_messages << text 
	  end
  end
 
  #MAKES THE COPY THE LAST MESSAGE OF THE USER MESSAGE ARRAY
  $last_message_copy = $new_messages.last

  # IF THE LAST EXECUTED COMMAND IS NOT THE LAST MESSAGE COPY, IT MAKES THE LAST EXECUTED COMMAND THE LAST MESSAGE COPY THEN EXECUTES IT
  if $last_message != $last_message_copy
    $last_message = $last_message_copy
    if $last_message == "Time"
      send_message $time.inspect
    elsif $last_message.include? "Remind me in "
      $reminder = $last_message[13,$last_message.length - 1]
      create_reminder $reminder
    else  
      send_message $last_message
    end   
  end
end

def create_reminder string
  reminder_array = string.split(" ")
  reminder_array.delete_at(2)
  sleep(reminder_array[0].to_f) 
  send_message reminder_array[2] 
end


#Remind me in 2 minutes to eat
#_5yl5 class of span of my message

#THINGS THAT THIS THING COULD DO
# Listen to music
# Send money/bitcoins
# Check Engrade
# Google things
# Email
# Text
# Play a game
# Order food
# Nico nico ni!
# Your computers location

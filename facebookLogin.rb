require 'selenium-webdriver'
require 'pry'

running = true

def setup

  $driver = Selenium::WebDriver.for :chrome # instantiates a google chrome session
  $driver.navigate.to 'https://www.facebook.com/' # takes you to facebook.com

  email_bar = $driver.find_element(:id,"email") #finds email input bar
  password_bar = $driver.find_element(:id,"pass") #find password input bar
  login_button = $driver.find_element(:id,"u_0_n") #finds login button

  $driver.manage.window.resize_to(1300,940)

  email_bar.send_keys "austinspreadsheet@gmail.com" # puts in the email
  password_bar.send_keys "iamfakesiri" # puts in the password
  login_button.click # clicks the login button

  #driver.manage.window.resize_to(1300,940) #maximizes the window

  $driver.manage.timeouts.implicit_wait = 7 #waits for friends to load in

  users = $driver.find_elements(:class,"_55ln") #finds the user's picture in the chat w/ friends bar
  users[0].click  #clicks the user's picture

  ui_options = $driver.find_elements(:class, "_552m") #Finds all user input bars

  $chat = ui_options[0] #Selects the chat bar

  $new_messages = [] # creates an array to store the messages text
#$new_messages_copy = [] #will check against new messages
  $stored_messages = [] #will store messages
  $selenium_messages = $driver.find_elements(:class,"_5yl5") 
  $last_message = ""
  $last_message_copy = ""

end

def send_default_message
  $chat.send_keys ";-;7 I am not a human being" #Puts in a message
  $chat.send_keys :return # Sends the message

  $chat.send_keys ";-;7 But I will still help you" #Puts in a message
  $chat.send_keys :return # Sends the message
end

def send_message message
	$chat.send_keys ";-;7 " + message
	$chat.send_keys :return
end

#seleniumMessages = driver.find_elements(:class,"_5yl5") #Finds the messages that have been exchanged (Will be selenium objects)

#$new_messages = [] # creates an array to store the messages text
#$new_messages_copy = [] #will check against new messages
#$stored_messages = [] #will store messages
#$selenium_messages = $driver.find_elements(:class,"_5yl5") 
#$last_message = ""
#$last_message_copy = ""

def get_messages

  $selenium_messages = $driver.find_elements(:class,"_5yl5") 
  
  $selenium_messages.each do |mes| # Gets the text of each message
	text = mes.text
	if !text.include? ";-;7" # If it does not have the AI token ';-;7', send to the messages array
		$new_messages << text #puts text into new messages
	end
	#binding.pry
  end

  $last_message_copy = $new_messages.last
  #binding.pry
  if $last_message != $last_message_copy
    $last_message = $last_message_copy
    send_message $last_message
  end
  #puts $new_messages
  #binding.pry
end


#get_messages

  #if $new_messages_copy != $new_messages
  #	 $new_messages = $new_messages_copy
  #	 $new_messages_copy = []
  #end
  #binding.pry
  #if $new_messages != $stored_messages #Sees if there are any new messages
   # start_point = $new_messages.size - ($new_messages.size - $stored_messages.size)
    #for index in start_point ... $new_messages.size
    #	send_message $new_messages[index]
    #end
    #	$stored_messages = $new_messages
 # else
  #	$stored_messages = $new_messages
  #	$new_messages = []
 # end
#end



  #puts $messages # prints the messages to the console

#get_messages

setup

while running
  sleep(5)
  get_messages
end


#_5yl5 # class of span of my message

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

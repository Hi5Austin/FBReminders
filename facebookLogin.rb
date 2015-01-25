require 'selenium-webdriver'

running = true

driver = Selenium::WebDriver.for :chrome # instantiates a google chrome session
driver.navigate.to 'https://www.facebook.com/' # takes you to facebook.com

emailBar = driver.find_element(:id,"email") #finds email input bar
passwordBar = driver.find_element(:id,"pass") #find password input bar
loginButton = driver.find_element(:id,"u_0_n") #finds login button

driver.manage.window.resize_to(1300,940)

emailBar.send_keys "YOUREMAIL" # puts in the email
passwordBar.send_keys "YOURPASSWORD" # puts in the password
loginButton.click # clicks the login button

#driver.manage.window.resize_to(1300,940) #maximizes the window

driver.manage.timeouts.implicit_wait = 7 #waits for friends to load in

users = driver.find_elements(:class,"_55ln") #finds the user's picture in the chat w/ friends bar
users[0].click  #clicks the user's picture

uiOptions = driver.find_elements(:class, "_552m") #Finds all user input bars

chat = uiOptions[0] #Selects the chat bar

chat.send_keys ";-;7 I am not a human being" #Puts in a message
chat.send_keys :return # Sends the message

chat.send_keys ";-;7 But I will still help you" #Puts in a message
chat.send_keys :return # Sends the message

seleniumMessages = driver.find_elements(:class,"_5yl5") #Finds the messages that have been exchanged (Will be selenium objects)

messages = [] # creates an array to store the messages text

seleniumMessages.each do |mes| # Gets the text of each message
	trans = mes.text
	if !trans.include? ";-;7" # If it does not have the AI token ';-;7', send to the messages array
		messages << trans
	end
end

puts messages # prints the messages to the console

while running
	driver.manage.timeouts.implicit_wait = 5

#_5yl5 # class of span of my message


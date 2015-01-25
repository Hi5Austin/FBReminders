require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome # instantiates a google chrome session
driver.navigate.to 'https://www.facebook.com/' # takes you to facebook.com

emailBar = driver.find_element(:id,"email") #finds email input bar
passwordBar = driver.find_element(:id,"pass") #find password input bar
loginButton = driver.find_element(:id,"u_0_n") #finds login button

emailBar.send_keys "austinspreadsheet@gmail.com" # puts in the email
passwordBar.send_keys "iamfakesiri" # puts in the password
loginButton.click # clicks the login button

driver.manage.window.resize_to(1300,940) #maximizes the window

driver.manage.timeouts.implicit_wait = 7 #waits for friends to load in

users = driver.find_elements(:class,"_55ln") #finds the user's picture in the chat w/ friends bar
users[0].click  #clicks the user's picture

uiOptions = driver.find_elements(:class, "_552m") #Finds all user input bars

chat = uiOptions[0] #Selects the chat bar

chat.send_keys "I am not a human being" #Puts in a message
chat.send_keys :return # Sends the message

require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome # instantiates a google chrome session
driver.navigate.to 'https://www.facebook.com/' # takes you to facebook.com

emailBar = driver.find_element(:id,"email") #finds email input bar
passwordBar = driver.find_element(:id,"pass") #find password input bar
loginButton = driver.find_element(:id,"u_0_n") #finds login button

emailBar.send_keys "austinspreadsheet@gmail.com" # puts in the email
passwordBar.send_keys "YOURPASSWORD" # puts in the password
loginButton.click # clicks the login button

links = driver.find_elements(:class,"fbNubButton") # finds the chat bar
links[0].click # opens the chat bar

#puts links[0].text
#puts links[1].text
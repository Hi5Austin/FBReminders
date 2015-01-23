require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome # instantiates a google chrome session
driver.navigate.to 'https://www.facebook.com/' # takes you to facebook.com

emailBar = driver.find_element(:id,"email") #finds email input bar
passwordBar = driver.find_element(:id,"pass") #find password input bar
loginButton = driver.find_element(:id,"u_0_n") #finds login button

emailBar.send_keys "austinspreadsheet@gmail.com" # puts in the email
passwordBar.send_keys "YOURPASSWORD" # puts in the password
loginButton.click # clicks the login button

driver.manage.window.resize_to(1300,940) #maximizes the window

friends = driver.find_elements(:class,"_55lr") # gather all your friends

puts friends

#links = driver.find_elements(:class,"fbNubButton") # finds the chat bar
#driver.manage.timeouts.page_load = 10
#links[0].click # opens the chat bar
#links[1].click # NOTE that sometime it works and sometimes it doesn't but if you click both it usually works, so the error is ok

#driver.execute_script("$('._55lr').click()",element)

#friends = driver.find_elements(:class,"_55lr") # gather all your friends

#puts friends

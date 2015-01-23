require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome # instantiates a google chrome session
driver.navigate.to 'https://www.google.com/' # takes you to google.com

googleBar = driver.find_element(:id,"gbqfq") # finds the google search bar
googleBar.send_keys "I am not a human being" # puts "I am not a human being" in the search bar

searchButton = driver.find_element(:id,"gbqfb") #finds the google search button
searchButton.click #clicks the button

#googleLinks = driver.find_elements(:class,"q qs") # finds the google links
# imageLink.click #clicks the link

#link = driver.find_element(:link,"Images")
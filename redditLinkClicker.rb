require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome # instantiates a google chrome session
driver.navigate.to 'http://www.reddit.com/' # takes you to reddit.com

link = driver.find_element(:link,"King of Saudi Arabia Has Died At 90")
link.click


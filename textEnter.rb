require 'selenium-webdriver'
driver = Selenium::WebDriver.for :chrome
driver.navigate.to 'https://www.google.com/'

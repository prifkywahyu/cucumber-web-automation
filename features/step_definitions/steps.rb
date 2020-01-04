require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome

Given("open the Amazon website") do
  driver.navigate.to "https://www.amazon.com"
end

Given("open sign in page") do
  driver.find_element(xpath: '//a[@id="nav-link-accountList"]').click
end

When("check if exists user email") do
  driver.find_element(xpath: '//input[@type="email"]').send_keys "prifkywahyu@gmail.com"
end

Then("user redirect to input password") do
  driver.find_element(xpath: '//input[@id="continue"]').click
end

When("user input password to verify") do
  driver.find_element(xpath: '//input[@id="ap_password"]').send_keys "Password123"
end

Then("failed redirect to home page") do
  driver.find_element(xpath: '//input[@id="signInSubmit"]').click
end

When("user input unregistered email") do
  driver.find_element(xpath: '//input[@type="email"]').send_keys "test.rifky@gmail.com"
end

Then("failed redirect to input password") do
  driver.find_element(xpath: '//input[@id="continue"]').click
end

Given("open sign in page and navigate to create new account") do
  driver.find_element(xpath: '//a[@id="nav-link-accountList"]').click
  driver.find_element(xpath: '//a[@id="createAccountSubmit"]').click
end

When("user input all required fields") do
  driver.find_element(xpath: '//input[@name="customerName"]').send_keys "Rifky Wahyu Pratama"
  driver.find_element(xpath: '//input[@name="email"]').send_keys "rifky.wahyu97@gmail.com"
  driver.find_element(xpath: '//input[@name="password"]').send_keys "Password123"
  driver.find_element(xpath: '//input[@name="passwordCheck"]').send_keys "Password123"
end

Then("user redirect to OTP verification page") do
  driver.find_element(xpath: '//input[@type="submit"]').click
end

When("user input OTP verification code") do
  driver.find_element(xpath: '//input[@type="text"]').send_keys "129034"
end

Then("user failed to create new account") do
  driver.find_element(xpath: '//input[@type="submit"]').click
end
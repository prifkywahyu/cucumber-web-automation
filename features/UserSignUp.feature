Feature: Amazon sign up new account

Scenario: Create valid sign up
Given open the Amazon website
And open sign in page and navigate to create new account
When user input all required fields
Then user redirect to OTP verification page

Scenario: Input wrong OTP code
Given open the Amazon website
And open sign in page and navigate to create new account
When user input all required fields
Then user redirect to OTP verification page
When user input OTP verification code
Then user failed to create new account
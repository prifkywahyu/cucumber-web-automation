Feature: Amazon sign in functionality

Scenario: Create sign in with wrong password
Given open the Amazon website
And open sign in page
When check if exists user email
Then user redirect to input password
When user input password to verify
Then failed redirect to home page

Scenario: Sign in using unregistered email
Given open the Amazon website
And open sign in page
When user input unregistered email
Then failed redirect to input password
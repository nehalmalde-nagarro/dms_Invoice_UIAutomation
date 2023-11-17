Feature: Dealer Information Functionality
 
 
  Background: Login with dealer
    Given User is on Login Page
    When User clicks on "Dealer" button
    And User enters "grn_sale" and "Welcome@1234"
    And User click on "LOGIN" button
 
Scenario: Validate Dealer Information Functionality
Given User is on Home Page
When user clicks on Profile Icon
Then user is able to view dealer information
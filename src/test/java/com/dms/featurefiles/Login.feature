@Login
Feature: Login

  #Scenario Outline: Login as a Dealer with Valid Credentials
    #Given User is on Login Page
    #When User clicks on "Dealer" button
    #When User enters "<username>" and "<password>"
    #And User click on Captcha
    #And User click on "LOGIN" button
    #Then Verify if user Logs in sucessfully
#
    #Examples: 
      #| username | password     |
      #| grn_sale | Welcome@1234 |
#
  #Scenario Outline: Login as a Dealer with Valid Credentials without checking captcha
    #Given User is on Login Page
    #When User clicks on "Dealer" button
    #When User enters "<username>" and "<password>"
    #And User click on "LOGIN" button
    #Then Verify if login button is disable
#
    #Examples: 
      #| username | password     |
      #| grn_sale | Welcome@1234 |
#
  #Scenario Outline: Login as a Dealer with InValid Credentials
    #Given User is on Login Page
    #When User clicks on "Dealer" button
    #When User enters "<username>" and "<password>"
    #And User click on Captcha
    #And User click on "LOGIN" button
    #Then Verify if user not Logs in sucessfully
#
    #Examples: 
      #| username     | password       |
      #| ccm_sales122 | ccm_sales1212e |
      #
  #Scenario Outline: Login as a Dealer with InValid Credentials username length less than 6 digits
    #Given User is on Login Page
    #When User clicks on "Dealer" button
    #When User enters "<username>" and "<password>"
    #And User click on Captcha
    #And User click on "LOGIN" button
    #Then Verify if we get error for invalid username
    #And Verify if login button is disable
#
    #Examples: 
      #| username | password       |
      #| ccm      | ccm_sales1212e |
      #|          | ccm_sales121   |
#
  #Scenario Outline: Login as a Dealer with InValid Credentials password length less than 6 digits
    #Given User is on Login Page
    #When User clicks on "Dealer" button
    #When User enters "<username>" and "<password>"
    #And User click on Captcha
    #And User click on "LOGIN" button
    #Then Verify if we get error for invalid password
    #And Verify if login button is disable
#
    #Examples: 
      #| username     | password |
      #| ccmksm_sales | ccm      |
      #| grn_Sales    |          |

      
      Scenario: Validate Zendesk messaging window is accessible
      Given User is on Login Page
      When User clicks on open Zendesk messaging window button
      Then Verify user is able to access the Zendesk messaging window
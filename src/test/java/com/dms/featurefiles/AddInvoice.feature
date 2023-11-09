@AddInvoice
Feature: Add Invoice - Invoice Details Tab

  Background: Login with dealer
    Given User is on Login Page
    And User clicks on "Dealer" button
    And User enters "grn_sale" and "Welcome@1234"
    #And User click on Captcha
    And User click on "LOGIN" button

  Scenario Outline: Validate Prefilled fields on Invoice Details tab
  Given User is on Home Page
  When User clicks on "Add Invoice" button
  And User click on Search Order
  And User enters OrderId from <rowNumber>
  And User clicks on "SEARCH" button
  And User select from displayed orders for <rowNumber>
  And User clicks on "OK" button
  Then Verify Prefilled fields for OrderId from <rowNumber> on invoice Details tab
  
  Examples:
  | rowNumber     |
  | 1 |
  
  Scenario Outline: Validate PopUp functionalities of search order Popup
  Given User is on Home Page
  When User clicks on "Add Invoice" button
  And User click on Search Order
  And User enters Mobile Number from <rowNumber>
  And User clicks on "SEARCH" button on popup
  And Verify if "OK" button is disable
  Then Verify data on search by Mobile Number from <rowNumber>
  And User clicks on "CLEAR" button on popup
  And Verify if "SEARCH" button is disable
  And Click on Close popup icon
  Then Verify if Popup closed
  
  Examples:
  | rowNumber |
  |   1 |
  #
  #Scenario Outline: Validate if no record found if invalid data input to search on popup
  #Given User is on Home Page
  #When User clicks on "Add Invoice" button
  #And User click on Search Order
  #And User enters "<MobileNumber>" for Mobile Number
  #And User enters "<OrderId>" for OrderId
  #And User clicks on "SEARCH" button on popup
  #Then Verify if "Nothing to display" text showing
  #
  #Examples:
  #| MobileNumber | OrderId     |
  #|   9844035228 | SOB23000623 |
  #
  #Scenario Outline: Validate back to listing button  functionality
  #Given User is on Home Page
  #When User clicks on "Add Invoice" button
  #And User clicks on "BACK TO LISTING" button
  #And User clicks on "NO" button on popup
  #Then verify user is on Add Invoice page
  #When User clicks on "BACK TO LISTING" button
  #And User clicks on "YES" button on popup
  #Then Verify User is on Home Page
  #
  #Examples:
  #| MobileNumber | OrderId     |
  #|   9844035228 | SOB23000623 |
  #Scenario Outline: Validate clear button functionality on Invoice details page
  #Given User is on Home Page
  #When User clicks on "Add Invoice" button
  #And User click on Search Order
  #And User enters "<OrderId>" for OrderId
  #And User clicks on "SEARCH" button
  #And User select from displayed orders for "<OrderId>"
  #And User clicks on "OK" button
  #And User clicks on "CLEAR" button
  #Then verify all the fields are empty on Invoice details page except Invoice Type and Selling Price For
  #
  #Examples:
  #| OrderId     |
  #| SOB23000623 |
  #Scenario Outline: Validate B2B functionality on Invoice details page
    #Given User is on Home Page
    #When User clicks on "Add Invoice" button
    #And User click on Search Order
    #And User enters "<OrderId>" for OrderId
    #And User clicks on "SEARCH" button
  #And User select from displayed orders for "<OrderId>"
    #And User clicks on "OK" button
    #And if user selects B2B Customer as "Yes"
    #And user enters "GSTUNREGISTERED" in Bill GSTN field
    #Then verify error message is displayed as "Enter GST Number for B2B Customer."
    #And if user selects B2B Customer as "No"
    #And user enters "ABC1001002003A" in Bill GSTN field
    #Then verify error message is displayed as "GST Number found for B2C Customer."
#
    #Examples: 
      #| OrderId     |
      #| SOB23000623 |
  #Scenario Outline: Validate Next button functionality on Invoice details page
    #Given User is on Home Page
    #When User clicks on "Add Invoice" button
    #And User click on Search Order
    #And User enters "<OrderId>" for OrderId
    #And User clicks on "SEARCH" button
    #And User select from displayed orders for "<OrderId>"
    #And User clicks on "OK" button
    #And user enters Workspace as "<Workspace>"
    #And user enters Aadhar Number as "<AadharNum>"
    #And user enters "<BillGSTN>" in Bill GSTN field
    #And User clicks on "NEXT" button
    #Then Verify user is navigated to "Vehicle Info"
#
    #Examples: 
      #| OrderId     | Workspace | AadharNum | BillGSTN |
      #| SOB23000623 |      OTHER     |    123234567894       |   ABC1001002003AF     |
#
  #Scenario Outline: Validate shipping info functionality for Individual on Invoice details page
    #Given User is on Home Page
    #When User clicks on "Add Invoice" button
    #And User click on Search Order
    #And User enters "<OrderId>" for OrderId
    #And User clicks on "SEARCH" button
    #And User select from displayed orders for "<OrderId>"
    #And User clicks on "OK" button
    #And Verify if Sales Type is "Individual"
    #Then Verify Shipping Info section is disabled
#
    #Examples: 
      #| OrderId     |
      #| SOB23000623 |

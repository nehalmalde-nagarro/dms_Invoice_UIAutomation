@FinancialInfo
Feature: Add Invoice - Vehicle Details Tab

  Background: Login with dealer
    Given User is on Login Page
    And User clicks on "Dealer" button
    And User enters "grn_sale" and "Welcome@1234"
    And User click on "LOGIN" button
    
    
    Scenario Outline: Validate prefilled data on Financial Info page
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And user enters Workspace from <rowNumber>
    And user enters Aadhar Number from <rowNumber>
    And user enters Bill GSTN field from <rowNumber>
    And user enters all required fields from <rowNumber>
    And User clicks on "NEXT" button
    And user selects Owners Manual Preference for scenario <rowNumber>
    And user selects Interested in Loyalty Card, Type of card, Reason for scenario <rowNumber>
    And user clicks on Preferred SRV Dealer popup
    And user selects state for scenario <rowNumber>
    And user selects city for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And selects the dealer for scenario <rowNumber> from searched results
    And User clicks on "OK" button
    And user selects Extended Warranty for scenario <rowNumber>
    And User clicks on "NEXT" button
    When User selects payment type as "Cash"
    And User selects tax rate for scenario <rowNumber>
    And User selects TDS Amount for scenario <rowNumber>
    And User selects the MSGA finance flag
    And user selects MSGA Financier Name and value from scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
     And User clicks on "NEXT" button
     Then Verify user is navigated to "CHARGE DETAILS"
    Then Verify Prefilled fields for OrderId from scenario <rowNumber> on Charge Details tab
    
     Examples: 
      | rowNumber |
      |         1 |
      
       
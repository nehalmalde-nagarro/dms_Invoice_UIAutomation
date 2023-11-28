Feature: Business Scenario 

  Background: Login with dealer
    Given User is on Login Page
    And User clicks on "Dealer" button
    And User enters "grn_sale" and "Welcome@1234"
    And User click on "LOGIN" button
    
    @BS1
    Scenario Outline: Business Scenario 1 :  B2B - IGST - Individual - CCP - Extended Warranty -   Exchange
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And if user selects B2B Customer as "Yes"
    And user enters Bill GSTN field from <rowNumber>
    And user enters all required fields from <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Vehicle Info"
    And user selects Owners Manual Preference for scenario <rowNumber>
    And user selects Interested in Loyalty Card, Type of card, Reason for scenario <rowNumber>
    And user clicks on Preferred SRV Dealer popup
    And user selects state for scenario <rowNumber>
    And user selects city for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And selects the dealer for scenario <rowNumber> from searched results
    And User clicks on "OK" button
    And user selects Extended Warranty for scenario <rowNumber>
    And User clicks on CCP Sale popup
    And Verify if benefit is already selected or select benefit from <rowNumber>
    And User clicks on "OK" button
    Then Verify if ccp benefit is selected
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Financial Info"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User selects the "Exchange" from old car offers
     And Click on "LOYALTY EXCHANGE/ADDITIONAL CAR BENEFITS" tab on Additional Details
    And User choose Loyalty Card for scenario <rowNumber>
    And User click "OK" button on loyalty card popup   
    #And User clicks on "NEXT" button
    #Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |         8 |
    
 
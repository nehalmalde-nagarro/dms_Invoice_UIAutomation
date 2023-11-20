Feature: Addtional Details Tab of Add Invoice


  Background: Login with dealer
    Given User is on Login Page
    And User clicks on "Dealer" button
    And User enters "grn_sale" and "Welcome@1234"
    And User click on "LOGIN" button
    
    Scenario Outline: Validate prefilled data on Additional Benefits Tab
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
    And user selects MSGA Financier Name from scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify Prefilled fields for OrderId from scenario <rowNumber> on Additional Benefits tab
 
    Examples:
      | rowNumber |
      |         1 |
      
     Scenario Outline: Validate the old car offer section in Additional Benefits Tab
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
    And user selects MSGA Financier Name from scenario <rowNumber>
    And User clicks on "NEXT" button
    And User selects the "Loyalty/Acquisition Bonus" from old car offers
    Then Verify "Loyalty/Acquisition Details" pop up button is displayed 
    When User selects the "Exchange" from old car offers
    Then Verify Old Vehicle Details, Loyalty Exchange/Additional Car Benefits and Loyalty Exchange Benefits are displayed
    Then Verify "Old Vehicle Details" pop up button is displayed 
    Then Verify "Loyalty Exchange/Additional Car Benefits" pop up button is displayed 
    Then Verify "Loyalty Exchange Benefits" pop up button is displayed 
    When User selects the "Scrappage" from old car offers
    Then Verify "Old Vehicle Details" pop up button is displayed
     Then Verify "Loyalty Exchange/Additional Car Benefits" pop up button is not displayed
 
    Examples:
      | rowNumber |
      |         1 |   
      
      
     #Scenario Outline: Validate the Other offer section in Additional Benefits Tab
    #Given User is on Home Page
    #When User clicks on "Add Invoice" button
    #And User click on Search Order
    #And User enters OrderId from scenario <rowNumber>
    #And User clicks on "SEARCH" button
    #And User select from displayed orders for scenario <rowNumber>
    #And User clicks on "OK" button
    #And user enters Workspace from <rowNumber>
    #And user enters Aadhar Number from <rowNumber>
    #And user enters Bill GSTN field from <rowNumber>
    #And user enters all required fields from <rowNumber>
    #And User clicks on "NEXT" button
    #And user selects Owners Manual Preference for scenario <rowNumber>
    #And user selects Interested in Loyalty Card, Type of card, Reason for scenario <rowNumber>
    #And user clicks on Preferred SRV Dealer popup
    #And user selects state for scenario <rowNumber>
    #And user selects city for scenario <rowNumber>
    #And User clicks on "SEARCH" button on popup
    #And selects the dealer for scenario <rowNumber> from searched results
    #And User clicks on "OK" button
    #And user selects Extended Warranty for scenario <rowNumber>
    #And User clicks on "NEXT" button
    #When User selects payment type as "Cash"
    #And User selects tax rate for scenario <rowNumber>
    #And User selects TDS Amount for scenario <rowNumber>
    #And User selects the MSGA finance flag
    #And user selects MSGA Financier Name from scenario <rowNumber>
    #And User clicks on "NEXT" button
    #And User selects only the "MSSF Offer" from other offers
    #Then Verify MSSF Offer pop up button is displayed and MDS Offer pop up button is not displayed
    #When User selects only the "MDS Offer" from other offers
    #Then Verify MSSF Offer pop up button is not displayed and MDS Offer pop up button is displayed
    #When User selects both "MSSF Offer" and "MDS Offer" from other offers
    #Then Verify both MSSF Offer pop up button and MDS Offer pop up button are displayed
 #
    #Examples:
      #| rowNumber |
      #|         1 |
    

Scenario Outline: Loyalty Acquisition bonus for old car offer with maruti make
  Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order from "Loyalty Ac"
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And user enters Workspace from <rowNumber>
    And user enters Aadhar Number from <rowNumber>
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
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Financial Info"
     When User selects payment type as "Cash"
    And User selects tax rate for scenario <rowNumber>
    And User selects TDS Amount for scenario <rowNumber>
    And User selects the MSGA finance flag
    And user selects MSGA Financier Name from scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User selects the "Loyalty/Acquisition Bonus" from old car offers
    Then Verify "LOYALTY/ACQUISITION DETAILS" pop up button is displayed
    And Click on "LOYALTY/ACQUISITION DETAILS" tab on Additional Details
    And user filled all details on Loyalty Bonus Benefits popup based on Vin Search for scenario <rowNumber>
    And User clicks on "OK" button
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Examples:
    |rowNumber|
    |1|
     


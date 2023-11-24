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
    And user selects MSGA Financier Name and value from scenario <rowNumber>
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
    And user selects MSGA Financier Name and value from scenario <rowNumber>
    And User clicks on "NEXT" button
    And User selects the "Loyalty/Acquisition Bonus" from old car offers
    Then Verify "LOYALTY/ACQUISITION DETAILS" pop up button is displayed
    When User selects the "Exchange" from old car offers
    Then Verify "OLD VEHICLE DETAILS" pop up button is displayed
    Then Verify "LOYALTY EXCHANGE/ADDITIONAL CAR BENEFITS" pop up button is displayed
    Then Verify "LOYALTY EXCHANGE BENEFITS" is displayed
    When User selects the "Scrappage" from old car offers
    Then Verify "OLD VEHICLE DETAILS" pop up button is displayed
    Then Verify "LOYALTY EXCHANGE/ADDITIONAL CAR BENEFITS" pop up button is not displayed

    Examples: 
      | rowNumber |
      |         4 |

  Scenario Outline: Validate the Other offer section in Additional Benefits Tab
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
    And User click on other offer dropdown
    And User selects only the "MSSF Offer" from other offers
    Then Verify "MSSF OFFER" pop up button is displayed
    Then Verify "MDS OFFER" pop up button is not displayed
    And User diselect the "MSSF Offer" from other offers
    #Then Verify MSSF Offer pop up button is displayed and MDS Offer pop up button is not displayed
    When User selects only the "MDS Offer" from other offers
    Then Verify "MDS OFFER" pop up button is displayed
    Then Verify "MSSF OFFER" pop up button is not displayed
    And User diselect the "MDS Offer" from other offers
    					
    #Then Verify MSSF Offer pop up button is not displayed and MDS Offer pop up button is displayed
    When User selects both "MSSF Offer" and "MDS Offer" from other offers
    #Then Verify both MSSF Offer pop up button and MDS Offer pop up button are displayed
    Then Verify "MDS OFFER" pop up button is displayed
    Then Verify "MSSF OFFER" pop up button is displayed

    Examples: 
      | rowNumber |
      |         4 |

  Scenario Outline: Loyalty Acquisition bonus for old car offer with maruti make
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
    And user selects MSGA Financier Name and value from scenario <rowNumber>
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
      | rowNumber |
      |         4 |

  Scenario Outline: Validation for Loyalty Bonus Benefits popup
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
    And user selects MSGA Financier Name and value from scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User selects the "Loyalty/Acquisition Bonus" from old car offers
    Then Verify "LOYALTY/ACQUISITION DETAILS" pop up button is displayed
    And Click on "LOYALTY/ACQUISITION DETAILS" tab on Additional Details
    And Select make as "Non Maruti"
    And Verify if Vin button is disabled
    And Enter value manually in all fields
    Then Verify error message if text box values are null
    And User clicks on "CLEAR" button on popup
    Then Verify if fields are disabled
    And Select Policy Type as "Maruti"
    And User enter policy no from <rowNumber>
    Then Verify Policy company name and customer name for policy no from <rowNumber>
    And User clicks on "CLEAR" button on popup
    And Select Policy Type as "Maruti"
    And User enter policy no from <invalidDataRowNumber>
    Then Verify if "Wrong policy number" error msg is displayed
    And User clicks on "CLEAR" button on popup
    And Select make as "Maruti"
    And User click on Vin button for vin search
    And User search by VIN on vin search popup from scenario <rowNumber>
    And User click "SEARCH" button on vin search popup
    And user choose vehicle details on vin search popup for scenario <rowNumber>
    And User click "OK" button on vin search popup
    And Validate AutoFilled data on popup for VIN for scenario <rowNumber>

    Examples: 
      | rowNumber | invalidDataRowNumber |
      |         4 |                    6 |

  Scenario Outline: Validation for VIN search popup
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
    And user selects MSGA Financier Name and value from scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User selects the "Loyalty/Acquisition Bonus" from old car offers
    Then Verify "LOYALTY/ACQUISITION DETAILS" pop up button is displayed
    And Click on "LOYALTY/ACQUISITION DETAILS" tab on Additional Details
    And Select make as "Maruti"
    And User click on Vin button for vin search
    And User search by VIN on vin search popup from scenario <rowNumber>
    And User click "SEARCH" button on vin search popup
    Then Verify if respective vehicle details able to search on vin search popup for scenario <rowNumber>
    And User click "CLEAR" button on vin search popup
    And User search by Reg Num on vin search popup from scenario <rowNumber>
    And User click "SEARCH" button on vin search popup
    Then Verify if respective vehicle details able to search on vin search popup for scenario <rowNumber>
    And User click "CLEAR" button on vin search popup
    And User search by Model on vin search popup from scenario <rowNumber>
    And User search by Chassis on vin search popup from scenario <rowNumber>
    And User click "SEARCH" button on vin search popup
    Then Verify if respective vehicle details able to search on vin search popup for scenario <rowNumber>
    And User click "CLEAR" button on vin search popup
    And User search by VIN on vin search popup from scenario <invalidDataRowNumber>
    And User click "SEARCH" button on vin search popup
    Then Verify "No record found" error popup
    And User click "CLEAR" button on vin search popup
    Then Verify if "OK" button is disable
    And User search by Model on vin search popup from scenario <rowNumber>
    And User click "SEARCH" button on vin search popup
    Then Verify "Invalid input parameters. Please provide valid vin, regNo, or both model and chassis." error popup
    And User click "CLEAR" button on vin search popup
    And User search by Chassis on vin search popup from scenario <rowNumber>
    And User click "SEARCH" button on vin search popup
    Then Verify "Invalid input parameters. Please provide valid vin, regNo, or both model and chassis." error popup

    Examples: 
      | rowNumber | invalidDataRowNumber |
      |         4 |                    6 |
      
      @run
     Scenario Outline: Loyalty Exchange / Additional Car Benefits validation of old car offer
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
    And user selects MSGA Financier Name and value from scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User selects the "Exchange" from old car offers
    Then Verify "LOYALTY EXCHANGE/ADDITIONAL CAR BENEFITS" pop up button is displayed
    And Click on "LOYALTY EXCHANGE/ADDITIONAL CAR BENEFITS" tab on Additional Details
    And User choose Loyalty Card for scenario <rowNumber>
    And User click "OK" button on loyalty card popup   
    Then Verify required field error for "LOYALTY EXCHANGE/ADDITIONAL CAR BENEFITS" is not displayed
    Then Verify Loyalty Exchnage Benefit value
    And Click on "LOYALTY EXCHANGE/ADDITIONAL CAR BENEFITS" tab on Additional Details
    And User click "CLEAR" button on loyalty card popup   
    Then Verify if "OK" button is disable
    And Click on Close popup icon
    Then Verify required field error for "LOYALTY EXCHANGE/ADDITIONAL CAR BENEFITS" is displayed
    Then Verify if "NEXT" button is disable
    
    Examples: 
      | rowNumber | invalidDataRowNumber |
      |         7 |                    6 |
      

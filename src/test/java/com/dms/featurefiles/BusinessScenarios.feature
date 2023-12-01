@BS
Feature: BS

  Background: Login with dealer
    Given User is on Login Page
    And User clicks on "Dealer" button
    And User enters "grn_sale" and "Welcome@1234"
    And User click on "LOGIN" button
    
    
    @BS0
  Scenario Outline: BS 0 :  B2B - IGST - Individual
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
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Financial Info"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Examples: 
      | rowNumber |
      |         8 |

  @BS1
  Scenario Outline: BS 1 :  B2B - IGST - Individual - CCP - Extended Warranty -   Exchange
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

  @BS2
  Scenario Outline: BS 2 :  B2B - IGST - Individual - CCP - Extended Warranty -   Loyalty Bonus Benefits
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
    And User selects the "Loyalty/Acquisition Bonus" from old car offers
    And Click on "LOYALTY/ACQUISITION DETAILS" tab on Additional Details
    And user filled all details on Loyalty Bonus Benefits popup based on Vin Search for scenario <rowNumber>
    And User clicks on "OK" button
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |         8 |

  @BS3
  Scenario Outline: BS 3 :  B2B - IGST - Individual  - Extended Warranty - CCP NoPack - Exchange  - Leasing
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
    When User selects payment type as "Leasing"
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
      |         9 |

  @BS4
  Scenario Outline: BS 4 :  B2B - IGST - Individual - CCP -  Exchange  - Finance
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
    And User clicks on CCP Sale popup
    And Verify if benefit is already selected or select benefit from <rowNumber>
    And User clicks on "OK" button
    Then Verify if ccp benefit is selected
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Financial Info"
    When User selects payment type as "Finance"
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
      |         10 |

  @BS5
  Scenario Outline: BS 5 :  B2B - IGST - Individual - Extended Warranty - ccp-  Cash
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
    When User selects payment type as "Cash"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |         8 |

  @BS6
  Scenario Outline: BS 6 :  B2B - IGST - Individual - CCP - Extended Warranty -  Scrapage
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
    And User selects the "Scrappage" from old car offers
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details

    #And User clicks on "OK" button
    #And User clicks on "NEXT" button
    #Then Verify user is navigated to "Charge Details"
    Examples: 
      | rowNumber |
      |         8 |

  @BS7
  Scenario Outline: BS 7 :  B2C - IGST - Individual - CCP - Extended Warranty -  Exchange
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And if user selects B2B Customer as "No"
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
      |        11 |

  @BS8
  Scenario Outline: BS 8 :  B2C - IGST - Individual  - Extended Warranty -ccp No Pckg -  Exchange  - Leasing
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And if user selects B2B Customer as "No"
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
    When User selects payment type as "Leasing"
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
      |        12 |

  @BS9
  Scenario Outline: BS 9 :  B2C - IGST - Individual - CCP -  Exchange  - Finance
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And if user selects B2B Customer as "No"
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
    And User clicks on CCP Sale popup
    And Verify if benefit is already selected or select benefit from <rowNumber>
    And User clicks on "OK" button
    Then Verify if ccp benefit is selected
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Financial Info"
    When User selects payment type as "Finance"
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
      |        13 |

  @BS10
  Scenario Outline: BS 10 :  B2C - IGST - Individual - Extended Warranty - ccp-- Cash
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And if user selects B2B Customer as "No"
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
    When User selects payment type as "Cash"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        11 |

  @BS11
  Scenario Outline: BS 11 :  B2C - IGST - Individual - CCP - Extended Warranty -  Scrapage
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And if user selects B2B Customer as "No"
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
    And User selects the "Scrappage" from old car offers
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details

    #And User clicks on "OK" button
    #And User clicks on "NEXT" button
    #Then Verify user is navigated to "Charge Details"
    Examples: 
      | rowNumber |
      |        11 |

  @BS12
  Scenario Outline: BS 12 :  B2C - IGST - Individual - CCP - Extended Warranty -   Loyalty Bonus Benefits
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And if user selects B2B Customer as "No"
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
    And User selects the "Loyalty/Acquisition Bonus" from old car offers
    And Click on "LOYALTY/ACQUISITION DETAILS" tab on Additional Details
    And user filled all details on Loyalty Bonus Benefits popup based on Vin Search for scenario <rowNumber>
    And User clicks on "OK" button
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        11 |
      
  @BS13
  Scenario Outline: BS 13 :  B2C - IGST - Individual 
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And if user selects B2B Customer as "No"
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
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Financial Info"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User clicks on "NEXT" button
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        11 |
   
    @BS14
  Scenario Outline: BS 14 :  B2B - CGST - Individual
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
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Financial Info"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Examples: 
      | rowNumber |
      |         14 |
      
      
      
  @BS15
  Scenario Outline: BS 15 :  B2B - CGST - Individual - CCP - Extended Warranty -   Exchange
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
      |         14 |
      
      
     
  @BS16
  Scenario Outline: BS 16 :  B2B - CGST - Individual  - Extended Warranty - CCP NoPack - Exchange  - Leasing
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
    When User selects payment type as "Leasing"
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
      |         15 | 
      
      
       @BS17
  Scenario Outline: BS 17 :  B2B - CGST - Individual - CCP -  Exchange  - Finance
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
    And User clicks on CCP Sale popup
    And Verify if benefit is already selected or select benefit from <rowNumber>
    And User clicks on "OK" button
    Then Verify if ccp benefit is selected
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Financial Info"
    When User selects payment type as "Finance"
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
      |         14 |
      
      @BS18
  Scenario Outline: BS 18 :  B2B - CGST - Individual - Extended Warranty - ccp -  Cash
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
    When User selects payment type as "Cash"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |         14 |
      
    @BS19
  Scenario Outline: BS 19 :  B2B - CGST - Individual - CCP - Extended Warranty -  Scrapage
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
    And User selects the "Scrappage" from old car offers
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details

    #And User clicks on "OK" button
    #And User clicks on "NEXT" button
    #Then Verify user is navigated to "Charge Details"
    Examples: 
      | rowNumber |
      |         14 |
      
      
  @BS20
  Scenario Outline: BS 20 :  B2B - CGST - Individual - CCP - Extended Warranty -   Loyalty Bonus Benefits
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
    And User selects the "Loyalty/Acquisition Bonus" from old car offers
    And Click on "LOYALTY/ACQUISITION DETAILS" tab on Additional Details
    And user filled all details on Loyalty Bonus Benefits popup based on Vin Search for scenario <rowNumber>
    And User clicks on "OK" button
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |         14 |
      
       @BS21
  Scenario Outline: BS 21 :  B2C - CGST - Individual 
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And if user selects B2B Customer as "No"
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
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Financial Info"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User clicks on "NEXT" button
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        16 |
      
      
    @BS22
  Scenario Outline: BS 22 :  B2C - CGST - Individual - CCP - Extended Warranty -  Exchange
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And if user selects B2B Customer as "No"
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
      |        16 |
      
      
  @BS23
  Scenario Outline: BS 23 :  B2C - CGST - Individual  - Extended Warranty -ccp No Pckg -  Exchange  - Leasing
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And if user selects B2B Customer as "No"
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
    When User selects payment type as "Leasing"
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
      |        17 |
      
       @BS24
  Scenario Outline: BS 24:  B2C - CGST - Individual - CCP -  Exchange  - Finance
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And if user selects B2B Customer as "No"
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
    And User clicks on CCP Sale popup
    And Verify if benefit is already selected or select benefit from <rowNumber>
    And User clicks on "OK" button
    Then Verify if ccp benefit is selected
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Financial Info"
    When User selects payment type as "Finance"
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
      |        18 |
      
      @BS25
  Scenario Outline: BS 25 :  B2C - CGST - Individual - Extended Warranty - ccp-- Cash
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And if user selects B2B Customer as "No"
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
    When User selects payment type as "Cash"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        16 |
      
      
      @BS26
  Scenario Outline: BS 26 :  B2C - CGST - Individual - CCP - Extended Warranty -  Scrapage
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And if user selects B2B Customer as "No"
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
    And User selects the "Scrappage" from old car offers
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details

    #And User clicks on "OK" button
    #And User clicks on "NEXT" button
    #Then Verify user is navigated to "Charge Details"
    Examples: 
      | rowNumber |
      |        16 |

  @BS27
  Scenario Outline: BS 27 :  B2C - CGST - Individual - CCP - Extended Warranty -   Loyalty Bonus Benefits
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And if user selects B2B Customer as "No"
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
    And User selects the "Loyalty/Acquisition Bonus" from old car offers
    And Click on "LOYALTY/ACQUISITION DETAILS" tab on Additional Details
    And user filled all details on Loyalty Bonus Benefits popup based on Vin Search for scenario <rowNumber>
    And User clicks on "OK" button
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        16 |
      

 
      

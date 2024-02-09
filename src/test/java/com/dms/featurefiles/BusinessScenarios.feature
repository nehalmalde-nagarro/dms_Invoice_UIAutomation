@BS
Feature: BS

  Background: Login with dealer
    Given User is on Login Page
    And User clicks on "Dealer" button
    #And User enters "ccm_sales121" and "Welcome@1234"
    And User enters "677272" and "5555"
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
    And User clicks on FastTag button
    And User enters Fast Tag ID from <rowNumber>
    When User selects Fast Tag Bank for scenario <rowNumber>
    And User selects Fast Tag Fitment Date "31-12-2023"
    Then User clicks on "OK" button
    And User clicks on "NEXT" button of Vehicle Details tab
    Then Verify user is navigated to "Financial Info"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User selects the tax rate for scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User selects the "No Offer" from old car offers
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page
    And User clicks on "SAVE & PREVIEW" button
		 And User clicks on "SUBMIT" button
		 Then Verify user is navigated to Invoice Generation screen
		 
		 
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
    And User selects the tax rate for scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User selects the "Exchange" from old car offers
    And Click on "LOYALTY EXCHANGE/ADDITIONAL CAR BENEFITS" tab on Additional Details
    And User choose Loyalty Card for scenario <rowNumber>
    And User click "OK" button on loyalty card popup
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters Exchange Loyalty bonus for scenario <rowNumber>
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page
    

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
    And User selects the tax rate for scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User selects the "Loyalty/Acquisition Bonus" from old car offers
    And Click on "LOYALTY/ACQUISITION DETAILS" tab on Additional Details
    And user filled all details on Loyalty Bonus Benefits popup based on Vin Search for scenario <rowNumber>
    And User clicks on "OK" button
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

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
  #  And if user selects B2B Customer as "Yes"
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
    And User selects the tax rate for scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User selects the "Exchange" from old car offers
  #  And Click on "LOYALTY EXCHANGE/ADDITIONAL CAR BENEFITS" tab on Additional Details
   # And User choose Loyalty Card for scenario <rowNumber>
  #  And User click "OK" button on loyalty card popup
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    #And User enters Exchange Loyalty bonus for scenario <rowNumber>
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

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
    And User selects the tax rate for scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User selects the "Exchange" from old car offers
    And Click on "LOYALTY EXCHANGE/ADDITIONAL CAR BENEFITS" tab on Additional Details
    And User choose Loyalty Card for scenario <rowNumber>
    And User click "OK" button on loyalty card popup
     And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters Exchange Loyalty bonus for scenario <rowNumber>
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

    Examples: 
      | rowNumber |
      |        10 |

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
    And User selects the tax rate for scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

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
    And Enter reg Num for "Scrappage" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Scrappage" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters Exchange Loyalty bonus for scenario <rowNumber>
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters Exchange Loyalty bonus for scenario <rowNumber>
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

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
    And User selects the "No Offer" from old car offers
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page
    

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
    And Enter reg Num for "Scrappage" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Scrappage" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page
    

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
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
     Then Validation on Charge details page
    

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
    And User clicks on "NEXT" button of Vehicle Details tab
    Then Verify user is navigated to "Financial Info"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User clicks on "NEXT" button
    And User selects the "No Offer" from old car offers
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

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
    And User clicks on "NEXT" button of Vehicle Details tab
    Then Verify user is navigated to "Financial Info"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User selects the "No Offer" from old car offers
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

    Examples: 
      | rowNumber |
      |        14 |

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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

    Examples: 
      | rowNumber |
      |        14 |

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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

    Examples: 
      | rowNumber |
      |        15 |

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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

    Examples: 
      | rowNumber |
      |        14 |

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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        14 |

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
    And Enter reg Num for "Scrappage" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Scrappage" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        14 |

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
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        14 |

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
    And User clicks on "NEXT" button of Vehicle Details tab
    Then Verify user is navigated to "Financial Info"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User clicks on "NEXT" button
    And User selects the "No Offer" from old car offers
        And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
        And User enters Exchange Loyalty bonus for scenario <rowNumber>
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page
    

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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
        And User enters Exchange Loyalty bonus for scenario <rowNumber>
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
        And User enters Exchange Loyalty bonus for scenario <rowNumber>
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Scrappage" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Scrappage" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    
    

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
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    	    Then Validation on Charge details page
    	

    Examples: 
      | rowNumber |
      |        16 |

  @BS28
  Scenario Outline: BS 28 :  B2B - CGST - CSD
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
    And User clicks on "NEXT" button of Vehicle Details tab
    Then Verify user is navigated to "Financial Info"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
        And User selects the "No Offer" from old car offers
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        22 |

  @BS29
  Scenario Outline: BS 29 :  B2B - CGST - CSD - CCP - Extended Warranty -   Exchange
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
        And User enters Exchange Loyalty bonus for scenario <rowNumber>
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        22 |

  @BS30
  Scenario Outline: BS 30 :  B2B - CGST - CSD  - Extended Warranty - CCP NoPack - Exchange  - Leasing
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
        And User enters Exchange Loyalty bonus for scenario <rowNumber>
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        23 |

  @BS31
  Scenario Outline: BS 31 :  B2B - CGST - CSD - CCP -  Exchange  - Finance
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
        And User enters Exchange Loyalty bonus for scenario <rowNumber>
    
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        22 |

  @BS32
  Scenario Outline: BS 32 :  B2B - CGST - CSD - Extended Warranty - ccp -  Cash
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
        And User selects the "No Offer" from old car offers
    
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        22 |

  @BS33
  Scenario Outline: BS 33 :  B2B - CGST - CSD - CCP - Extended Warranty -  Scrapage
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
    And Enter reg Num for "Scrappage" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Scrappage" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        22 |

  @BS34
  Scenario Outline: BS 34 :  B2B - CGST - CSD - CCP - Extended Warranty -   Loyalty Acquistion
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
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        22 |

  @BS35
  Scenario Outline: BS 35 :  B2B - IGST - CSD
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
    And User clicks on "NEXT" button of Vehicle Details tab
    Then Verify user is navigated to "Financial Info"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        24 |

  @BS36
  Scenario Outline: BS 36 :  B2B - IGST - CSD - CCP - Extended Warranty -   Exchange
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
        And User enters Exchange Loyalty bonus for scenario <rowNumber>
    
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        24 |

  @BS37
  Scenario Outline: BS 37 :  B2B - IGST - CSD  - Extended Warranty - CCP NoPack - Exchange  - Leasing
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
        And User enters Exchange Loyalty bonus for scenario <rowNumber>
    
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        25 |

  @BS38
  Scenario Outline: BS 38 :  B2B - IGST - CSD - CCP -  Exchange  - Finance
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
        And User enters Exchange Loyalty bonus for scenario <rowNumber>
    
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        24 |

  @BS39
  Scenario Outline: BS 39 :  B2B - IGST - CSD - Extended Warranty - ccp-  Cash
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        24 |

  @BS40
  Scenario Outline: BS 40 :  B2B - IGST - CSD - CCP - Extended Warranty -  Scrapage
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
    And Enter reg Num for "Scrappage" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Scrappage" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    	And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        24 |

  @BS41
  Scenario Outline: BS 41 :  B2B - IGST - CSD - CCP - Extended Warranty -   Loyalty Acquistion
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
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        24 |

  @BS42
  Scenario Outline: BS 42 :  B2C - CGST - CSD
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
    And User clicks on "NEXT" button of Vehicle Details tab
    Then Verify user is navigated to "Financial Info"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User clicks on "NEXT" button
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        26 |

  @BS43
  Scenario Outline: BS 43 :  B2C - CGST - CSD - CCP - Extended Warranty -  Exchange
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
        And User enters Exchange Loyalty bonus for scenario <rowNumber>
    
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        26 |

  @BS44
  Scenario Outline: BS 44 :  B2C - CGST - CSD  - Extended Warranty -ccp No Pckg -  Exchange  - Leasing
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
        And User enters Exchange Loyalty bonus for scenario <rowNumber>
    
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        27 |

  @BS45
  Scenario Outline: BS 45:  B2C - CGST - CSD - CCP -  Exchange  - Finance
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
        And User enters Exchange Loyalty bonus for scenario <rowNumber>
    
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        26 |

  @BS46
  Scenario Outline: BS 46 :  B2C - CGST - CSD - Extended Warranty - ccp-- Cash
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        26 |

  @BS47
  Scenario Outline: BS 47 :  B2C - CGST - CSD - CCP - Extended Warranty -  Scrapage
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
    And Enter reg Num for "Scrappage" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Scrappage" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        26 |

  @BS48
  Scenario Outline: BS 48 :  B2C - CGST - CSD - CCP - Extended Warranty -   Loyalty Bonus Benefits
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
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        26 |

  @BS49
  Scenario Outline: BS 49 :  B2C - IGST - CSD
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
    And User clicks on "NEXT" button of Vehicle Details tab
    Then Verify user is navigated to "Financial Info"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User clicks on "NEXT" button
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        28 |

  @BS50
  Scenario Outline: BS 50 :  B2C - IGST - CSD - CCP - Extended Warranty -  Exchange
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
        And User enters Exchange Loyalty bonus for scenario <rowNumber>
    
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

    Examples: 
      | rowNumber |
      |        28 |

  @BS51
  Scenario Outline: BS 51 :  B2C - IGST - CSD  - Extended Warranty -ccp No Pckg -  Exchange  - Leasing
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
        And User enters Exchange Loyalty bonus for scenario <rowNumber>
    
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        29 |

  @BS52
  Scenario Outline: BS 52:  B2C - IGST - CSD - CCP -  Exchange  - Finance
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
        And User enters Exchange Loyalty bonus for scenario <rowNumber>
    
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        28 |

  @BS53
  Scenario Outline: BS 53 :  B2C - IGST - CSD - Extended Warranty - ccp-- Cash
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
        And User selects the "No Offer" from old car offers
    
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        28 |

  @BS54
  Scenario Outline: BS 54 :  B2C - IGST - CSD - CCP - Extended Warranty -  Scrapage
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
    And Enter reg Num for "Scrappage" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Scrappage" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        28 |

  @BS55
  Scenario Outline: BS 55 :  B2C - IGST - CSD - CCP - Extended Warranty -   Loyalty Bonus Benefits
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
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

    Examples: 
      | rowNumber |
      |        28 |

  @BS56
  Scenario Outline: BS 56 :  B2C - IGST - CPC
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
    And User clicks on "NEXT" button of Vehicle Details tab
    Then Verify user is navigated to "Financial Info"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User clicks on "NEXT" button
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        30 |

  @BS57
  Scenario Outline: BS 57 :  B2C - IGST - CPC - CCP - Extended Warranty -  Exchange
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters Exchange Loyalty bonus for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        30 |

  @BS58
  Scenario Outline: BS 58 :  B2C - IGST - CCP  - Extended Warranty -ccp No Pckg -  Exchange  - Leasing
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    	And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
        And User enters Exchange Loyalty bonus for scenario <rowNumber>
    
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        31 |

  @BS59
  Scenario Outline: BS 59:  B2C - IGST - CPC - CCP -  Exchange  - Finance
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
        And User enters Exchange Loyalty bonus for scenario <rowNumber>
    
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        30 |

  @BS60
  Scenario Outline: BS 60 :  B2C - IGST - CPC - Extended Warranty - ccp-- Cash
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
        And User selects the "No Offer" from old car offers
    
    Then Verify user is navigated to "Loyalty"
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
        Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        30 |

  @BS61
  Scenario Outline: BS 61 :  B2C - IGST - CPC - CCP - Extended Warranty -  Scrapage
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Scrappage" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Scrappage" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        30 |

  @BS62
  Scenario Outline: BS 62 :  B2C - IGST - CPC - CCP - Extended Warranty -   Loyalty Bonus Benefits
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
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        30 |

  @BS63
  Scenario Outline: BS 63 :  B2B - IGST - CPC
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        32 |

  @BS64
  Scenario Outline: BS 64 :  B2B - IGST - CPC - CCP - Extended Warranty -   Exchange
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        32 |

  @BS65
  Scenario Outline: BS 65 :  B2B - IGST - CPC  - Extended Warranty - CCP NoPack - Exchange  - Leasing
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        33 |

  @BS66
  Scenario Outline: BS 66 :  B2B - IGST - CPC - CCP -  Exchange  - Finance
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        32 |

  @BS67
  Scenario Outline: BS 67 :  B2B - IGST - CPC - Extended Warranty - ccp-  Cash
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        32 |

  @BS68
  Scenario Outline: BS 68 :  B2B - IGST - CPC - CCP - Extended Warranty -  Scrapage
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Scrappage" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Scrappage" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        32 |

  @BS69
  Scenario Outline: BS 69 :  B2B - IGST - CPC - CCP - Extended Warranty -   Loyalty Acquistion
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
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        32 |

  @BS70
  Scenario Outline: BS 70 :  B2C - CGST - CPC
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab  
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page
    

    Examples: 
      | rowNumber |
      |        34 |

  @BS71
  Scenario Outline: BS 71 :  B2C - CGST - CPC - CCP - Extended Warranty -  Exchange
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        34 |

  @BS72
  Scenario Outline: BS 72 :  B2C - CGST - CPC  - Extended Warranty -ccp No Pckg -  Exchange  - Leasing
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        35 |

  @BS73
  Scenario Outline: BS 73:  B2C - CGST - CPC - CCP -  Exchange  - Finance
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        34 |

  @BS74
  Scenario Outline: BS 74 :  B2C - CGST - CPC - Extended Warranty - ccp-- Cash
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        34 |

  @BS75
  Scenario Outline: BS 75 :  B2C - CGST - CPC - CCP - Extended Warranty -  Scrapage
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
    And Enter reg Num for "Scrappage" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Scrappage" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        34 |

  @BS76
  Scenario Outline: BS 76 :  B2C - CGST - CPC - CCP - Extended Warranty -   Loyalty Bonus Benefits
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
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        34 |

  @BS77
  Scenario Outline: BS 77 :  B2B - CGST - CPC
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        36 |

  @BS78
  Scenario Outline: BS 78 :  B2B - CGST - CPC - CCP - Extended Warranty -   Exchange
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        36 |

  @BS79
  Scenario Outline: BS 79 :  B2B - CGST - CPC  - Extended Warranty - CCP NoPack - Exchange  - Leasing
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        37 |

  @BS80
  Scenario Outline: BS 80 :  B2B - CGST - CPC - CCP -  Exchange  - Finance
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        36 |

  @BS81
  Scenario Outline: BS 81 :  B2B - CGST - CPC - Extended Warranty - ccp -  Cash
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        36 |

  @BS82
  Scenario Outline: BS 82 :  B2B - CGST - CSD - CPC - Extended Warranty -  Scrapage
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Scrappage" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Scrappage" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        36 |

  @BS83
  Scenario Outline: BS 83 :  B2B - CGST - CPC - CCP - Extended Warranty -   Loyalty Acquistion
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
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        36 |

  @BS84
  Scenario Outline: BS 84: Validate the count of orders dispalyed on UI and backend (ST_ALLOT)
    Given User is on Home Page
    When user search by "<SearchParam>"
    And user clicks on search button
    Then verify count of total count of records

    Examples: 
      | SearchParam |
      | ORDER       |

  @BS85
  Scenario Outline: BS 85: Validate the latest orders should come 1st in search by order page
    Given User is on Home Page
    When user search by "<SearchParam>"
    And user clicks on search button
    Then verify user is able to view all Customer details for search by order

    Examples: 
      | SearchParam |
      | ORDER       |

  @BS86
  Scenario Outline: BS 86: Validate if dealer is able filter search by order based on Order ID
    Given User is on Home Page
    When user search by "<SearchParam>"
    And user enters Order Id for scenario <rowNo>
    And user clicks on search button
    Then verify user is able to view Customer details by order based on scenario <rowNo>

    Examples: 
      | rowNo | SearchParam |
      |    38 | ORDER       |
      |    39 | ORDER       |
      |    40 | ORDER       |

  @BS87
  Scenario Outline: BS 87 :  For cancel and booked status Order should not display on UI
    Given User is on Home Page
    When user search by "<SearchParam>"
    And user enters Order Id for scenario <rowNo>
    And user clicks on search button
    Then Verify if "No Records Found." text showing

    Examples: 
      | rowNo | SearchParam |
      |    41 | ORDER       |
      |    42 | ORDER       |

  @BS88
  Scenario Outline: BS 88 :  B2B - IGST - BSF
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        43 |

  @BS89
  Scenario Outline: BS 89 :  B2B - IGST - BSF - CCP - Extended Warranty -   Exchange
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        43 |

  @BS90
  Scenario Outline: BS 90 :  B2B - IGST - BSF  - Extended Warranty - CCP NoPack - Exchange  - Leasing
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        44 |

  @BS91
  Scenario Outline: BS 91 :  B2B - IGST - BSF - CCP -  Exchange  - Finance
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        43 |

  @BS92
  Scenario Outline: BS 92 :  B2B - IGST - BSF - Extended Warranty - ccp-  Cash
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        43 |

  @BS93
  Scenario Outline: BS 93 :  B2B - IGST - BSF - CCP - Extended Warranty -  Scrapage
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
    And Enter reg Num for "Scrappage" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Scrappage" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        43 |

  @BS94
  Scenario Outline: BS 94 :  B2B - IGST - BSF - CCP - Extended Warranty -   Loyalty Acquistion
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
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        43 |

  @BS95
  Scenario Outline: BS 95 :  B2C - IGST - BSF
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        45 |

  @BS96
  Scenario Outline: BS 96 :  B2C - IGST - BSF - CCP - Extended Warranty -  Exchange
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        45 |

  @BS97
  Scenario Outline: BS 97 :  B2C - IGST - BSF  - Extended Warranty -ccp No Pckg -  Exchange  - Leasing
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        46 |

  @BS98
  Scenario Outline: BS 98:  B2C - IGST - BSF - CCP -  Exchange  - Finance
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        45 |

  @BS99
  Scenario Outline: BS 99 :  B2C - IGST - BSF - Extended Warranty - ccp-- Cash
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        45 |

  @BS100
  Scenario Outline: BS 100 :  B2C - IGST - BSF - CCP - Extended Warranty -  Scrapage
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Scrappage" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Scrappage" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        45 |

  @BS101
  Scenario Outline: BS 101 :  B2C - IGST - BSF - CCP - Extended Warranty -   Loyalty Bonus Benefits
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
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        45 |

  @BS102
  Scenario Outline: BS 102 :  B2B - CGST - HNC
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        47 |

  @BS103
  Scenario Outline: BS 103 :  B2B - CGST - HNC - CCP - Extended Warranty -   Exchange
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        47 |

  @BS104
  Scenario Outline: BS 104 :  B2B - CGST - HNC  - Extended Warranty - CCP NoPack - Exchange  - Leasing
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        48 |

  @BS105
  Scenario Outline: BS 105 :  B2B - CGST - HNC - CCP -  Exchange  - Finance
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        47 |

  @BS106
  Scenario Outline: BS 106 :  B2B - CGST - HNC - Extended Warranty - ccp -  Cash
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        47 |

  @BS107
  Scenario Outline: BS 107 :  B2B - CGST - HNC - CPC - Extended Warranty -  Scrapage
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Scrappage" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Scrappage" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        47 |

  @BS108
  Scenario Outline: BS 108 :  B2B - CGST - HNC - CCP - Extended Warranty -   Loyalty Acquistion
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
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    And Validation on Charge details page

    Examples: 
      | rowNumber |
      |        47 |

  @BS109
  Scenario Outline: BS 109 :  B2C - CGST - HNC
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        49 |

  @BS110
  Scenario Outline: BS 110 :  B2C - CGST - HNC - CCP - Extended Warranty -  Exchange
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        49 |

  @BS111
  Scenario Outline: BS 111 :  B2C - CGST - HNC  - Extended Warranty -ccp No Pckg -  Exchange  - Leasing
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        50 |

  @BS112
  Scenario Outline: BS 112:  B2C - CGST - HNC - CCP -  Exchange  - Finance
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        49 |

  @BS113
  Scenario Outline: BS 113 :  B2C - CGST - HNC - Extended Warranty - ccp-- Cash
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        49 |

  @BS114
  Scenario Outline: BS 114 :  B2C - CGST - HNC - CCP - Extended Warranty -  Scrapage
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
    And Enter reg Num for "Scrappage" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Scrappage" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        49 |

  @BS115
  Scenario Outline: BS 115 :  B2C - CGST - HNC - CCP - Extended Warranty -   Loyalty Bonus Benefits
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
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        49 |

  @BS116
  Scenario Outline: BS 116 :  B2C - IGST - HNC
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        51 |

  @BS117
  Scenario Outline: BS 117 :  B2C - IGST - HNC - CCP - Extended Warranty -  Exchange
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        51 |

  @BS118
  Scenario Outline: BS 118 :  B2C - IGST - HNC  - Extended Warranty -ccp No Pckg -  Exchange  - Leasing
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        52 |

  @BS119
  Scenario Outline: BS 119:  B2C - IGST - HNC - CCP -  Exchange  - Finance
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        51 |

  @BS120
  Scenario Outline: BS 120 :  B2C - IGST - HNC - Extended Warranty - ccp-- Cash
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        51 |

  @BS121
  Scenario Outline: BS 121 :  B2C - IGST - HNC - CCP - Extended Warranty -  Scrapage
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Scrappage" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Scrappage" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        51 |

  @BS122
  Scenario Outline: BS 122 :  B2C - IGST - HNC - CCP - Extended Warranty -   Loyalty Bonus Benefits
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
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        51 |

  @BS123
  Scenario Outline: BS 123 :  B2B - IGST - HNC
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

    Examples: 
      | rowNumber |
      |        53 |

  @BS124
  Scenario Outline: BS 124 :  B2B - IGST - HNC - CCP - Extended Warranty -   Exchange
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

    Examples: 
      | rowNumber |
      |        53 |

  @BS125
  Scenario Outline: BS 125 :  B2B - IGST - HNC  - Extended Warranty - CCP NoPack - Exchange  - Leasing
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

    Examples: 
      | rowNumber |
      |        54 |

  @BS126
  Scenario Outline: BS 126 :  B2B - IGST - HNC - CCP -  Exchange  - Finance
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
    And Click on "OLD VEHICLE DETAILS" tab on Additional Details
    And Enter reg Num for "Exchange" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Exchange" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

    Examples: 
      | rowNumber |
      |        53 |

  @BS127
  Scenario Outline: BS 127 :  B2B - IGST - HNC - Extended Warranty - ccp-  Cash
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
    And User selects the "No Offer" from old car offers
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

    Examples: 
      | rowNumber |
      |        53 |

  @BS128
  Scenario Outline: BS 128 :  B2B - IGST - HNC - CCP - Extended Warranty -  Scrapage
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
    And Enter reg Num for "Scrappage" for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And User choose old vehicle for "Scrappage" for scenario <rowNumber>
    And Choose Relation for scenario <rowNumber>
    And User clicks on "OK" button on popup
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"

    Examples: 
      | rowNumber |
      |        53 |

  @BS129
  Scenario Outline: BS 129 :  B2B - IGST - HNC - CCP - Extended Warranty -   Loyalty Acquistion
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
    #And User Select other offers
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page

    Examples: 
      | rowNumber |
      |        53 |
      
      @BS130
  Scenario Outline: BS 130:  Edit Functionality
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
    And User enters and select other offers for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page
    And User clicks on "SAVE & PREVIEW" button
    And User clicks on "EDIT" button
    And User edit billing address
    And User clicks on "NEXT" button
        And User clicks on "NEXT" button
            And User clicks on "NEXT" button
            And User clicks on "NEXT" button
                And User clicks on "SAVE & PREVIEW" button
                Then Verify billing Address after edit for scenario <rowNumber>
            
        
    
    

    Examples: 
      | rowNumber |
      |         8 |
	
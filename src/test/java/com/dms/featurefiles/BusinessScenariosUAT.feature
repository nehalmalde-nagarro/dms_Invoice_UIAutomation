@UATBS
Feature: UAT BS

  Background: Login with dealer
    Given User is on Login Page
    And User clicks on "Dealer" button
    #And User enters "ccm_sales121" and "Welcome@1234"
    And User enters "677272" and "5555"
    And User click on "LOGIN" button


 @UATBS1
  Scenario Outline: BS 1 :  B2C - CGST - Individual  - Extended Warranty - CCP - Exchange  - Leasing
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
    And User clicks on "Search" button on popup
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
   And User enters and select other offers "Additional Discount 1" for scenario <rowNumber>
    And User enters and select other offers "Additional Discount 2" for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page
	 	And User clicks on "SAVE & PREVIEW" button
		 And User clicks on "SUBMIT" button
		 Then Verify user is navigated to Invoice Generation screen
		 
    Examples: 
      | rowNumber |
      |         1 |

@UATBS2
  Scenario Outline: BS 2 :  B2C - CGST - Individual  - Extended Warranty - CCP - No Exchange  - Leasing
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
    And User clicks on "Search" button on popup
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
    And User enters and select other offers "Additional Discount 3" for scenario <rowNumber>
    And User enters and select other offers "Additional Discount 4" for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page
	 	And User clicks on "SAVE & PREVIEW" button
		 And User clicks on "SUBMIT" button
		 Then Verify user is navigated to Invoice Generation screen
		 
    Examples: 
      | rowNumber |
      |         2 | 
      
 @UATBS3
  Scenario Outline: BS 3 :  B2C - IGST - Individual  - Extended Warranty - CCP - Exchange  - Finance
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And user enters Bill GSTN field from <rowNumber>
    And user enters all required fields from <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Vehicle Info"
    And user selects Owners Manual Preference for scenario <rowNumber>
    And user selects Interested in Loyalty Card, Type of card, Reason for scenario <rowNumber>
    And user clicks on Preferred SRV Dealer popup
    And user selects state for scenario <rowNumber>
    And user selects city for scenario <rowNumber>
    And User clicks on "Search" button on popup
    And selects the dealer for scenario <rowNumber> from searched results
    And User clicks on "OK" button
    And user selects Extended Warranty for scenario <rowNumber>
    And User clicks on CCP Sale popup
    And Verify if benefit is already selected or select benefit from <rowNumber>
    And User clicks on "OK" button
    Then Verify if ccp benefit is selected
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Financial Info"
    When User selects payment type as "Finance"
    And User selects all required fields on financial info for scenario <rowNumber>
    And User selects GST as "IGST"
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
    And User enters and select other offers "AUTO CARD" for scenario <rowNumber>
    And User enters and select other offers "ADS 10" for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page
	 	And User clicks on "SAVE & PREVIEW" button
		 And User clicks on "SUBMIT" button
		 Then Verify user is navigated to Invoice Generation screen
		 
    Examples: 
      | rowNumber |
      |         3 | 
      
 @UATBS4
  Scenario Outline: BS 4 :  B2C - IGST - Individual  - Extended Warranty - CCP - No Exchange  - Cash
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And user enters Bill GSTN field from <rowNumber>
    And user enters all required fields from <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Vehicle Info"
    And user selects Owners Manual Preference for scenario <rowNumber>
    And user selects Interested in Loyalty Card, Type of card, Reason for scenario <rowNumber>
    And user clicks on Preferred SRV Dealer popup
    And user selects state for scenario <rowNumber>
    And user selects city for scenario <rowNumber>
    And User clicks on "Search" button on popup
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
    And User selects GST as "IGST"
    And User selects the tax rate for scenario <rowNumber>
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
    And User enters and select other offers "AUTO CARD" for scenario <rowNumber>
    And User enters and select other offers "ADS 10" for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page
	 	And User clicks on "SAVE & PREVIEW" button
		 And User clicks on "SUBMIT" button
		 Then Verify user is navigated to Invoice Generation screen
		 
    Examples: 
      | rowNumber |
      |         4 | 
      
  @UATBS5
  Scenario Outline: BS 5 :  B2C - CGST - CSD  - Extended Warranty - CCP - No Exchange - Leasing
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
    And User clicks on "Search" button on popup
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
    And User enters and select other offers "Additional Discount 3" for scenario <rowNumber>
    And User enters and select other offers "Additional Discount 4" for scenario <rowNumber>
    And User enters all required fields on Addtional tab
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Charge Details"
    Then Validation on Charge details page
	 	And User clicks on "SAVE & PREVIEW" button
		 And User clicks on "SUBMIT" button
		 Then Verify user is navigated to Invoice Generation screen
		 
    Examples: 
      | rowNumber |
      |         5 |
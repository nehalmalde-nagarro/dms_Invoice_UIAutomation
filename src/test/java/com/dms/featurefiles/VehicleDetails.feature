@VehicleDetails
Feature: Add Invoice - Vehicle Details Tab

  Background: Login with dealer
    Given User is on Login Page
    And User clicks on "Dealer" button
    And User enters "grn_sale" and "Welcome@1234"
    And User click on "LOGIN" button 
    #Then verify user profile

  Scenario Outline: Validate prefilled data on Vehicles details page
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
    Then Verify Prefilled fields for OrderId from scenario <rowNumber> on Vehicle Details tab

    Examples: 
      | rowNumber |
      |         1 |

  Scenario Outline: Validate previous button functionality on Vehicles details page
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
    And User clicks on "PREV" button 
    And User clicks on "YES" button on popup
    Then Verify user is navigated to "Order Details"

    Examples: 
      | rowNumber |
      |         1 |

  Scenario Outline: Validate back to listing button  functionality
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
    And User clicks on "BACK TO LISTING" button
    And User clicks on "NO" button on popup
    Then verify user is on Add Invoice page
    When User clicks on "BACK TO LISTING" button
    And User clicks on "YES" button on popup
    Then Verify User is on Home Page
    
     Examples: 
      | rowNumber |
      |         1 |

  Scenario Outline: Validate next button functionality on Vehicles details page
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
    Then Verify user is navigated to "Financial Info"

    Examples: 
      | rowNumber |
      |         1 |

  Scenario Outline: Validate Fasttag functionalities of Vehicle details tab
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
    And User clicks on FastTag button
    And User enters Fast Tag ID from <rowNumber>
    Then Verify if "OK" button is disable
    When User selects Fast Tag Bank for scenario <rowNumber>
    And User selects Fast Tag Fitment Date "20-12-2023"
    Then User clicks on "OK" button
    And User clicks on FastTag button
    And User enters Fast Tag ID from <rowNumber>
    And User clicks on "CLEAR" button on popup
    Then Verify the FastTag fields are cleared out
    And Click on Close popup icon
    Then Verify if Popup closed

    Examples: 
      | rowNumber |
      |         1 |

  Scenario Outline: Validate Preferred SRV functionalities of Vehicle details tab
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
    And user clicks on Preferred SRV Dealer popup
    And user selects state for scenario <rowNumber>
    Then Verify if "OK" button is disable
    And user selects city for scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And selects the dealer for scenario <rowNumber> from searched results
    And User clicks on "OK" button
    And user clicks on Preferred SRV Dealer popup
    And user selects state for scenario <rowNumber>
    And user selects city for scenario <rowNumber>
    And User clicks on "CLEAR" button on popup
    Then Verify the Preferred SRV fields are cleared out
    And Click on Close popup icon
    Then Verify if Popup closed

    Examples: 
      | rowNumber |
      |         1 |

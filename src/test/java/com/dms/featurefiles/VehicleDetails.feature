@VehicleDetails
Feature: Add Invoice - Vehicle Details Tab
 
  Background: Login with dealer
    Given User is on Login Page
    And User clicks on "Dealer" button
    And User enters "grn_sale" and "Welcome@1234"
    And User click on "LOGIN" button
 
#Scenario Outline: Validate prefilled data on Vehicles details page
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
    #Then Verify Prefilled fields for "<OrderId>" on Vehicle Details tab
    #Examples: 
      #| OrderId     | Workspace  |  AadharNum   |  BillGSTN   |
      #| SOB23000623 |            |              |             |
 #
 #
#Scenario Outline: Validate previous button functionality on Vehicles details page
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
    #And User clicks on "Prev" button
    #Then Verify user is navigated to "Order Details"
 #
#Examples: 
      #| OrderId     | Workspace  |  AadharNum   |  BillGSTN   |
      #| SOB23000623 |            |              |             |
 #
#Scenario: Validate back to listing button  functionality
  #Given User is on Home Page
  #When User clicks on "Add Invoice" button
  #And User clicks on "BACK TO LISTING" button
  #And User clicks on "NO" button on popup
  #Then verify user is on Add Invoice page
  #When User clicks on "BACK TO LISTING" button
  #And User clicks on "YES" button on popup
  #Then Verify User is on Home Page
 #
Scenario Outline: Validate next button functionality on Vehicles details page
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters "<OrderId>" for OrderId
    And User clicks on "SEARCH" button
    And User select from displayed orders for "<OrderId>"
    And User clicks on "OK" button
    And user enters Workspace as "<Workspace>"
    And user enters Aadhar Number as "<AadharNum>"
    And user enters "<BillGSTN>" in Bill GSTN field
    And User clicks on "NEXT" button
    And user selects Owner's Manual Preference as "<OwnerManualPref>"
    And user selects Interested in Loyalty Card, Type of card, Reason as "<LoyaltyCard>", "<TypeOFLoyaltyCard>", "<Reason>"
    And user clicks on Preferred SRV Dealer popup 
    And user selects state as "<state>" 
    And user selects city as "<city>"
    And User clicks on "SEARCH" button on popup
    And selects the dealer "<Dealer>" from searched results
    And User clicks on "OK" button
    And user selects Extended Warranty as "<ExtendedWarranty>"
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Financial Info"
 
Examples: 
| OrderId     | Workspace  |  AadharNum   |  BillGSTN   | OwnerManualPref | LoyaltyCard | TypeOFLoyaltyCard | Reason | state | city | Dealer|ExtendedWarranty |
| SOB23000623|    OTHER   |  898922216665 |A123456789fghd1|  Digital       | Yes         | Maruti Suzuki Rewards  |        |ANDHRA PRADESH |AMARAVATHI|JAYALAKSHMI|Extended Warranty Gold|
| SOB23000623|    OTHER   |  898922216665 |A123456789fghd2|  Physical       | No         |  |   Customer Not Interested   |ANDHRA PRADESH |AMARAVATHI|JAYALAKSHMI|Extended Warranty Platinum|


Scenario Outline: Validate Fasttag functionalities of Vehicle details tab
  Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters "<OrderId>" for OrderId
    And User clicks on "SEARCH" button
    And User select from displayed orders for "<OrderId>"
    And User clicks on "OK" button
    And user enters Workspace as "<Workspace>"
    And user enters Aadhar Number as "<AadharNum>"
    And user enters "<BillGSTN>" in Bill GSTN field
    And User clicks on "NEXT" button
  And User clicks on FastTag button
  And User enters "<FastTagID>" for Fast Tag ID
  Then Verify if "OK" button is disable
  When User selects Fast Tag Bank as "<FastTagBank>"
  And User selects Fast Tag Fitment Date "<Date>"
  Then User clicks on "OK" button
  And User clicks on "FASTTAG" button
  And User enters "<FastTagID>" for Fast Tag ID
  And User selects Fast Tag Bank as "<FastTagBank>"
  And User selects Fast Tag Fitment Date "<Date>"
  And User clicks on "CLEAR" button on popup
  Then Verify the FastTag fields are cleared out
  And Click on Close popup icon
  Then Verify if Popup closed
Examples: 
      | OrderId     | Workspace  |  AadharNum   |  BillGSTN   | FastTagID | FastTagBank | Date |
      | SOB23000623 |  OTHER     | 222211115555 | A12345678923aqe|A123|Individual|22-11-2023|

Scenario Outline: Validate Preferred SRV functionalities of Vehicle details tab
  Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters "<OrderId>" for OrderId
    And User clicks on "SEARCH" button
    And User select from displayed orders for "<OrderId>"
    And User clicks on "OK" button
    And user enters Workspace as "<Workspace>"
    And user enters Aadhar Number as "<AadharNum>"
    And user enters "<BillGSTN>" in Bill GSTN field
    And User clicks on "NEXT" button
  And user clicks on Preferred SRV Dealer popup 
  And user selects state as "<state>"
  Then Verify if "OK" button is disable 
    And user selects city as "<city>"
    And User clicks on "SEARCH" button on popup
    And selects the dealer "<Dealer>" from searched results
    And User clicks on "OK" button
    And user clicks on Preferred SRV Dealer popup 
    And user selects state as "<state>" 
    And user selects city as "<city>"
    And User clicks on "CLEAR" button on popup
   Then Verify the Preferred SRV fields are cleared out
  And Click on Close popup icon
  Then Verify if Popup closed

Examples: 
      | OrderId     | Workspace  |  AadharNum   |  BillGSTN   | State | City | Dealer|
      | SOB23000623 |  OTHER     | 222211115555 | A12345678923aqe|A123|Individual||


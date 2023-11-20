@AddInvoice
Feature: Add Invoice - Invoice Details Tab

  Background: Login with dealer
    Given User is on Login Page
    And User clicks on "Dealer" button
    And User enters "grn_sale" and "Welcome@1234"
    And User click on "LOGIN" button

  # Then verify user profile
  Scenario Outline: Validate Prefilled fields on Invoice Details tab
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    Then Verify Prefilled fields for OrderId from scenario <rowNumber> on invoice Details tab

    Examples: 
      | rowNumber |
      |         1 |

  Scenario Outline: Validate PopUp functionalities of search order Popup
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters Mobile Number from scenario <rowNumber>
    And User clicks on "SEARCH" button on popup
    And Verify if "OK" button is disable
    Then Verify data on search by Mobile Number for scenario <rowNumber>
    And User clicks on "CLEAR" button on popup
    And Verify if "SEARCH" button is disable
    And Click on Close popup icon
    Then Verify if Popup closed

    Examples: 
      | rowNumber |
      |         1 |

  Scenario Outline: Validate if no record found if invalid data input to search on popup
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters Mobile Number "<MobileNo>"
    And User enters OrderId "<OrderId>"
    And User clicks on "SEARCH" button on popup
    Then Verify if "Nothing to display" text showing

    Examples: 
      | MobileNo   | OrderId     |
      | 1212121212 | SB000212121 |

  Scenario: Validate back to listing button  functionality
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User clicks on "BACK TO LISTING" button
    And User clicks on "NO" button on popup
    Then verify user is on Add Invoice page
    When User clicks on "BACK TO LISTING" button
    And User clicks on "YES" button on popup
    Then Verify User is on Home Page

  Scenario Outline: Validate clear button functionality on Invoice details page
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And User clicks on "CLEAR" button
    Then verify all the fields are empty on Invoice details page except Invoice Type and Selling Price For

    Examples: 
      | rowNumber |
      |         1 |

  Scenario Outline: Validate B2B functionality on Invoice details page
    Given User is on Home Page
    When User clicks on "Add Invoice" button
    And User click on Search Order
    And User enters OrderId from scenario <rowNumber>
    And User clicks on "SEARCH" button
    And User select from displayed orders for scenario <rowNumber>
    And User clicks on "OK" button
    And if user selects B2B Customer as "Yes"
    And user enters "GSTUNREGISTERED" in Bill GSTN field
    Then verify error message is displayed as "Enter GST Number for B2B Customer."
    And if user selects B2B Customer as "No"
    And user enters "ABC1001002003A" in Bill GSTN field
    Then verify error message is displayed as "GST Number found for B2C Customer."

    Examples: 
      | rowNumber |
      |         1 |

  Scenario Outline: Validate Next button functionality on Invoice details page
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

    Examples: 
      | rowNumber |
      |         1 |

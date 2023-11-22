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
    Then Verify Prefilled fields for OrderId from scenario <rowNumber> on Financial Info tab

    Examples: 
      | rowNumber |
      |         1 |

  Scenario Outline: Validate the Finance and Leasing payment Type dependent fields
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
    And User selects payment type as "Cash"
    Then verify the fields Financier, Finance Amount, Branch and Finance Details are disabled
    When User selects payment type as "Finance"
    Then verify the fields Financier, Finance Amount, Branch and Finance Details are enabled
    When User selects payment type as "Leasing"
    Then verify the fields Financier, Finance Amount, Branch and Finance Details are enabled

    Examples: 
      | rowNumber |
      |         1 |

@finance
  Scenario Outline: Validate the next button is enabled in Financial Info page and able to navigate to next screen when Payment Type is Cash
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

    Examples: 
      | rowNumber |
      |         1 |

 Scenario Outline: Validate Receipt Details in Financial Info page
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
    And user clicks on Receipt Details
    And user selects the receipt
    And User clicks on "OK" button
    And user clicks on Receipt Details
    And user selects the receipt
    And User clicks on "CLEAR" button on popup
    Then Verify receipt details should be cleared
    
    Examples:
      | rowNumber |
      |         5 |

Scenario Outline: Validate the next button is enabled in Financial Info page and able to navigate to next screen when Payment Type is Finance and Loan status is Approved
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
    When User selects payment type as "Finance"
    And User selects Financier for scenario <rowNumber>
    And User selects Finance Amount for scenario <rowNumber>
    And User selects tax rate for scenario <rowNumber>
    And User selects TDS Amount for scenario <rowNumber>
    And User selects TCS Flag for scenario <rowNumber>
    And user clicks on Receipt Details
    And user selects the receipt
    And User clicks on Receipt Details Popup "OK" button
    And User clicks on Financial Details
    And User selects Loan Type for scenario <rowNumber>
    And User selects Loan Status for scenario <rowNumber>
    And User selects Loan Application Date for scenario <rowNumber>
    And User selects Loan Approval Date for scenario <rowNumber>
    And User selects Loan Closing Date for scenario <rowNumber>
    And User selects Loan Disbursal Date for scenario <rowNumber>
    And User selects Down Payment Mode for scenario <rowNumber>
    And User clicks on "OK" button
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
 
    Examples:
      | rowNumber |
      |         2 |
 
 
Scenario Outline: Validate the next button is enabled in Financial Info page and able to navigate to next screen when Payment Type is Finance and Loan Status as Rejected
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
    When User selects payment type as "Finance"
    And User selects Financier for scenario <rowNumber>
    And User selects Finance Amount for scenario <rowNumber>
    And User selects tax rate for scenario <rowNumber>
    And User selects TDS Amount for scenario <rowNumber>
    And user clicks on Receipt Details
    And user selects the receipt
    And User clicks on Receipt Details Popup "OK" button
    And User clicks on Financial Details
    And User selects Loan Type for scenario <rowNumber>
    And User selects Loan Status for scenario <rowNumber>
    And User selects Loan Application Date for scenario <rowNumber>
    And User selects Loan Rejection Date for scenario <rowNumber>
    And User clicks on "OK" button
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"
 
    Examples:
      | rowNumber |
      |         3 |

  Scenario Outline: Validate the next button is enabled in Financial Info page and able to navigate to next screen when Payment Type is Leasing
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
    When User selects payment type as "Leasing"
    And User selects Financier for scenario <rowNumber>
    And User selects Finance Amount for scenario <rowNumber>
    And User selects tax rate for scenario <rowNumber>
    And User selects TDS Amount for scenario <rowNumber>
    And user clicks on Receipt Details
    And user selects the receipt
    And User clicks on Receipt Details Popup "OK" button
    And User clicks on Financial Details
    And User selects Loan Type for scenario <rowNumber>
    And User selects Loan Status for scenario <rowNumber>
    And User selects Loan Application Date for scenario <rowNumber>
    And User selects Loan Approval Date for scenario <rowNumber>
    And User selects Loan Closing Date for scenario <rowNumber>
    And User selects Loan Disbursal Date for scenario <rowNumber>
    And User selects Down Payment Mode for scenario <rowNumber>
    And User clicks on "OK" button
    And User clicks on "NEXT" button
    Then Verify user is navigated to "Loyalty"

    Examples: 
      | rowNumber |
      |         2 |

  Scenario Outline: Validate clear button functionality in Financial Detail pop up
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
    And User selects Financier for scenario <rowNumber>
    And User selects Finance Amount for scenario <rowNumber>
    And User selects tax rate for scenario <rowNumber>
    And User selects TDS Amount for scenario <rowNumber>
    And User selects TCS Flag for scenario <rowNumber>
    And user clicks on Receipt Details
    And user selects the receipt
    And User clicks on Receipt Details Popup "OK" button
    And User clicks on Financial Details
    And User selects Loan Type for scenario <rowNumber>
    And User selects Loan Status for scenario <rowNumber>
    And User selects Loan Application Date for scenario <rowNumber>
    And User selects Loan Approval Date for scenario <rowNumber>
    And User selects Loan Closing Date for scenario <rowNumber>
    And User selects Loan Disbursal Date for scenario <rowNumber>
    And User selects Down Payment Mode for scenario <rowNumber>
    And User clicks on "CLEAR" button on popup
    Then Verify the Financial Details fields are cleared out

    Examples: 
      | rowNumber |
      |         2 |

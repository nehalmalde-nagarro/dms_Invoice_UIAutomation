@Search
Feature: Search by Order or Invoice on Dashboard Page

  Background: Login with dealer
    Given User is on Login Page
    When User clicks on "Dealer" button
    And User enters "ccm_sales121" and "Welcome@123"
    And User click on Captcha
    And User click on "LOGIN" button

  Scenario Outline: Validate if dealer is able to view all order deatils on click on search button
  Given User is on Home Page
  When user search by "<SearchParam>"
  And user clicks on search button
  Then verify user is able to view all Customer details for search by order
  
  Examples:
  | SearchParam |
  | ORDER       |
  
  Scenario Outline: Validate if dealer is able filter search by order based on Order ID
  Given User is on Home Page
  When user search by "<SearchParam>"
  And user enters Order Id "<OrderId>"
  And user clicks on search button
  Then verify user is able to view Customer details by order based on "<OrderId>"
  
  Examples:
  | OrderId     | SearchParam |
  | SOB06000006	 | ORDER       |
  
  Scenario Outline: Validate if dealer is able filter search by order based on Phone number
  Given User is on Home Page
  When user search by "<SearchParam>"
  And user enters Phone Number "<PhoneNumber>"
  When user clicks on search button
  Then verify user is able to view Customer details by order based on phone number "<PhoneNumber>"
  
  Examples:
  | PhoneNumber | SearchParam |
  |  9322226386 | ORDER       |
  
  #Scenario Outline: Validate if dealer is able filter search by order based on dates
  #Given User is on Home Page
  #When user search by "<SearchParam>"
  #And user selects From "<fromdate>"
  #And user selects To "<todate>"
  #When user clicks on search button
  #Then verify user is able to view Customer details by order based on "<fromdate>" and "<todate>"
  #
  #Examples:
  #| fromdate   | todate     | SearchParam |
  #| 20-06-2023 | 21-09-2023 | ORDER       |
  
  Scenario Outline: Validate if dealer is able filter search by order based on various Valid params
  Given User is on Home Page
  When user search by "<SearchParam>"
  And user enters Order Id "<OrderId>"
  And user enters Phone Number "<PhoneNumber>"
  #And user selects From "<fromdate>"
  #And user selects To "<todate>"
  And user clicks on search button
  Then Verify user is able to view Customer details by order based on "<OrderId>" "<fromdate>" "<todate>" "<PhoneNumber>"
  
  Examples:
  | SearchParam | OrderId     | fromdate   | todate     | PhoneNumber |
  | ORDER       | SOB06000007	 | 20-06-2023 | 21-09-2023 | 9322226386 |
  
  Scenario Outline: Validate if dealer is able filter search by order based on various invalid params
  Given User is on Home Page
  When user search by "<SearchParam>"
  And user enters Order Id "<OrderId>"
  And user enters Phone Number "<PhoneNumber>"
  And user selects From "<fromdate>"
  And user selects To "<todate>"
  And user clicks on search button
  Then Verify if "No Records Found." text showing
  
  Examples:
  | SearchParam | OrderId     | fromdate   | todate     | PhoneNumber |
  | ORDER       | SOB23000621 | 20-06-2023 | 21-09-2023 | 83404232026 |
  
  Scenario Outline: Verify if clear icon clear search text box for order search by
  Given User is on Home Page
  When user search by "<SearchParam>"
  And user enters Order Id "<OrderId>"
  And user enters Phone Number "<PhoneNumber>"
  And user selects From "<fromdate>"
  And user selects To "<todate>"
  And user clicks on clear button
  Then verify if fields are clear out for search by order
  
  Examples:
  | SearchParam | OrderId     | fromdate   | todate     | PhoneNumber |
  | ORDER       | SOB23000621 | 20-06-2023 | 21-09-2023 | 83404232026 |
  
  Scenario Outline: Validate search button not activated if Phone Number is not of 10 digit for search by order
  Given User is on Home Page
  When user search by "<SearchParam>"
  And user enters Phone Number "<PhoneNumber>"
  When user clicks on search button
  Then verify if search button is disable
  
  Examples:
  | SearchParam | PhoneNumber |
  | ORDER       |      839283 |
  
  Scenario Outline: Verify if click on Generate Invoice Add invoice
  Given User is on Home Page
  When user search by "<SearchParam>"
  And user enters Order Id "<OrderId>"
  And user clicks on search button
  And user clicks on Generate Invoice for "<OrderId>"
  Then verify user is on Add Invoice page
  
  Examples:
  | OrderId     | SearchParam |
  | SOB23000623 | ORDER       |
  
  #============= FOR INVOICE  =====================
  
  
  Scenario Outline: Validate if dealer is able filter search by invoice based on Invoice ID
    Given User is on Home Page
    When user search by "<SearchParam>"
    And user enters Invoice Number "<InvoiceNumber>"
    When user clicks on search button
    Then verify user is able to view Customer details by invoice based on "<InvoiceNumber>"

    Examples: 
      | SearchParam | InvoiceNumber |
      | INVOICE     | VSL/23000505  |
      | INVOICE     | VSL/23000520  |
      | INVOICE     | VSL/23000510  |

  Scenario Outline: Validate if dealer is able filter search by invoice based on phone number
    Given User is on Home Page
    When user search by "<SearchParam>"
    And user enters Phone Number "<PhoneNumber>"
    When user clicks on search button
    Then verify user is able to view Customer details by invoice based on phone number "<PhoneNumber>"

    Examples: 
      | SearchParam | PhoneNumber |
      | INVOICE     |  9334644311 |
      | INVOICE     |  9334650605 |
      | INVOICE     |  7004185366 |
      | INVOICE     |  7979936944 |

  Scenario Outline: Validate if dealer is able filter search by invoice based on Vin number
    Given User is on Home Page
    When user search by "<SearchParam>"
    And user enters VIN number "<vinNumber>"
    When user clicks on search button
    Then verify user is able to view Customer details by invoice based on vin number "<vinNumber>"

    Examples: 
      | SearchParam | vinNumber         |
      | INVOICE     | MA3RYHK1SPG274705 |
      | INVOICE     | MA3CZFB3SPH822728 |
      | INVOICE     | MA3BNC72SPH668478 |

  Scenario Outline: Verify if clear icon clear search text box for invoice search by
   Given User is on Home Page
    When user search by "<SearchParam>"
    And user enters Invoice Number "<InvoiceNumber>"
    And user enters VIN number "<vinNumber>"
    And user enters Phone Number "<PhoneNumber>"
    When user clicks on search button
    When user clicks on clear button
    Then verify if fields are clear out for search by invoice

    Examples: 
     |SearchParam | vinNumber         | PhoneNumber  | InvoiceNumber |
      |INVOICE| MA3RFL61SPG466761 |  9973509638      | VSL/23000554  |

  Scenario Outline: Verify No Record found for invalid data inputs
   Given User is on Home Page
    When user search by "<SearchParam>"
    And user enters Invoice Number "<InvoiceNumber>"
    And user enters VIN number "<vinNumber>"
    When user clicks on search button
    Then Verify if "No Records Found." text showing

    Examples: 
      | SearchParam | vinNumber         | InvoiceNumber  | PhoneNumber |
      | INVOICE     | MA3RFL61SPG4667ee | VSL/2300055322 |  9973509638 |
      | INVOICE     |                   | VSL/230        |             |
      | INVOICE     | MA3RFL61SPG4667ee |                |         232 |

  Scenario Outline: Validate search button not activated if Phone Number is not of 10 digit for search by invoice
   Given User is on Home Page
    When user search by "<SearchParam>"
    And user enters Phone Number "<PhoneNumber>"
    When user clicks on search button
    Then verify if search button is disable

    Examples: 
      | SearchParam | PhoneNumber |
      | INVOICE     |      839283 |

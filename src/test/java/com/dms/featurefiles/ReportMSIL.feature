@MSILReport
Feature: MSIL User Reports
 
Background: Login with MSIL
    Given User is on Login Page
    And User clicks on "MSIL User" button
    And User click on "LOGIN" button
    And User enters MSIL "Maruti\267597" and "Bobo@8901"
    And User click on Sign in button
    
@Report1
Scenario Outline: Validate Sales Register Report submit functionality
Given user is on the Online Report Landing page
And user clicks on Reports
And user selects Sales Register Report
And user selects Zone as "<Zone>"
And user selects Region as "<Region>"
And user selects Dealer as "<Dealer>" and "<Location>"
And user selects Channel as "<Channel>"
And user selects From Date as "<From Date>"
And user selects To Date as "<To Date>"
And user selects Invoice Status as "<Invoice Status>"
And user selects Model Details as "<Model Details>"
And user selects Variant Details as "<Variant Details>"
And user selects Color Details as "<Color Details>"
And User clicks on "SUBMIT" button
And user validates the MSIL sales register report from "<From Date>" to "<To Date>","<Invoice Status>","<Dealer>","<Location>","<Region>","<Channel>"
 
Examples: 
|Zone|Region|Dealer|Location|Channel|From Date | To Date| Invoice Status | Model Details | Variant Details | Color Details |
|CENTRAL|C2|PREM MOTOR|GRN|NRM|01-11-2023|30-11-2023|Invoiced|All Models|All Variants|All Colors|
 
@Report2
Scenario Outline: Validate Sales Register Report clear button functionality
Given user is on the Online Report Landing page
And user clicks on Reports
And user selects Sales Register Report
And user selects Zone as "<Zone>"
And user selects Region as "<Region>"
And user selects Dealer as "<Dealer>" and "<Location>"
And user selects Channel as "<Channel>"
And user selects From Date as "<From Date>"
And user selects To Date as "<To Date>"
And user selects Invoice Status as "<Invoice Status>"
And User clicks on "CLEAR" button
 
Examples:
|Zone|Region|Dealer|Location|Channel|From Date | To Date| Invoice Status |
|CENTRAL|C2|PREM MOTOR|GRN|NRM|01-11-2023|30-11-2023|Invoiced|



Scenario Outline: Validate Online Retail Report submit functionality
Given user is on the Online Report Landing page
And user clicks on Reports
And user selects Online Retail Report
And user selects Region as "<Region>"
And user selects Channel as "<Channel>"
And user selects Model Wise as "<ModelWise>"
And user selects Model as "<Model>"
And user selects Fuel as "<Fuel>"
And user selects From Date as "<From Date>"
And user selects To Date as "<To Date>"
And user select Type as "<Type>"
And User clicks on "SEARCH" button
 
Examples:
|Region|Dealer|Channel|ModelWise|Model|Fuel|From Date|To Date| Type|
||||||||||

Scenario Outline: Validate Online Retail Report clear functionality
Given user is on the Online Report Landing page
And user clicks on Reports
And user selects Online Retail Report
And user selects Region as "<Region>"
And user selects Channel as "<Channel>"
And user selects Model Wise as "<ModelWise>"
And user selects Model as "<Model>"
And user selects Fuel as "<Fuel>"
And user selects From Date as "<From Date>"
And user selects To Date as "<To Date>"
And User clicks on "CLEAR" button
 
Examples:
|Region|Dealer|Channel|ModelWise|Model|Fuel|From Date|To Date| 
|||||||||
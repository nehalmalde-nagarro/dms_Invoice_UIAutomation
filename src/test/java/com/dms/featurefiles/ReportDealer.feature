@DealerReport
Feature: Dealer - Sales Register Report
 
Background: Login with dealer
    Given User is on Login Page
    And User clicks on "Dealer" button
    And User enters "677272" and "5555"
    And User click on "LOGIN" button
    
Scenario Outline: Validate Sales Register Report submit functionality
Given User is on Home Page
And user clicks on Reports
And user selects Sales Register Report
And user selects From Date as "<From Date>"
And user selects To Date as "<To Date>"
And user selects Invoice Status as "<Invoice Status>"
And user selects Model Details as "<Model Details>"
And user selects Variant Details as "<Variant Details>"
And user selects Color Details as "<Color Details>"
And User clicks on "SUBMIT" button
And user validates the dealer sales register report from "<From Date>" to "<To Date>" and "<Invoice Status>"

Examples: 
|From Date | To Date| Invoice Status | Model Details | Variant Details | Color Details |
|01-11-2023|30-11-2023|Invoiced|All Models|All Variants|All Colors|
 
Scenario Outline: Validate Sales Register Report clear button functionality
Given User is on Home Page
And user clicks on Reports
And user selects Sales Register Report
And user selects From Date as "<From Date>"
And user selects To Date as "<To Date>"
And user selects Invoice Status as "<Invoice Status>"
And User clicks on "CLEAR" button

Examples: 
|From Date | To Date| Invoice Status | 
|01-06-2023|30-06-2023|Invoiced|



 
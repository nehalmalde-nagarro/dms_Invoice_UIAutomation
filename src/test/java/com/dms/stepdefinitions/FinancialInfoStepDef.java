package com.dms.stepdefinitions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.core.Core;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.testng.Assert;

import com.dms.browserInstance.BrowserHandle;
import com.dms.core.CoreFunctions;
import com.dms.dbconfig.Query;
import com.dms.pageobjects.AddInvoice_FinancialInfo;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class FinancialInfoStepDef {
	
	public static List<Map<String, String>> testData = new ArrayList<>();
	AddInvoice_FinancialInfo financialInfoPOM = new AddInvoice_FinancialInfo();

	@Then("Verify Prefilled fields for OrderId from scenario {int} on Financial Info tab")
	public void Verify_Prefilled_fields_for_OrderId_from_scenario_on_Financial_Info_tab(int rowNo) throws Exception {
	    String textFromBE="";
	    String data="";
	    testData=CoreFunctions.test("InvoiceData");
	    String orderId=testData.get(rowNo).get("OrderId").toString();
	    String interestAmt=Query.get_fields_From_ShOrderBook("INTEREST_AMT", "ORDER_NUM", orderId);
	    String chargeAmt=Query.get_fields_From_ShOrderBook("CHARGE_AMT", "ORDER_NUM", orderId);
	    String TDSAmt=Query.get_fields_From_ShOrderBook("TDS_AMT","ORDER_NUM", orderId);
	    
	    //Assert Boking amount
		String textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.bookingAmount(), "value");
		textFromBE=Query.get_fields_From_ShOrderBook("BOOKING_AMT","ORDER_NUM", orderId);
		Assert.assertEquals(textFromFE, textFromBE);
		
		//Assert Recevied Amount
		textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.recievedAmount(), "value");
	    textFromBE=Query.get_fields_From_ShOrderBook("RECD_AMT","ORDER_NUM", orderId);
	    Assert.assertEquals(textFromFE, textFromBE);
	    
	    //AssertSellingAmount
		textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.sellingAmount(), "value");
		data=Query.get_fields_From_STAllot("VIN", "ORDER_NUM", orderId);
		data = Query.get_fields_From_SD_GRN("ECOLOR_CD", "VIN", data);
		String sellingPrice=Query.get_fields_From_SM_PRICE_FOR("SELL_PRICE_L", "COLOR_IND", data);
		Assert.assertEquals(textFromFE, sellingPrice);
		
		textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.invoiceAmount(), "value");
	    
		//Assert chargeAmt
		textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.chargeAmount(), "value");
	    Assert.assertEquals(textFromFE, chargeAmt);
		
	    //Assert round off amt
		textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.roundOffAmount(), "value");
	    double roundoff=Double.parseDouble(sellingPrice)+Double.parseDouble(TDSAmt)-Double.parseDouble(interestAmt)+Double.parseDouble(chargeAmt);
		roundoff=CoreFunctions.round(roundoff, 2);
	    Assert.assertEquals(textFromFE, roundoff);
		
		
	    //Assert Outstanding amount
	    textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.outstandingAmount(), "value");
	    data=Query.get_fields_From_ShOrderBook("CUST_CD", "ORDER_NUM", orderId);
	    textFromBE=Query.get_fields_From_GM_CIN("OUTSTANDING_AMT", "CUST_CD", data);
	    Assert.assertEquals(textFromFE, textFromBE);
	        
	    //Assert TDS Amount
	    textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.tdsAmount(), "value");
	    Assert.assertEquals(textFromFE, TDSAmt);
	    
	    //
	    textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.GST(), "value");
	    textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.billingNature(), "value");
	 
	}
	
	@And("User selects payment type as {string}")
		public void User_selects_payment_type_as(String paymentType) throws Exception {
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.clickPaymentTypeDropdown()));
			CoreFunctions.click(financialInfoPOM.clickPaymentTypeDropdown(), "Clicking on Payment Type");
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.choosePaymentTypeDropdown(paymentType)));
			CoreFunctions.click(financialInfoPOM.choosePaymentTypeDropdown(paymentType), "Chhosing Payment Type");
			
		}
		
		@Then("verify the fields Financier, Finance Amount, Branch and Finance Details are disabled")
		public void Verify_the_fields_Financier_Finance_Amount_Branch_and_Finance_Details_are_disabled() throws Exception {
			Assert.assertFalse(financialInfoPOM.clickFinancerDropdown().isEnabled());
			Assert.assertFalse(financialInfoPOM.financierName().isEnabled());
			Assert.assertFalse(financialInfoPOM.financierBranch().isEnabled());
			Assert.assertFalse(financialInfoPOM.financeAmount().isEnabled());
			Assert.assertFalse(financialInfoPOM.FinancialDetailsPopUpButton().isEnabled());
		}
		
		@Then("verify the fields Financier, Finance Amount, Branch and Finance Details are enabled")
		public void Verify_the_fields_Financier_Finance_Amount_Branch_and_Finance_Details_are_enabled() throws Exception {
			Assert.assertTrue(financialInfoPOM.clickFinancerDropdown().isEnabled());
			Assert.assertTrue(financialInfoPOM.financierBranch().isEnabled());
			Assert.assertTrue(financialInfoPOM.financeAmount().isEnabled());
			Assert.assertTrue(financialInfoPOM.FinancialDetailsPopUpButton().isEnabled());
		}
		
		@Then("verify the fields Financier, Finance Amount, Branch are enabled and Finance Details is disabled")
		public void Verify_the_fields_Financier_Finance_Amount_Branch_are_enabled_and_Finance_Details_is_disabled() throws Exception {
			Assert.assertTrue(financialInfoPOM.clickFinancerDropdown().isEnabled());
			Assert.assertTrue(financialInfoPOM.financierBranch().isEnabled());
			Assert.assertTrue(financialInfoPOM.financeAmount().isEnabled());
			Assert.assertFalse(financialInfoPOM.FinancialDetailsPopUpButton().isEnabled());
		}
		
//		User selects tax rate for scenario <rowNumber>
//	    And User selects TDS Amount for scenario <rowNumber>
//	    And User selects the MSGA finance flag
//	    And user selects MSGA Financier Name from scenario <rowNumber>
//	    And user clicks on Receipt Details
//	    And user selects the receipt
//	    And user clicks on "OK" button
	    
	    @When("User selects TDS Amount for scenario {int}")
	    public void User_selects_tdsAmount_for_scenario(int rowNo) {
		    String tdsAmt=testData.get(rowNo).get("TDSAmount").toString();
	    	CoreFunctions.click(financialInfoPOM.tdsAmount(), null);
		    CoreFunctions.setText(financialInfoPOM.tdsAmount(), tdsAmt);

	    }
	    @When("User selects tax rate for scenario {int}")
	    public void User_selects_tax_rate_for_scenario(int rowNo) {
	    	CoreFunctions.click(financialInfoPOM.clicktaxrateDropdown(), null);
		    String taxRate=testData.get(rowNo).get("TaxRate").toString();
		    CoreFunctions.click(financialInfoPOM.choosetaxrateDropdown(taxRate), taxRate);

	    }
	    @When("User selects the MSGA finance flag")
	    public void User_selects_the_MSGA_finance_flag() {
	    	CoreFunctions.click(financialInfoPOM.msgaFinanceFlag(), null);
	    }
	    @When("user selects MSGA Financier Name from scenario {int}")
	    public void User_selects_msga_financer_for_scenario(int rowNo) {
		    String msgafinancer=testData.get(rowNo).get("MSGAFinancierName").toString();
	    	CoreFunctions.click(financialInfoPOM.clickMSGAFiancierDropdown(), null);
		    CoreFunctions.click(financialInfoPOM.chooseFinancierDropdown(msgafinancer), msgafinancer);

	    }
	    @When("user clicks on Receipt Details")
	    public void user_clicks_on_Receipt_Details() {
	    	CoreFunctions.click(financialInfoPOM.ReceiptDetailsPopUpButton(), null);
	    }
	    @When("user selects the receipt")
	    public void user_selects_the_receipt() {
	    	CoreFunctions.click(financialInfoPOM.chooseFirstReceiptDetails(), null);
	    }
	   
	  
//	    And User selects TCS Flag as "<TCSFlag>"
//	    User selects Financier for scenario <rowNumber>
//	    And User selects Finance Amount for scenario <rowNumber>
	    @When("User selects Financier for scenario {int}")
	    public void User_selects_financer_for_scenario(int rowNo) {
		    String financier=testData.get(rowNo).get("Financier").toString();
	    	CoreFunctions.click(financialInfoPOM.chooseFinancierDropdown(financier), null);

	    }
	    @When("User selects Finance Amount for scenario {int}")
	    public void User_selects_financer_Amount_for_scenario(int rowNo) {
		    String financierAmt=testData.get(rowNo).get("FinancierAmt").toString();
	    	CoreFunctions.setText(financialInfoPOM.financeAmount(), financierAmt);

	    }
	    @When("User selects TCS Flag as {string}")
	    public void User_selects_tcs_flag(String tcsFlag) {
	    	CoreFunctions.click(financialInfoPOM.clickTCSFlagDropdown(),null);
	    	CoreFunctions.click(financialInfoPOM.chooseTCSFlagDropdown(tcsFlag), tcsFlag);

	    }
	    
	    @When("User clicks on Financial Details")
		public void user_clicks_on_financial_details() {
		    // Write code here that turns the phrase above into concrete actions
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.FinancialDetailsPopUpButton()));
			CoreFunctions.click(financialInfoPOM.FinancialDetailsPopUpButton(), "Clicking on Financial Details Pop up");
		}
 
		@When("User selects Loan Type for scenario {int}")
		public void user_selects_loan_type_for_scenario(Integer rowNo) {
		    // Write code here that turns the phrase above into concrete actions
			
			String loanType = testData.get(rowNo).get("LoanType").toString();
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.clickLoanTypeDropdown()));
			CoreFunctions.click(financialInfoPOM.clickLoanTypeDropdown(), "Clicking on Loan Type dropdown");
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.chooseFromDropdown(loanType)));
			CoreFunctions.click(financialInfoPOM.chooseFromDropdown(loanType), "Choosing Loan Type");
		}
 
		@When("User selects Loan Status for scenario {int}")
		public void user_selects_loan_status_for_scenario(Integer rowNo) {
		    // Write code here that turns the phrase above into concrete actions
			String loanStatus = testData.get(rowNo).get("LoanStatus").toString();
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.clickLoanStatusDropdown()));
			CoreFunctions.click(financialInfoPOM.clickLoanStatusDropdown(), "Clicking on Loan Status dropdown");
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.chooseFromDropdown(loanStatus)));
			CoreFunctions.click(financialInfoPOM.chooseFromDropdown(loanStatus), "Choosing Loan Status");
		}
 
		@When("User selects Loan Application Date for scenario {int}")
		public void user_selects_loan_application_date_for_scenario(Integer rowNo) throws Exception {
		    // Write code here that turns the phrase above into concrete actions
		    String loanApplicationDate = testData.get(rowNo).get("LoanApplicationDate").toString();
		    
		    BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.loanApplicationDatePicker()));
			CoreFunctions.click(financialInfoPOM.loanApplicationDatePicker(), "Choosing Loan Application Date");
		    CoreFunctions.selectDate(BrowserHandle.getDriver(), loanApplicationDate);
		}
 
		@When("User selects Loan Approval Date for scenario {int}")
		public void user_selects_loan_approval_date_for_scenario(Integer rowNo) throws Exception {
		    // Write code here that turns the phrase above into concrete actions
			String loanApprovalDate = testData.get(rowNo).get("LoanApprovalDate").toString();
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.loanApprovalDatePicker()));
			CoreFunctions.click(financialInfoPOM.loanApprovalDatePicker(), "Choosing Loan Approval Date");
		    CoreFunctions.selectDate(BrowserHandle.getDriver(), loanApprovalDate);
		}
 
		@When("User selects Loan Closing Date for scenario {int}")
		public void user_selects_loan_closing_date_for_scenario(Integer rowNo) throws Exception {
		    // Write code here that turns the phrase above into concrete actions
			String loanClosingDate = testData.get(rowNo).get("LoanClosingDate").toString();
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.loanClosingDatePicker()));
			CoreFunctions.click(financialInfoPOM.loanClosingDatePicker(), "Choosing Loan Closing Date");
			CoreFunctions.selectDate(BrowserHandle.getDriver(), loanClosingDate);
		}
 
		@When("User selects Down Payment Mode for scenario {int}")
		public void user_selects_down_payment_mode_for_scenario(Integer rowNo) {
		    // Write code here that turns the phrase above into concrete actions
			String downPaymentMode = testData.get(rowNo).get("DownPaymentMode").toString();
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.downPaymentMode()));
			CoreFunctions.setText(financialInfoPOM.downPaymentMode(),downPaymentMode );
		}
 
		@When("User selects Loan Rejection Date for scenario {int}")
		public void user_selects_loan_rejection_date_for_scenario(Integer rowNo) throws Exception {
		    // Write code here that turns the phrase above into concrete actions
			String loanRejectionDate = testData.get(rowNo).get("LoanRejectionDate").toString();
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.loanRejectionDatePicker()));
			CoreFunctions.click(financialInfoPOM.loanRejectionDatePicker(), "Choosing Loan Rejection Date");
			CoreFunctions.selectDate(BrowserHandle.getDriver(), loanRejectionDate);
		}
		
		@Then("Verify the Financial Details fields are cleared out")
		public void verify_the_Financial_Details_fields_are_cleared_out() throws Exception {
			
			String loanTypeFE = CoreFunctions.getElementText(financialInfoPOM.getDropdownValueForClear("loanType"));
			Assert.assertEquals(loanTypeFE,"Select");
			Assert.assertTrue(financialInfoPOM.financierBranch().isEnabled());
			Assert.assertTrue(financialInfoPOM.financeAmount().isEnabled());
			Assert.assertFalse(financialInfoPOM.FinancialDetailsPopUpButton().isEnabled());
		}
	    
	    
	    
	 
	}

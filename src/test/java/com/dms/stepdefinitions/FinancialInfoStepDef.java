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
import com.dms.logs.Logs;
import com.dms.pageobjects.AddInvoice_FinancialInfo;
import com.dms.pageobjects.LoginPOM;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class FinancialInfoStepDef {
	
	public static List<Map<String, String>> testData = new ArrayList<>();
	AddInvoice_FinancialInfo financialInfoPOM = new AddInvoice_FinancialInfo();
	LoginPOM loginPOM = new LoginPOM();
	public static String Recevied_Amt="";
	public static String GST_Type="";
	public static String invoiceAmt ="";
	public static String SellingPriceFor ="";


	@Then("Verify Prefilled fields for OrderId from scenario {int} on Financial Info tab")
	public void Verify_Prefilled_fields_for_OrderId_from_scenario_on_Financial_Info_tab(int rowNo) throws Exception {
	    String textFromBE="";
	    String data="";
	    testData=CoreFunctions.test("InvoiceData");
	    String orderId=testData.get(rowNo).get("OrderId").toString();
	    String interestAmt=Query.get_fields_From_ShOrderBook("INTEREST_AMT", "ORDER_NUM", orderId);
	    String chargeAmt=Query.get_fields_From_ShOrderBook("CHARGE_AMT", "ORDER_NUM", orderId);
	    String TDSAmt=Query.get_fields_From_ShOrderBook("TDS_AMT","ORDER_NUM", orderId);
	    String saleType = Query.get_fields_From_ShOrderBook("SALES_TYPE","ORDER_NUM", orderId);

	    //Assert Boking amount
		String textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.bookingAmount(), "value");
		textFromBE=Query.get_fields_From_ShOrderBook("BOOKING_AMT","ORDER_NUM", orderId);
		  double doubleValue = Double.parseDouble(textFromBE);
		Assert.assertEquals(Integer.parseInt(textFromFE), (int)(doubleValue));
		
		//Assert Recevied Amount
		textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.recievedAmount(), "value");
	    textFromBE=Query.get_fields_From_ShOrderBook("RECD_AMT","ORDER_NUM", orderId);
		   doubleValue = Double.parseDouble(textFromBE);

	    Assert.assertEquals(Integer.parseInt(textFromFE), (int) doubleValue);
	    
	    //AssertSellingAmount
	    textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.sellingAmount(), "value");
		data=Query.get_fields_From_STAllot("VIN", "ORDER_NUM", orderId);
		String variant = Query.get_fields_From_SD_GRN("VARIANT_CD", "VIN", data);
		data = Query.get_fields_From_SD_GRN("ECOLOR_CD", "VIN", data);
		//String sellingPrice=Query.get_fields_From_SM_PRICE_FOR("SELL_PRICE_L", "COLOR_IND", data);
		String sellingPrice=Query.get_fields_From_SM_PRICE_FOR_with_mutiple_conditions("SELL_PRICE_L", "COLOR_IND", data, "VARIANT_CD",variant, "SALES_TYPE", saleType);
//		SellingPriceFor=CoreFunctions.getElementAttribute(financialInfoPOM.sellingAmount(), "value");
		Assert.assertEquals(textFromFE, sellingPrice);
		
		textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.invoiceAmount(), "value");
	    
		//Assert chargeAmt
		textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.chargeAmount(), "value");
	    if(chargeAmt==null)
			Assert.assertEquals(textFromFE, "0");
	    else
		Assert.assertEquals(textFromFE, chargeAmt);
		
	    //Assert round off amt
		textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.roundOffAmount(), "value");
		    if(chargeAmt==null)chargeAmt="0";
			if(sellingPrice==null)sellingPrice="0";
			if(interestAmt==null)interestAmt="0";
			if(TDSAmt==null)TDSAmt="0";
		
		System.out.println("Selling price is "+sellingPrice+"TDS "+TDSAmt+"intrest amt "+interestAmt+"Charge amt "+chargeAmt);
	    double roundoff=Double.parseDouble(sellingPrice)+Double.parseDouble(TDSAmt)-Double.parseDouble(interestAmt)+Double.parseDouble(chargeAmt);
		roundoff=CoreFunctions.round(roundoff, 2);
	    Assert.assertEquals(Double.parseDouble(textFromFE), roundoff);
		
		
	    //Assert Outstanding amount
	    textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.outstandingAmount(), "value");
	    data=Query.get_fields_From_ShOrderBook("CUST_CD", "ORDER_NUM", orderId);
//	    textFromBE=Query.get_fields_From_GM_CIN("OUTSTANDING_AMT", "CUST_CD", data);
	    Assert.assertEquals(textFromFE, "0");
	        
	    //Assert TDS Amount
	    textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.tdsAmount(), "value");
	    Assert.assertEquals(textFromFE, TDSAmt);
	    
	    //
	    textFromFE=CoreFunctions.getElementText(financialInfoPOM.GST());
	    
	    String stateInGM_CIN = Query.search_for_gmcin_for_stateCD("STATE_CD", "ORDER_NUM", orderId);
	    String stateInAM_DEALER_LOC = Query.get_fields_From_AM_DEALER_LOC("STATE_CD");
	    
	    
	    if(stateInAM_DEALER_LOC.equals(stateInGM_CIN))
	    {
	    	GST_Type="CGST";
	    	
	    	Assert.assertEquals(textFromFE, "CGST");
	    }
	    else
	    {
	    	GST_Type="IGST";
	    	Assert.assertEquals(textFromFE, "IGST");
	    }
	    
	    textFromFE=CoreFunctions.getElementAttribute(financialInfoPOM.billingNature(), "value");
	 
	    int invoiceAmountCalc = Integer.parseInt(sellingPrice)+Integer.parseInt(TDSAmt)-Integer.parseInt(interestAmt)+Integer.parseInt(chargeAmt);
	    String invoiceAmt = CoreFunctions.getElementAttribute(financialInfoPOM.invoiceAmount(), "value");
	    Assert.assertEquals(invoiceAmountCalc, Integer.parseInt(invoiceAmt));	
	}
	
	@And("User selects payment type as {string}")
		public void User_selects_payment_type_as(String paymentType) throws Exception {
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.clickPaymentTypeDropdown()));
			CoreFunctions.click(financialInfoPOM.clickPaymentTypeDropdown(), "Clicking on Payment Type");
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.choosePaymentTypeDropdown(paymentType)));
			CoreFunctions.click(financialInfoPOM.choosePaymentTypeDropdown(paymentType), "Choosing Payment Type");
			Thread.sleep(2000);
		}
		
		@Then("verify the fields Financier, Finance Amount, Branch and Finance Details are disabled")
		public void Verify_the_fields_Financier_Finance_Amount_Branch_and_Finance_Details_are_disabled() throws Exception {
			
			Assert.assertEquals(financialInfoPOM.FinancierDisabled().size(), 1);
			Assert.assertEquals(financialInfoPOM.FinancerNameDisabled().size(), 1);
			Assert.assertEquals(financialInfoPOM.FinanceAmountDisabled().size(),1);
			Assert.assertEquals(financialInfoPOM.BranchDisabled().size(),1);
			Assert.assertEquals(financialInfoPOM.FinanceDetailsDisabled().size(),1);
		}
		
		@Then("verify the fields Financier, Finance Amount, Branch and Finance Details are enabled")
		public void Verify_the_fields_Financier_Finance_Amount_Branch_and_Finance_Details_are_enabled() throws Exception {
			Assert.assertEquals(financialInfoPOM.FinancierDisabled().size(), 0);
			Assert.assertEquals(financialInfoPOM.FinanceAmountDisabled().size(),0);
			Assert.assertEquals(financialInfoPOM.BranchDisabled().size(),0);
			Assert.assertEquals(financialInfoPOM.FinanceDetailsDisabled().size(),0);
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
	    	rowNo--;
		    String tdsAmt=testData.get(rowNo).get("TDSAmount").toString();
	    	CoreFunctions.click(financialInfoPOM.tdsAmount(), null);
		    CoreFunctions.setText(financialInfoPOM.tdsAmount(), tdsAmt);

	    }
	    @When("User selects tax rate for scenario {int}")
	    public void User_selects_tax_rate_for_scenario(int rowNo) {
	    	testData=CoreFunctions.test("InvoiceData");
	    	rowNo--;
	    	CoreFunctions.click(financialInfoPOM.clicktaxrateDropdown(), null);
		    String taxRate=testData.get(rowNo).get("TaxRate").toString();
		    CoreFunctions.click(financialInfoPOM.choosetaxrateDropdown(taxRate), taxRate);

	    }
	    @When("User selects the MSGA finance flag")
	    public void User_selects_the_MSGA_finance_flag() {
	    	CoreFunctions.click(financialInfoPOM.msgaFinanceFlag(), null);
	    }
	    @When("user selects MSGA Financier Name and value from scenario {int}")
	    public void User_selects_msga_financer_for_scenario(int rowNo) {
	    	rowNo--;
		    String msgafinancer=testData.get(rowNo).get("MSGAFinancierName").toString();
	    	CoreFunctions.click(financialInfoPOM.clickMSGAFiancierDropdown(), null);
		    CoreFunctions.click(financialInfoPOM.chooseFinancierDropdown(msgafinancer), msgafinancer);
			while(CoreFunctions.getElementText(financialInfoPOM.clickMSGAFiancierDropdown()).isEmpty())
			{
//				CoreFunctions.click(financialInfoPOM.clickMSGAFiancierDropdown(), null);
			    CoreFunctions.click(financialInfoPOM.chooseFinancierDropdown(msgafinancer), msgafinancer);
					
			}
		    
		    BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.msgaFinanceValue()));

		    String msgsFianncerValue=testData.get(rowNo).get("MSGAFinancierValue").toString();
		    CoreFunctions.setText(financialInfoPOM.msgaFinanceValue(), msgsFianncerValue);
		    
	    }
	    @When("user clicks on Receipt Details")
	    public void user_clicks_on_Receipt_Details() {
	    	
	    	if(financialInfoPOM.ReceiptDetailsDisabled().size()==0)
	    	{
	    		CoreFunctions.click(financialInfoPOM.ReceiptDetailsPopUpButton(), null);
	    	}
	    	
	    }
	    @When("user selects the receipt")
	    public void user_selects_the_receipt() {
	    	if(financialInfoPOM.ReceiptDetailsDisabled().size()==1)
	    	{
	    		
	    	}
	    	else
	    	{
	    		CoreFunctions.click(financialInfoPOM.chooseFirstReceiptDetails(), null);
	    	}
	    }
	   
	    @When("User clicks on Receipt Details Popup {string} button")
		public void user_click_on_btn(String btn) throws InterruptedException {
			
	    	if(financialInfoPOM.ReceiptDetailsDisabled().size()==1)
	    	{
	    		
	    	}
	    	else
	    	{
		    	Logs.logger.info(new Object() {
				}.getClass().getEnclosingMethod().getName() + " " + btn);
				BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.spanButton(btn)));
				CoreFunctions.moveToElement(loginPOM.spanButton(btn));
				CoreFunctions.click(loginPOM.spanButton(btn), btn);
	    	}
		}
//	    And User selects TCS Flag as "<TCSFlag>"
//	    User selects Financier for scenario <rowNumber>
//	    And User selects Finance Amount for scenario <rowNumber>
	    @When("User selects Financier for scenario {int}")
	    public void User_selects_financer_for_scenario(int rowNo) throws InterruptedException {
	    	testData=CoreFunctions.test("InvoiceData");
	    	rowNo--;
		    String financier=testData.get(rowNo).get("Financier").toString();
		    BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.clickFinancerDropdown()));
			CoreFunctions.click(financialInfoPOM.clickFinancerDropdown(), "Clicking on Financier dropdown");
			CoreFunctions.setText(financialInfoPOM.searchDropDropDownValue(), financier);
			Thread.sleep(2000);
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.chooseFinancierDropdown(financier)));
	    	CoreFunctions.click(financialInfoPOM.chooseFromDropdown(financier), "ChosingFinancier");

	    }
	    @When("User selects Finance Amount for scenario {int}")
	    public void User_selects_financer_Amount_for_scenario(int rowNo) {
	    	testData=CoreFunctions.test("InvoiceData");
	    	rowNo--;
		    String financierAmt=testData.get(rowNo).get("FinancierAmt").toString();
	    	CoreFunctions.setText(financialInfoPOM.financeAmount(), financierAmt);

	    }
	    @When("User selects TCS Flag for scenario {int}")
	    public void User_selects_tcs_flag_for_Scenario(int rowNo) {
	    	testData=CoreFunctions.test("InvoiceData");
	    	rowNo--;
	    	String tcsFlag=testData.get(rowNo).get("TCSFlag").toString();
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
			testData=CoreFunctions.test("InvoiceData");
			rowNo--;
		    // Write code here that turns the phrase above into concrete actions
			
			String loanType = testData.get(rowNo).get("LoanType").toString();
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.clickLoanTypeDropdown()));
			CoreFunctions.click(financialInfoPOM.clickLoanTypeDropdown(), "Clicking on Loan Type dropdown");
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.chooseFromDropdown(loanType)));
			CoreFunctions.click(financialInfoPOM.chooseFromDropdown(loanType), "Choosing Loan Type");
		}
 
		@When("User selects Loan Status for scenario {int}")
		public void user_selects_loan_status_for_scenario(Integer rowNo) {
			testData=CoreFunctions.test("InvoiceData");
			rowNo--;
		    // Write code here that turns the phrase above into concrete actions
			String loanStatus = testData.get(rowNo).get("LoanStatus").toString();
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.clickLoanStatusDropdown()));
			CoreFunctions.click(financialInfoPOM.clickLoanStatusDropdown(), "Clicking on Loan Status dropdown");
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.chooseFromDropdown(loanStatus)));
			CoreFunctions.click(financialInfoPOM.chooseFromDropdown(loanStatus), "Choosing Loan Status");
		}
 
		@When("User selects Loan Application Date for scenario {int}")
		public void user_selects_loan_application_date_for_scenario(Integer rowNo) throws Exception {
			testData=CoreFunctions.test("InvoiceData");
			rowNo--;
			// Write code here that turns the phrase above into concrete actions
		    String loanApplicationDate = testData.get(rowNo).get("LoanApplicationDate").toString();
		    System.out.println(loanApplicationDate);
		   
		    BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.loanApplicationDatePicker()));
			CoreFunctions.click(financialInfoPOM.loanApplicationDatePicker(), "Choosing Loan Application Date");
		    Thread.sleep(3000);
			CoreFunctions.selectDate(BrowserHandle.getDriver(), loanApplicationDate);
		}
 
		@When("User selects Loan Approval Date for scenario {int}")
		public void user_selects_loan_approval_date_for_scenario(Integer rowNo) throws Exception {
			testData=CoreFunctions.test("InvoiceData");
			rowNo--;
			// Write code here that turns the phrase above into concrete actions
			String loanApprovalDate = testData.get(rowNo).get("LoanApprovalDate").toString();
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.loanApprovalDatePicker()));
			CoreFunctions.click(financialInfoPOM.loanApprovalDatePicker(), "Choosing Loan Approval Date");
		    CoreFunctions.selectDate(BrowserHandle.getDriver(), loanApprovalDate);
		}
 
		@When("User selects Loan Closing Date for scenario {int}")
		public void user_selects_loan_closing_date_for_scenario(Integer rowNo) throws Exception {
			testData=CoreFunctions.test("InvoiceData");
			rowNo--;
			// Write code here that turns the phrase above into concrete actions
			String loanClosingDate = testData.get(rowNo).get("LoanClosingDate").toString();
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.loanClosingDatePicker()));
			CoreFunctions.click(financialInfoPOM.loanClosingDatePicker(), "Choosing Loan Closing Date");
			CoreFunctions.selectDate(BrowserHandle.getDriver(), loanClosingDate);
		}
		
		@When("User selects Loan Disbursal Date for scenario {int}")
		public void user_selects_loan_disbursal_date_for_scenario(Integer rowNo) throws Exception {
			testData=CoreFunctions.test("InvoiceData");
			rowNo--;
			// Write code here that turns the phrase above into concrete actions
			String loanDisbursalDate = testData.get(rowNo).get("LoanDisbursalDate").toString();
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.loanDisbursalDatePicker()));
			CoreFunctions.click(financialInfoPOM.loanDisbursalDatePicker(), "Choosing Loan Disbursal Date");
			CoreFunctions.selectDate(BrowserHandle.getDriver(), loanDisbursalDate);
		}
		
		@When("User selects Down Payment Mode for scenario {int}")
		public void user_selects_down_payment_mode_for_scenario(Integer rowNo) {
			testData=CoreFunctions.test("InvoiceData");
			rowNo--;
			// Write code here that turns the phrase above into concrete actions
			String downPaymentMode = testData.get(rowNo).get("DownPaymentMode").toString();
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.downPaymentMode()));
			CoreFunctions.setText(financialInfoPOM.downPaymentMode(),downPaymentMode );
		}
 
		@When("User selects Loan Rejection Date for scenario {int}")
		public void user_selects_loan_rejection_date_for_scenario(Integer rowNo) throws Exception {
			testData=CoreFunctions.test("InvoiceData");
			rowNo--;
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
			
			String loanStatusFE = CoreFunctions.getElementText(financialInfoPOM.getDropdownValueForClear("loanStatus"));
			Assert.assertEquals(loanStatusFE,"Select");
			
			String applicationDate = CoreFunctions.getElementAttribute(financialInfoPOM.loanApplicationDateInput(), "value") ;
			String approvalDate = CoreFunctions.getElementAttribute(financialInfoPOM.loanApprovalDateInput(), "value") ;
			String closingDate = CoreFunctions.getElementAttribute(financialInfoPOM.loanClosingDateInput(), "value") ;
			String disbursalDate = CoreFunctions.getElementAttribute(financialInfoPOM.loanDisbursalDateInput(), "value") ;
			
			Assert.assertTrue(applicationDate.isEmpty());
			Assert.assertTrue(approvalDate.isEmpty());
			Assert.assertTrue(closingDate.isEmpty());
			Assert.assertTrue(disbursalDate.isEmpty());
			
		}
		@Then("Verify receipt details should be cleared")
	    public void Verify_receipt_details_should_be_cleared()
	    {
	    	Assert.assertFalse(financialInfoPOM.chooseFirstReceiptDetails().isSelected());
	    }
	    
	    @When("User selects all required fields on financial info for scenario {int}")
	    public void user_select_all_required_filed_on_financial(int rowNo) throws Exception {
//	    	Verify_Prefilled_fields_for_OrderId_from_scenario_on_Financial_Info_tab(rowNo);
	 
	    	String paymentType= CoreFunctions.getElementText(financialInfoPOM.getDropdownSelectedValue("paymentType"));
//		    String paymentType=testData.get(rowNo-1).get("PaymentType").toString();
	       	
	    	GST_Type=CoreFunctions.getElementText(financialInfoPOM.GST());	
			SellingPriceFor=CoreFunctions.getElementAttribute(financialInfoPOM.sellingAmount(), "value");

		    invoiceAmt = CoreFunctions.getElementAttribute(financialInfoPOM.invoiceAmount(), "value");
		    Recevied_Amt =CoreFunctions.getElementAttribute(financialInfoPOM.recievedAmount(), "value");
	    	if(paymentType.equalsIgnoreCase("finance") || paymentType.equalsIgnoreCase("Leasing")) {
	    		User_selects_financer_for_scenario(rowNo);
	    		User_selects_financer_Amount_for_scenario(rowNo);
	    		user_clicks_on_financial_details();
	    		user_selects_loan_type_for_scenario(rowNo);
	    		user_selects_loan_status_for_scenario(rowNo);
	    		user_selects_loan_application_date_for_scenario(rowNo);
	    		user_selects_loan_approval_date_for_scenario( rowNo);
	    		user_selects_loan_closing_date_for_scenario( rowNo);
	    		user_selects_loan_disbursal_date_for_scenario(rowNo);
	    		user_selects_down_payment_mode_for_scenario(rowNo);
	    		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.spanButton("OK")));
	    		CoreFunctions.moveToElement(loginPOM.spanButton("OK"));
	    		CoreFunctions.click(loginPOM.spanButton("OK"), "OK");
	    	}
//	    	System.out.println(CoreFunctions.getElementAttribute(financialInfoPOM.clicktaxrateDropdown(),"aria-disabled"));
//	    	if((CoreFunctions.getElementAttribute(financialInfoPOM.clicktaxrateDropdown(),"aria-disabled").equalsIgnoreCase("true")));
//	    	{
//	    		System.out.println("Hiii");
//	    	}
	    	
	    		
	    		if(financialInfoPOM.getDropdownSelectedValue("TCSFlag").equals("Yes")) {
		    		User_selects_tax_rate_for_scenario(rowNo);

	    	User_selects_tdsAmount_for_scenario(rowNo);
	    	User_selects_tcs_flag_for_Scenario(rowNo);
	    		}
	    	
	    	
	    	
	    }
	    
	 
	}

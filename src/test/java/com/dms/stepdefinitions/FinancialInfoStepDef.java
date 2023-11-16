package com.dms.stepdefinitions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.support.ui.ExpectedConditions;
import org.testng.Assert;

import com.dms.browserInstance.BrowserHandle;
import com.dms.core.CoreFunctions;
import com.dms.dbconfig.Query;
import com.dms.pageobjects.AddInvoice_FinancialInfo;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;

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
	 
	}

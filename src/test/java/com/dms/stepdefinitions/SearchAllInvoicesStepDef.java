package com.dms.stepdefinitions;

import java.util.List;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.testng.Assert;

import com.dms.browserInstance.BrowserHandle;
import com.dms.core.CoreFunctions;
import com.dms.dbconfig.Query;
import com.dms.logs.Logs;
import com.dms.pageobjects.SearchInvoice;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class SearchAllInvoicesStepDef {

	SearchInvoice searchInvoice = new SearchInvoice();

	@Then("Verify User is on Home Page")
	@Given("User is on Home Page")
	public void user_logged_in_is_on_home_page() {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		Assert.assertTrue(searchInvoice.searchBy().isDisplayed());
	}

	@When("user search by {string}")
	public void user_search_by(String searchParam) {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName() + searchParam);

		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(searchInvoice.searchBy()));
		CoreFunctions.click(searchInvoice.searchBy(), "searchBy");
		CoreFunctions.click(searchInvoice.dropDownValue(searchParam), searchParam);
	}

	@When("user enters Order Id {string}")
	public void user_enters_order_id(String orderId) {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName() + orderId);

		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(searchInvoice.orderId()));
		CoreFunctions.setText(searchInvoice.orderId(), orderId);
	}

	@When("user clicks on search button")
	public void user_clicks_on_search_button() {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
//		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(searchInvoice.searchButton()));
		CoreFunctions.click(searchInvoice.searchButton(), "click on search button");
	}

	@When("user clicks on clear button")
	public void user_clicks_on_clear_button() {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(searchInvoice.clearButton()));
		CoreFunctions.click(searchInvoice.clearButton(), "click on clear button");
	}

	@When("user enters Phone Number {string}")
	public void user_enters_phone_number(String phone) {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName() + phone);

		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(searchInvoice.phoneNumber()));
		CoreFunctions.setText(searchInvoice.phoneNumber(), phone);
	}

	@Then("verify user is able to view Customer details by order based on {string}")
	public void verify_user_is_able_to_view_customer_details_by_order_based_on(String orderId) throws Exception {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		String custCode = Query.get_fields_From_ShOrderBook("CUST_CD","ORDER_NUM",orderId);
		String custName = Query.get_fields_From_GM_CIN("FULL_NAME","CUST_CD",custCode);
		String phoneNumber = Query.get_fields_From_GM_CIN("MOBILE_PHONE","CUST_CD",custCode);
		String orderDateBE = CoreFunctions.dateFormatterwithTime(Query.get_fields_From_ShOrderBook("ORDER_DATE","ORDER_NUM",orderId));
		String orderDateFE =CoreFunctions.dateFormatterwithoutTime(searchInvoice.searchResultsOrderInvoiceDate(orderId).getText());
		System.out.println();
		Assert.assertEquals(custCode, searchInvoice.searchResultsCustomerID(orderId).getText());
		Assert.assertEquals(CoreFunctions.trim(custName), CoreFunctions.trim(searchInvoice.searchResultsCustomerName(orderId).getText()));
		Assert.assertEquals(phoneNumber, searchInvoice.searchResultsPhoneNumber(orderId).getText());
		Assert.assertEquals(orderDateBE,orderDateFE );
	}
	
	@Then("verify user is able to view Customer details by order based on phone number {string}")
	public void verify_user_is_able_to_view_customer_details_by_order_based_on_phone_number(String mobileNum) throws Exception {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		String custCd = Query.get_fields_From_GM_CIN("CUST_CD","MOBILE_PHONE",mobileNum);
		String orderNum = Query.get_fields_From_ShOrderBook("ORDER_NUM","CUST_CD",custCd);
		String orderDateBE = CoreFunctions.dateFormatterwithTime(Query.get_fields_From_ShOrderBook("ORDER_DATE","CUST_CD",custCd));
		String orderDateFE =CoreFunctions.dateFormatterwithoutTime(searchInvoice.searchResultsOrderInvoiceDate(orderNum).getText());
		String fullName = Query.get_fields_From_GM_CIN("FULL_NAME","MOBILE_PHONE",mobileNum);
		Assert.assertEquals(custCd, searchInvoice.searchResultsCustomerID(orderNum).getText());
		Assert.assertEquals(CoreFunctions.trim(fullName)  , CoreFunctions.trim(searchInvoice.searchResultsCustomerName(orderNum).getText()));
		Assert.assertEquals(orderDateBE,orderDateFE );
		Assert.assertEquals(orderNum, searchInvoice.searchResults(orderNum).get(0).getText());
		
//				select "FULL_NAME" from "MULDMS"."GM_CIN" where "MOBILE_PHONE" ='9322226386'
	}


	@When("user selects From {string}")
	public void user_selects_from(String fromDate) throws InterruptedException {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());

		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(searchInvoice.fromDate()));
		CoreFunctions.click(searchInvoice.fromDate(), fromDate);
		try {
			CoreFunctions.selectDate(BrowserHandle.getDriver(), fromDate);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Thread.sleep(2000);

	}

	@When("user selects To {string}")
	public void user_selects_to(String toDate) throws InterruptedException {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());

		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(searchInvoice.toDate()));
		CoreFunctions.click(searchInvoice.toDate(), toDate);
		Thread.sleep(1000);
		try {
			CoreFunctions.selectDate(BrowserHandle.getDriver(), toDate);
			Thread.sleep(10000);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Thread.sleep(1000);

	}

	@Then("verify user is able to view Customer details by order based on {string} and {string}")
	public void verify_user_is_able_to_view_customer_details_by_order_id_based_on_and(String fromDate, String toDate) {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());

	}

	@Then("verify user is able to view Customer details by invoice based on {string}")
	public void verify_user_is_able_to_view_customer_details_by_invoice_based_on(String invoiceNum) throws Exception {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());

		
		 String orderPartyCd=Query.get_fields_From_ShInvoice("ORDER_PARTY_CD", "INV_NUM", invoiceNum);
			String custName = CoreFunctions.trim(Query.get_fields_From_GM_CIN("FULL_NAME","CUST_CD",orderPartyCd));
			String mobileNum = Query.get_fields_From_GM_CIN("MOBILE_PHONE","CUST_CD",orderPartyCd);
			String invoiceDateBE = CoreFunctions.dateFormatterwithTime(Query.get_fields_From_ShInvoice("INV_DATE", "INV_NUM",invoiceNum));
			String invoiceDateFE =CoreFunctions.dateFormatterwithoutTime(searchInvoice.searchResultsOrderInvoiceDate(invoiceNum).getText());
			Assert.assertEquals(orderPartyCd, searchInvoice.searchResultsCustomerID(invoiceNum).getText());
			Assert.assertEquals(custName,CoreFunctions.trim(searchInvoice.searchResultsCustomerName(invoiceNum).getText()));
			Assert.assertEquals(mobileNum, searchInvoice.searchResultsPhoneNumber(invoiceNum).getText());
			Assert.assertEquals(invoiceDateBE,invoiceDateFE );
		
		}
	
	@Then("verify user is able to view Customer details by invoice based on vin number {string}")
	public void verify_user_is_able_to_view_customer_details_by_invoice_based_on_vinNumber(String vinNum) throws Exception {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		 String orderPartyCd=Query.get_fields_From_ShInvoice("ORDER_PARTY_CD", "VIN", vinNum);
			String custName = CoreFunctions.trim(Query.get_fields_From_GM_CIN("FULL_NAME","CUST_CD",orderPartyCd));
			String mobileNum = Query.get_fields_From_GM_CIN("MOBILE_PHONE","CUST_CD",orderPartyCd);
		    String invNum=Query.get_fields_From_ShInvoice("INV_NUM", "VIN", vinNum);
			String invoiceDateBE = CoreFunctions.dateFormatterwithTime(Query.get_fields_From_ShInvoice("INV_DATE", "VIN",vinNum));
			String invoiceDateFE =CoreFunctions.dateFormatterwithoutTime(searchInvoice.searchResultsOrderInvoiceDate(invNum).getText());
			Assert.assertEquals(orderPartyCd, searchInvoice.searchResultsCustomerID(invNum).getText());
			Assert.assertEquals(custName,CoreFunctions.trim(searchInvoice.searchResultsCustomerName(invNum).getText()));
			Assert.assertEquals(mobileNum, searchInvoice.searchResultsPhoneNumber(invNum).getText());
			Assert.assertEquals(invoiceDateBE,invoiceDateFE );
		
		
		}
	
	@Then("verify user is able to view Customer details by invoice based on phone number {string}")
	public void verify_user_is_able_to_view_customer_details_by_invoice_based_on_phone_number(String mobileNum) throws Exception {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		String custCD = Query.get_fields_From_GM_CIN("CUST_CD","MOBILE_PHONE",mobileNum);
	    String invNum=Query.get_fields_From_ShInvoice("INV_NUM", "ORDER_PARTY_CD", custCD);
		String custName = Query.get_fields_From_GM_CIN("FULL_NAME","CUST_CD",custCD);
		String invoiceDateBE = CoreFunctions.dateFormatterwithTime(Query.get_fields_From_ShInvoice("INV_DATE", "INV_NUM",invNum));
		String invoiceDateFE =CoreFunctions.dateFormatterwithoutTime(searchInvoice.searchResultsOrderInvoiceDate(invNum).getText());
		Assert.assertEquals(custCD, searchInvoice.searchResultsCustomerID(invNum).getText());
		Assert.assertEquals(CoreFunctions.trim(custName),CoreFunctions.trim(searchInvoice.searchResultsCustomerName(invNum).getText()));
		Assert.assertEquals(invNum, searchInvoice.searchResults(invNum).get(0).getText());
		Assert.assertEquals(invoiceDateBE,invoiceDateFE );
		
	}
	

	@Then("Verify user is able to view Customer details by order based on {string} {string} {string} {string}")
	public void userDetailsBasedOnMultpleParam(String orderNum,String fromDate,String ToDate,String PhoneNum) throws Exception {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		String custCd = Query.get_fields_From_GM_CIN("CUST_CD","MOBILE_PHONE",PhoneNum);
		String custCd2=Query.get_fields_From_ShOrderBook("CUST_CD","ORDER_NUM",orderNum);
		Assert.assertEquals(custCd, custCd2);
		String orderDateBE = CoreFunctions.dateFormatterwithTime(Query.get_fields_From_ShOrderBook("ORDER_DATE","CUST_CD",custCd));
		String orderDateFE =CoreFunctions.dateFormatterwithoutTime(searchInvoice.searchResultsOrderInvoiceDate(orderNum).getText());
		String fullName = Query.get_fields_From_GM_CIN("FULL_NAME","CUST_CD",custCd);
		Assert.assertEquals(custCd, searchInvoice.searchResultsCustomerID(orderNum).getText());
		Assert.assertEquals(fullName, searchInvoice.searchResultsCustomerName(orderNum).getText());
		Assert.assertEquals(orderDateBE,orderDateFE );
		Assert.assertEquals(orderNum, searchInvoice.searchResults(orderNum).get(0).getText());
	}


	@When("user enters Invoice Number {string}")
	public void user_enters_invoice_number(String invoiceNumber) {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());

		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(searchInvoice.invoiceNumber()));
		CoreFunctions.setText(searchInvoice.invoiceNumber(), invoiceNumber);
	}

	@When("user enters VIN number {string}")
	public void user_enters_vin_number(String vinNumber) {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());

		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(searchInvoice.vinNumber()));
		CoreFunctions.setText(searchInvoice.vinNumber(), vinNumber);
	}

	@When("user clicks on Generate Invoice for {string}")
	public void user_Clicks_on_Generate_invoice_for(String orderId) {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());

		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(searchInvoice.generateInvoice(orderId)));
		CoreFunctions.click(searchInvoice.generateInvoice(orderId), "click on generate invoice");
	}

	@Then("verify if fields are clear out for search by order")
	public void verify_if_fields_are_clear_out_search_by_order() {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());

		String classAttr = CoreFunctions.getElementAttribute(searchInvoice.phoneNumber(), "class");
		Assert.assertTrue(classAttr.contains("ng-untouched"));
		classAttr = CoreFunctions.getElementAttribute(searchInvoice.orderId(), "class");
		Assert.assertTrue(classAttr.contains("ng-untouched"));
		classAttr = CoreFunctions.getElementAttribute(searchInvoice.inputfromDate(), "class");
		Assert.assertTrue(classAttr.contains("ng-untouched"));
		classAttr = CoreFunctions.getElementAttribute(searchInvoice.inputtoDate(), "class");
		Assert.assertTrue(classAttr.contains("ng-untouched"));
	}

	@Then("verify if fields are clear out for search by invoice")
	public void verify_if_fields_are_clear_out_search_by_invoice() {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());

		String classAttr = CoreFunctions.getElementAttribute(searchInvoice.phoneNumber(), "class");
		Assert.assertTrue(classAttr.contains("ng-untouched"));
		classAttr = CoreFunctions.getElementAttribute(searchInvoice.vinNumber(), "class");
		Assert.assertTrue(classAttr.contains("ng-untouched"));
		classAttr = CoreFunctions.getElementAttribute(searchInvoice.invoiceNumber(), "class");
		Assert.assertTrue(classAttr.contains("ng-untouched"));

	}

	@Then("Verify if {string} text showing")
	public void verify_if_text_showing(String text) {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());

		Assert.assertTrue(searchInvoice.verifyByText(text));
	}

	@Then("verify if search button is disable")
	public void verify_if_search_button_disabled() throws InterruptedException {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());

		BrowserHandle.wait
				.until(ExpectedConditions.attributeToBe(searchInvoice.searchBtnDisabled(), "disabled", "true"));
		System.out.println(searchInvoice.searchBtnDisabled().getAttribute("disabled"));
		Assert.assertEquals(searchInvoice.searchBtnDisabled().getAttribute("disabled"), "true");
	}

	@Then("verify user is able to view all Customer details for search by order")
	public void verify_user_is_able_to_view_all_Customer_details_for_searchorder() throws Exception {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		List<String> orderIdFromBE=Query.getAllOrderId();
		List<WebElement> orderIdFromFE=searchInvoice.allOrderID();
		for(int i=0; i<orderIdFromBE.size();i++) {
			Assert.assertEquals(CoreFunctions.getElementText(orderIdFromFE.get(i)),orderIdFromBE.get(i));
		}
		

	}

	@Then("verify user is on Add Invoice page")
	public void verify_user_is_on_Add_Invoice_page() {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());

		BrowserHandle.wait.until(ExpectedConditions.visibilityOf(searchInvoice.verifyAddInvoiceTitle()));
		Assert.assertTrue(searchInvoice.verifyAddInvoiceTitle().isDisplayed());
	}

}

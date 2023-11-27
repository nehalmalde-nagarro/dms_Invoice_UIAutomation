package com.dms.stepdefinitions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.testng.Assert;

import com.dms.browserInstance.BrowserHandle;
import com.dms.core.CoreFunctions;
import com.dms.dbconfig.Query;
import com.dms.logs.Logs;
import com.dms.pageobjects.AddInvoice_FinancialInfo;
import com.dms.pageobjects.AddInvoice_InvoiceDetailsPOM;
import com.dms.pageobjects.LoginPOM;
import com.dms.pageobjects.SearchInvoice;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class AddInvoiceStepDef {
	public static List<Map<String, String>> testData = new ArrayList<>();

	// add
	AddInvoice_InvoiceDetailsPOM addInvoicePOM = new AddInvoice_InvoiceDetailsPOM();
	LoginPOM loginPOM = new LoginPOM();
	AddInvoice_FinancialInfo financialInfo = new AddInvoice_FinancialInfo();
	SearchInvoice searchInvoicePOM = new SearchInvoice();
	JavascriptExecutor js = (JavascriptExecutor) BrowserHandle.getDriver();

	@When("User click on Search Order")
	public void user_click_on_search_order() {
		testData = CoreFunctions.test("InvoiceData");
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(addInvoicePOM.addInvoiceOrderNumber()));
		CoreFunctions.click(addInvoicePOM.addInvoiceOrderNumber(), null);
	}

	@When("User enters OrderId from scenario {int}")
	public void user_enters_for_order_id(int rowNo) {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		rowNo--;
		String Text = testData.get(rowNo).get("OrderId").toString();
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(addInvoicePOM.searchByOrderNumber()));
		CoreFunctions.setText(addInvoicePOM.searchByOrderNumber(), Text);

	}

	@When("User enters OrderId {string}")
	public void user_enters_for_order_id(String orderId) {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(addInvoicePOM.searchByOrderNumber()));
		CoreFunctions.setText(addInvoicePOM.searchByOrderNumber(), orderId);

	}

	@When("User enters Mobile Number from scenario {int}")
	public void user_enters_for_mobile_number(int rowNo) {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		rowNo--;
		String Text = testData.get(rowNo).get("MobileNumber").toString();
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(addInvoicePOM.searchByMobileNumber()));
		CoreFunctions.setText(addInvoicePOM.searchByMobileNumber(), Text);

	}

	@When("User enters Mobile Number {string}")
	public void user_enters_for_mobile_number(String mobileNo) {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(addInvoicePOM.searchByMobileNumber()));
		CoreFunctions.setText(addInvoicePOM.searchByMobileNumber(), mobileNo);

	}

	@When("User select from displayed orders for scenario {int}")
	public void user_select_from_displayed_orders(int rowNo) {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		rowNo--;
		String Text = testData.get(rowNo).get("OrderId").toString();
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(addInvoicePOM.chooseOrder(Text)));

		CoreFunctions.click(addInvoicePOM.chooseOrder(Text), null);
	}

	@Then("Verify Prefilled fields for OrderId from scenario {int} on invoice Details tab")
	public void verify_prefilled_fields_on_invoice_details_tab(int rowNo) throws Exception {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		rowNo--;
		String orderId = testData.get(rowNo).get("OrderId").toString();

		// Assert LOC_CD
		String text = CoreFunctions.waitUntilAttrAvailable(addInvoicePOM.locationId(), 20, "value");
		System.out.println(" Vlaue from coreFuycntion" + text);
		System.out.println("BE  " + Query.get_fields_From_ShOrderBook("LOC_CD", "ORDER_NUM", orderId));
		System.out.println("FE  " + text);
		Assert.assertEquals(Query.get_fields_From_ShOrderBook("LOC_CD", "ORDER_NUM", orderId), text);

		// Assert SElling PRice For
//		text = CoreFunctions.getElementText(addInvoicePOM.sellingPriceFor());
//		System.out.println("BE  " + Query.sellingPriceFor(orderId));
//		System.out.println("FE  " + text);
		// ----- yet it more implemented Assert.assertEquals(text,
		// Query.sellingPriceFor(orderId));

		// Assert OrderDate
		String dateFromBE = Query.get_fields_From_ShOrderBook("ORDER_DATE", "ORDER_NUM", orderId);
		text = CoreFunctions.waitUntilAttrAvailable(addInvoicePOM.orderDateID(), 20, "value");
		String formattedDateFromBE = CoreFunctions.dateFormatterwithTime(dateFromBE);
		Assert.assertEquals(text, formattedDateFromBE);

		// AssertState
		text = CoreFunctions.waitUntilAttrAvailable(addInvoicePOM.state(), 20, "value");
		String state = Query.get_StateDesc(orderId);
		Assert.assertEquals(text, state);

		// AsssertAllotNum
		text = CoreFunctions.waitUntilAttrAvailable(addInvoicePOM.allotmentNo(), 20, "value");
		String dataFromDB = Query.get_fields_From_STAllot("ALLOT_NUM", "ORDER_NUM", orderId);
		System.out.println("FE  : " + text);
		System.out.println("BE  :" + dataFromDB);
		Assert.assertEquals(text, dataFromDB);

		// AsssertAllotDate //yet to assert
		text = CoreFunctions.waitUntilAttrAvailable(addInvoicePOM.allotmentDate(), 20, "value");
		dataFromDB = Query.get_fields_From_STAllot("ALLOT_DATE", "ORDER_NUM", orderId);
		System.out.println("FE  : " + text);
		System.out.println("BE  :" + dataFromDB);
//		Assert.assertEquals(text, dataFromDB);

		// AssertShipGSTIN
		dataFromDB = Query.get_fields_From_ShOrderBook("SHIP_GST_NUM", "ORDER_NUM", orderId);
		text = CoreFunctions.waitUntilAttrAvailable(addInvoicePOM.shippingGST(), 20, "value");
		System.out.println("FE  : " + text);
		System.out.println("BE  :" + dataFromDB);
		Assert.assertEquals(text, dataFromDB);

		// Assert"BILL_PIN"
//		dataFromDB = Query.get_fields_From_ShOrderBook("BILL_PIN", "ORDER_NUM", orderId);
//		text = CoreFunctions.waitUntilAttrAvailable(addInvoicePOM.billingPincode(), 20, "value");
//		System.out.println("FE  : " + text);
//		System.out.println("BE  :" + dataFromDB);
//		Assert.assertEquals(text, dataFromDB);

		// Assert billingAddress_1
		dataFromDB = Query.get_fields_From_ShOrderBook("BILL_ADDRESS1", "ORDER_NUM", orderId);
		text = CoreFunctions.waitUntilAttrAvailable(addInvoicePOM.billingAddress_1(), 20, "value");
		text = CoreFunctions.getElementAttribute(addInvoicePOM.billingAddress_1(), "value");

		System.out.println("FE  : " + text);
		System.out.println("BE  :" + dataFromDB);
		if (text.isEmpty())
			Assert.assertEquals(dataFromDB, null);
		else
			Assert.assertEquals(text, dataFromDB);
		// Assert billingAddress_2
		dataFromDB = Query.get_fields_From_ShOrderBook("BILL_ADDRESS2", "ORDER_NUM", orderId);
//		text = CoreFunctions.waitUntilAttrAvailable(addInvoicePOM.billingAddress_2(), 20, "value");
		text = CoreFunctions.getElementAttribute(addInvoicePOM.billingAddress_2(), "value");

		System.out.println("FE  : " + text);
		System.out.println("BE  :" + dataFromDB);

		if (text.isEmpty())
			Assert.assertEquals(dataFromDB, null);
		else
			Assert.assertEquals(text, dataFromDB);
		// Assert billingAddress_3
		dataFromDB = Query.get_fields_From_ShOrderBook("BILL_ADDRESS3", "ORDER_NUM", orderId);
//		text = CoreFunctions.waitUntilAttrAvailable(addInvoicePOM.billingAddress_3(), 20, "value");
		text = CoreFunctions.getElementAttribute(addInvoicePOM.billingAddress_3(), "value");
		System.out.println("FE  : " + text);
		System.out.println("BE  :" + dataFromDB);
		if (text.isEmpty())
			Assert.assertEquals(dataFromDB, null);
		else
			Assert.assertEquals(text, dataFromDB);

	}

	@Then("Verify data on search by Mobile Number for scenario {int}")
	public void verify_data_on_search_by(int rowNo) throws Exception {
		rowNo--;
		String Text = testData.get(rowNo).get("MobileNumber").toString();
		String name = Query.get_fields_From_GM_CIN_by_Mobile("FULL_NAME", "MOBILE_PHONE", Text);
		BrowserHandle.wait.until(ExpectedConditions.visibilityOf(addInvoicePOM.isOrderDetailVisible(name)));
		Assert.assertTrue(addInvoicePOM.isOrderDetailVisible(name).isDisplayed());

	}

	@Then("Verify if {string} button is disable")
	public void verify_if_button_is_disable(String btn) {
		BrowserHandle.wait
				.until(ExpectedConditions.attributeToBe(loginPOM.spanButtonIsDisable(btn), "disabled", "true"));
		System.out.println(loginPOM.spanButtonIsDisable(btn).getAttribute("disabled"));
		Assert.assertEquals(loginPOM.spanButtonIsDisable(btn).getAttribute("disabled"), "true");
	}

	@Then("Click on Close popup icon")
	public void click_on_close_popup_icon() {
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(addInvoicePOM.closePopIcon()));

		CoreFunctions.click(addInvoicePOM.closePopIcon(), null);
	}

	@Then("Verify if Popup closed")
	public void verify_if_popup_closed() {

		Assert.assertTrue(addInvoicePOM.isPopupClosed());

	}

	@When("if user selects B2B Customer as {string}")
	public void if_user_selects_b2b_customer_as(String option) throws InterruptedException {
//	Actions ac=new Actions(BrowserHandle.getDriver());
//	ac.moveToElement(addIn/voicePOM.b2bCustomer()).build().perform();
//	js.executeScript("window.scrollTo(0,250)");
//	Thread.sleep(4000);
		CoreFunctions.moveToElement(addInvoicePOM.aadharNumber());
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(addInvoicePOM.b2bCustomer()));

		CoreFunctions.click(addInvoicePOM.b2bCustomer(), "click on b2b customer");
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(addInvoicePOM.options(option)));
		CoreFunctions.click(addInvoicePOM.options(option), option);
	}

	@Then("verify error message is displayed as {string}")
	public void verify_error_message_is_displayed_as(String errorMsg) throws InterruptedException {
		BrowserHandle.wait.until(ExpectedConditions.visibilityOf(addInvoicePOM.billGstnError()));
		CoreFunctions.moveToElement(addInvoicePOM.shippingInfoTitle());

		Assert.assertEquals(CoreFunctions.getElementText(addInvoicePOM.billGstnError()), errorMsg);
	}

	@Then("user enters {string} in Bill GSTN field")
	public void user_enters_in_bill_gstn_field(String string) {
		CoreFunctions.clearText(addInvoicePOM.billGSTN());
		CoreFunctions.setText(addInvoicePOM.billGSTN(), string);
	}

	@Then("user enters Bill GSTN field from {int}")
	public void user_enters_in_bill_gstn_field(int rowNo) {
		rowNo--;
		String Text = testData.get(rowNo).get("Bill GSTN").toString();
		CoreFunctions.clearText(addInvoicePOM.billGSTN());
		CoreFunctions.setText(addInvoicePOM.billGSTN(), Text);
	}

	@Then("Verify if Sales Type is {string}")
	public void verify_is_Sales_type(String salesType) {
		String text = CoreFunctions.getElementText(addInvoicePOM.salesType());
		Assert.assertEquals(text, salesType);

	}

	@Then("Verify Shipping Info section is disabled")
	public void verify_Shipping_Info_section_is_disabled() {
		int countDisabledElements = addInvoicePOM.shippingInfoCount().size();
		Assert.assertEquals(countDisabledElements, 13);
	}

	@When("user enters Workspace from {int}")
	public void user_enters_workspace_as(int rowNo) {
		rowNo--;
		String Text = testData.get(rowNo).get("OrderId").toString();
		CoreFunctions.setText(addInvoicePOM.workplace(), Text);
	}

	@When("user enters Aadhar Number from {int}")
	public void user_enters_aadhar_number_as(int rowNo) {
		rowNo--;
		String Text = testData.get(rowNo).get("Aadhar Num").toString();
		CoreFunctions.setText(addInvoicePOM.aadharNumber(), Text);

	}

	@Then("Verify user is navigated to {string}")
	public void verify_user_is_navigated_to(String text) {
		Assert.assertTrue(searchInvoicePOM.verifyByText(text));
	}

	@Then("verify all the fields are empty on Invoice details page except Invoice Type and Selling Price For")
	public void verify_all_filefs_are_Empty_on_invoice_page() {

		// Assert SElling PRice For
		String text = CoreFunctions.getElementText(addInvoicePOM.sellingPriceFor());
		System.out.println("FE  " + text);
		Assert.assertTrue(!text.isEmpty());

		// ASsert invoice type
		text = CoreFunctions.getElementText(addInvoicePOM.invoiceType());
		System.out.println("FE  " + text);
		Assert.assertTrue(!text.isEmpty());

		// AssertAddInvoiceOrderNumber is null
		text = CoreFunctions.getElementAttribute(addInvoicePOM.addInvoiceOrderNumber(), "value");
		System.out.println("FE  " + text);
		Assert.assertTrue(text != null);

	}

	@When("user enters all required fields from {int}")
	public void user_enters_all_required_fields(int rowNo) {
		rowNo--;
		String bill_address_1 = testData.get(rowNo).get("BillAddress_1").toString();

		String billingAddress_1 = CoreFunctions.getElementAttribute(addInvoicePOM.billingAddress_1(), "value");
		if (billingAddress_1.isEmpty())
			CoreFunctions.setText(addInvoicePOM.billingAddress_1(), bill_address_1);

		String bill_address_2 = testData.get(rowNo).get("BillAddress_2").toString();
		String billingAddress_2 = CoreFunctions.getElementAttribute(addInvoicePOM.billingAddress_2(), "value");
		if (billingAddress_2.isEmpty())
			CoreFunctions.setText(addInvoicePOM.billingAddress_2(), bill_address_2);

		String bill_address_3 = testData.get(rowNo).get("BillAddress_3").toString();
		String billingAddress_3 = CoreFunctions.getElementAttribute(addInvoicePOM.billingAddress_3(), "value");
		System.out.println(billingAddress_3);
		if (billingAddress_3.isEmpty())
			CoreFunctions.setText(addInvoicePOM.billingAddress_3(), bill_address_3);

		String govOrg = CoreFunctions.getElementText(financialInfo.getDropdownValueForClear("govtOraganisationWOPAN"));
		if (govOrg.equals("Select")) {
			CoreFunctions.click(addInvoicePOM.govOrg_W_O_PAN(), govOrg);
			CoreFunctions.click(addInvoicePOM.options("Yes"), govOrg);
		}
		
		while(CoreFunctions.getElementAttribute(addInvoicePOM.billingAddress_1(), "value").isEmpty())
			CoreFunctions.setText(addInvoicePOM.billingAddress_1(), bill_address_1);

		while(CoreFunctions.getElementAttribute(addInvoicePOM.billingAddress_2(), "value").isEmpty())
			CoreFunctions.setText(addInvoicePOM.billingAddress_2(), bill_address_2);

		while(CoreFunctions.getElementAttribute(addInvoicePOM.billingAddress_3(), "value").isEmpty())
			CoreFunctions.setText(addInvoicePOM.billingAddress_3(), bill_address_3);
		
		while(CoreFunctions.getElementText(financialInfo.getDropdownValueForClear("govtOraganisationWOPAN")).equals("Select"))
				{
			CoreFunctions.click(addInvoicePOM.govOrg_W_O_PAN(), govOrg);
			CoreFunctions.click(addInvoicePOM.options("Yes"), govOrg);
				}
	}
	

	@When("Invoice Details Tab for {string} scenario {int}")
	public void invoice_tab(String sheet, int rowNo) throws InterruptedException {
		testData = CoreFunctions.test(sheet);
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		Assert.assertTrue(searchInvoicePOM.searchBy().isDisplayed());
		CoreFunctions.moveToElement(loginPOM.spanButton("Add Invoice"));
		CoreFunctions.click(loginPOM.spanButton("Add Invoice"), "Add Invoice");
		CoreFunctions.click(addInvoicePOM.addInvoiceOrderNumber(), null);
		rowNo--;
		String Text = testData.get(rowNo).get("OrderId").toString();
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(addInvoicePOM.searchByOrderNumber()));
		CoreFunctions.setText(addInvoicePOM.searchByOrderNumber(), Text);
		CoreFunctions.moveToElement(loginPOM.spanButton("SEARCH"));
		CoreFunctions.click(loginPOM.spanButton("SEARCH"), "SEARCH");
		Text = testData.get(rowNo).get("OrderId").toString();
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(addInvoicePOM.chooseOrder(Text)));
		CoreFunctions.click(addInvoicePOM.chooseOrder(Text), null);
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.spanButton("OK")));
		CoreFunctions.moveToElement(loginPOM.spanButton("OK"));
		CoreFunctions.click(loginPOM.spanButton("OK"), "OK");
		Text = testData.get(rowNo).get("OrderId").toString();
		CoreFunctions.setText(addInvoicePOM.workplace(), Text);
		Text = testData.get(rowNo).get("OrderId").toString();
		CoreFunctions.setText(addInvoicePOM.workplace(), Text);
		Text = testData.get(rowNo).get("Aadhar Num").toString();
		CoreFunctions.setText(addInvoicePOM.aadharNumber(), Text);
		Text = testData.get(rowNo).get("Bill GSTN").toString();
		CoreFunctions.clearText(addInvoicePOM.billGSTN());
		CoreFunctions.setText(addInvoicePOM.billGSTN(), Text);
		Text = testData.get(rowNo).get("BillAddress_1").toString();

		String billingAddress_1 = CoreFunctions.getElementAttribute(addInvoicePOM.billingAddress_1(), "value");
		if (billingAddress_1.isEmpty())
			CoreFunctions.setText(addInvoicePOM.billingAddress_1(), Text);

		Text = testData.get(rowNo).get("BillAddress_2").toString();
		String billingAddress_2 = CoreFunctions.getElementAttribute(addInvoicePOM.billingAddress_2(), "value");
		if (billingAddress_2.isEmpty())
			CoreFunctions.setText(addInvoicePOM.billingAddress_2(), Text);

		Text = testData.get(rowNo).get("BillAddress_3").toString();
		String billingAddress_3 = CoreFunctions.getElementAttribute(addInvoicePOM.billingAddress_3(), "value");
		System.out.println(billingAddress_3);
		if (billingAddress_3.isEmpty())
			CoreFunctions.setText(addInvoicePOM.billingAddress_3(), Text);

		String govOrg = CoreFunctions.getElementText(financialInfo.getDropdownValueForClear("govtOraganisationWOPAN"));
		if (govOrg.equals("Select")) {
			CoreFunctions.click(addInvoicePOM.govOrg_W_O_PAN(), govOrg);
			CoreFunctions.click(addInvoicePOM.options("Yes"), govOrg);
		}
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.spanButton("NEXT")));
		CoreFunctions.moveToElement(loginPOM.spanButton("NEXT"));
		CoreFunctions.click(loginPOM.spanButton("NEXT"), "NEXT");
		Assert.assertTrue(searchInvoicePOM.verifyByText("Vehicle Info"));

	}
}
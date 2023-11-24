package com.dms.stepdefinitions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.Keys;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.testng.Assert;

import com.dms.browserInstance.BrowserHandle;
import com.dms.core.CoreFunctions;
import com.dms.dbconfig.Query;
import com.dms.pageobjects.AddInvoice_AdditionalDetailsPOM;
import com.dms.pageobjects.AddInvoice_FinancialInfo;
import com.dms.pageobjects.LoginPOM;
import com.dms.pageobjects.SearchInvoice;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class AdditionalDetailsStepDef {
	public static List<Map<String, String>> testData = new ArrayList<>();
	LoginPOM loginPOM = new LoginPOM();
	SearchInvoice searchInvoicePOM = new SearchInvoice();
	String exchangeBenefit="";

	AddInvoice_AdditionalDetailsPOM additionalDetailsPOM = new AddInvoice_AdditionalDetailsPOM();
	AddInvoice_FinancialInfo financialInfoPOM = new AddInvoice_FinancialInfo();

	@When("User selects the {string} from old car offers")
	public void user_select_old_Car_offer(String option) {
		BrowserHandle.wait
				.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.oldCarOfferNameDropdown()));
		CoreFunctions.click(additionalDetailsPOM.oldCarOfferNameDropdown(), option);
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.chooseFromDropdown(option)));
		CoreFunctions.click(financialInfoPOM.chooseFromDropdown(option), option);

	}

	@When("Verify {string} pop up button is displayed")
	public void verify_popup_button_dispalyed(String btn) {
		BrowserHandle.wait.until(ExpectedConditions.visibilityOf(additionalDetailsPOM.popUpBtn(btn)));
		String text = CoreFunctions.getElementText(additionalDetailsPOM.popUpBtn(btn));
		Assert.assertEquals(text, btn);
	}

	@When("Verify {string} pop up button is not displayed")
	public void verify_popup_button_not_dispalyed(String btn) {
		Assert.assertFalse(additionalDetailsPOM.isPopupBtnDisplayed(btn),
				"Button '" + btn + "' should not be displayed");

	}
	@When("Verify required field error for {string} is not displayed")
	public void verify_required_field_not_displted(String btn) {
		Assert.assertFalse(additionalDetailsPOM.isRequiresDisplayed(btn),
				"Button '" + btn + "' should not be displayed");
	}

	@When("Verify required field error for {string} is displayed")
	public void verify_required_field_displted(String btn) {
		Assert.assertTrue(additionalDetailsPOM.isRequiresDisplayed(btn),
				"Button '" + btn + "' should not be displayed");
	}

	@Then("Verify {string} is displayed")
	public void Verify_string_displayed(String text) {
		Assert.assertTrue(searchInvoicePOM.verifyByText(text));
	}
	@Then("Verify Loyalty Exchnage Benefit value")
	public void verify_loyalty_exchnage() {
		String text=CoreFunctions.getElementAttribute(additionalDetailsPOM.loyaltyExchangeBenefit(),"value");
		Assert.assertEquals(text, exchangeBenefit);
	}

	@When("Click on {string} tab on Additional Details")
	public void click_tab_additioanl_Details(String btn) throws InterruptedException {
		CoreFunctions.moveToElement(additionalDetailsPOM.popUpBtn(btn));
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.popUpBtn(btn)));
		CoreFunctions.click(additionalDetailsPOM.popUpBtn(btn), btn);
	}

	@When("user filled all details on Loyalty Bonus Benefits popup based on Vin Search for scenario {int}")
	public void user_Filled_on_loyalty_bonus(int rowNo) throws InterruptedException {
		rowNo--;
		CoreFunctions.click(additionalDetailsPOM.makeDropdown(), null);
		String text = AddInvoiceStepDef.testData.get(rowNo).get("Make").toString();
		CoreFunctions.click(financialInfoPOM.chooseFromDropdown(text), null);
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.popUpBtn("VIN")));
		CoreFunctions.click(additionalDetailsPOM.VinSearchIcon(), null);
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.enterValue_vin()));
		text = AddInvoiceStepDef.testData.get(rowNo).get("Vin").toString();
		CoreFunctions.setText(additionalDetailsPOM.enterValue_vin(), text);
		CoreFunctions.moveToElement(loginPOM.spanButton("SEARCH"));
		CoreFunctions.click(loginPOM.spanButton("SEARCH"), "SEARCH");
		BrowserHandle.wait.until(
				ExpectedConditions.elementToBeClickable(additionalDetailsPOM.chooseVehicleOnVehicalDetailsTab(text)));
		CoreFunctions.click(additionalDetailsPOM.chooseVehicleOnVehicalDetailsTab(text), null);
		CoreFunctions.click(additionalDetailsPOM.vinSearchBtn("OK"), "OK");
		CoreFunctions.click(additionalDetailsPOM.policyTypeDropdown(), text);
		text = AddInvoiceStepDef.testData.get(rowNo).get("PolicyType").toString();
		CoreFunctions.click(financialInfoPOM.chooseFromDropdown(text), text);
		text = AddInvoiceStepDef.testData.get(rowNo).get("PolicyNo").toString();
		CoreFunctions.setText(additionalDetailsPOM.policyNo(), text);
		text = AddInvoiceStepDef.testData.get(rowNo).get("OldCarCustomerName").toString();
		CoreFunctions.setText(additionalDetailsPOM.oldCarCustomerName(), text);
		CoreFunctions.click(additionalDetailsPOM.relationDropdown(), "relation");
		text = AddInvoiceStepDef.testData.get(rowNo).get("Relation").toString();
		CoreFunctions.click(financialInfoPOM.chooseFromDropdown(text), text);
		CoreFunctions.click(loginPOM.spanButton("OK"), "OK");

	}
	@When("User click on Vin button for vin search")
	public void click_on_vin_btn() {
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.popUpBtn("VIN")));
		CoreFunctions.click(additionalDetailsPOM.VinSearchIcon(), null);
	}
	
	@Then("Verify {string} error popup")
	public void verfy_toast_sms(String txt) {
		String text=CoreFunctions.getElementText(additionalDetailsPOM.errorToastMsg());
	    Assert.assertEquals(txt, text);
//	    CoreFunctions.click(additionalDetailsPOM.closeRrrorToastMsg(), text);
	}
	
	@When("User search by VIN on vin search popup from scenario {int}")
	public void user_selectVin(int rowNo) throws InterruptedException {
		rowNo--;
		String text="";
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.enterValue_vin()));
		 text = AddInvoiceStepDef.testData.get(rowNo).get("Vin").toString();
		CoreFunctions.setText(additionalDetailsPOM.enterValue_vin(), text);
//		CoreFunctions.moveToElement(loginPOM.spanButton("SEARCH"));
//		CoreFunctions.click(loginPOM.spanButton("SEARCH"), "SEARCH");
//		BrowserHandle.wait.until(
//				ExpectedConditions.elementToBeClickable(additionalDetailsPOM.chooseVehicleOnVehicalDetailsTab(text)));
//		CoreFunctions.click(additionalDetailsPOM.chooseVehicleOnVehicalDetailsTab(text), null);
		}
	
	@When("User search by Reg Num on vin search popup from scenario {int}")
	public void user_selectReg(int rowNo) throws InterruptedException {
		rowNo--;
		String text="";
//		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.popUpBtn("VIN")));
//		CoreFunctions.click(additionalDetailsPOM.VinSearchIcon(), null);
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.enterValue_regNo()));
		 text = AddInvoiceStepDef.testData.get(rowNo).get("RegNum").toString();
		CoreFunctions.setText(additionalDetailsPOM.enterValue_regNo(), text);
		}
//	@When("User search by Model and chassis on vin search popup from scenario {int}")
//	public void user_selectModelChassis(int rowNo) throws InterruptedException {
//		rowNo--;
//		String text="";
////		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.popUpBtn("VIN")));
////		CoreFunctions.click(additionalDetailsPOM.VinSearchIcon(), null);
//		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.enterValue_model()));
//		text = AddInvoiceStepDef.testData.get(rowNo).get("Model").toString();
//		CoreFunctions.setText(additionalDetailsPOM.enterValue_model(), text);
//		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.enterValue_chassis()));
//		text = AddInvoiceStepDef.testData.get(rowNo).get("Chassis").toString();
//		CoreFunctions.setText(additionalDetailsPOM.enterValue_chassis(), text);
//		}
	@When("User search by Model on vin search popup from scenario {int}")
	public void user_selectModel(int rowNo) throws InterruptedException {
		rowNo--;
		String text="";
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.enterValue_model()));
		text = AddInvoiceStepDef.testData.get(rowNo).get("Model").toString();
		CoreFunctions.setText(additionalDetailsPOM.enterValue_model(), text);
		}
	
	@When("User search by Chassis on vin search popup from scenario {int}")
	public void user_selectChassis(int rowNo) throws InterruptedException {
		rowNo--;
		String text="";
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.enterValue_chassis()));
		text = AddInvoiceStepDef.testData.get(rowNo).get("Chassis").toString();
		CoreFunctions.setText(additionalDetailsPOM.enterValue_chassis(), text);
		}
	
	@When("user choose vehicle details on vin search popup for scenario {int}")
	public void user_choose_vehicle_Details(int rowNo) {
		rowNo--;
		
		String text = AddInvoiceStepDef.testData.get(rowNo).get("Vin").toString();

		BrowserHandle.wait.until(
				ExpectedConditions.elementToBeClickable(additionalDetailsPOM.chooseVehicleOnVehicalDetailsTab(text)));
		CoreFunctions.click(additionalDetailsPOM.chooseVehicleOnVehicalDetailsTab(text), null);
		
	}
	@When("Verify if respective vehicle details able to search on vin search popup for scenario {int}")
	public void verify_respective_Detail(int rowNo) {
		rowNo--;
		
		String text = AddInvoiceStepDef.testData.get(rowNo).get("Vin").toString();

		BrowserHandle.wait.until(
				ExpectedConditions.elementToBeClickable(additionalDetailsPOM.chooseVehicleOnVehicalDetailsTab(text)));
		Assert.assertTrue(additionalDetailsPOM.chooseVehicleOnVehicalDetailsTab(text).isDisplayed());
	}
	
	@When("User click {string} button on vin search popup")
	public void user_select_vehicle_detais(String txt) {
		CoreFunctions.click(additionalDetailsPOM.vinSearchBtn(txt), txt);

	}
	@When("User click {string} button on loyalty card popup")
	public void user_select_loyal_Cards(String txt) {
		CoreFunctions.click(additionalDetailsPOM.loyaltyCard(txt), txt);

	}

	@Then("Verify Prefilled fields for OrderId from scenario {int} on Additional Benefits tab")
	public void Verify_Prefilled_fields_for_OrderId_from_scenario_on_Additional_Benefits_tab(int rowNo)
			throws Exception {
		rowNo--;
		testData = CoreFunctions.test("InvoiceData");
		String orderId = testData.get(rowNo).get("OrderId").toString();
		String loyaltyRedeemPointBE = Query.get_fields_From_ShOrderBook("LOYL_REDEEM_PTS", "ORDER_NUM", orderId);
		String loyaltyRedeemPointFE = CoreFunctions.getElementAttribute(additionalDetailsPOM.loyaltyRedemptionPoints(),
				"value");
		Assert.assertEquals(loyaltyRedeemPointBE, loyaltyRedeemPointFE);

		String mobileNum = Query.get_fields_From_ShOrderBook("MOBILE", "ORDER_NUM", orderId);
		String cardType = Query.get_fields_From_ShOrderBook("REF_CARD_TYPE", "ORDER_NUM", orderId);
		String channel = Query.get_fields_From_GD_LOYALTY_ENROL("CHANNEL", "REG_MOBILE", mobileNum, "CARD_TYPE",
				cardType);
		String tier = Query.get_fields_From_GD_LOYALTY_ENROL("TIER", "REG_MOBILE", mobileNum, "CARD_TYPE", cardType);

		String valuePerPOint = Query.get_fields_From_GM_LOYALTY_MASTER("VALUE_PER_POINT", "CHANNEL", channel, "TIER",
				tier, "CARD_TYPE", cardType);
		int redeemAmountBE = ((int) Double.parseDouble(valuePerPOint)) * Integer.parseInt(loyaltyRedeemPointBE);

		String loyaltyReedemAmountFE = CoreFunctions.getElementAttribute(additionalDetailsPOM.loyaltyRedemptionAmount(),
				"value");
		Assert.assertEquals(Integer.toString(redeemAmountBE), loyaltyReedemAmountFE);
	}

	@When("Select make as {string}")
	public void select_make_as(String option) {
		CoreFunctions.click(additionalDetailsPOM.makeDropdown(), null);
		CoreFunctions.click(financialInfoPOM.chooseFromDropdown(option), null);

	}
	@When("Select Policy Type as {string}")
	public void select_policyType_as(String option) {
		CoreFunctions.click(additionalDetailsPOM.policyTypeDropdown(), null);
		CoreFunctions.click(financialInfoPOM.chooseFromDropdown(option), null);

	}
	@And("User enter policy no from {int}")
	public void user_enter_policy_no(int rowNo) {
		testData = CoreFunctions.test("InvoiceData");

		BrowserHandle.wait.until(
				ExpectedConditions.elementToBeClickable(additionalDetailsPOM.policyNo()));
		
		rowNo--;
		String text = AddInvoiceStepDef.testData.get(rowNo).get("PolicyNo").toString();
		CoreFunctions.setText(additionalDetailsPOM.policyNo(), text);
		
	}
	@Then("Verify Policy company name and customer name for policy no from {int}")
	public void verify_policy_company_name(int rowNo) throws Exception {
		rowNo--;
		String text = AddInvoiceStepDef.testData.get(rowNo).get("PolicyNo").toString();

		String dataFromBE=Query.get_fields_From_NI_NEW_MINUS("MINS_INS_COMP", "MINS_POLICY_NO", text);
	    String dataFromFE= CoreFunctions.getElementAttribute(additionalDetailsPOM.companyName(),"value");
	     Assert.assertEquals(CoreFunctions.trim(dataFromFE), CoreFunctions.trim(dataFromBE));
	    
		 dataFromBE=Query.get_fields_From_NI_NEW_MINUS("MINS_CUST_NAME", "MINS_POLICY_NO", text);
	     dataFromFE= CoreFunctions.getElementAttribute(additionalDetailsPOM.oldCarCustomerMiName(),"value");
	     Assert.assertEquals(CoreFunctions.trim(dataFromFE), CoreFunctions.trim(dataFromBE));
	}
	
	@Then("Verify if {string} error msg is displayed")
	public void verify_error_Sms(String txt) {
		BrowserHandle.wait.until(
				ExpectedConditions.visibilityOf(additionalDetailsPOM.errorMsg(txt)));
		Assert.assertTrue(additionalDetailsPOM.errorMsg(txt).isDisplayed());
	}

	@Then("Verify if Vin button is disabled")
	public void Verify_if_vin_btn_disabled() {
		BrowserHandle.wait
				.until(ExpectedConditions.visibilityOf(additionalDetailsPOM.VinSearchIcon()));
		Assert.assertTrue(additionalDetailsPOM.VinSearchbtnDisabled().isDisplayed());
	}
	@Then("Verify error message if text box values are null")
	public void Text_box_value_Are_null() throws InterruptedException {
		additionalDetailsPOM.chassisNum().sendKeys((Keys.chord(Keys.CONTROL,"a",Keys.DELETE)));
		Thread.sleep(1000);
		CoreFunctions.click(additionalDetailsPOM.engineNo(), null);
		Thread.sleep(1000);
		Assert.assertTrue(additionalDetailsPOM.chasisNoError().isDisplayed());
		
	}
	@When("Enter value manually in all fields")
	public void Enter_value_manually() {
		CoreFunctions.setText(additionalDetailsPOM.chassisNum(), "12345");
		CoreFunctions.setText(additionalDetailsPOM.regNum(), "12345");
		CoreFunctions.setText(additionalDetailsPOM.engineNo(), "12345");
		CoreFunctions.setText(additionalDetailsPOM.model(), "12345");
		CoreFunctions.setText(additionalDetailsPOM.vairant(), "12345");
		CoreFunctions.setText(additionalDetailsPOM.vin(), "12345");
		CoreFunctions.setText(additionalDetailsPOM.oldCarCustomerName(), "12345");
	}
	@Then("Verify if fields are disabled")
	public void Verify_filed_disabled() {
		BrowserHandle.wait
		.until(ExpectedConditions.attributeToBe(additionalDetailsPOM.chassisNum(), "disabled", "true"));
System.out.println(additionalDetailsPOM.chassisNum().getAttribute("disabled"));
Assert.assertEquals(additionalDetailsPOM.chassisNum().getAttribute("disabled"), "true");

	}
	@And("User click on other offer dropdown")
	public void user_click_other_offer() {

		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.otherOfferNameDropdown()));
		CoreFunctions.click(additionalDetailsPOM.otherOfferNameDropdown(), "Other Offers");
		
	}
	@And("User selects only the {string} from other offers")
	public void User_selects_only_the_MSSFOffer_from_other_offers(String offerName)
	{
//		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.otherOfferNameDropdown()));
//		CoreFunctions.click(additionalDetailsPOM.otherOfferNameDropdown(), "Other Offers");
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.chooseFromDropdown(offerName)));
		CoreFunctions.click(financialInfoPOM.chooseFromDropdown(offerName), offerName);
//		CoreFunctions.click(additionalDetailsPOM.otherOfferNameDropdown(), "Other Offers");
	}
	@And("User diselect the {string} from other offers")
	public void User_diselect_only_the_MSSFOffer_from_other_offers(String offerName)
	{
//		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.otherOfferNameDropdown()));
//		CoreFunctions.click(additionalDetailsPOM.otherOfferNameDropdown(), "Other Offers");
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.chooseFromDropdown(offerName)));
		CoreFunctions.click(financialInfoPOM.chooseFromDropdown(offerName), offerName);
//		CoreFunctions.click(additionalDetailsPOM.otherOfferNameDropdown(), "Other Offers");
	}
	
	@Then("Verify MSSF Offer pop up button is displayed and MDS Offer pop up button is not displayed")
	public void Verify_MSSF_Offer_pop_up_button_is_displayed_and_MDS_Offer_pop_up_button_is_not_displayed()
	{
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.mssfOfferButton()));
		Assert.assertTrue(additionalDetailsPOM.mssfOfferButton().isDisplayed());
		Assert.assertFalse(additionalDetailsPOM.mdsOfferButton().isDisplayed());
	}
	
	
	@Then("Verify MSSF Offer pop up button is not displayed and MDS Offer pop up button is displayed")
	public void Verify_MSSF_Offer_pop_up_button_is_not_displayed_and_MDS_Offer_pop_up_button_is_displayed()
	{
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.mdsOfferButton()));
		Assert.assertFalse(additionalDetailsPOM.mssfOfferButton().isDisplayed());
		Assert.assertTrue(additionalDetailsPOM.mdsOfferButton().isDisplayed());
	}
	
	@And("User selects both {string} and {string} from other offers")
	public void User_selects_only_the_MSSFOffer_from_other_offers(String offerName1, String offerName2)
	{
//		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.otherOfferNameDropdown()));
//		CoreFunctions.click(additionalDetailsPOM.otherOfferNameDropdown(), "Other Offers");
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.chooseFromDropdown(offerName1)));
		CoreFunctions.click(financialInfoPOM.chooseFromDropdown(offerName1), offerName1);
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfoPOM.chooseFromDropdown(offerName2)));
		CoreFunctions.click(financialInfoPOM.chooseFromDropdown(offerName2), offerName2);
	}
	
	@Then("Verify both MSSF Offer pop up button and MDS Offer pop up button are displayed")
	public void Verify_both_MSSF_Offer_pop_up_button_and_MDS_Offer_pop_up_button_are_displayed()
	{
		
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.mdsOfferButton()));
		Assert.assertTrue(additionalDetailsPOM.mssfOfferButton().isDisplayed());
		Assert.assertTrue(additionalDetailsPOM.mdsOfferButton().isDisplayed());
	}
	@Then("Validate AutoFilled data on popup for VIN for scenario {int}")
	public void Validate_prefiled_detials(int rowNo) throws Exception {
		rowNo--;
		String vin = AddInvoiceStepDef.testData.get(rowNo).get("Vin").toString();
		
	    String dataFromFE=CoreFunctions.getElementAttribute(additionalDetailsPOM.vin(), "value");
	    Assert.assertEquals(dataFromFE,vin);
		
		
		//Assert Chasis
		String dataFromBE=Query.get_fields_From_POC_MSIL_GM_VIN("CHASSIS", "VIN_NUMBER", vin);
	     dataFromFE=CoreFunctions.getElementAttribute(additionalDetailsPOM.chassisNum(), "value");
	    Assert.assertEquals(dataFromBE, dataFromFE);
	    
	    //Assert reg num
	     dataFromBE=Query.get_fields_From_POC_MSIL_GM_VIN("ENGINE_NUMBER", "VIN_NUMBER", vin);
	     dataFromFE=CoreFunctions.getElementAttribute(additionalDetailsPOM.engineNo(), "value");
	    Assert.assertEquals(dataFromBE, dataFromFE);
	    
	    //Assert model cd
	     String text=Query.get_fields_From_POC_MSIL_GM_VIN("ENGI_VEHM_PMODEL_CODE", "VIN_NUMBER", vin);
	     text=Query.get_fields_From_GM_VAR("MODEL_CD", "VARIANT_CD", text);
         dataFromBE=Query.get_fields_From_GM_MOD("MODEL_CD", "MODEL_CD", text);
	     dataFromFE=CoreFunctions.getElementAttribute(additionalDetailsPOM.model(), "value");
	     Assert.assertEquals(dataFromBE, dataFromFE);
	     
	     //Asser Varint desc
	      text=Query.get_fields_From_POC_MSIL_GM_VIN("ENGI_VEHM_PMODEL_CODE", "VIN_NUMBER", vin);
	      dataFromBE=Query.get_fields_From_GM_VAR("VARIANT_DESC", "VARIANT_CD", text);
		  dataFromFE=CoreFunctions.getElementAttribute(additionalDetailsPOM.vairant(), "value");

	}
	@When("User choose Loyalty Card for scenario {int}")
	public void user_choose_loyalty_card(int rowNo) throws Exception {
		testData = CoreFunctions.test("InvoiceData");

		rowNo--;
		String Text = testData.get(rowNo).get("OrderId").toString();
		String loyaltyCardNum=Query.fetch_loyalty_exchange_benefits(Text);
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(additionalDetailsPOM.chooseCardFromPopup(loyaltyCardNum)));
		CoreFunctions.click(additionalDetailsPOM.chooseCardFromPopup(loyaltyCardNum), loyaltyCardNum);
		exchangeBenefit=CoreFunctions.getElementText(additionalDetailsPOM.loyalExchnageBenefit(loyaltyCardNum));
	
	}
	
	
}

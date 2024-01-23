package com.dms.stepdefinitions;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.poi.hpsf.Variant;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.testng.Assert;

import com.dms.browserInstance.BrowserHandle;
import com.dms.core.CoreFunctions;
import com.dms.dbconfig.Query;
import com.dms.logs.Logs;
import com.dms.pageobjects.AddInvoice_AdditionalDetailsPOM;
import com.dms.pageobjects.AddInvoice_FinancialInfo;
import com.dms.pageobjects.AddInvoice_VehicleDetailsPOM;
import com.dms.pageobjects.LoginPOM;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class VehicleDetailTabStepDef {
	LoginPOM loginPOM = new LoginPOM();
	AddInvoice_AdditionalDetailsPOM additionalDetailsPOM = new AddInvoice_AdditionalDetailsPOM();
    public static String ccpCode="";
    public static String ccpDesc="";
    public static String ccpTotal="0";
    public static String Color="";
    public static String Variant="";
    public static String ChasisNo="";
    public static String EngineNum="";
    public static String  extendedWarrantyValue="";

    


  

	AddInvoice_VehicleDetailsPOM vehicleDetailsPOM=new AddInvoice_VehicleDetailsPOM();
	public static List<Map<String, String>> testData = new ArrayList<>();
	AddInvoice_FinancialInfo financialInfoPOM = new AddInvoice_FinancialInfo();

	@Then("Verify Prefilled fields for OrderId from scenario {int} on Vehicle Details tab")
	public void verify_preFilled_Data_on_Vehicle_Detail_Tab(int rowNo) throws Exception {
		String textFromFE = "";
		String textFromBE = "";
		testData=CoreFunctions.test("InvoiceData");
		rowNo--;
		String orderId = testData.get(rowNo).get("OrderId").toString();
		String allotNo = Query.get_fields_From_STAllot("ALLOT_NUM", "ORDER_NUM", orderId);

		String vin = Query.get_fields_From_STAllotBaseOnAllotNo("VIN", "ORDER_NUM", orderId,allotNo);

		// Assert Model
		textFromFE = CoreFunctions.getElementAttribute(vehicleDetailsPOM.model(), "value");
		String modelCd = Query.get_fields_From_SD_GRN("MODEL_CD", "VIN", vin);
		textFromBE = Query.get_fields_From_GM_MOD("MODEL_DESC", "MODEL_CD", modelCd);
		System.out.println("FE " + textFromFE + "  BE  " + modelCd + "-" + textFromBE);
		Assert.assertEquals(textFromFE, modelCd + "-" + textFromBE);

		// Assert Variant
		textFromFE = CoreFunctions.getElementAttribute(vehicleDetailsPOM.variant(), "value");
		String variantCd = Query.get_fields_From_SD_GRN("VARIANT_CD", "VIN", vin);
		textFromBE = Query.get_fields_From_GM_VAR("VARIANT_DESC", "VARIANT_CD", variantCd);
		Variant = Query.get_fields_From_GM_VAR("VARIANT_DESC", "VARIANT_CD", variantCd);

		System.out.println("FE " + textFromFE + "  BE  " + variantCd + "-" + textFromBE);
		Assert.assertEquals(textFromFE, variantCd + "-" + textFromBE);

		// Assert vehicleId
		textFromFE = CoreFunctions.getElementAttribute(vehicleDetailsPOM.vehicleID(), "value");
		System.out.println("FE " + textFromFE + "  BE  " + vin);
		Assert.assertEquals(vin, textFromFE);

		// Assert Chassis No
		textFromFE = CoreFunctions.getElementAttribute(vehicleDetailsPOM.chassisNum(), "value");
		textFromBE = Query.get_fields_From_SD_GRN("CHASSIS_NUM", "VIN", vin);
		ChasisNo = Query.get_fields_From_SD_GRN("CHASSIS_NUM", "VIN", vin);

		System.out.println("FE " + textFromFE + "  BE  " + textFromBE);
		Assert.assertEquals(textFromBE, textFromFE);

		// Assert Color
		textFromFE = CoreFunctions.getElementAttribute(vehicleDetailsPOM.color(), "value");
		String colorCd = Query.get_fields_From_SD_GRN("ECOLOR_CD", "VIN", vin);
		textFromBE = Query.get_fields_From_GM_ECLR("ECOLOR_DESC", "ECOLOR_CD", colorCd);
		Color = Query.get_fields_From_GM_ECLR("ECOLOR_DESC", "ECOLOR_CD", colorCd);

		System.out.println("FE " + textFromFE + "  BE  " + textFromBE);
		Assert.assertEquals(textFromFE, colorCd + "-" + textFromBE);

		// Assert Engine no
		textFromFE = CoreFunctions.getElementAttribute(vehicleDetailsPOM.engineNum(), "value");
		textFromBE = Query.get_fields_From_SD_GRN("ENGINE_NUM", "VIN", vin);
		EngineNum = Query.get_fields_From_SD_GRN("ENGINE_NUM", "VIN", vin);

		System.out.println("FE " + textFromFE + "  BE  " + textFromBE);
		Assert.assertEquals(textFromBE, textFromFE);

		// Assert Key no
		textFromFE = CoreFunctions.getElementAttribute(vehicleDetailsPOM.keyNum(), "value");
		textFromBE = Query.get_fields_From_SD_GRN("KEY_NUM", "VIN", vin);
		System.out.println("FE " + textFromFE + "  BE  " + textFromBE);
		Assert.assertEquals(textFromBE, textFromFE);

	}

	
	@When("User clicks on {string} button of Vehicle Details tab")
	public void user_click_on_btn(String btn) throws InterruptedException {
		CoreFunctions.moveToElement(vehicleDetailsPOM.selectExtendedWarrantyDropdown());
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.clickCCPSalepopup()));
		CoreFunctions.click(vehicleDetailsPOM.clickCCPSalepopup(),"Clicking on Preferred SRV");

        ccpTotal=CoreFunctions.trim(CoreFunctions.getElementText(vehicleDetailsPOM.ccpTotal()));

		
		CoreFunctions.click(loginPOM.spanButton("OK"), "OK");

		
		
		
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName() + " " + btn);
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.spanButton(btn)));
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.spanButton(btn)));
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.spanButton(btn)));
		CoreFunctions.moveToElement(loginPOM.spanButton(btn));
		CoreFunctions.click(loginPOM.spanButton(btn), btn);
	}
	
	@When("user selects Owners Manual Preference for scenario {int}")
	public void user_selects_owners_manual_preference_as(int rowNo) throws Exception {
		testData=CoreFunctions.test("InvoiceData");

		rowNo--;
		
		if(financialInfoPOM.getDropdownSelectedValue("ownerManualRef")==null) {
		
		String ownerManualValue = testData.get(rowNo).get("OwnerManualPref").toString();
		CoreFunctions.moveToElement(vehicleDetailsPOM.clickownersManualPrefDropdown());
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.clickownersManualPrefDropdown()));
		CoreFunctions.click(vehicleDetailsPOM.clickownersManualPrefDropdown(), "Clicking on Owner Pref");
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.chooseownersManualPref(ownerManualValue)));
		CoreFunctions.click(vehicleDetailsPOM.chooseownersManualPref(ownerManualValue), "selecting the Owner manual");
		}
		//verify_preFilled_Data_on_Vehicle_Detail_Tab(++rowNo);
		
		ChasisNo= CoreFunctions.getElementAttribute(vehicleDetailsPOM.chassisNum(), "value");
		EngineNum = CoreFunctions.getElementAttribute(vehicleDetailsPOM.engineNum(), "value");
		Variant = CoreFunctions.getElementAttribute(vehicleDetailsPOM.variant(), "value"); 
		String[] variantSplitArray = Variant.split("-");
		Variant = variantSplitArray[variantSplitArray.length-1];
		Color = CoreFunctions.getElementAttribute(vehicleDetailsPOM.color(), "value");
		String[] colorSplitArray = Color.split("-");
		Color = colorSplitArray[colorSplitArray.length-1];
	}

	@When("user selects Interested in Loyalty Card, Type of card, Reason for scenario {int}")
	public void user_selects_interested_in_loyalty_card_as(int rowNo) {
		rowNo--;
		String loyaltyCardValue = testData.get(rowNo).get("LoyaltyCard").toString();
		String loyaltyCardTypeValue = testData.get(rowNo).get("TypeOFLoyaltyCard").toString();
		String reasonValue = testData.get(rowNo).get("Reason").toString();
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.clickLoyaltyCardDropdown()));
		CoreFunctions.click(vehicleDetailsPOM.clickLoyaltyCardDropdown(),"Clicking on Loyalty Card dropdown");
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.chooseLoyaltyCard(loyaltyCardValue)));
		CoreFunctions.click(vehicleDetailsPOM.chooseLoyaltyCard(loyaltyCardValue),"Selecting Loyalty Card");
		if(loyaltyCardValue.equalsIgnoreCase("Yes"))
		{
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.clickLoyaltyCardTypeDropdown()));
			CoreFunctions.click(vehicleDetailsPOM.clickLoyaltyCardTypeDropdown(),"Clicking on Loyalty Card Type dropdown");
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.chooseLoyaltyCardType(loyaltyCardTypeValue)));
			CoreFunctions.click(vehicleDetailsPOM.chooseLoyaltyCardType(loyaltyCardTypeValue),"Selecting Loyalty Card Type");
		}
		else if(loyaltyCardValue.equalsIgnoreCase("No"))
		{
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.reasons()));
			CoreFunctions.click(vehicleDetailsPOM.reasons(),"Clicking on reason dropdown");
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.chooseReasons(reasonValue)));
			CoreFunctions.click(vehicleDetailsPOM.chooseReasons(reasonValue),"Selecting Reason");
		}
	}

	@When("user clicks on Preferred SRV Dealer popup")
	public void user_clicks_on_preferred_srv_dealer_popup() throws InterruptedException {
		CoreFunctions.moveToElement(vehicleDetailsPOM.selectExtendedWarrantyDropdown());
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.clickPrefSrvDealerpopup()));
		CoreFunctions.click(vehicleDetailsPOM.clickPrefSrvDealerpopup(),"Clicking on Preferred SRV");

	}
	
@When("User clicks on CCP Sale popup")
public void user_Click_ccp_sale() throws InterruptedException {
	CoreFunctions.moveToElement(vehicleDetailsPOM.selectExtendedWarrantyDropdown());
	BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.clickCCPSalepopup()));
	CoreFunctions.click(vehicleDetailsPOM.clickCCPSalepopup(),"Clicking on ccp");

}

	@When("user selects state for scenario {int}")
	public void user_selects_state_as(int rowNo) throws InterruptedException, InvalidFormatException, IOException {
		rowNo--;
		testData=CoreFunctions.test("InvoiceData");
		

		String stateValue = testData.get(rowNo).get("State").toString();
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.selectStateDropdown()));
		CoreFunctions.click(vehicleDetailsPOM.selectStateDropdown(),"Clicking on Select State dropdown");
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.chooseState(stateValue)));
		CoreFunctions.click(vehicleDetailsPOM.chooseState(stateValue),"Selecting State");
	}

	@When("user selects city for scenario {int}")
	public void user_selects_city_as(int rowNo) throws InterruptedException {
		rowNo--;
		

		String cityValue = testData.get(rowNo).get("City").toString();
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.selectCityDropdown()));
		CoreFunctions.click(vehicleDetailsPOM.selectCityDropdown(),"Clicking on Select City dropdown");
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.chooseCity(cityValue)));
		CoreFunctions.click(vehicleDetailsPOM.chooseCity(cityValue),"Selecting City");
	}

	@When("selects the dealer for scenario {int} from searched results")
	public void selects_the_dealer_from_searched_results(int rowNo) {
		rowNo--;
		String dealerName = testData.get(rowNo).get("Dealer").toString();
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.chooseDealer(dealerName)));
		CoreFunctions.click(vehicleDetailsPOM.chooseDealer(dealerName),"Selecting Dealer");
	}

	@When("user selects Extended Warranty for scenario {int}")
	public void user_selects_extended_warranty_as(int rowNo) throws InterruptedException, InvalidFormatException, IOException {
		rowNo--;
		testData=CoreFunctions.test("InvoiceData");
		extendedWarrantyValue = testData.get(rowNo).get("ExtendedWarranty").toString();
		
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.selectExtendedWarrantyDropdown()));
		CoreFunctions.click(vehicleDetailsPOM.selectExtendedWarrantyDropdown(),"Clicking on Extended Warranty dropdown");
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.chooseExtendedWarranty(extendedWarrantyValue)));
		CoreFunctions.click(vehicleDetailsPOM.chooseExtendedWarranty(extendedWarrantyValue),"Selecting Extended Warranty");
	}

	@When("User clicks on FastTag button")
	public void user_clicks_on_fast_tag_button() throws InterruptedException {
		CoreFunctions.moveToElement(vehicleDetailsPOM.clickLoyaltyCardDropdown());
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.clickFastTagpopup()));
		CoreFunctions.click(vehicleDetailsPOM.clickFastTagpopup(),"Clicking on Fast Tag");
	}

	@When("User enters Fast Tag ID from {int}")
	public void user_enters_for_fast_tag_id(int rowNo) throws InvalidFormatException, IOException {
		rowNo--;
		testData=CoreFunctions.test("InvoiceData");
		String fastTagID = testData.get(rowNo).get("FastTagID").toString();
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.fastTagId()));
		CoreFunctions.setText(vehicleDetailsPOM.fastTagId(), fastTagID);
	}

	@When("User selects Fast Tag Bank for scenario {int}")
	public void user_selects_fast_tag_bank_as(int rowNo) {
		rowNo--;
		String fastTagBank = testData.get(rowNo).get("FastTagBank").toString();
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.fastTagBank()));
		CoreFunctions.click(vehicleDetailsPOM.fastTagBank(),"Clicking on FastTag Bank dropdown");
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.inputBankSearch()));
		CoreFunctions.setText(vehicleDetailsPOM.inputBankSearch(),fastTagBank);

//		CoreFunctions.click(vehicleDetailsPOM.fastTagBank(),"Clicking on FastTag Bank dropdown");
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.choosefastTagBank(fastTagBank)));
		CoreFunctions.click(vehicleDetailsPOM.choosefastTagBank(fastTagBank),"Selecting FastTag Bank");
	}

	@When("User selects Fast Tag Fitment Date {string}")
	public void user_selects_fast_tag_fitment_date(String fastTagFitmentDate) {
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.fastTagFitmentdatePicker()));
		CoreFunctions.click(vehicleDetailsPOM.fastTagFitmentdatePicker(),fastTagFitmentDate);
		try {
			CoreFunctions.selectDate(BrowserHandle.getDriver(), fastTagFitmentDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Then("Verify CCP Sale popup list")
	public void ccp_list_verify() throws Exception {
		
		List<WebElement> codeList=vehicleDetailsPOM.codeColumnList();
		List<WebElement> codeDescList=vehicleDetailsPOM.codeDescColumnList();

		for(int i=0;i<codeList.size();i++) {
			String codeDesc=Query.get_fields_From_AM_List("LIST_DESC", "LIST_CODE", codeList.get(i).getText());
		    Assert.assertEquals(CoreFunctions.trim(codeDesc), CoreFunctions.trim(codeDescList.get(i).getText()));
		}
		
		
	}

	@Then("Verify the FastTag fields are cleared out")
	public void verify_the_FastTag_fields_are_cleared_out() {
		Assert.assertTrue(vehicleDetailsPOM.fastTagId().getAttribute("value").isEmpty());
		Assert.assertEquals(financialInfoPOM.getDropdownValueForClear("fastTagBank").getText(),"Select");	
		Assert.assertTrue(vehicleDetailsPOM.fastTagFitmentValue().getAttribute("value").isEmpty());
	}

	@Then("Verify the Preferred SRV fields are cleared out")
	public void verify_the_preferred_srv_fields_are_cleared_out() {
		Assert.assertEquals(financialInfoPOM.getDropdownValueForClear("dealerState").getText(),"Select");	
		Assert.assertEquals(financialInfoPOM.getDropdownValueForClear("dealerCity").getText(),"Select");	

	}
	@Then("Verify if ccp benefit is selected")
	public void verify_ccp_benefit() {
	Assert.assertTrue(vehicleDetailsPOM.IsCCPSaleActive().isDisplayed());
	}
	@Then("Verify if benefit is already selected or select benefit from {int}")
	public void verify_if_benefit_already_selected(int rowNo) throws InterruptedException {
	
		rowNo--;
		
		
		if(loginPOM.spanButtonIsDisable("OK").getAttribute("disabled")!=(null)) {
		if(loginPOM.spanButtonIsDisable("OK").getAttribute("disabled").equalsIgnoreCase("true")){
			System.out.println("Inside CPP if");
			String text = AddInvoiceStepDef.testData.get(rowNo).get("CCPPackageCodeWithEW").toString();
			CoreFunctions.click(additionalDetailsPOM.chooseCardFromPopup(text), text);
		}
		}
		
		ccpCode=CoreFunctions.trim(CoreFunctions.getElementText(vehicleDetailsPOM.selectedCCPCode()));
		ccpDesc=CoreFunctions.trim(CoreFunctions.getElementText(vehicleDetailsPOM.selectedCCPDesc()));
        ccpTotal=CoreFunctions.trim(CoreFunctions.getElementText(vehicleDetailsPOM.ccpTotal()));
//         System.out.println("ccpCode"+ccpCode+"ccpDesc"+ccpDesc+"ccpTotal"+ccpTotal);

		
		
	}
	

}

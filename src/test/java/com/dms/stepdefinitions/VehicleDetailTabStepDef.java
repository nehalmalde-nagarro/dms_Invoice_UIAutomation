package com.dms.stepdefinitions;
 
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.testng.Assert;

import com.dms.browserInstance.BrowserHandle;
import com.dms.core.CoreFunctions;
import com.dms.dbconfig.Query;
import com.dms.pageobjects.AddInvoice_VehicleDetailsPOM;
 
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
public class VehicleDetailTabStepDef {
AddInvoice_VehicleDetailsPOM vehicleDetailsPOM=new AddInvoice_VehicleDetailsPOM();
	
@Then("Verify Prefilled fields for {string} on Vehicle Details tab")
public void verify_preFilled_Data_on_Vehicle_Detail_Tab(String orderId) throws Exception {
	String textFromFE = "";
	String textFromBE = "";

	String vin = Query.get_fields_From_STAllot("VIN", "ORDER_NUM", orderId);

	// Assert Model
	textFromFE = CoreFunctions.getElementAttribute(vehicleDetailsPOM.model(), "value");
	String modelCd = Query.get_fields_From_SD_GRN("MODEL_CD", "VIN", vin);
	textFromBE = Query.get_fields_From_GM_MOD("MODEL_DESC", "MODEL_CD", modelCd);
	System.out.println("FE " + textFromFE + "  BE  " + modelCd + "-" + textFromBE);
	Assert.assertEquals(textFromFE, modelCd + "-" + textFromBE);

	// Assert Varinat
	textFromFE = CoreFunctions.getElementAttribute(vehicleDetailsPOM.variant(), "value");
	String variantCd = Query.get_fields_From_SD_GRN("VARIANT_CD", "VIN", vin);
	textFromBE = Query.get_fields_From_GM_VAR("VARIANT_DESC", "VARIANT_CD", variantCd);
	System.out.println("FE " + textFromFE + "  BE  " + variantCd + "-" + textFromBE);
	Assert.assertEquals(textFromFE, variantCd + "-" + textFromBE);

	// Assert vehicleId
	textFromFE = CoreFunctions.getElementAttribute(vehicleDetailsPOM.vehicleID(), "value");
	System.out.println("FE " + textFromFE + "  BE  " + vin);
	Assert.assertEquals(vin, textFromFE);

	// Assert Chassis No
	textFromFE = CoreFunctions.getElementAttribute(vehicleDetailsPOM.chassisNum(), "value");
	textFromBE = Query.get_fields_From_SD_GRN("CHASSIS_NUM", "VIN", vin);
	System.out.println("FE " + textFromFE + "  BE  " + textFromBE);
	Assert.assertEquals(textFromBE, textFromFE);

	// Assert Color
	textFromFE = CoreFunctions.getElementAttribute(vehicleDetailsPOM.color(), "value");
	String colorCd = Query.get_fields_From_SD_GRN("ECOLOR_CD", "VIN", vin);
	textFromBE = Query.get_fields_From_GM_ECLR("ECOLOR_DESC", "ECOLOR_CD", colorCd);
	System.out.println("FE " + textFromFE + "  BE  " + textFromBE);
	Assert.assertEquals(textFromFE, colorCd + "-" + textFromBE);

	// Assert Engine no
	textFromFE = CoreFunctions.getElementAttribute(vehicleDetailsPOM.engineNum(), "value");
	textFromBE = Query.get_fields_From_SD_GRN("ENGINE_NUM", "VIN", vin);
	System.out.println("FE " + textFromFE + "  BE  " + textFromBE);
	Assert.assertEquals(textFromBE, textFromFE);

	// Assert Key no
	textFromFE = CoreFunctions.getElementAttribute(vehicleDetailsPOM.keyNum(), "value");
	textFromBE = Query.get_fields_From_SD_GRN("KEY_NUM", "VIN", vin);
	System.out.println("FE " + textFromFE + "  BE  " + textFromBE);
	Assert.assertEquals(textFromBE, textFromFE);

}
	
	
	@When("user selects Owner's Manual Preference as {string}")
	public void user_selects_owner_s_manual_preference_as(String ownerManualValue) {
	    // Write code here that turns the phrase above into concrete actions
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.clickownersManualPrefDropdown()));
		CoreFunctions.click(vehicleDetailsPOM.clickownersManualPrefDropdown(), "Clicking on Owner Pref");
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.chooseownersManualPref(ownerManualValue)));
		CoreFunctions.click(vehicleDetailsPOM.chooseownersManualPref(ownerManualValue), "selecting the Owner manual");
		
	}

	@When("user selects Interested in Loyalty Card, Type of card, Reason as {string}, {string}, {string}")
	public void user_selects_interested_in_loyalty_card_as(String loyaltyCardValue, String loyaltyCardTypeValue, String reasonValue) {
	    // Write code here that turns the phrase above into concrete actions
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
	public void user_clicks_on_preferred_srv_dealer_popup() {
	    // Write code here that turns the phrase above into concrete actions
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.clickPrefSrvDealerpopup()));
		CoreFunctions.click(vehicleDetailsPOM.clickPrefSrvDealerpopup(),"Clicking on Preferred SRV");
		
	}

	@When("user selects state as {string}")
	public void user_selects_state_as(String stateValue) {
	    // Write code here that turns the phrase above into concrete actions
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.selectStateDropdown()));
		CoreFunctions.click(vehicleDetailsPOM.selectStateDropdown(),"Clicking on Select State dropdown");
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.chooseState(stateValue)));
	    CoreFunctions.click(vehicleDetailsPOM.chooseState(stateValue),"Selecting State");
	}

	@When("user selects city as {string}")
	public void user_selects_city_as(String cityValue) {
	    // Write code here that turns the phrase above into concrete actions
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.selectCityDropdown()));
		CoreFunctions.click(vehicleDetailsPOM.selectCityDropdown(),"Clicking on Select City dropdown");
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.chooseCity(cityValue)));
	    CoreFunctions.click(vehicleDetailsPOM.chooseCity(cityValue),"Selecting City");
	}

	@When("selects the dealer {string} from searched results")
	public void selects_the_dealer_from_searched_results(String dealerName) {
	    // Write code here that turns the phrase above into concrete actions
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.chooseDealer(dealerName)));
		 CoreFunctions.click(vehicleDetailsPOM.chooseDealer(dealerName),"Selecting Dealer");
	}

	@When("user selects Extended Warranty as {string}")
	public void user_selects_extended_warranty_as(String extendedWarrantyValue) {
	    // Write code here that turns the phrase above into concrete actions
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.selectExtendedWarrantyDropdown()));
		CoreFunctions.click(vehicleDetailsPOM.selectExtendedWarrantyDropdown(),"Clicking on Extended Warranty dropdown");
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.chooseExtendedWarranty(extendedWarrantyValue)));
		CoreFunctions.click(vehicleDetailsPOM.chooseExtendedWarranty(extendedWarrantyValue),"Selecting Extended Warranty");
	}

	@When("User clicks on FastTag button")
	public void user_clicks_on_fast_tag_button() {
	    // Write code here that turns the phrase above into concrete actions
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.clickFastTagpopup()));
		CoreFunctions.click(vehicleDetailsPOM.clickFastTagpopup(),"Clicking on Fast Tag");
	}

	@When("User enters {string} for Fast Tag ID")
	public void user_enters_for_fast_tag_id(String fastTagID) {
	    // Write code here that turns the phrase above into concrete actions
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.fastTagId()));
		CoreFunctions.setText(vehicleDetailsPOM.fastTagId(), fastTagID);
	}

	@When("User selects Fast Tag Bank as {string}")
	public void user_selects_fast_tag_bank_as(String fastTagBank) {
	    // Write code here that turns the phrase above into concrete actions
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.fastTagBank()));
		CoreFunctions.click(vehicleDetailsPOM.fastTagBank(),"Clicking on FastTag Bank dropdown");
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.choosefastTagBank(fastTagBank)));
		CoreFunctions.click(vehicleDetailsPOM.choosefastTagBank(fastTagBank),"Selecting FastTag Bank");
	}

	@When("User selects Fast Tag Fitment Date {string}")
	public void user_selects_fast_tag_fitment_date(String fastTagFitmentDate) {
	    // Write code here that turns the phrase above into concrete actions
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.fastTagFitmentdatePicker()));
		try {
			CoreFunctions.selectDate(BrowserHandle.getDriver(), fastTagFitmentDate);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
 
	
	@Then("Verify the FastTag fields are cleared out")
	public void verify_the_FastTag_fields_are_cleared_out() {
	    // Write code here that turns the phrase above into concrete actions
		
		Assert.assertTrue(vehicleDetailsPOM.fastTagId().getAttribute("value")==null);
		Assert.assertEquals(vehicleDetailsPOM.fastTagBank().getAttribute("placeholder"), "Select");
		Assert.assertTrue(vehicleDetailsPOM.fastTagFitmentValue().getAttribute("value")==null);
	}
	
	@Then("Verify the Preferred SRV fields are cleared out")
	public void verify_the_preferred_srv_fields_are_cleared_out() {
	    // Write code here that turns the phrase above into concrete actions
		
		Assert.assertTrue(vehicleDetailsPOM.selectStateDropdown().getText().isEmpty());
		Assert.assertTrue(vehicleDetailsPOM.selectCityDropdown().getText().isEmpty());
		
	}
	
}

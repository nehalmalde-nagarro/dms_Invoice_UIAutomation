package com.dms.stepdefinitions;

import org.testng.Assert;

import com.dms.core.CoreFunctions;
import com.dms.dbconfig.Query;
import com.dms.logs.Logs;
import com.dms.pageobjects.DealerInformationPOM;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class DealerInformationStepDef {

	DealerInformationPOM dealerInformationPOM = new DealerInformationPOM();

	@When("user clicks on Profile Icon")
	public void user_clicks_on_profile_icon() {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		CoreFunctions.click(dealerInformationPOM.userIcon(), "user icon");
	}

	@Then("user is able to view dealer information")
	public void user_is_able_to_view_deaer_information() {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());

	}

	@Then("verify user profile")
	public void verify_user_profile() {
		CoreFunctions.click(dealerInformationPOM.userIcon(), "user icon");
		Query.PARENT_GROUP=CoreFunctions.getElementText(dealerInformationPOM.parentGroup());
		Query.dealer_Code=Integer.parseInt(CoreFunctions.getElementText(dealerInformationPOM.dealerMapCode()));
		Query.LOC_CD=CoreFunctions.getElementText(dealerInformationPOM.locationCode());
		Query.COMP_FA=CoreFunctions.getElementText(dealerInformationPOM.company());
		CoreFunctions.click(dealerInformationPOM.closeIcon(), "close icon");
		
		
	}
}

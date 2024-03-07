package com.dms.stepdefinitions;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.KeyEvent;
import java.time.Duration;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import com.dms.browserInstance.BrowserHandle;
import com.dms.core.CoreFunctions;
import com.dms.dbconfig.Query;
import com.dms.pageobjects.AddInvoice_FinancialInfo;
import com.dms.pageobjects.AddInvoice_InvoiceDetailsPOM;
import com.dms.pageobjects.AddInvoice_VehicleDetailsPOM;
import com.dms.pageobjects.LoginPOM;
import com.dms.pageobjects.ReportsPOM;
import com.dms.pageobjects.SearchInvoice;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class ReportsStepDef {
	
	AddInvoice_InvoiceDetailsPOM addInvoicePOM = new AddInvoice_InvoiceDetailsPOM();
	AddInvoice_VehicleDetailsPOM vehicleDetailsPOM = new AddInvoice_VehicleDetailsPOM();
	LoginStepDef loginStepDef = new LoginStepDef();
	LoginPOM loginPOM = new LoginPOM();
	ReportsPOM reportsPOM = new ReportsPOM();
	AddInvoice_FinancialInfo financialInfo = new AddInvoice_FinancialInfo();
	SearchInvoice searchInvoicePOM = new SearchInvoice();
	JavascriptExecutor js = (JavascriptExecutor) BrowserHandle.getDriver();
	boolean flag = new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
	        "return document.readyState").equals("complete"));
	
	@Given("user is on the Online Report Landing page")
	public void user_is_on_the_Online_Report_Landing_page() throws InterruptedException {
		
		new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
		        "return document.readyState").equals("complete"));
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.onlineReportLanding()));
		
	}
	
	
	@Given("user clicks on Reports")
	public void verify_user_is_navigated_to() throws InterruptedException {
		Thread.sleep(3000);
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.ReportKeyDown()));
		CoreFunctions.click(reportsPOM.ReportKeyDown(), null);
	}
	
	@And("user selects Sales Register Report")
	public void user_selects_sales_register_report() {
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.SaleRegisterReport()));
		CoreFunctions.click(reportsPOM.SaleRegisterReport(), null);
	}

	@And("user selects From Date as {string}")
	public void user_selects_from_date_as(String date) throws Exception {
	    // Write code here that turns the phrase above into concrete actions
		new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
		        "return document.readyState").equals("complete"));
			Thread.sleep(3000);
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.fromDate()));
			CoreFunctions.click(reportsPOM.fromDate(), date);
			CoreFunctions.selectDate(BrowserHandle.getDriver(), date);
		
		
		
	}

	@And("user selects To Date as {string}")
	public void user_selects_to_date_as(String date) throws Exception {
		new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
		        "return document.readyState").equals("complete"));
			Thread.sleep(1000);
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.toDate()));
			CoreFunctions.click(reportsPOM.toDate(), date);
			CoreFunctions.selectDate(BrowserHandle.getDriver(), date);
			Thread.sleep(1000);
		
		
	}

	@And("user selects Invoice Status as {string}")
	public void user_selects_invoice_status_as(String value) {
		new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
		        "return document.readyState").equals("complete"));
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.invoiceStatus()));
			CoreFunctions.click(reportsPOM.invoiceStatus(), null);
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(financialInfo.chooseFromDropdown(value)));
			CoreFunctions.click(financialInfo.chooseFromDropdown(value), null);
		
			
		
	}

	@And("user selects Model Details as {string}")
	public void user_selects_model_details_as(String model) throws AWTException {
		new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
		        "return document.readyState").equals("complete"));
			if(!model.contains("All"))
			{
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.modelDetails()));
			CoreFunctions.click(reportsPOM.modelDetails(), null);
			
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.searchInDropdown()));
			CoreFunctions.setText(vehicleDetailsPOM.searchInDropdown(), model);
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.selectInDropdown(model)));
			CoreFunctions.click(reportsPOM.selectInDropdown(model), null);
			new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
			        "return document.readyState").equals("complete"));
			CoreFunctions.clickTabKey();
			
			
			}
		
		
	}

	@And("user selects Variant Details as {string}")
	public void user_selects_variant_details_as(String variant) throws AWTException {
		new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
		        "return document.readyState").equals("complete"));
			if(!variant.contains("All"))
			{
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.variantDetails()));
			CoreFunctions.click(reportsPOM.modelDetails(), null);
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.searchInDropdown()));
			CoreFunctions.setText(vehicleDetailsPOM.searchInDropdown(), variant);
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.selectInDropdown(variant)));
			CoreFunctions.click(reportsPOM.selectInDropdown(variant), null);
			new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
			        "return document.readyState").equals("complete"));
			CoreFunctions.clickTabKey();
			
		}
		
	}

	@And("user selects Color Details as {string}")
	public void user_selects_color_details_as(String color) throws AWTException {
		new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
		        "return document.readyState").equals("complete"));
			if(!color.contains("All"))
			{
				BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.colorDetails()));
				CoreFunctions.click(reportsPOM.colorDetails(), null);
				BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.searchInDropdown()));
				CoreFunctions.setText(vehicleDetailsPOM.searchInDropdown(), color);
				BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.selectInDropdown(color)));
				CoreFunctions.click(reportsPOM.selectInDropdown(color), null);
				new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
				        "return document.readyState").equals("complete"));
				CoreFunctions.clickTabKey();
				
		}
		
		
	}

	

		@Given("user selects Zone as {string}")
	public void user_selects_zone_as(String zone) throws InterruptedException, AWTException {
		Thread.sleep(3000);
		new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
		        "return document.readyState").equals("complete"));
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.zone()));
			CoreFunctions.click(reportsPOM.zone(), null);
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.selectInDropdown(zone)));
			CoreFunctions.click(reportsPOM.selectInDropdown(zone), null);
			new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
			        "return document.readyState").equals("complete"));
			CoreFunctions.clickTabKey();
			
		
	}
	
	@Given("user selects Region as {string}")
	public void user_selects_region_as(String region) throws AWTException {
		new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
		        "return document.readyState").equals("complete"));
			if(!region.contains("All"))
			{
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.region()));
			CoreFunctions.click(reportsPOM.region(), null);
			
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.selectInDropdown(region)));
			CoreFunctions.click(reportsPOM.selectInDropdown(region), null);
			new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
			        "return document.readyState").equals("complete"));
			CoreFunctions.clickTabKey();
			}
			
			
		
	}
	
	@Given("user selects Dealer as {string} and {string}")
	public void user_selects_dealer_as(String dealerName, String location) throws InterruptedException {
		new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
		        "return document.readyState").equals("complete"));
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.dealer()));
			CoreFunctions.click(reportsPOM.dealer(), null);
			CoreFunctions.click(reportsPOM.dealer(), null);
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.dealerName()));
			CoreFunctions.setText(reportsPOM.dealerName(), dealerName);
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.searchByLocation()));
			CoreFunctions.setText(reportsPOM.searchByLocation(), location);
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.popupButton("Search")));
			CoreFunctions.click(loginPOM.popupButton("Search"), null);
			new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
			        "return document.readyState").equals("complete"));
			Thread.sleep(2000);
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.selectDealerFromList(dealerName)));
			CoreFunctions.click(reportsPOM.selectDealerFromList(dealerName), null);
			new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
			        "return document.readyState").equals("complete"));
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.popupButton("Search")));
			CoreFunctions.click(loginPOM.popupButton("OK"), null);
		
		
	}
	
	@Given("user selects Channel as {string}")
	public void user_selects_channel_as(String channel) throws AWTException {
		new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
		        "return document.readyState").equals("complete"));
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.channel()));
			CoreFunctions.click(reportsPOM.channel(), null);
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.selectInDropdown(channel)));
			CoreFunctions.click(reportsPOM.selectInDropdown(channel), null);
			new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
			        "return document.readyState").equals("complete"));
			CoreFunctions.clickTabKey();
			
		
	}



	
	
	@When("user clicks on Submit button")
	public void user_clicks_on_submit_button() {
	    // Write code here that turns the phrase above into concrete actions
	    throw new io.cucumber.java.PendingException();
	}

	@When("user clicks on Clear button")
	public void user_clicks_on_clear_button() {
	    // Write code here that turns the phrase above into concrete actions
	    throw new io.cucumber.java.PendingException();
	}
	
	
	
	//Online 

	@Given("user selects Online Retail Report")
	public void user_selects_online_retail_report() {
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.onlineRetailReport()));
		CoreFunctions.click(reportsPOM.onlineRetailReport(), null);
	}
	
	@Given("user selects Model Wise as {string}")
	public void user_selects_model_wise_as(String modelWise) {
		new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
		        "return document.readyState").equals("complete"));
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.modelwise()));
		CoreFunctions.click(reportsPOM.modelwise(), null);
		
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.selectInDropdown(modelWise)));
		CoreFunctions.click(reportsPOM.selectInDropdown(modelWise), null);
		
	}
	
	@Given("user selects Model as {string}")
	public void user_selects_model_as(String model) {
		new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
		        "return document.readyState").equals("complete"));
		if(!model.contains("All"))
		{
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.model()));
		CoreFunctions.click(reportsPOM.model(), null);
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(vehicleDetailsPOM.searchInDropdown()));
		CoreFunctions.setText(vehicleDetailsPOM.searchInDropdown(), model);
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.selectInDropdown(model)));
		CoreFunctions.click(reportsPOM.selectInDropdown(model), null);
		}
		
	}
	
	@Given("user selects Fuel as {string}")
	public void user_selects_fuel_as(String fuel) {
		new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
		        "return document.readyState").equals("complete"));
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.fuel()));
		CoreFunctions.click(reportsPOM.fuel(), null);
		
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.selectInDropdown(fuel)));
		CoreFunctions.click(reportsPOM.selectInDropdown(fuel), null);
		
	}
	
	@Given("user select Type as {string}")
	public void user_select_type_as(String type) {
		new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
		        "return document.readyState").equals("complete"));
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(reportsPOM.typeRadioButton(type)));
		CoreFunctions.click(reportsPOM.typeRadioButton(type), null);
		
	}
	
	@Given("user validates the dealer sales register report from {string} to {string} and {string}")
	public void user_validates_the_dealer_sales_register_report(String fromDate, String toDate, String status) throws Exception {
		
		Thread.sleep(5000);
		int rowCountFromFile = CoreFunctions.validateExportedExcel();
		
		String queryOrderCount = Query.get_order_count_for_sales_register_report_dealer(fromDate, toDate, status);
		Assert.assertEquals(rowCountFromFile-1, Integer.parseInt(queryOrderCount) );
		
	}

	@Given("user validates the MSIL sales register report from {string} to {string},{string},{string},{string},{string},{string}")
	public void user_validates_the_MSIL_sales_register_report(String fromDate, String toDate, String status,String dealerName, String location,String regionCode, String channelCode) throws Exception {
		
		Thread.sleep(5000);
		int rowCountFromFile = CoreFunctions.validateExportedExcel();
		
		String queryOrderCount = Query.get_order_count_for_sales_register_report_MSIL(fromDate, toDate, status,dealerName, location, regionCode, channelCode);
		Assert.assertEquals(rowCountFromFile-1, Integer.parseInt(queryOrderCount) );
		
	}
	
}

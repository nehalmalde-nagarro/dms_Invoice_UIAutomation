package com.dms.stepdefinitions;

import java.io.IOException;
import java.time.Duration;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import com.dms.browserInstance.BrowserHandle;
import com.dms.core.CoreFunctions;
import com.dms.logs.Logs;
import com.dms.pageobjects.LoginPOM;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class LoginStepDef {

	LoginPOM loginPOM = new LoginPOM();
//	CoreFunctions coreFunctions=new CoreFunctions();

	@Given("User is on Login Page")
	public void user_is_on_login_page() throws IOException {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		if (CoreFunctions.readConfig("environment").equalsIgnoreCase("qa")) {
			BrowserHandle.getDriver().get(CoreFunctions.readConfig("qaSignInurl"));
		}
		if (CoreFunctions.readConfig("environment").equalsIgnoreCase("dev")) {
			BrowserHandle.getDriver().get(CoreFunctions.readConfig("devSignInurl"));
		}
		if (CoreFunctions.readConfig("environment").equalsIgnoreCase("uat")) {
			BrowserHandle.getDriver().get(CoreFunctions.readConfig("uatSignInurl"));
		}
	}

	@When("User enters {string} and {string}")
	public void user_enters_and(String username, String password) throws InterruptedException {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName() + " username : " + username + " password : " + password);
//   CoreFunctions.click(loginPOM.dealerBtn(), "dealer");
		// CoreFunctions.setText(loginPOM.inputUsername(), username);
		// CoreFunctions.setText(loginPOM.inputPassword(), password);

		// CoreFunctions.setText(loginPOM.inputMSPin(), username);
		loginPOM.inputMSPin().sendKeys(username + Keys.TAB);

		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.verifyMSPin()));
		JavascriptExecutor executor = (JavascriptExecutor) BrowserHandle.getDriver();
		executor.executeScript("arguments[0].click();", loginPOM.verifyMSPin());

		BrowserHandle.wait.until(ExpectedConditions.visibilityOf(loginPOM.msPinVerified()));

		BrowserHandle.getDriver().switchTo().frame(1);
		  BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.
		  closeZendesk())); CoreFunctions.click(loginPOM.closeZendesk(),
		  "Closing Zendesk");
		  
		  BrowserHandle.getDriver().switchTo().defaultContent(); 
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.inputOTP()));
		CoreFunctions.setText(loginPOM.inputOTP(), password);
	}
	
	@When("User enters MSIL {string} and {string}")
	public void user_enters_MSIL_User_and_Password(String username, String password) throws InterruptedException {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName() + " username : " + username + " password : " + password);
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.MSILUserName()));
		CoreFunctions.setText( loginPOM.MSILUserName(),username);

		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.MSILPassword()));
		CoreFunctions.setText( loginPOM.MSILPassword(),password);
		

	}

	@When("User click on Sign in button")
	public void user_click_on_Sign_in_button() throws InterruptedException {
		
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.MSILSignInButton()));
		CoreFunctions.click( loginPOM.MSILSignInButton(),null);

		
	}
	
	@When("User click on Captcha")
	public void user_click_on_captcha() {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		CoreFunctions.click(loginPOM.captcha(), "Captcha");
	}

	@When("User click on {string} button")
	public void user_click_on_button(String button) throws InterruptedException {
		Thread.sleep(1000);
		
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName() + " " + button);
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.button(button)));
		CoreFunctions.click(loginPOM.button(button), button);

		
		  
		 
	}

	@When("User clicks on {string} button")
	public void user_click_on_btn(String btn) throws InterruptedException {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName() + " " + btn);
		if(btn.contains("Export"))
		{
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(BrowserHandle.getDriver().findElement(By.xpath(" //div[text()=' SR. NO. ']"))));
			//Thread.sleep(5000);
		}
		new WebDriverWait(BrowserHandle.getDriver(), Duration.ofSeconds(60)).until(webDriver -> ((JavascriptExecutor) webDriver).executeScript(
		        "return document.readyState").equals("complete"));
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.spanButton(btn)));
		CoreFunctions.moveToElement(loginPOM.spanButton(btn));
		CoreFunctions.click(loginPOM.spanButton(btn), btn);
	}

	@When("User clicks on {string} button on popup")
	public void user_click_on_btn_on_popup(String btn) {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName() + " " + btn);
		
			BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.popupButton(btn)));
			CoreFunctions.click(loginPOM.popupButton(btn), btn);

	}

	@Then("Verify if user Logs in sucessfully")
	public void verify_if_user_logs_in_sucessfully() {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		Assert.assertTrue(loginPOM.signOut().isDisplayed());
	}

	@Then("Verify if user not Logs in sucessfully")
	public void verify_if_user_not_logs_in_sucessfully() {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		Assert.assertTrue(loginPOM.errorToastmsg().isDisplayed());
	}

	@Then("Verify if login button is disable")
	public void verify_if_login_button_disabled() throws InterruptedException {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		BrowserHandle.wait.until(ExpectedConditions.attributeToBe(loginPOM.button("LOGIN"), "disabled", "true"));
		System.out.println(loginPOM.button("LOGIN").getAttribute("disabled"));
		Assert.assertEquals(loginPOM.button("LOGIN").getAttribute("disabled"), "true");
	}

	@Then("Verify if we get error for invalid username")
	public void verify_inavlid_username() {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		Assert.assertTrue(loginPOM.invalidUsername().isDisplayed());
	}

	@Then("Verify if we get error for invalid password")
	public void verify_inavlid_password() {
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName());
		Assert.assertTrue(loginPOM.invalidPassword().isDisplayed());
	}

	@When("User clicks on open Zendesk messaging window button")
	public void User_clicks_on_open_Zendesk_messaging_window_button() {

		BrowserHandle.getDriver().switchTo().frame("launcher");
		BrowserHandle.wait.until(ExpectedConditions.elementToBeClickable(loginPOM.openZendeskMessagingWindow()));
		CoreFunctions.click(loginPOM.openZendeskMessagingWindow(), "open Zendesk");
		Logs.logger.info(new Object() {
		}.getClass().getEnclosingMethod().getName() + " " + loginPOM.openZendeskMessagingWindow());

	}

	@Then("Verify user is able to access the Zendesk messaging window")
	public void Verify_user_is_able_to_access_the_Zendesk_messaging_window() {

		BrowserHandle.getDriver().switchTo().defaultContent();
		BrowserHandle.getDriver().switchTo().frame("Messaging window");
		BrowserHandle.wait.until(ExpectedConditions.visibilityOf(loginPOM.zendeskMessagingWindow()));
		Assert.assertTrue(loginPOM.zendeskMessagingWindow().isDisplayed());
		BrowserHandle.getDriver().switchTo().defaultContent();

	}
}

package com.dms.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.dms.utils.PageUtil;

public class LoginPOM {
	public WebElement MSILUserButton() {
		return PageUtil.findBy(By.id("mat-button-toggle-1-button"));
	}
	public WebElement MSILUserName() {
		return PageUtil.findBy(By.id("userNameInput"));
	}
	public WebElement MSILPassword() {
		return PageUtil.findBy(By.id("passwordInput"));
	}
	public WebElement MSILSignInButton() {
		return PageUtil.findBy(By.id("submitButton"));
	}
	
	
	public WebElement dealerBtn() {
		return PageUtil.findBy(By.id("mat-button-toggle-2-button"));
	}

	public WebElement inputMSPin() {
		return PageUtil.findBy(By.id("'formInput-'mspin"));
	}
	
	public WebElement verifyMSPin() {
		return PageUtil.findBy(By.xpath("//span//div[contains(text(),'Verify')]"));
	}
	public WebElement msPinVerified() {
		return PageUtil.findBy(By.xpath("//img[contains(@src,'verify')]"));
	}
	
	
	public WebElement inputOTP() {
		return PageUtil.findBy(By.id("'formInput-'otp"));
	}
	
	public WebElement inputUsername() {
		return PageUtil.findBy(By.id("'formInput-'username"));
	}
	
	public WebElement closeZendesk() {
		return PageUtil.findBy(By.xpath("//button[@aria-label='Close message']"));
	}
	//launcher
	public WebElement needHelpZendesk() {
		return PageUtil.findBy(By.xpath("//button/div[text()='Hi. Need any help?']"));
	}
	public WebElement openZendeskMessagingWindow() {
		return PageUtil.findBy(By.xpath("//button[@aria-label='Open messaging window']"));
	}
	//Messaging window
	public WebElement zendeskMessagingWindow() {
		return PageUtil.findBy(By.xpath("//h2[text()='Maruti Suzuki India Limited']"));
	}
	public WebElement closeZendeskMessagingWindow() {
		return PageUtil.findBy(By.xpath("//button[@aria-label='Close']"));
	}
	
	
	public WebElement inputPassword() {
		return PageUtil.findBy(By.id("'formInput-'password"));
	}

	public WebElement captcha() {
		return PageUtil.findBy(By.id("mat-mdc-checkbox-1-input"));
	}

	public WebElement button(String btn) {
		return PageUtil.findBy(By.xpath("//button[contains(text(),'" + btn + "')]"));
	}

	public WebElement errorToastmsg() {
		return PageUtil.findBy(By.xpath("//span[contains(text(),'Please enter valid credentials.')]"));
	}

	public WebElement signOut() {
		return PageUtil.findBy(By.xpath("//span[contains(text(),'Sign Out')]"));
	}

	public WebElement spanButton(String btn) {
		return PageUtil.findBy(By.xpath("//button//span[contains(text(),'"+ btn +"')]"));
	}
	public WebElement spanButtonIsDisable(String btn) {
		return PageUtil.findBy(By.xpath("//span[contains(text(),'" + btn + "')]//parent::button"));
	}
	
	public WebElement popupButton(String btn) {
		return PageUtil.findBy(By.xpath("//mat-dialog-container//button//span[contains(text(),'"+btn+"')]"));
	}
	
	public WebElement popupSearchButton() {
		return PageUtil.findBy(By.xpath("//mat-dialog-container//button//span[contains(text(),'Search')]"));
	}

	public WebElement invalidUsername() {
		return PageUtil.findBy(By.id("username_error"));
	}

	public WebElement invalidPassword() {
		return PageUtil.findBy(By.id("password_error"));
	}

}

package com.dms.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.dms.utils.PageUtil;

public class LoginPOM {
	public WebElement dealerBtn() {
		return PageUtil.findBy(By.id("mat-button-toggle-2-button"));
	}

	public WebElement inputUsername() {
		return PageUtil.findBy(By.id("'formInput-'username"));
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
		return PageUtil.findBy(By.xpath("//button//span[contains(text(),'" + btn + "')]"));
	}
	public WebElement spanButtonIsDisable(String btn) {
		return PageUtil.findBy(By.xpath("//span[contains(text(),'" + btn + "')]//parent::button"));
	}
	
	public WebElement popupButton(String btn) {
		return PageUtil.findBy(By.xpath("//mat-dialog-container//button//span[contains(text(),'"+btn+"')]"));
	}
	

	public WebElement invalidUsername() {
		return PageUtil.findBy(By.id("username_error"));
	}

	public WebElement invalidPassword() {
		return PageUtil.findBy(By.id("password_error"));
	}

}

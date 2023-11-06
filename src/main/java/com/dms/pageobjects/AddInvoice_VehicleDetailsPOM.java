package com.dms.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.dms.utils.PageUtil;

public class AddInvoice_VehicleDetailsPOM {

	// Vehicle Info
	public WebElement model() {
		return PageUtil.findBy(By.id("'formInput-'modelNo"));
	}
 
	public WebElement variant() {
		return PageUtil.findBy(By.id("'formInput-'varient"));
	}
 
	public WebElement vehicleID() {
		return PageUtil.findBy(By.id("'formInput-'vehicleId"));
	}
 
	public WebElement chassisNum() {
		return PageUtil.findBy(By.id("'formInput-'chassisNumber"));
	}
 
	public WebElement color() {
		return PageUtil.findBy(By.id("'formInput-'color"));
	}
 
	public WebElement engineNum() {
		return PageUtil.findBy(By.id("'formInput-'engineNumber"));
	}
 
	public WebElement keyNum() {
		return PageUtil.findBy(By.id("'formInput-'keyNumber"));
	}
	public WebElement clickownersManualPrefDropdown() {
		return PageUtil.findBy(By.id("ownerManualRef"));
	}
	public WebElement chooseownersManualPref(String prefValue) {
		return PageUtil.findBy(By.xpath("//span[contains(text(),'"+prefValue+"')]"));
	}
	public WebElement clickLoyaltyCardDropdown() {
		return PageUtil.findBy(By.id("intrestedLoyalityCard"));
	}
	public WebElement chooseLoyaltyCard(String loyalyCardValue) {
		return PageUtil.findBy(By.xpath("//span[contains(text(),'"+loyalyCardValue+"')]"));
	}
	public WebElement clickLoyaltyCardTypeDropdown() {
		return PageUtil.findBy(By.id("typeOfLoyalyCard"));
	}
	public WebElement chooseLoyaltyCardType(String loyalyCardTypeValue) {
		return PageUtil.findBy(By.xpath("//span[contains(text(),'"+loyalyCardTypeValue+"')]"));
	}
}

package com.dms.pageobjects;

import java.util.List;

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

	public WebElement reasons() {
		return PageUtil.findBy(By.id("reasons"));
	}
	public WebElement chooseReasons(String reasonsValue) {
		return PageUtil.findBy(By.xpath("//span[contains(text(),'"+reasonsValue+"')]"));
	}

	public WebElement clickFastTagpopup() {
		return PageUtil.findBy(By.xpath("//div[text()='FASTAG']//ancestor::div[@class='modal-btn-container']"));
	}

	public WebElement clickPrefSrvDealerpopup() {
		return PageUtil.findBy(By.xpath("//div[contains(text(),'PREFERRED SRV DEALER')]"));
	}

	public WebElement clickCCPSalepopup() {
		return PageUtil.findBy(By.xpath("//div[contains(text(),'CCP Sale')]"));
	}
	public List<WebElement> codeColumnList () {
		return PageUtil.findBys(By.xpath("//div[contains(@class,'table-with-data')]//div[contains(@class,'row-data')]//div[2]"));
	}
	public List<WebElement> codeDescColumnList () {
		return PageUtil.findBys(By.xpath("//div[contains(@class,'table-with-data')]//div[contains(@class,'row-data')]//div[3]"));
	}

	
	//FastTag popup
	public WebElement fastTagId() {
		return PageUtil.findBy(By.id("'formInput-'fastTagId"));
	}

	public WebElement fastTagBank() {
		return PageUtil.findBy(By.id("fastTagBank"));
	}
	public WebElement choosefastTagBank(String fastTagBankValue) {
		return PageUtil.findBy(By.xpath("//span[contains(text(),'"+fastTagBankValue+"')]"));
	}


	public WebElement fastTagFitmentValue() {
		return PageUtil.findBy(By.id("inputDatefasTagFitmentDate"));
	}

	public WebElement fastTagFitmentdatePicker() {
		return PageUtil.findBy(By.xpath("//button[@aria-label='Open calendar']"));
	}

	public WebElement fastTagClearButton() {
		return PageUtil.findBy(By.xpath("//span[text()=' CLEAR ']"));
	}


	//SrvDealerPopup
	public WebElement selectStateDropdown() {
		return PageUtil.findBy(By.id("dealerState"));
	}
	public WebElement chooseState(String stateValue) {
		return PageUtil.findBy(By.xpath("//span[contains(text(),'"+stateValue+"')]"));
	}

	public WebElement searchInDropdown() {
		return PageUtil.findBy(By.xpath("//input[@placeholder='Select']"));
	}

	public WebElement selectCityDropdown() {
		return PageUtil.findBy(By.id("dealerCity"));
	}
	public WebElement chooseCity(String cityValue) {
		return PageUtil.findBy(By.xpath("//span[contains(text(),'"+cityValue+"')]"));
	}
	//search button 

	//select the user provided dealer
	public WebElement chooseDealer(String dealerName) {
		return PageUtil.findBy(By.xpath("//span[contains(text(),'"+dealerName+"')]/parent::div"));
	}

	//Extended Waaranty section

	public WebElement selectExtendedWarrantyDropdown() {
		return PageUtil.findBy(By.id("extendedWarranty"));
	}
	public WebElement chooseExtendedWarranty(String extendedWarrantyValue) {
		return PageUtil.findBy(By.xpath("//span[contains(text(),'"+extendedWarrantyValue+"')]"));
	}
}

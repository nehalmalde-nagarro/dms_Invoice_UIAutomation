package com.dms.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.dms.utils.PageUtil;

public class AddInvoice_AdditionalDetailsPOM {

	public WebElement loyaltyRedemptionPoints() {
		return PageUtil.findBy(By.id("'formInput-'loyaltyRedemptionPoints"));
	}
	public WebElement loyaltyRedemptionAmount() {
		return PageUtil.findBy(By.id("''formInput-'loyaltyRedemptionAmount"));
	}
	public WebElement oldCarOfferNameDropdown() {
		return PageUtil.findBy(By.id("oldCarOfferName"));
	}

//LOYALTY/ACQUISITION DETAILS
	public WebElement loyaltyAcqDetailsBtn() {
		return PageUtil.findBy(By.id("//div[contains(text(),'LOYALTY/ACQUISITION DETAILS')]"));
	}
	public WebElement makeDropdown() {
		return PageUtil.findBy(By.id("make"));
	}
	
	public WebElement regNum() {
		return PageUtil.findBy(By.id("'formInput-'regNo"));
	}
	public WebElement policyTypeDropdown() {
		return PageUtil.findBy(By.id("policyType"));
	}
        public WebElement chassisNum() {
		return PageUtil.findBy(By.id("'formInput-'chassisNum"));
	}
	
	public WebElement engineNo() {
		return PageUtil.findBy(By.id("'formInput-'engineNo"));
	}
	public WebElement policyNo() {
		return PageUtil.findBy(By.id("'formInput-'policyNo"));
	}
        public WebElement model() {
		return PageUtil.findBy(By.id("'formInput-'model"));
	}
	
	public WebElement vairant() {
		return PageUtil.findBy(By.id("'formInput-'variant"));
	}
	public WebElement companyName() {
		return PageUtil.findBy(By.id("'formInput-'companyName"));
	}
        public WebElement vin() {
		return PageUtil.findBy(By.id("'formInput-'vin"));
	}
	public WebElement relationDropdown() {
		return PageUtil.findBy(By.id("relation"));
	}
       public WebElement oldCarCustomerMiName() {
		return PageUtil.findBy(By.id("'formInput-'oldCarCustomerMiName"));
	}
	public WebElement oldCarCustomerName() {
		return PageUtil.findBy(By.id("'formInput-'oldCarCustomerName"));
	}
	public WebElement loyaltyExcAddCarBenefits() {
		return PageUtil.findBy(By.xpath("//div[contains(text(),'LOYALTY EXCHANGE/ADDITIONAL CAR BENEFITS')]"));
}
	public WebElement olVehicleRegistrationId() {
		return PageUtil.findBy(By.id("'formInput-'olVehicleRegistrationId"));

	}
	public WebElement oldVehicleStatus() {
		return PageUtil.findBy(By.id("oldVehicleStatus"));

	}
public WebElement searchBtn() {
		return PageUtil.findBy(By.xpath("//button[@class='btn btn-search']"));

	}


}

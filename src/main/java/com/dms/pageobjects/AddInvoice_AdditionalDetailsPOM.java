package com.dms.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;

import com.dms.utils.PageUtil;

public class AddInvoice_AdditionalDetailsPOM {

	public WebElement loyaltyRedemptionPoints() {
		return PageUtil.findBy(By.id("'formInput-'loyaltyRedemptionPoints"));
	}
	public WebElement loyaltyRedemptionAmount() {
		return PageUtil.findBy(By.id("'formInput-'loyaltyRedemptionAmount"));
	}
	public WebElement oldCarOfferNameDropdown() {
		return PageUtil.findBy(By.id("oldCarOfferName"));
	}
	public WebElement loyaltyExchangeBenefit() {
		return PageUtil.findBy(By.id("'formInput-'loyalityExchangeBenefit"));
	}

//	public WebElement oldCarOfferNameDropdown() {
//		return PageUtil.findBy(By.xpath("//mat-panel-title[contains(text(),'Old Car Offers')]//ancestor::mat-expansion-panel-header//following-sibling::div//mat-select[contains(@id,'oldCarOfferName')]"));
//	}
//LOYALTY/ACQUISITION DETAILS
	
	public WebElement makeDropdown() {
		return PageUtil.findBy(By.id("make"));
	}
	
	public WebElement regNum() {
		return PageUtil.findBy(By.id("'formInput-'regNo"));
	}

	public WebElement enterRegNum() {
		return PageUtil.findBy(By.xpath("//input[@placeholder='Enter Registration Number']"));
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
	public WebElement relationDropdownOnOldVehileDetials() {
		return PageUtil.findBy(By.xpath("//mat-label[contains(text(),'RELATIONSHIP')]//parent::label//parent::div//mat-select//div"));
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

//Vin Search Popup

public WebElement enterValue_vin() {
	return PageUtil.findBy(By.id("'formInput-'vin-vinsearch"));

}

public WebElement enterValue_regNo() {
	return PageUtil.findBy(By.id("'formInput-'regNo-vinsearch"));

}
public WebElement enterValue_model() {
	return PageUtil.findBy(By.id("'formInput-'model-vinsearch"));

}
public WebElement enterValue_chassis() {
	return PageUtil.findBy(By.id("'formInput-'chassisNum-vinsearch"));

}
public WebElement chooseVehicleOnVehicalDetailsTab(String txt) {
	return PageUtil.findBy(By.xpath("//div[contains(text(),'"+txt+"')]"));

}
public WebElement VinSearchIcon() {
	return PageUtil.findBy(By.cssSelector("img[alt='form-input-icon']"));

}
public WebElement VinSearchbtnDisabled() {
	return PageUtil.findBy(By.xpath("//div[contains(text(),'VIN') and contains(@class,'disabled')]"));

}
public WebElement vinSearchBtn(String txt) {
	return PageUtil.findBy(By.xpath("//div[contains(@class,'vin-search-modal-container')]//button//span[contains(text(),'"+txt+"')]"));

}
public WebElement loyaltyCard(String txt) {
	return PageUtil.findBy(By.xpath("//div[contains(@class,'loyalty-exchange-modal-container')]//button//span[contains(text(),'"+txt+"')]"));

}
public WebElement loyalExchnageBenefit(String txt) {
	return PageUtil.findBy(By.xpath("//div[contains(text(),'"+txt+"')]//..//div[4]"));
}
public boolean isPopupBtnDisplayed(String txt) {
	try {
        WebElement element = PageUtil.findBy(By.xpath("//div[contains(text(),'"+txt+"')]"));
        return true; // Element is found, so it is not absent
    } catch (NoSuchElementException e) {
        return false; // Element is not found, so it is absent
    }
}


public boolean isRequiresDisplayed(String txt) {
	try {
        WebElement element = PageUtil.findBy(By.xpath("//div[contains(text(),'"+txt+"')]//..//..//mat-error"));
        return true; // Element is found, so it is not absent
    } catch (NoSuchElementException e) {
        return false; // Element is not found, so it is absent
    }
}

public WebElement otherOfferNameDropdown() {
	return PageUtil.findBy(By.id("otherOfferName"));
}

public WebElement mssfOfferButton() {
	return PageUtil.findBy(By.xpath("//div[text()='MSSF OFFER']//ancestor::app-modal-button"));
}

public WebElement mdsOfferButton() {
	return PageUtil.findBy(By.xpath("//div[text()='MDS OFFER']//ancestor::app-modal-button"));
}
public WebElement popUpBtn(String txt) {
	return PageUtil.findBy(By.xpath("//div[contains(text(),'"+txt+"')]"));
}
public WebElement chooseCardFromPopup(String txt) {
	return PageUtil.findBy(By.xpath("//div[contains(text(),'"+txt+"')]"));
}



public WebElement chasisNoError() {
	return PageUtil.findBy(By.id("chassisNum_error"));
}
public WebElement errorMsg(String txt) {
	return PageUtil.findBy(By.xpath("//mat-error[contains(text(),'"+txt+"')]"));
}

public WebElement errorToastMsg() {
	return PageUtil.findBy(By.xpath("//app-notifier/div/div/span"));
}
public WebElement closeRrrorToastMsg() {
	return PageUtil.findBy(By.xpath("xpath=//mat-icon[contains(.,'close')]"));
}

public WebElement ewCashDiscountInput() {
	return PageUtil.findBy(By.id("'formInput-'ewCashDiscount"));
}
public WebElement additionalDiscount1() {
	return PageUtil.findBy(By.id("'formInput-'ADIS1"));
}
public WebElement additionalDiscount2() {
	return PageUtil.findBy(By.id("'formInput-'ADIS2"));
}

public WebElement firstOptionFromPopup() {
	return PageUtil.findBy(By.xpath("//div[contains(@class,'row-data') and not(contains(@class,'heading'))]"));
}
 



}

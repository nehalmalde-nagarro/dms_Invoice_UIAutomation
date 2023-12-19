package com.dms.pageobjects;



import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;

import com.dms.utils.PageUtil;

public class AddInvoice_InvoiceDetailsPOM {
	public WebElement billingAddress2() {
		return PageUtil.findBy(By.xpath("//mat-label[text()='BILLING ADDRESS 2 ']//parent::div//p"));
	}

	public WebElement closePopIcon() {
		return PageUtil.findBy(By.xpath("//img[@alt='modal close']"));
	}
	public boolean isPopupClosed() {
		try {
            WebElement element = PageUtil.findBy(By.xpath("//div[@class='modal-container']"));
            return false; // Element is found, so it is not absent
        } catch (NoSuchElementException e) {
            return true; // Element is not found, so it is absent
        }
	}
	
	
	// search Popup
	public WebElement searchByOrderNumber() {
		return PageUtil.findBy(By.id("'formInput-'orderId"));
	}

	public WebElement searchByMobileNumber() {
		return PageUtil.findBy(By.id("'formInput-'phoneNumber"));
	}

	public WebElement chooseOrder(String orderId) {
		return PageUtil.findBy(By.xpath("//div[contains(text(),'" + orderId + "')]"));
	}
	
	public WebElement isOrderDetailVisible(String data) {
		return PageUtil.findBy(By.xpath("//div[contains(text(),'" + data + "')]"));
	}

	// order details
	public WebElement addInvoiceOrderNumber() {
		return PageUtil.findBy(By.id("'formInput-'orderNumber"));
	}

	public WebElement workplace() {
		return PageUtil.findBy(By.id("'formInput-'workplace"));
	}

	public WebElement sellingPriceFor() {
		return PageUtil.findBy(By.xpath("//mat-select[@id='sellingPriceFor']/div//span"));
	}

	public WebElement orderDateID() {
		return PageUtil.findBy(By.id("inputDateorderDate"));
	}

	public WebElement locationId() {
		return PageUtil.findBy(By.id("'formInput-'location"));
	}

	public WebElement state() {
		return PageUtil.findBy(By.id("'formInput-'state"));
	}

	public WebElement invoiceType() {
		return PageUtil.findBy(By.xpath("//mat-select[@id='invoiceType']//span/span"));
	}

	public WebElement invoiceNumber() {
		return PageUtil.findBy(By.id("'formInput-'invoiceNumber"));
	}

	public WebElement inVoiceDate() {
		return PageUtil.findBy(By.id("inputDateinvoiceDate"));
	}

	public WebElement salesType() {
		return PageUtil.findBy(By.xpath("//mat-select[@id='salesType']//span/span"));
	}

	public WebElement bookingDealerCode() {
		return PageUtil.findBy(By.id("'formInput-'bookingDealerCode"));
	}

	public WebElement DSE() {
		return PageUtil.findBy(By.id("DSE - 'formInput-'DSE"));
	}

	public WebElement allotmentNo() {
		return PageUtil.findBy(By.id("'formInput-'allotmentNumber"));
	}

	public WebElement allotmentDate() {
		return PageUtil.findBy(By.id("inputDateallotmentDate"));
	}

	public WebElement corporateCode() {
		return PageUtil.findBy(By.id("'formInput-'corporateCode"));
	}

	public WebElement corporateName() {
		return PageUtil.findBy(By.id("'formInput-'corporateName"));
	}

	// customerDetails
	public WebElement b2bCustomer() {
		return PageUtil.findBy(By.id("b2bCustomer"));
	}

	public WebElement customerName() {
		return PageUtil.findBy(By.id("'formInput-'customerName"));
	}

	public WebElement customerId() {
		return PageUtil.findBy(By.id("'formInput-'customerId"));
	}

	public WebElement aadharNumber() {
		return PageUtil.findBy(By.id("'formInput-'aadharNumber"));
	}

	public WebElement customerContactNumber() {
		return PageUtil.findBy(By.id("'formInput-'customerContactNumber"));
	}

	public WebElement miName() {
		return PageUtil.findBy(By.id("'formInput-'miName"));
	}

	public WebElement flag() {
		return PageUtil.findBy(By.id("'formInput-'flag"));
	}

	// billing details
	public WebElement billingAddress_1() {
		return PageUtil.findBy(By.id("'formInput-'billingAddress1"));
	}

	public WebElement billingAddress_2() {
		return PageUtil.findBy(By.id("'formInput-'billingAddress2"));
	}

	public WebElement billingAddress_3() {
		return PageUtil.findBy(By.id("'formInput-'billingAddress3"));
	}

	public WebElement billingPincode() {
		return PageUtil.findBy(By.id("'formInput-'pinCode"));
	}

	public WebElement billingCity() {
		return PageUtil.findBy(By.id("'formInput-'city"));
	}

	public WebElement billingCityDescription() {
		return PageUtil.findBy(By.id("'formInput-'cityDescription"));
	}

	public WebElement billGSTN() {
		return PageUtil.findBy(By.id("'formInput-'billGSTN"));
	}
	
	public WebElement shippingGST() {
		return PageUtil.findBy(By.id("'formInput-'shippingGST"));

	}

	public WebElement govOrg_W_O_PAN() {
		return PageUtil.findBy(By.id("govtOraganisationWOPAN"));
	}
	
	
	//shipping details
	public WebElement shippingInfoTitle() {
		return PageUtil.findBy(By.xpath("//mat-panel-title[text()=' Shipping Info ']"));

	}

	// commonSelectForYes/No
	public WebElement options(String param) {
		return PageUtil.findBy(By.xpath("//mat-option//span[text()='" + param + "']"));
	}
	public WebElement isPopUpVisible() {
		return PageUtil.findBy(By.xpath("//div[@class='cdk-overlay-pane']"));
	}
	
	public List<WebElement> shippingInfoCount() {
		return PageUtil.findBys(By.xpath("//div[@class='shipping-info-container']//div[@class='form-input-field-disabled']"));
	}
	public WebElement billGstnError() {
		return PageUtil.findBy(By.id("billGSTN_error"));
	}	

}

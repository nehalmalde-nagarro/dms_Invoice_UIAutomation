package com.dms.pageobjects;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.dms.utils.PageUtil;

public class SearchInvoice {

	public WebElement searchByDropdown() {
		return PageUtil.findBy(By.id("mat-select-value-1"));
	}

	public WebElement infoTitle(String txt) {
		return PageUtil.findBy(By.xpath("//mat-panel-title[contains(text(),'"+txt+"')]"));

	}
	public WebElement searchBy() {
		return PageUtil.findBy(By.id("searchBy"));
	}
	
	public WebElement totalRecords() {
		return PageUtil.findBy(By.xpath("//mat-label//span[2]"));
	}

	public WebElement dropDownValue(String param) {
		return PageUtil.findBy(By.xpath("//mat-option//span[contains(text(),'" + param + "')]"));
	}

	public WebElement orderId() {
		return PageUtil.findBy(By.id("'formInput-'orderId"));
	}

	public WebElement phoneNumber() {
		return PageUtil.findBy(By.id("'formInput-'phoneNumber"));
	}

	public WebElement invoiceNumber() {
		return PageUtil.findBy(By.id("'formInput-'invoiceNumber"));
	}

	public WebElement vinNumber() {
		return PageUtil.findBy(By.id("'formInput-'vinNumber"));
	}

	public WebElement fromDate() {
		return PageUtil.findBy(By.xpath("//mat-datepicker-toggle[@data-mat-calendar='mat-datepicker-0']"));
	}

	public WebElement toDate() {
		return PageUtil.findBy(By.xpath("//mat-datepicker-toggle[@data-mat-calendar='mat-datepicker-1']"));
	}

	public WebElement inputtoDate() {
		return PageUtil.findBy(By.id("inputDatetoDate"));
	}

	public WebElement inputfromDate() {
		return PageUtil.findBy(By.id("inputDatefromDate"));
	}

	public WebElement searchButton() {
		return PageUtil.findBy(By.xpath("//div[@class='search-container']//form//div[@class='action-wrapper']//button[2]"));
	}

	public WebElement searchBtnDisabled() {
		return PageUtil.findBy(By.xpath("//button[contains(@class,'btn-search')]"));
	}

	public WebElement clearButton() {
		return PageUtil.findBy(By.xpath("//div[@class='search-container']//form//div[@class='action-wrapper']//button[1]"));
	}
	public List<WebElement> allOrderID() {
		return PageUtil.findBys(By.xpath("//tr[@role='row']//td[1]"));
	}

	public List<WebElement> searchResults(String param) {
		return PageUtil.findBys(By.xpath("//td[contains(text(),'" + param + "')]"));
	}

	
	public WebElement searchResultsCustomerID(String param) {
		return PageUtil.findBy(By.xpath("//td[contains(text(),'" + param + "')]/following-sibling::td[1]"));
	}
	
	public WebElement searchResultsCustomerName(String param) {
		return PageUtil.findBy(By.xpath("//td[contains(text(),'" + param + "')]/following-sibling::td[2]"));
	}
	
	public WebElement searchResultsPhoneNumber(String param) {
		return PageUtil.findBy(By.xpath("//td[contains(text(),'" + param + "')]/following-sibling::td[3]"));
	}
	
	public WebElement searchResultsOrderInvoiceDate(String param) {
		return PageUtil.findBy(By.xpath("//td[contains(text(),'" + param + "')]/following-sibling::td[4]"));
	}
	
	public boolean verifyByText(String text) {
		return PageUtil.findBy(By.xpath("//*[contains(text(),'" + text + "')]")).isDisplayed();
	}

	public WebElement generateInvoice(String orderId) {
		return PageUtil.findBy(
				By.xpath("//td[text()='" + orderId + "']/following-sibling::td[5]//span[text()='Generate Invoice']"));
	}

	public WebElement verifyAddInvoiceTitle() {
		return PageUtil.findBy(By.xpath("//div[contains(text(),'ADD INVOICE')]"));
	}

}

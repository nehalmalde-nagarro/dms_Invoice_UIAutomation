package com.dms.pageobjects;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.dms.utils.PageUtil;

public class ReportsPOM {
	
	
	
	public WebElement ReportKeyDown() {
		return PageUtil.findBy(By.xpath("//div[contains(text(),'Reports')]"));
	}
	
	public WebElement SaleRegisterReport() {
		return PageUtil.findBy(By.xpath("//span[contains(text(),' Sale Register Report ')]"));
	}
	public WebElement onlineReportLanding() {
		return PageUtil.findBy(By.xpath("//*[contains(text(),'ONLINE RETAIL REPORT')]"));
	}
	
	public WebElement zone() {
		return PageUtil.findBy(By.id("zone"));
	}
	public WebElement region() {
		return PageUtil.findBy(By.id("region"));
	}
	public WebElement dealer() {
		return PageUtil.findBy(By.id("'formInput-'dealer"));
	}
	public WebElement channel() {
		return PageUtil.findBy(By.id("channel"));
	}
	
	
	public WebElement selectInDropdown(String value) {
		return PageUtil.findBy(By.xpath("//*[contains(text(),'"+value+"')]"));
	}
	
	
	public WebElement fromDate() {
		return PageUtil.findBy(By.xpath("//div[@id='monthlydatePicker_fromDate']//button[@aria-label='Open calendar']"));
	}
	
	public WebElement toDate() {
		return PageUtil.findBy(By.xpath("//div[@id='monthlydatePicker_toDate']//button[@aria-label='Open calendar']"));
	}
	
	public WebElement invoiceStatus() {
		return PageUtil.findBy(By.id("invoiceStatus"));
	}
	public WebElement modelDetails() {
		return PageUtil.findBy(By.id("modelDetails"));
	}
	
	public WebElement variantDetails() {
		return PageUtil.findBy(By.id("variantDetails"));
	}
	
	public WebElement colorDetails() {
		return PageUtil.findBy(By.id("colorDetails"));
	}
	
	
	//DealerSearchPoup
	public WebElement dealerName() {
		return PageUtil.findBy(By.id("'formInput-'dealerName"));
	}
	
	public WebElement searchByLocation() {
		return PageUtil.findBy(By.id("'formInput-'searchByLocation"));
	}
	
	public WebElement selectDealerFromList(String dealer) {
		return PageUtil.findBy(By.xpath("//div/span[contains(text(),'"+dealer+"')]"));
	}
	
	
	public WebElement selectDealerFromListBasedonLocation(String dealer, String location) {
		return PageUtil.findBy(By.xpath("//div/span[contains(text(),'"+dealer+"')]/parent::div/following-sibling::div[2][contains(text(),'"+location+"')]"));
	}
	
	
	//Online Reports
	
	public WebElement onlineRetailReport() {
		return PageUtil.findBy(By.xpath("//span[contains(text(),' Online Retail Report ')]"));
	}
	
	public WebElement location() {
		return PageUtil.findBy(By.id("'formInput-'location"));
	}
	
	public WebElement modelwise() {
		return PageUtil.findBy(By.id("modelwise"));
	}
	
	public WebElement model() {
		return PageUtil.findBy(By.id("model"));
	}
	
	public WebElement fuel() {
		return PageUtil.findBy(By.id("fuel"));
	}
	
	public WebElement typeRadioButton(String value) {
		return PageUtil.findBy(By.xpath("//mat-radio-button//label[text()='"+value+"']"));
	}
	
	
	
	
	//Export to excel
	public WebElement exportToExcelButton() {
		return PageUtil.findBy(By.xpath("//*[contains(text(),'Export to Excel')]"));
	}
	
	//get all options in dropdown
	
	
	public List<WebElement> dropdownOptionsList() {
		return PageUtil.findBys(By.xpath("//mat-option/span/span"));
	}
	
	public WebElement allOptionCheckbox() {
		return PageUtil.findBy(By.xpath("//mat-checkbox//label[contains(text(),'All')]"));
	}
	
	 
}

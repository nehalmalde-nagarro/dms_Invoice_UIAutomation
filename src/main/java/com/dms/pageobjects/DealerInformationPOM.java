package com.dms.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.dms.utils.PageUtil;

public class DealerInformationPOM {

	public WebElement userIcon() {
		return PageUtil.findBy(By.id("user_icon"));
	}

	public WebElement parentGroup() {
		return PageUtil.findBy(By.xpath("//mat-label[contains(text(),'PARENT GROUP')]/following-sibling::mat-label"));
	}

	public WebElement dealerMapCode() {
		return PageUtil
				.findBy(By.xpath("//mat-label[contains(text(),'DEALER MAP CODE')]/following-sibling::mat-label"));
	}

	public WebElement pin() {
		return PageUtil.findBy(By.xpath("//mat-label[contains(text(),'PIN')]/following-sibling::mat-label"));
	}

	public WebElement cityName() {
		return PageUtil.findBy(By.xpath("//mat-label[contains(text(),'CITY NAME')]/following-sibling::mat-label"));
	}

	public WebElement locationCode() {
		return PageUtil.findBy(By.id("//mat-label[contains(text(),'LOCATION CODE')]/following-sibling::mat-label"));
	}

	public WebElement locationName() {
		return PageUtil.findBy(By.xpath("//mat-label[contains(text(),'LOCATION NAME')]/following-sibling::mat-label"));
	}

	public WebElement company() {
		return PageUtil.findBy(By.xpath("//mat-label[contains(text(),'COMPANY')]/following-sibling::mat-label"));
	}

	public WebElement dealerName() {
		return PageUtil.findBy(By.xpath("//mat-label[contains(text(),'DEALER NAME')]/following-sibling::mat-label"));
	}

	public WebElement address() {
		return PageUtil.findBy(By.xpath("//mat-label[text()='ADDRESS']/parent::div/span/mat-label"));
	}

	public WebElement dealer() {
		return PageUtil.findBy(By.xpath("//mat-label[text()='DEALER']/following-sibling::mat-label"));
	}

}

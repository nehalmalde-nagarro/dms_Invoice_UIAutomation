package com.dms.pageobjects;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.dms.utils.PageUtil;

public class AddInvoice_FinancialInfo {

	// get Selected Value in Dropdown other than Financer field
	public WebElement getDropdownSelectedValue(String id) {
		return PageUtil.findBy(By.xpath("//mat-select[@id='" + id + "']/div/div/span/span"));
	}

	// get Value in Dropdown value if clear is perfomed
	public WebElement getDropdownValueForClear(String id) {
		return PageUtil.findBy(By.xpath("//mat-select[@id='" + id + "']/div/div/span"));
	}

	// get Selected Value in Dropdown from Financer field
	public WebElement getFinancerDropdownSelectedValue() {
		return PageUtil.findBy(By.xpath("//mat-select[@id='financer']/div/div/span/mat-select-trigger"));
	}

	// choose a given value from dropdown
	public WebElement chooseFromDropdown(String value) {
		return PageUtil.findBy(By.xpath("//mat-option//span[text()='" + value + "']"));
	}

	// Finanical Info - Payment Details
	public WebElement clickPaymentTypeDropdown() {
		return PageUtil.findBy(By.id("paymentType"));
	}

	public WebElement choosePaymentTypeDropdown(String paymentTypeValue) {
		return PageUtil.findBy(By.xpath("//mat-option//span[text()='" + paymentTypeValue + "']"));
	}

	public WebElement clickFinancerDropdown() {
		return PageUtil.findBy(By.id("financer"));
	}
	
	
	public List<WebElement> FinancierDisabled() {
		return PageUtil.findBys(By.xpath("//mat-select[@aria-disabled='true']/preceding-sibling::label[@for='financer']"));
	}
	public List<WebElement> FinancerNameDisabled() {
		return PageUtil.findBys(By.xpath("//input[@id=\"'formInput-'financerName\" and @disabled]"));
	}
	
	public List<WebElement> BranchDisabled() {
		return PageUtil.findBys(By.xpath("//input[@id=\"'formInput-'branch\" and @disabled]"));
	}
	public List<WebElement> FinanceAmountDisabled() {
		return PageUtil.findBys(By.xpath("//input[@id=\"'formInput-'financeAmount\" and @disabled]"));
	}
	public List<WebElement> FinanceDetailsDisabled() {
		return PageUtil.findBys(By.xpath("//div[@class='modal-btn-container disabled']//div[text()='Financial Details']"));
	}
	public List<WebElement> ReceiptDetailsDisabled() {
		return PageUtil.findBys(By.xpath("//div[@class='modal-btn-container disabled']//div[text()='Receipt Details']"));
	}
	
	public WebElement searchDropDropDownValue() {
		return PageUtil.findBy(By.xpath("//input[@aria-label='dropdown search']"));
	}
	
	public WebElement chooseFinancierDropdown(String financerValue) {
		return PageUtil.findBy(By.xpath("//mat-option//span[text()='" + financerValue + "']"));
	}

	public WebElement financierName() {
		return PageUtil.findBy(By.id("'formInput-'financerName"));
	}

	public WebElement financierBranch() {
		return PageUtil.findBy(By.id("'formInput-'branch"));
	}

	public WebElement financeAmount() {
		return PageUtil.findBy(By.id("'formInput-'financeAmount"));
	}

	public WebElement bookingAmount() {
		return PageUtil.findBy(By.id("'formInput-'bookingAmount"));
	}

	public WebElement recievedAmount() {
		return PageUtil.findBy(By.id("'formInput-'recievedAmount"));
	}

	public WebElement sellingAmount() {
		return PageUtil.findBy(By.id("'formInput-'sellingPrice"));
	}

	public WebElement invoiceAmount() {
		return PageUtil.findBy(By.id("'formInput-'invoiceAmount"));
	}

	public WebElement chargeAmount() {
		return PageUtil.findBy(By.id("'formInput-'chargeAmount"));
	}

	public WebElement roundOffAmount() {
		return PageUtil.findBy(By.id("'formInput-'roundOff"));
	}

	public WebElement outstandingAmount() {
		return PageUtil.findBy(By.id("'formInput-'outstandingAmount"));
	}

	public WebElement taxCalculation() {
		return PageUtil.findBy(By.id("'formInput-'taxCalculation"));
	}

	public WebElement clicktaxrateDropdown() {
		return PageUtil.findBy(By.id("taxRate"));
	}

	public WebElement choosetaxrateDropdown(String taxrateValue) {
		return PageUtil.findBy(By.xpath("//mat-option//span[text()='" + taxrateValue + "']"));
	}

	public WebElement tdsAmount() {
		return PageUtil.findBy(By.id("'formInput-'tdsAmount"));
	}

	public WebElement clickTCSFlagDropdown() {
		return PageUtil.findBy(By.id("TCSFlag"));
	}

	public WebElement chooseTCSFlagDropdown(String tcsFlagValue) {
		return PageUtil.findBy(By.xpath("//mat-option//span[text()='" + tcsFlagValue + "']"));
	}

	public WebElement clickGSTDropdown() {
		return PageUtil.findBy(By.id("GST"));
	}


	public WebElement clickBillingNatureDropdown() {
		return PageUtil.findBy(By.id("billingNature"));
	}

	public WebElement FinancialDetailsPopUpButton() {
		return PageUtil.findBy(By.xpath("//app-modal-button//div[text()='Financial Details']"));
	}

	public WebElement ReceiptDetailsPopUpButton() {
		return PageUtil.findBy(By.xpath("//div[text()='Receipt Details']/ancestor::app-modal-button"));
	}

	// Financial Details Pop Up
	public WebElement clickLoanTypeDropdown() {
		return PageUtil.findBy(By.id("loanType"));
	}

	public WebElement clickLoanStatusDropdown() {
		return PageUtil.findBy(By.id("loanStatus"));
	}

	public WebElement loanApplicationDateInput() {
		return PageUtil.findBy(By.id("inputDateloanApplicationDate"));
	}

	public WebElement loanApplicationDatePicker() {
		return PageUtil.findBy(By.xpath("//img[@id='datePicker_iconloanApplicationDate']//ancestor::button"));
	}

	public WebElement clickLoanStageDropdown() {
		return PageUtil.findBy(By.id("loanStage"));
	}

	public WebElement loanApprovalDateInput() {
		return PageUtil.findBy(By.id("inputDateloanApprovalDate"));
	}
	
	public WebElement loanApprovalDatePicker() {
		return PageUtil.findBy(By.xpath("//img[@id='datePicker_iconloanApprovalDate']//ancestor::button"));
	}

	public WebElement loanClosingDateInput() {
		return PageUtil.findBy(By.id("inputDateloanClosingDate"));
	}
	
	public WebElement loanClosingDatePicker() {
		return PageUtil.findBy(By.xpath("//img[@id='datePicker_iconloanClosingDate']//ancestor::button"));
	}

	public WebElement loanRejectionDateInput() {
		return PageUtil.findBy(By.id("inputDateloanRejectionDate"));
	}
	
	public WebElement loanRejectionDatePicker() {
		return PageUtil.findBy(By.xpath("//img[@id='datePicker_iconloanRejectionDate']//ancestor::button"));
	}

	public WebElement loanRejectionReason() {
		return PageUtil.findBy(By.id("'formInput-'loanRejectionReason"));
	}

	public WebElement loanDisbursalDateInput() {
		return PageUtil.findBy(By.id("inputDateloanDisbursalDate"));
	}
	
	public WebElement loanDisbursalDatePicker() {
		return PageUtil.findBy(By.xpath("//img[@id='datePicker_iconloanDisbursalDate']//ancestor::button"));
	}

	public WebElement downPaymentMode() {
		return PageUtil.findBy(By.id("'formInput-'downPaymentMode"));
	}

	public WebElement reasonForCash() {
		return PageUtil.findBy(By.id("'formInput-'reasonForCash"));
	}

	public WebElement clickDownPaymentHasAdjustedOrNotDropdown() {
		return PageUtil.findBy(By.id("downpaymentHasAdjustedOrNot"));
	}

	public WebElement financialDetailsClearButton() {
		return PageUtil.findBy(By.xpath("//span[text()=' CLEAR ']"));
	}

	// MSGA Details
	public WebElement msgaFinanceFlag() {
		return PageUtil.findBy(By.id("'formInput-'MSGAFinanceFlag"));
	}

	public WebElement clickMSGAFiancierDropdown() {
		return PageUtil.findBy(By.id("MSGAFinancierName"));
	}

	public WebElement msgaFinanceValue() {
		return PageUtil.findBy(By.id("'formInput-'MSGAFinanceValue"));
	}

	public WebElement GST() {
		return PageUtil.findBy(By.xpath("//mat-select[@id='GST']//div//span/span"));
	}

	public WebElement billingNature() {
		return PageUtil.findBy(By.xpath("//mat-select[@id='billingNature']//div//span/span"));
	}
	
	public WebElement chooseFirstReceiptDetails() {
		return PageUtil.findBy(By.xpath("//tbody//tr[1]//td[1]//input/ancestor::mat-checkbox"));
	}

}

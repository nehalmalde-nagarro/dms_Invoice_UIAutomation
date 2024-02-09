package com.dms.pageobjects;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.dms.core.CoreFunctions;
import com.dms.utils.PageUtil;

public class AddInvoice_ChargeDetailsPOM {

	
	//Charge Details
		public WebElement sellingPrice() {
			return PageUtil.findBy(By.xpath("//mat-label[text()='SELLING PRICE:']//following-sibling::label"));
		}
		public WebElement chassisNum() {
			return PageUtil.findBy(By.xpath("//mat-label[text()='CHASSIS NO:']//following-sibling::label"));
		}
		public WebElement engineNum() {
			return PageUtil.findBy(By.xpath("//mat-label[text()='ENGINE NO:']//following-sibling::label"));
		}
		public WebElement color() {
			return PageUtil.findBy(By.xpath("//mat-label[text()='COLOR:']//following-sibling::label"));
		}
		public WebElement variant() {
			return PageUtil.findBy(By.xpath("//mat-label[text()='VARIANT:']//following-sibling::label"));
		}
		
		
		//table
		public List<WebElement> allRowsInTable() {
			return PageUtil.findBys(By.xpath("//div[contains(@class,'tblchargeDetail')]//tbody//tr"));
		}
		
		public WebElement ChargeDetailsPage() {
			return PageUtil.findBy(By.xpath("//mat-panel-title[contains(text(),'Charge Details')]"));
		}
		
		public WebElement totalAmt() {
			return PageUtil.findBy(By.xpath("//input[contains(@formcontrolname,'chargeAmountTotal')]"));
		}
		
		public List<WebElement> allRowsChargeName() {
			return PageUtil.findBys(By.xpath("//div[contains(@class,'tblchargeDetail')]//tbody//tr//td[2]//input"));
		}
		public List<WebElement> allRowsChargeIndicator() {
			return PageUtil.findBys(By.xpath("//div[contains(@class,'tblchargeDetail')]//tbody//tr//td[3]//input"));
		}
		public List<WebElement> allRowsChargeValue() {
			return PageUtil.findBys(By.xpath("//div[contains(@class,'tblchargeDetail')]//tbody//tr//td[4]//input"));
		}
		public List<WebElement> allRowsChargeAmount() {
			return PageUtil.findBys(By.xpath("//div[contains(@class,'tblchargeDetail')]//tbody//tr//td[5]//input"));
		}
		public List<WebElement> allRowsRemarks() {
			return PageUtil.findBys(By.xpath("//div[contains(@class,'tblchargeDetail')]//tbody//tr//td[6]//input"));
		}
		
		public WebElement totalAmount() {
			return PageUtil.findBy(By.xpath("//input[@formcontrolname='chargeAmountTotal']"));
		}
		
		
		public WebElement clickTaxiTypeDropdown() {
			return PageUtil.findBy(By.id("taxiType"));
		}
		public WebElement reportTitle() {
			return PageUtil.findBy(By.id("'formInput-'reportTitle"));
		}
		public WebElement clickPrintReportDropdown() {
			return PageUtil.findBy(By.id("printReport"));
		}
		public WebElement savePreviewButon() {
			return PageUtil.findBy(By.xpath("//span[text()='SAVE & PREVIEW']/ancestor::button"));
		}
		
		
		public Map<String, List<String>> getChargeDetails()
		{
			Map<String, List<String>> hm = new HashMap<String, List<String>>();
			
			for(int i=0;i<allRowsChargeName().size();i++)
			{
				List<String> chargeList = new ArrayList<>();
				String chargeName = CoreFunctions.getElementAttribute(allRowsChargeName().get(i),"value"); 
				chargeList.add(CoreFunctions.getElementAttribute(allRowsChargeIndicator().get(i),"value"));
				chargeList.add(CoreFunctions.getElementAttribute(allRowsChargeValue().get(i),"value")); 
				chargeList.add(CoreFunctions.getElementAttribute(allRowsChargeAmount().get(i),"value")); 
				chargeList.add(CoreFunctions.getElementAttribute(allRowsRemarks().get(i),"value")); 
				
				hm.put(chargeName, chargeList);
			}
			return hm;
		}
		
		public Set<String> getAllChargeNames()
		{
			return getChargeDetails().keySet();
		}
		
		public String getChargeIndicatorForProvidedChargeName(String chargeName)
		{
			return getChargeDetails().get(chargeName).get(0);
		}
		public String getChargeValueForProvidedChargeName(String chargeName)
		{
			return getChargeDetails().get(chargeName).get(1);
		}
		public String getChargeAmountForProvidedChargeName(String chargeName)
		{
			return getChargeDetails().get(chargeName).get(2);
		}
		
		
		
		
		//Submit
		public WebElement successMessage() {
			return PageUtil.findBy(By.xpath("//p[contains(text(),'Success')]"));
		}
		
		public WebElement invoiceNumberGenerated() {
			return PageUtil.findBy(By.xpath("//h2[contains(text(),'Invoice No')]/span"));
		}
}

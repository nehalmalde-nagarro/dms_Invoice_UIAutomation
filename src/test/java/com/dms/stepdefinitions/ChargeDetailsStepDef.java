package com.dms.stepdefinitions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.openqa.selenium.support.ui.ExpectedConditions;
import org.testng.Assert;

import com.dms.browserInstance.BrowserHandle;
import com.dms.core.CoreFunctions;
import com.dms.dbconfig.Query;
import com.dms.pageobjects.AddInvoice_ChargeDetailsPOM;

import io.cucumber.java.en.Then;

public class ChargeDetailsStepDef {
	AddInvoice_ChargeDetailsPOM chargeDetailsPOM = new AddInvoice_ChargeDetailsPOM();
	public static List<Map<String, String>> testData = new ArrayList<>();

	@Then("Verify Prefilled fields for OrderId from scenario {int} on Charge Details tab")
	public void Verify_Prefilled_fields_for_OrderId_from_scenario_on_Charge_Details_tab(int rowNo) throws Exception {

		String sellingPriceFE = CoreFunctions.getElementText(chargeDetailsPOM.sellingPrice());
		String chasisNoFE = CoreFunctions.getElementText(chargeDetailsPOM.sellingPrice());
		String engineNoFE = CoreFunctions.getElementText(chargeDetailsPOM.sellingPrice());
		String colorFE = CoreFunctions.getElementText(chargeDetailsPOM.sellingPrice());
		String variantFE = CoreFunctions.getElementText(chargeDetailsPOM.sellingPrice());
		rowNo--;
		testData = CoreFunctions.test("InvoiceData");
		String orderId = testData.get(rowNo).get("OrderId").toString();
		String vin = Query.get_fields_From_STAllot("VIN", "ORDER_NUM", orderId);
		String variantCD = Query.get_fields_From_SD_GRN("VARIANT_CD", "VIN", vin);
		String colorCD = Query.get_fields_From_SD_GRN("ECOLOR_CD", "VIN", vin);
		String saleType = Query.get_fields_From_ShOrderBook("SALES_TYPE", "ORDER_NUM", orderId);
		// String sellingPrice=Query.get_fields_From_SM_PRICE_FOR("SELL_PRICE_L",
		// "COLOR_IND", data);
		String sellingPriceBE = Query.get_fields_From_SM_PRICE_FOR_with_mutiple_conditions("SELL_PRICE_L", "COLOR_IND",
				colorCD, "VARIANT_CD", variantCD, "SALES_TYPE", saleType);
		Assert.assertEquals(sellingPriceFE, sellingPriceBE);

		// chasisNumber
		String chassisBE = Query.get_fields_From_SD_GRN("CHASSIS_NUM", "VIN", vin);
		Assert.assertEquals(chasisNoFE, chassisBE);

		// EngineNumber
		String engineBE = Query.get_fields_From_SD_GRN("ENGINE_NUM", "VIN", vin);
		Assert.assertEquals(engineNoFE, engineBE);

		// Color
		String colorDescBE = Query.get_fields_From_GM_ECLR("ECOLOR_DESC", "ECOLOR_CD", colorCD);
		Assert.assertEquals(colorFE, colorDescBE);

		// Variant
		String variantDescBE = Query.get_fields_From_GM_VAR("VARIANT_DESC", "VARIANT_CD", variantCD);
		Assert.assertEquals(variantFE, variantDescBE);

	}

	@Then("Validation on Charge details page")
	public void validation_on_charge_Detail_page() throws InterruptedException {
//		BrowserHandle.wait.until(ExpectedConditions.textToBePresentInElement(chargeDetailsPOM.sellingPrice(), FinancialInfoStepDef.SellingPriceFor));
		BrowserHandle.wait.until(ExpectedConditions.textToBePresentInElement(chargeDetailsPOM.chassisNum(),VehicleDetailTabStepDef.ChasisNo));
		BrowserHandle.wait.until(ExpectedConditions.textToBePresentInElement(chargeDetailsPOM.engineNum(),VehicleDetailTabStepDef.EngineNum));
		BrowserHandle.wait.until(ExpectedConditions.textToBePresentInElement(chargeDetailsPOM.color(),VehicleDetailTabStepDef.Color));
		BrowserHandle.wait.until(ExpectedConditions.textToBePresentInElement(chargeDetailsPOM.variant(), VehicleDetailTabStepDef.Variant));
		Thread.sleep(2000);
		String SP=CoreFunctions.getElementText(chargeDetailsPOM.sellingPrice());
	    String cleanedStr = SP.replaceAll("[^\\d.]", "");
        // Split the string by the decimal point
        String[] parts = cleanedStr.split("\\.");


		BrowserHandle.wait.until(ExpectedConditions.visibilityOf(chargeDetailsPOM.sellingPrice()));
		Assert.assertEquals(parts[0], FinancialInfoStepDef.SellingPriceFor);
		BrowserHandle.wait.until(ExpectedConditions.visibilityOf(chargeDetailsPOM.chassisNum()));
		Assert.assertEquals(CoreFunctions.getElementText(chargeDetailsPOM.chassisNum()), VehicleDetailTabStepDef.ChasisNo);
		BrowserHandle.wait.until(ExpectedConditions.visibilityOf(chargeDetailsPOM.engineNum()));
		Assert.assertEquals(CoreFunctions.getElementText(chargeDetailsPOM.engineNum()), VehicleDetailTabStepDef.EngineNum);
		Assert.assertEquals(CoreFunctions.getElementText(chargeDetailsPOM.color()), VehicleDetailTabStepDef.Color);
		Assert.assertEquals(CoreFunctions.getElementText(chargeDetailsPOM.variant()), VehicleDetailTabStepDef.Variant);

		
		
		System.out.println("ccpCode" + VehicleDetailTabStepDef.ccpCode);
		System.out.println("ccpDesc " + VehicleDetailTabStepDef.ccpDesc);
		System.out.println(" ccpTotal " + VehicleDetailTabStepDef.ccpTotal);
		System.out.println(" Recevied_Amt " + FinancialInfoStepDef.Recevied_Amt);
		System.out.println(" INvoice AMT " + FinancialInfoStepDef.invoiceAmt);
		System.out.println("GST_Type " + FinancialInfoStepDef.GST_Type);
		System.out.println(" AD1 " + AdditionalDetailsStepDef.AD1);
		System.out.println("AD2 " + AdditionalDetailsStepDef.AD2);
		System.out.println("MSSFOfferAmt " + AdditionalDetailsStepDef.MSSFOfferAmt);
		System.out.println(" exchangeBenefit " + AdditionalDetailsStepDef.exchangeBenefitAmt);
		System.out.println(" SchemeOfferAmt " + AdditionalDetailsStepDef.SchemeOfferAmt);

         		
		
		
		
		Set<String> chargesName = chargeDetailsPOM.getAllChargeNames();
		System.out.println(chargesName);
		int total=0;

		for (String charges : chargesName) {
			
			System.out.println("charges  "+ charges);

			if (CoreFunctions.trim(charges).toLowerCase().contains("Discount 1".toLowerCase())) {
             	Assert.assertEquals(chargeDetailsPOM.getChargeAmountForProvidedChargeName(charges),
						AdditionalDetailsStepDef.AD1);
             	total+=CoreFunctions.convertStringToInt(AdditionalDetailsStepDef.AD1);
			} else if (CoreFunctions.trim(charges).toLowerCase().contains("Discount 2".toLowerCase())) {
              Assert.assertEquals(chargeDetailsPOM.getChargeAmountForProvidedChargeName(charges),
						AdditionalDetailsStepDef.AD2);
           	total+=CoreFunctions.convertStringToInt(AdditionalDetailsStepDef.AD2);

			} else if (CoreFunctions.trim(charges).toLowerCase().contains("Cess".toLowerCase())) {
				Assert.assertEquals(chargeDetailsPOM.getChargeAmountForProvidedChargeName(charges),
						CoreFunctions.percent(FinancialInfoStepDef.invoiceAmt, "1"));
				   total+= CoreFunctions.convertStringToInt(CoreFunctions.percent(FinancialInfoStepDef.invoiceAmt, "1"));
			} else if (CoreFunctions.trim(charges).toLowerCase().contains("IGST".toLowerCase())) {
         		Assert.assertEquals(chargeDetailsPOM.getChargeAmountForProvidedChargeName(charges),
						CoreFunctions.percent(FinancialInfoStepDef.invoiceAmt, "28"));
			   total+= CoreFunctions.convertStringToInt(CoreFunctions.percent(FinancialInfoStepDef.invoiceAmt, "28"));
			} else if (CoreFunctions.trim(charges).toLowerCase().contains("MSSF".toLowerCase())) {
				if (AdditionalDetailsStepDef.MSSFOfferAmt.equals(""))
					Assert.assertEquals(chargeDetailsPOM.getChargeAmountForProvidedChargeName(charges), "0");
				else {
					Assert.assertEquals(chargeDetailsPOM.getChargeAmountForProvidedChargeName(charges),
							AdditionalDetailsStepDef.MSSFOfferAmt);
					   total+= CoreFunctions.convertStringToInt(AdditionalDetailsStepDef.MSSFOfferAmt);

				}
			} else if (CoreFunctions.trim(charges).toLowerCase().contains("Exchange".toLowerCase())) {
				if (AdditionalDetailsStepDef.exchangeBenefitAmt.equals(""))
					Assert.assertEquals(chargeDetailsPOM.getChargeAmountForProvidedChargeName(charges), "0");

				else {
					Assert.assertEquals(chargeDetailsPOM.getChargeAmountForProvidedChargeName(charges),
							AdditionalDetailsStepDef.exchangeBenefitAmt);
				   total+= CoreFunctions.convertStringToInt(AdditionalDetailsStepDef.exchangeBenefitAmt);
				}
			}
        	else if(CoreFunctions.trim(charges).toLowerCase().contains("Scrappage".toLowerCase())) {
        		if (AdditionalDetailsStepDef.Scrappage.equals(""))
					Assert.assertEquals(chargeDetailsPOM.getChargeAmountForProvidedChargeName(charges), "0");
				else {
					Assert.assertEquals(chargeDetailsPOM.getChargeAmountForProvidedChargeName(charges),
							AdditionalDetailsStepDef.Scrappage);
				   total+=CoreFunctions.convertStringToInt(AdditionalDetailsStepDef.Scrappage);}

        	}
        	else if(CoreFunctions.trim(charges).toLowerCase().contains("CCP".toLowerCase())) {
        		if (!VehicleDetailTabStepDef.ccpTotal.equals("")) {
					Assert.assertEquals(chargeDetailsPOM.getChargeAmountForProvidedChargeName(charges), VehicleDetailTabStepDef.ccpTotal);
					   total+= CoreFunctions.convertStringToInt(VehicleDetailTabStepDef.ccpTotal);
        		}
        		}
//        	else if(CoreFunctions.trim(charges).toLowerCase().contains("Extended ".toLowerCase())) {
//					Assert.assertEquals(chargeDetailsPOM.getChargeAmountForProvidedChargeName(charges), "");
//       					   total+= Integer.parseInt(Query);

//			}
		

		}
		String totalFromFE=CoreFunctions.getElementAttribute(chargeDetailsPOM.totalAmount(), "value");
//		Assert.assertEquals(totalFromFE, null);
		System.out.println("total "+totalFromFE+"    "+total);

	}

}

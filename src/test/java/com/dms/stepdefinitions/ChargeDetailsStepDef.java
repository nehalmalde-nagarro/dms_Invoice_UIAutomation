package com.dms.stepdefinitions;

import static org.testng.Assert.assertEquals;

import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
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
		BrowserHandle.wait.until(ExpectedConditions.textToBePresentInElement(chargeDetailsPOM.chassisNum(),
				VehicleDetailTabStepDef.ChasisNo));
		BrowserHandle.wait.until(ExpectedConditions.textToBePresentInElement(chargeDetailsPOM.engineNum(),
				VehicleDetailTabStepDef.EngineNum));
		BrowserHandle.wait.until(
				ExpectedConditions.textToBePresentInElement(chargeDetailsPOM.color(), CoreFunctions.trim(VehicleDetailTabStepDef.Color)));
		BrowserHandle.wait.until(ExpectedConditions.textToBePresentInElement(chargeDetailsPOM.variant(),
				VehicleDetailTabStepDef.Variant));
		
		String SP = CoreFunctions.getElementText(chargeDetailsPOM.sellingPrice());
		String cleanedStr = SP.replaceAll("[^\\d.]", "");
		// Split the string by the decimal point
//		String[] parts = cleanedStr.split("\\.");

		System.out.println("***************************");
		System.out.println(cleanedStr);
		System.out.println(FinancialInfoStepDef.SellingPriceFor);
		BrowserHandle.wait.until(ExpectedConditions.visibilityOf(chargeDetailsPOM.sellingPrice()));
		Assert.assertEquals(Math.round(CoreFunctions.convertStringToDouble(cleanedStr) ),Math.round( CoreFunctions.convertStringToDouble(FinancialInfoStepDef.SellingPriceFor)));
		BrowserHandle.wait.until(ExpectedConditions.visibilityOf(chargeDetailsPOM.chassisNum()));
		Assert.assertEquals(CoreFunctions.getElementText(chargeDetailsPOM.chassisNum()), VehicleDetailTabStepDef.ChasisNo);
		BrowserHandle.wait.until(ExpectedConditions.visibilityOf(chargeDetailsPOM.engineNum()));
		Assert.assertEquals(CoreFunctions.getElementText(chargeDetailsPOM.engineNum()), VehicleDetailTabStepDef.EngineNum);
		Assert.assertEquals(CoreFunctions.getElementText(chargeDetailsPOM.color()), CoreFunctions.trim(VehicleDetailTabStepDef.Color));
		Assert.assertEquals(CoreFunctions.getElementText(chargeDetailsPOM.variant()), VehicleDetailTabStepDef.Variant);

//		System.out.println("ccpCode" + VehicleDetailTabStepDef.ccpCode);
//		System.out.println("ccpDesc " + VehicleDetailTabStepDef.ccpDesc);
//		System.out.println(" ccpTotal " + VehicleDetailTabStepDef.ccpTotal);
//		System.out.println(" Recevied_Amt " + FinancialInfoStepDef.Recevied_Amt);
//		System.out.println(" INvoice AMT " + FinancialInfoStepDef.invoiceAmt);
//		System.out.println("GST_Type " + FinancialInfoStepDef.GST_Type);
//		System.out.println(" AD1 " + AdditionalDetailsStepDef.AD1);
//		System.out.println("AD2 " + AdditionalDetailsStepDef.AD2);
//		System.out.println("MSSFOfferAmt " + AdditionalDetailsStepDef.MSSFOfferAmt);
//		System.out.println(" exchangeBenefit " + AdditionalDetailsStepDef.exchangeBenefitAmt);
//		System.out.println(" SchemeOfferAmt " + AdditionalDetailsStepDef.SchemeOfferAmt);

		Set<String> chargesName = chargeDetailsPOM.getAllChargeNames();
		System.out.println(chargesName);
		double total = 0;
		double AV = CoreFunctions.formatAndConvertStringToDouble(SP);
		double calulatedCess=0;
		double calculatedIGST=0;
		double calculatedCGST=0;
		double calculatedSGST=0;
		double calculatedTaxCollection=0;
		double percentageOfTaxCollection=0;
		double taxCollectionAmtfromUI=0;
		double ccpAmtFromUI=0;
		double extendedWarrantyValueFromUI=0;
		
		System.out.println("AV is  :  "+ AV);
		  
		  HashMap<String, Double> chargeDetailsData=new HashMap<String, Double>();
for (String charge : chargesName) {
	chargeDetailsData.put(charge, CoreFunctions.convertStringToDouble(chargeDetailsPOM.getChargeAmountForProvidedChargeName(charge)));
}
HashMap<String, Double> chargeDetailsDataValue=new HashMap<String, Double>();

for (String charge : chargesName) {
	chargeDetailsDataValue.put(charge, CoreFunctions.convertStringToDouble(chargeDetailsPOM.getChargeValueForProvidedChargeName(charge)));
}
for(String key:chargeDetailsData.keySet()) {
	
	    String value = chargeDetailsData.get(key).toString();
	    System.out.println(key + " " + value);
}



		for (String charges : chargesName) {

			System.out.println("charges  " + charges);

			if (CoreFunctions.trim(charges).toLowerCase().contains("Discount 1".toLowerCase())) {
//				System.out.println("Assert AD1 input" + AdditionalDetailsStepDef.AD1 + " form Charge details UI "
//						+ chargeDetailsPOM.getChargeAmountForProvidedChargeName(charges));
//				AV -= CoreFunctions
//						.convertStringToDouble(chargeDetailsPOM.getChargeAmountForProvidedChargeName(charges));
				System.out.println("Assert AD1 input" + AdditionalDetailsStepDef.AD1 + " form Charge details UI "
						+chargeDetailsData.get(charges));	
				Assert.assertEquals(CoreFunctions.convertStringToDouble(AdditionalDetailsStepDef.AD1 ), chargeDetailsData.get(charges));
				AV -= chargeDetailsData.get(charges);

				System.out.println(" AV After Subtract DIS1" + AV);
			} 
			else if (CoreFunctions.trim(charges).toLowerCase().contains("Discount 2".toLowerCase())) {
				System.out.println("Assert AD2 input" + CoreFunctions.convertStringToDouble(AdditionalDetailsStepDef.AD2) + " form Charge details UI "
						+ chargeDetailsData.get(charges));
				Assert.assertEquals( CoreFunctions.convertStringToDouble(AdditionalDetailsStepDef.AD2), chargeDetailsData.get(charges));
				AV -= chargeDetailsData.get(charges);
				System.out.println(" AV After Subtract DIS2" + AV);
			}
			else if (CoreFunctions.trim(charges).toLowerCase().contains("Discount 3".toLowerCase())) {
				AV -= chargeDetailsData.get(charges);
				System.out.println(" AV After Subtract DIS3" + AV);
			}
			else if (CoreFunctions.trim(charges).toLowerCase().contains("Discount 4".toLowerCase())) {
				AV -= chargeDetailsData.get(charges);
			System.out.println(" AV After Subtract DIS4" + AV);
			}
			else if (CoreFunctions.trim(charges).toLowerCase().contains("MDS Discount".toLowerCase())) {
				AV -= chargeDetailsData.get(charges);
			System.out.println(" AV After Subtract MDS Dis" + AV);
			}
//			
	        else if (CoreFunctions.trim(charges).toLowerCase().contains("MSSF".toLowerCase())) {
				System.out.println("Assert MSSF input" + CoreFunctions.convertStringToDouble(AdditionalDetailsStepDef.MSSFOfferAmt)
						+ " form Charge details UI " + chargeDetailsData.get(charges));
				Assert.assertEquals(CoreFunctions.convertStringToDouble(AdditionalDetailsStepDef.MSSFOfferAmt), chargeDetailsData.get(charges));
				AV -= chargeDetailsData.get(charges);
				System.out.println(" AV After Subtract MSSSF" + AV);
			}
			else if (CoreFunctions.trim(charges).toLowerCase().contains("Exchange".toLowerCase())) {
				System.out.println("Assert Exchange " + CoreFunctions.convertStringToDouble(AdditionalDetailsStepDef.exchnageLoyalty)
						+ " form Charge details UI " + chargeDetailsData.get(charges));
				//Assert.assertEquals( CoreFunctions.convertStringToDouble(AdditionalDetailsStepDef.exchnageLoyalty), chargeDetailsData.get(charges));
				AV -= chargeDetailsData.get(charges);
				System.out.println(" AV After Exchnage " + AV);

			} 
			else if (CoreFunctions.trim(charges).toLowerCase().contains("Scrappage".toLowerCase())) {
				System.out.println("Assert Scrappge " + AdditionalDetailsStepDef.Scrappage + " form Charge details UI "
						+ chargeDetailsData.get(charges));
				Assert.assertEquals(CoreFunctions.convertStringToDouble(AdditionalDetailsStepDef.Scrappage ),chargeDetailsData.get(charges));
				AV -= chargeDetailsData.get(charges);
				System.out.println(" AV After scrappage " + AV);
			}
			else if (CoreFunctions.trim(charges).toLowerCase().contains("Special Scheme".toLowerCase())) {
				AV -= chargeDetailsData.get(charges);
				System.out.println(" AV After Special schemee " + AV);
			}
			
		}
		
		for (String charges : chargesName) {
			  if (CoreFunctions.trim(charges).toLowerCase().contains("Cess".toLowerCase())) {
				  double percentage=chargeDetailsDataValue.get(charges);
			       calulatedCess=CoreFunctions.percent(AV, percentage);
			       calulatedCess = Math.round(calulatedCess * 100.0) / 100.0;
			       DecimalFormat df = new DecimalFormat("#.##");
			       df.setRoundingMode(RoundingMode.DOWN);
			       System.out.println(calulatedCess);
			       System.out.println(df.format(calulatedCess));
			       calulatedCess= CoreFunctions.convertStringToDouble(df.format(calulatedCess));
			       
			       System.out.println(calulatedCess);
			       
			      System.out.println("Assert Cess from ui "+chargeDetailsData.get(charges)+" From Calculatio "+calulatedCess);
			      Assert.assertEquals(chargeDetailsData.get(charges), calulatedCess);
			  }
			  else if (CoreFunctions.trim(charges).toLowerCase().contains("Tax Collection".toLowerCase())) {
					System.out.println("charges  " + charges);

					   percentageOfTaxCollection=chargeDetailsDataValue.get(charges);
				       taxCollectionAmtfromUI=chargeDetailsData.get(charges);
				       
				       System.out.println("  percentageOfTaxCollection : "+percentageOfTaxCollection+" taxCollectionAmtfromUI :  "+taxCollectionAmtfromUI);
					   
				  }
			  else if (CoreFunctions.trim(charges).toLowerCase().contains("GST".toLowerCase())) {
     		 if(CoreFunctions.trim(charges).toLowerCase().contains("IGST".toLowerCase())) {
				  double percentage=chargeDetailsDataValue.get(charges);
			      calculatedIGST = (CoreFunctions.percent(AV, percentage));
			      System.out.println("Charge Name is " + CoreFunctions.trim(charges) +  "Assert GST from ui "+ chargeDetailsData.get(charges)+" From Calculatio "+calculatedIGST);
			      Assert.assertEquals(calculatedIGST, chargeDetailsData.get(charges));
			  
			  } 
				 if(CoreFunctions.trim(charges).toLowerCase().contains("CGST".toLowerCase())) {
					  double percentage=chargeDetailsDataValue.get(charges);
				      calculatedCGST = CoreFunctions.roundOff(CoreFunctions.percent(AV, percentage));
				      System.out.println("Charge Name is " + CoreFunctions.trim(charges) +  "Assert GST from ui "+ chargeDetailsData.get(charges)+" From Calculatio "+calculatedCGST);
				      Assert.assertEquals(calculatedCGST,chargeDetailsData.get(charges));

				  } 
				 if(CoreFunctions.trim(charges).toLowerCase().contains("SGST".toLowerCase())) {
					  double percentage=chargeDetailsDataValue.get(charges);
				      calculatedSGST = CoreFunctions.roundOff(CoreFunctions.percent(AV, percentage));
				      System.out.println("Charge Name is " + CoreFunctions.trim(charges) +  "Assert GST from ui "+ chargeDetailsData.get(charges)+" From Calculatio "+calculatedSGST);
				      Assert.assertEquals(calculatedSGST, chargeDetailsData.get(charges));

				  } 
			  }
		    else if(CoreFunctions.trim(charges).toLowerCase().contains("CCP".toLowerCase())) {
		    System.out.println("Asser CCP from UI "+chargeDetailsData.get(charges)+"From vehicle details vari   "+VehicleDetailTabStepDef.ccpTotal);
    		if(!VehicleDetailTabStepDef.ccpTotal.equals("0"))
		    Assert.assertEquals(CoreFunctions.convertStringToDouble(VehicleDetailTabStepDef.ccpTotal), chargeDetailsData.get(charges));
		    System.out.println("ccp : "+chargeDetailsData.get(charges));
    		ccpAmtFromUI=chargeDetailsData.get(charges);
    		
    		
		}
    	else if(CoreFunctions.trim(charges).toLowerCase().contains("Extended ".toLowerCase())) {
    	        		extendedWarrantyValueFromUI=chargeDetailsData.get(charges);
        		
		}
			  
				  
		
		}
		
		System.out.println("extendedWarrantyValueFromUI "+extendedWarrantyValueFromUI+"ccpAmtFromUI "+ccpAmtFromUI+   "Av "+AV+ "CSST "+calculatedCGST +" IGST "+ calculatedIGST+"SGST "+calculatedSGST+" Cess  "+calulatedCess);
		System.out.println("Total is "+ (extendedWarrantyValueFromUI+ccpAmtFromUI+AV+calculatedCGST+calculatedIGST+calculatedSGST+calulatedCess )+" Percentage value is "+percentageOfTaxCollection);
	 //calculatedTaxCollection= CoreFunctions.taxCollectionRoundOff(CoreFunctions.percent((extendedWarrantyValueFromUI+ccpAmtFromUI+AV+calculatedCGST+calculatedIGST+calculatedSGST+calulatedCess),percentageOfTaxCollection));
		if(FinancialInfoStepDef.tcsFlag.equalsIgnoreCase("Yes"))
		{
			Assert.assertTrue( chargesName.contains("Tax Collection at Source"));
			calculatedTaxCollection= CoreFunctions.percent((extendedWarrantyValueFromUI+ccpAmtFromUI+AV+calculatedCGST+calculatedIGST+calculatedSGST+calulatedCess),percentageOfTaxCollection);
			calculatedTaxCollection = Math.round(calculatedTaxCollection * 100.0) / 100.0;
		}
		else if(FinancialInfoStepDef.tcsFlag.equalsIgnoreCase("No"))
		{
			Assert.assertFalse( chargesName.contains("Tax Collection at Source"));
		}
		
	 System.out.println("Assert tax collection from UI "+taxCollectionAmtfromUI+"  From calulation "+ calculatedTaxCollection);
	assertEquals(taxCollectionAmtfromUI, calculatedTaxCollection);
	 //total=extendedWarrantyValueFromUI+AV+calculatedTaxCollection+calculatedCGST+calculatedIGST+calculatedSGST+calulatedCess+ccpAmtFromUI;
	 total=AV+calculatedTaxCollection+calculatedCGST+calculatedIGST+calculatedSGST+calulatedCess;
	 total = Math.round(total * 100.0) / 100.0;
	 System.out.println("Assert total from UI is "+CoreFunctions.getElementAttribute(chargeDetailsPOM.totalAmount(),"value")+" From caliclation "+ total);
//Assert.assertEquals(CoreFunctions.convertStringToInt( CoreFunctions.getElementAttribute(chargeDetailsPOM.totalAmount(),"value")),(int)  Math.round(total));
Assert.assertEquals(CoreFunctions.convertStringToDouble( CoreFunctions.getElementAttribute(chargeDetailsPOM.totalAmount(),"value")),total);
	 
  


	}
	
	
	
	

}

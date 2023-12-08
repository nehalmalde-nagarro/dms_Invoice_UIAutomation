package com.dms.stepdefinitions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.testng.Assert;

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
	public void validation_on_charge_Detail_page() {
		
		System.out.println(VehicleDetailTabStepDef.ccpCode);
		System.out.println(VehicleDetailTabStepDef.ccpDesc);
		System.out.println(VehicleDetailTabStepDef.ccpTotal);
		System.out.println(FinancialInfoStepDef.Recevied_Amt);
		System.out.println(FinancialInfoStepDef.GST_Type);



	}

}

package com.dms.stepdefinitions;

import java.io.IOException;

import org.testng.Assert;
import com.dms.core.ValidatePDF;
import com.dms.utils.Constants;

import io.cucumber.java.en.Then;

public class ValidatePDFStepDef {

	
	@Then("validate the PDF generated for scenario {int}")
	public void validate_the_pdf_generated(int rowNo) throws IOException {
	    // Write code here that turns the phrase above into concrete actions
	   String pdfURl = Constants.INVOICE_PDF;
	   
	  String pdfText =  ValidatePDF.validatePDF(pdfURl);
	   
		/*
		 * Assert.assertTrue(pdfText.contains("SOB23000380"));
		 * Assert.assertTrue(pdfText.contains("4,15,503.75"));
		 * Assert.assertTrue(pdfText.contains("58,170.52"));
		 * 
		 * Assert.assertTrue(pdfText.contains("5,35,999.82"));
		 * Assert.assertTrue(pdfText.contains("87032291"));
		 * 
		 * Assert.assertTrue(pdfText.contains("MA3JDT08WPFB98378"));
		 * Assert.assertTrue(pdfText.contains("K12NN 4090739"));
		 * Assert.assertTrue(pdfText.contains("Superior White-26U"));
		 * 
		 * Assert.assertTrue(pdfText.contains("MR. SUDHAKAR MORESHWAR SHEVADE"));
		 * Assert.assertTrue(pdfText.contains("ACZPS2242K"));
		 * Assert.assertTrue(pdfText.contains("2351593915"));
		 * Assert.assertTrue(pdfText.contains("10/06/2023"));
		 */
	  System.out.println(pdfText);
	  String ccpEnabled="Yes";
	  String CGST ="";
	  String SGST ="";
	  String IGST ="";
	  String ccp="";
	   String invoiceNum= "Invoice No. : "+"VSL/23002081";
	   String additionalDiscount1= "Additional Discount 1   0.00  "+"1,000.00";
	   String additionalDiscount2= "Additional Discount 2   0.00  "+"2,000.00";
	   String specialScheme= "Special Scheme   0.00  "+"14,000.00";
	   String accessibleValue= "Assessable Value   "+"43,220.99";
	   if("CGST".contains("CGST"))
	   {
		   CGST = "CGST @ "+"14"+"%   "+"6,050.93";
		   SGST = "SGST @ "+"14"+"%   "+"6,050.93";
		   Assert.assertTrue(pdfText.contains(CGST));
		   Assert.assertTrue(pdfText.contains(SGST));
	   }
	   if("IGST".contains("NoIGST"))
	   {
		   IGST = "IGST @ "+"14"+"%   "+"6,050.93";
		   Assert.assertTrue(pdfText.contains(IGST));
	   }
	   if(ccpEnabled.equals("Yes"))
	   {
		   ccp= "N-EW CCP Gold - Plus   "+"2,242.00";
		   Assert.assertTrue(pdfText.contains(ccp));
	   }
	   String taxCollectionAtSource= "Tax Collection at Source   "+"57.99";
	   String total= "Sub Total Amount (Assessable Value + Tax) : "+"58,055.06";
	  
	   Assert.assertTrue(pdfText.contains(invoiceNum));
	   Assert.assertTrue(pdfText.contains(additionalDiscount1));
	   Assert.assertTrue(pdfText.contains(additionalDiscount2));
	   //Assert.assertTrue(pdfText.contains(specialScheme));
	   Assert.assertTrue(pdfText.contains(accessibleValue));
	   Assert.assertTrue(pdfText.contains(taxCollectionAtSource));
	   Assert.assertTrue(pdfText.contains(total));
	   
	}

}

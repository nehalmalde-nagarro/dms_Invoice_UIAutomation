package com.dms.stepdefinitions;

import java.io.IOException;

import org.testng.Assert;
import com.dms.core.ValidatePDF;
import com.dms.utils.Constants;

import io.cucumber.java.en.Then;

public class ValidatePDFStepDef {

	
	@Then("validate the PDF generated")
	public void validate_the_pdf_generated() throws IOException {
	    // Write code here that turns the phrase above into concrete actions
	   String pdfURl = Constants.INVOICE_PDF;
	    String pdfText = ValidatePDF.extractTextFromPDF(pdfURl);
	    System.out.println( "validateCr "+  ValidatePDF.extractInvoiceNumber(pdfText,"invoiceData.invNo"));
	    System.out.println( "chaiss "+  ValidatePDF.extractInvoiceNumber(pdfText,"{vehicleDetails.variantDesc}"));
System.out.println( "validateDr "+ ValidatePDF.extractInvoiceNumber(pdfText,"TableEnd:chargeDetails"));
//System.out.println( "validateCr "+  ValidatePDF.extractInvoiceNumber(pdfText,"adnlDis2.crAmt"));

        // Extract data using the placeholder '{invoice.invNo}'
//        System.out.println( ValidatePDF.extractInvoiceNumberRegex(pdfText,"Invoice No\\."));
//        System.out.println("invoicedata "+ValidatePDF.extractInvoiceNumberRegex(pdfText,"Invoice Date"));
//        System.out.println("custid "+ValidatePDF.extractInvoiceNumberRegex(pdfText,"Customer ID"));
//        System.out.println("vehicle id"+ ValidatePDF.extractInvoiceNumberRegex(pdfText,"Vehicle ID"));
//        System.out.println("order no"+ValidatePDF.extractInvoiceNumberRegex(pdfText,"Order No\\."));

//
//        // Print the extracted invoice number
        System.out.println("Extract pdf url "+pdfText);
//        System.out.println("Extracted Invoice Number: " + invNo);

	   
//	  String pdfText =  ValidatePDF.validatePDF(pdfURl);
//	   
//	   Assert.assertTrue(pdfText.contains("SOB23000380"));
//	   Assert.assertTrue(pdfText.contains("4,15,503.75"));
//	   Assert.assertTrue(pdfText.contains("58,170.52"));
//	   
//	   Assert.assertTrue(pdfText.contains("5,35,999.82"));
//	   Assert.assertTrue(pdfText.contains("87032291"));
//	   
//	   Assert.assertTrue(pdfText.contains("MA3JDT08WPFB98378"));
//	   Assert.assertTrue(pdfText.contains("K12NN 4090739"));
//	   Assert.assertTrue(pdfText.contains("Superior White-26U"));
//	   
//	   Assert.assertTrue(pdfText.contains("MR. SUDHAKAR MORESHWAR SHEVADE"));
//	   Assert.assertTrue(pdfText.contains("ACZPS2242K"));
//	   Assert.assertTrue(pdfText.contains("2351593915"));
//	   Assert.assertTrue(pdfText.contains("10/06/2023"));
	   
	   
	}

}

package com.dms.core;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

import com.dms.browserInstance.BrowserHandle;

public class ValidatePDF {

		public static String validatePDF(String url) throws IOException
		{
			BrowserHandle.getDriver().get(url);
			
			URL pdfURL =new URL(url);
			InputStream is = pdfURL.openStream();
			BufferedInputStream bis = new BufferedInputStream(is);
			PDDocument pdDoc = PDDocument.load(bis);
			
			PDFTextStripper stripper = new PDFTextStripper();
			String pdfText = stripper.getText(pdDoc);
			return pdfText;
			
		}
		  public static String extractTextFromPDF(String pdfPath) throws IOException {
  	        try (PDDocument document = PDDocument.load(new File(pdfPath))) {
  	            PDFTextStripper pdfTextStripper = new PDFTextStripper();
  	            return pdfTextStripper.getText(document);
  	        }
  	    }

		  public static String extractInvoiceNumberRegex(String pdfText,String key) {
		        // Use a regular expression to match the Invoice No. label and extract the value
		        // You may need to adjust the regular expression based on the actual format in your PDF
		        String regex = key + "\\s*:\\s*(.*?)(\\s|$)";
		        Pattern pattern = Pattern.compile(regex);
		        Matcher matcher = pattern.matcher(pdfText);

		        // Check if the pattern is found
		        if (matcher.find()) {	
		            return matcher.group(1);
		        } else {
		            // If the pattern is not found, return an empty string or handle it accordingly
		            return "";
		        }
		    }
		 public static String extractInvoiceNumber(String pdfText,String place) {
		        // Implement your logic to extract the invoice number
		        // For example, if the format is "{invoice.invNo} 12345", you can use regex or string manipulation
		        // to extract the number after the placeholder
		        String placeholder = "{"+place+"}";
		        System.out.println(placeholder);
		        int startIndex = pdfText.indexOf(placeholder) + placeholder.length();
		        int endIndex = pdfText.indexOf(" ", startIndex);
		        
//		        sys
		        
		        return pdfText.substring(startIndex-1, endIndex).trim();
		        
		    }
}

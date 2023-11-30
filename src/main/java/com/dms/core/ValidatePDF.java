package com.dms.core;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

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
}

package com.dms.core;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.KeyEvent;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Properties;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;

import com.dms.browserInstance.BrowserHandle;
import com.dms.logs.Logs;
import com.dms.utils.Constants;
import com.dms.utils.ExcelReader;
import com.dms.utils.ReadFromProperty;

public class CoreFunctions {
	
	public static String readConfig(String str) throws IOException 
	{
		ReadFromProperty readFromProperty;
		Properties prop;
		readFromProperty = new ReadFromProperty();
		prop = readFromProperty.property();
		String output = prop.getProperty(str);
		return output;
	}
	public static double taxCollectionRoundOff(double val) {
		 double numberToTruncate = val;

	        // Cast the double to an int to truncate the decimal part
	        int truncatedNumber = (int) (numberToTruncate * 100);

	        // Divide by 100.0 to shift the decimal back to the correct position
	        double result = truncatedNumber / 100.0;
			return result;
	}
	public static double roundOff(double val) {
		 val = Math.round(val * 100);
		 val = val/100;
		 return val;
	}
	   public static double formatAndConvertStringToDouble(String str) {
	        // Remove commas and decimal places
	        String cleanedStr = str.replaceAll("[^\\d.]", "");

	        // Split the string by the decimal point
//	        String[] parts = cleanedStr.split("\\.");

	        // Take only the integer part (before the decimal point)
	        return Double.parseDouble(cleanedStr);
	    }
	   public static double convertStringToDouble(String str) {
	    
	        return Double.parseDouble(str);
	    }
	   public static int convertStringToInt(String str) {
		    
	        return Integer.parseInt(str);
	    }
	
	public static String percent(String num,String per) {
		 int n=Integer.parseInt(num);
		 int p= Integer.parseInt(per);
		 
		 int perOfNo=(n*p)/100;
		 
		 return String.valueOf(perOfNo);
		
	}
	public static Double percent(Double num,Double per) {
		
		 
		 double perOfNo=(num*per);
		 
		 System.out.println("perrrr "+perOfNo);
		 
		 return perOfNo/100;
		
	}
	public static List<Map<String, String>> test(String sheetName) throws IOException, InvalidFormatException
    {
     List<Map<String, String>> testData = new ArrayList<>();
            ExcelReader reader = new ExcelReader();
            if (CoreFunctions.readConfig("environment").equalsIgnoreCase("dev")) {
            testData = reader.getData(Constants.DEV_TESTDATA_CSV, sheetName);
            }
            else if (CoreFunctions.readConfig("environment").equalsIgnoreCase("qa")) {
                testData = reader.getData(Constants.QA_TESTDATA_CSV, sheetName);
                }
            else if (CoreFunctions.readConfig("environment").equalsIgnoreCase("uat")) {
                    testData = reader.getData(Constants.UAT_TESTDATA_CSV, sheetName);
                }
    return testData;
    }

	public static String dateFormatterwithTime(String dateFromBE)
	{
		String outputDateStr = new String();
		SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MM/yyyy");
		try {
			Date date = inputDateFormat.parse(dateFromBE);
			outputDateStr = outputDateFormat.format(date);
			System.out.println("Formatted Date: " + outputDateStr);

		} catch (ParseException e) {
			System.err.println("Date parsing error: " + e.getMessage());
		}
		return outputDateStr;
	}
	public static String trim(String input) {
		String str=input.replaceAll("\\s+", " ");
		return str;
	}
	public static String dateFormatterwithoutTime(String dateFromBE)
	{
		String outputDateStr = new String();
		SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MM/yyyy");
		try {
			Date date = inputDateFormat.parse(dateFromBE);
			outputDateStr = outputDateFormat.format(date);
			System.out.println("Formatted Date: " + outputDateStr);

		} catch (ParseException e) {
			System.err.println("Date parsing error: " + e.getMessage());
		}
		return outputDateStr;
	}
	
	public static String date_mmddyyyy_FormatterwithoutTime(String dateFromBE)
	{
		String outputDateStr = new String();
		SimpleDateFormat inputDateFormat = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat outputDateFormat = new SimpleDateFormat("MM/dd/yyyy");
		try {
			Date date = inputDateFormat.parse(dateFromBE);
			outputDateStr = outputDateFormat.format(date);
			System.out.println("Formatted Date: " + outputDateStr);

		} catch (ParseException e) {
			System.err.println("Date parsing error: " + e.getMessage());
		}
		return outputDateStr;
	}
	public static String appendingStringValues(List<String> listValues){
		String s = "";
		for(int i=0;i<listValues.size();i++) {
			if(i==listValues.size()-1)
				s+="'"+listValues.get(i)+"'";
			else
				s+="'"+listValues.get(i)+"',";

		}
		return s;
	}
	
	public static String appendingIntegerValues(List<String> listValues){
		String s = "";
		for(int i=0;i<listValues.size();i++) {
			if(i==listValues.size()-1)
				s+=listValues.get(i);
			else
				s+=listValues.get(i)+",";

		}
		return s;
	}
	
	public static void click(WebElement element, String elementName) {
		Logs.logger.info("Clicking on " + elementName);
		try {
			element.click();
			Logs.logger.info("Pass:SuccessfuLogsy clicked on " + elementName);
		} catch (Exception e) {
			Logs.logger.info("Fail:Could not click on " + elementName);
			e.printStackTrace();
		}
	}

	public static void setText(WebElement element, String Text) {
//		click(element, Text);
		Logs.logger.info("Entering" + Text);
		try {
			element.sendKeys(Text);
			Logs.logger.info("Pass:" + Text + " is entered");
		} catch (Exception e) {
			Logs.logger.info("Fail:Unable to set text: " + Text);
			e.printStackTrace();
		}
	}

	public static void clearText(WebElement element) {
		try {element.clear();
		Logs.logger.info("Pass: is clear");
		} 
		catch (Exception e) 
		{
			Logs.logger.info("Fail:Unable to clear text: " );
			e.printStackTrace();
		}
	}
	public static String getElementText(WebElement element) {
		Logs.logger.info("Getting Element Text");
		String text = "";
		try {
			text = element.getText().trim();
			Logs.logger.info("Pass:Text is:" + text);
		} catch (Exception e) {
			Logs.logger.info("Could not get text");
			e.printStackTrace();
		}
		return text;
	}
	public static String getElementAttribute(WebElement element,String attrs) {
		Logs.logger.info("Getting Element Attribute");
		String text = "";
		try {
			text = element.getAttribute(attrs);
			Logs.logger.info("Pass: Attribute value is :" + text);
		} catch (Exception e) {
			Logs.logger.info("Could not found any such attribute");
			e.printStackTrace();
		}
		return text;
	}

//	public static void moveToElement(WebElement element) {
//		Actions move = new Actions(BrowserHandle.getDriver());
//		Logs.logger.info("Moving to " + element.getText() + " element ");
//		move.moveToElement(element);
//		move.perform();
//		Logs.logger.info("Pass: Moved to element " + element.getText());
//	}

	public static void selectDate(WebDriver driver, String targetDate) throws Exception {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat targetDateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date formattedTargetDate;
//		try {
			targetDateFormat.setLenient(false);
			formattedTargetDate = targetDateFormat.parse(targetDate);
			calendar.setTime(formattedTargetDate);
			System.out.println("formared date is "+formattedTargetDate);

			int targetDay = calendar.get(Calendar.DAY_OF_MONTH);
			int targetMonth = calendar.get(Calendar.MONTH)+1;
			int targetYear = calendar.get(Calendar.YEAR);
//			int targetDay = 18;
//			int targetMonth = 10;
//					int targetYear = 2023;
			System.out.println("targetDay "+targetDay+" targetMonth "+targetMonth+" targetYear "+targetYear);

			String actualDate = driver.findElement(By.cssSelector("span[class='mdc-button__label'] span[aria-hidden='true']")).getText();
			calendar.setTime(new SimpleDateFormat("MMM yyyy").parse(actualDate));
			int actualMonth = calendar.get(Calendar.MONTH)+1;
			int actualYear = calendar.get(Calendar.YEAR);
            System.out.println("acual date"+ actualDate +"  actualMonth "+actualMonth+" actualYear "+actualYear);
			while (targetMonth < actualMonth || targetYear < actualYear) {
				driver.findElement(By.xpath("//button[contains(@class,'mat-calendar-previous-button')]")).click();
				actualDate = driver.findElement(By.cssSelector("span[class='mdc-button__label'] span[aria-hidden='true']")).getText();
				if(actualDate.contains("SEPT"))
				{
					actualDate=	actualDate.replace("SEPT", "SEP");
				}
				calendar.setTime(new SimpleDateFormat("MMM yyyy").parse(actualDate));
				actualMonth = calendar.get(Calendar.MONTH)+1;
				actualYear = calendar.get(Calendar.YEAR);
			}

			while (targetMonth > actualMonth || targetYear > actualYear) {
				driver.findElement(By.xpath("//button[contains(@class,'mat-calendar-next-button')]")).click();
				actualDate = driver.findElement(By.cssSelector("span[class='mdc-button__label'] span[aria-hidden='true']")).getText();
				if(actualDate.contains("SEPT"))
				{
					actualDate=	actualDate.replace("SEPT", "SEP");
				}
				calendar.setTime(new SimpleDateFormat("MMM yyyy").parse(actualDate));
				actualMonth = calendar.get(Calendar.MONTH)+1;
				actualYear = calendar.get(Calendar.YEAR);
			}

			driver.findElement(By.xpath(
					"//table[contains(@class,'mat-calendar-table')]//td[not(contains(@class,'mat-calendar-body-label'))]//span[text()=' " + targetDay + " ']"))
			.click();
//		} catch (ParseException e) {
//			throw new Exception("Invalid date is provided, please check input date");
//		}
	}

	public static boolean waitUntilElementDisplayed(WebElement locator, int timeoutSec) {
        boolean elementVisible = locator.isDisplayed();
        int timer = 0;
        while (!elementVisible && timer < timeoutSec) {
            try {
            	Logs.logger.info("Wait for the element to be displayed");
                Thread.sleep(1000);
                elementVisible = locator.isDisplayed();
                timer++;

            } catch (Exception e) {
            	Logs.logger.info("Wait for the element to be displayed");
                System.out.println(locator + "was not visible.");
            }
        }
        return elementVisible;
    }
	public static String waitUntilAttrAvailable(WebElement locator, int timeoutSec,String attr) {
        boolean elementVisible = locator.isDisplayed();
        String value=locator.getAttribute(attr);
        int timer = 0;
        while (timer < timeoutSec && value.isEmpty()) {
            try {
            	Logs.logger.info("Wait for the element to be displayed");
                Thread.sleep(1000);
                elementVisible = locator.isDisplayed();
               value= locator.getAttribute(attr);
                timer++;

            } catch (Exception e) {
            	Logs.logger.info("Wait for the element to be displayed");
                System.out.println(locator + "was not visible.");
            }
        }
        return value;
    }
	
	public static void moveToElement (WebElement element) throws InterruptedException {
		Actions ac=new Actions(BrowserHandle.getDriver());
		ac.moveToElement(element).build().perform();
		Thread.sleep(4000);
	}

	public static double round(double value, int places) {
        if (places < 0) throw new IllegalArgumentException();
 
        BigDecimal bd = BigDecimal.valueOf(value);
        bd = bd.setScale(places, RoundingMode.HALF_UP);
 
        return bd.doubleValue();
    }

	
	
	public static int validateExportedSaleRegisterExcel() throws IOException {
		// TODO Auto-generated method stub
		Path dir = Paths.get(System.getProperty("user.dir") + "\\Downloads");  // specify your directory
		//Path dir = Paths.get("C:\\Users\\sprakash01\\Downloads"); 
		Optional<Path> lastFilePath = Files.list(dir)    // here we get the stream with full directory listing
		    .filter(f -> !Files.isDirectory(f))  // exclude subdirectories from listing
		    .max(Comparator.comparingLong(f -> f.toFile().lastModified()));  // finally get the last file using simple comparator by lastModified field

		System.out.println(lastFilePath);
		if ( lastFilePath.isPresent() ) // your folder may be empty
		{
			
		} 
		List<List<String>> records = new ArrayList<>();
		String result = lastFilePath.stream()
	              .findFirst()  // returns Optional
	              .map(Object::toString)
	              .orElse("");	
		
		
		try (BufferedReader br = new BufferedReader(new FileReader(result))) {
		    String line;
		   
		    while ((line = br.readLine()) != null) {
		        String[] values = line.split(",");
		        System.out.println(values);
		        records.add(Arrays.asList(values));
		        
		    }
		    
		    
		}
		
		System.out.println(records.size());
		return records.size();
	}
	
	
	public static Integer validateExportedOnlineReportExcel() throws IOException {
		// TODO Auto-generated method stub
		Path dir = Paths.get(System.getProperty("user.dir") + "\\Downloads");  // specify your directory
		//Path dir = Paths.get("C:\\Users\\sprakash01\\Downloads"); 
		Optional<Path> lastFilePath = Files.list(dir)    // here we get the stream with full directory listing
		    .filter(f -> !Files.isDirectory(f))  // exclude subdirectories from listing
		    .max(Comparator.comparingLong(f -> f.toFile().lastModified()));  // finally get the last file using simple comparator by lastModified field

		System.out.println(lastFilePath);
		if ( lastFilePath.isPresent() ) // your folder may be empty
		{
			
		} 
		List<List<String>> records = new ArrayList<>();
		String result = lastFilePath.stream()
	              .findFirst()  // returns Optional
	              .map(Object::toString)
	              .orElse("");	
		
		Integer sum=0;
		try (BufferedReader br = new BufferedReader(new FileReader(result))) {
		    String line;
		    List<Integer> invoiceCountList =  new ArrayList<Integer>();
		    while ((line = br.readLine()) != null) {
		        String[] values = line.split(",");
		       
		        records.add(Arrays.asList(values));
		        
		    }
		    for(int i=0;i<records.size();i++)
	        {
		    	//System.out.println(records.get(i));
		    	if(i>0)
		    	{
		    		
		    		invoiceCountList.add(Integer.parseInt( records.get(i).get(8).substring(1, records.get(i).get(8).length()-1)));
		    		//System.out.println(Integer.parseInt( records.get(i).get(8).substring(1, records.get(i).get(8).length()-1)));
		    				    		
		    	}
	        	
	        }
		    for(Integer count: invoiceCountList)
		    {
		    	System.out.println(count);
		    	sum+=count;
		    }
		}

		return sum;
	}
	
	
	public static void clickTabKey() throws AWTException
	{
		Robot robot = new Robot();
		robot.keyPress(KeyEvent.VK_TAB);
		robot.keyRelease(KeyEvent.VK_TAB);
		
	}
	
	
	public static String appendStringForQuery(String value)
	{
		List<String> valueList = Arrays.asList( value.split(","));
		String valueForQuery = new String();
		for(int i =0;i<valueList.size();i++)
		{
			if(i<valueList.size()-1)
				valueForQuery+="'"+valueList.get(i)+"'"+",";
			else
				valueForQuery+="'"+valueList.get(i)+"'";
		}
		
		System.out.println(valueForQuery);
		return valueForQuery;
	}
	
	
	public static String appendStringForQuery(List<String> valueList)
	{
		String valueForQuery = new String();
		for(int i =0;i<valueList.size();i++)
		{
			if(i<valueList.size()-1)
				valueForQuery+="'"+valueList.get(i)+"'"+",";
			else
				valueForQuery+="'"+valueList.get(i)+"'";
		}
		
		System.out.println(valueForQuery);
		return valueForQuery;
	}
}

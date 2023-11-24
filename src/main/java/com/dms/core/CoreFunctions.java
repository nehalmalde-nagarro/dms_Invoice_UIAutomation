package com.dms.core;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
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
	
	public static List<Map<String, String>> test(String sheetName)
    {
     List<Map<String, String>> testData = new ArrayList<>();
            ExcelReader reader = new ExcelReader();
        try {
            testData = reader.getData(Constants.TESTDATA_CSV, sheetName);
        } 
        catch (InvalidFormatException | IOException e) {
            e.printStackTrace();
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

	
}

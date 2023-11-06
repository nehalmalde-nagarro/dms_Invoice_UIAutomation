package com.dms.utils;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.dms.browserInstance.BrowserHandle;
import com.dms.logs.Logs;

public class PageUtil {

	public static WebElement findBy(By webLocator) {

		Logs.logger.info("finding Web element " + webLocator);
		WebElement temp_android = (WebElement) BrowserHandle.getDriver().findElement(webLocator);
		return temp_android;

	}

	public static List<WebElement> findBys(By webLocator) {	

		Logs.logger.info("finding Webelements " + webLocator);
		List<WebElement> temp_android = BrowserHandle.getDriver().findElements(webLocator);
		return temp_android;


	}
}

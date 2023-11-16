package com.dms.runner;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;

@CucumberOptions(features = { "src/test/java/com/dms/featurefiles/" }, glue = { "com.dms.stepdefinitions",
		"com.dms.apphooks" }, plugin = { "com.aventstack.extentreports.cucumber.adapter.ExtentCucumberAdapter:" },
			tags="@FinancialInfo",
		dryRun = true

)

public class TestRunner extends AbstractTestNGCucumberTests {

}
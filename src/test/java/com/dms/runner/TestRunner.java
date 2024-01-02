package com.dms.runner;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;

@CucumberOptions(features = { "src/test/java/com/dms/featurefiles/" }, glue = { "com.dms.stepdefinitions",
		"com.dms.apphooks" }, plugin = {
				"com.aventstack.extentreports.cucumber.adapter.ExtentCucumberAdapter:" },
		tags = "@BS30 or @BS31 or @BS32 or @BS33 or @BS34 or @BS35 or @BS36 or @BS37 or @BS38 or @BS39", dryRun = false

)

public class TestRunner extends AbstractTestNGCucumberTests {

}
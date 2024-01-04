package com.dms.utils;

public class Constants {
	
	
	public static final String WORKING_DIRECTORY = System.getProperty("user.dir");

	public final static String EXTENT_REPORT_DIRECTORY=WORKING_DIRECTORY+"\\Reports\\Spark\\ExtentSpark.html";
	public final static String LOG_PROPERTIES_PATH = WORKING_DIRECTORY + "/src/test/resources/log4j.properties";
    public final static String BROWSER_CONFIG_PATH=WORKING_DIRECTORY+"/src/test/resources/browser-config.properties";
    public final static String DEV_TESTDATA_CSV=WORKING_DIRECTORY+"/src/test/resources/DEV_TestData.xlsx";
    public final static String QA_TESTDATA_CSV=WORKING_DIRECTORY+"/src/test/resources/QA_TestData.xlsx";
    public final static String UAT_TESTDATA_CSV=WORKING_DIRECTORY+"/src/test/resources/UAT_TestData.xlsx";

//    public final static String INVOICE_PDF="file:///"+WORKING_DIRECTORY+"/src/test/resources/inv_ind.pdf";
    public final static String INVOICE_PDF="C:\\Users\\tanugupta02\\Downloads\\VSL-23002081.pdf";

}
//file:///C:/Users/sprakash01/Downloads/inv_ind.pdf
package com.dms.dbconfig;

import java.util.List;

import com.dms.core.CoreFunctions;

public class Query {
	

	static String query;
	public static int dealer_Code=12356;
	public static int principal_map_cd=1;
	public static String LOC_CD="GRN";
	public static String COMP_FA="PREM";
	static String ORDER_STATUS="A";
	public static String PARENT_GROUP="PREM";
	

	public static String get_dealer_map_code() throws Exception {
		query = "(SELECT \"DEALER_MAP_CD\" FROM \"MULDMS\".\"SH_ORDBOOK\" where \"ORDER_NUM\" ='SOB23000623' and \"DEALER_MAP_CD\"="
				+ dealer_Code + ");";
		System.out.println(query);
		String dealer_map_code = ReadFromDB.getData(Database.MULDMS, query).get(0);
	
		return dealer_map_code;
	}
	public static String get_fields_From_ShOrderBook(String selectCol, String conditionCol, String conditionVal)
			throws Exception {
//		query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"SH_ORDBOOK\" where \"" + conditionCol + "\" ='"
//				+ conditionVal + "' and \"DEALER_MAP_CD\"=" + dealer_Code + ");";
		
		query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"SH_ORDBOOK\" where \"" + conditionCol + "\" = '"
                + conditionVal + "' AND \"DEALER_MAP_CD\" = " + dealer_Code + " AND \"LOC_CD\" = '" + LOC_CD
                + "' AND \"COMP_FA\" = '" + COMP_FA + "' AND \"PARENT_GROUP\" = '" + PARENT_GROUP + "' AND \"ORDER_STATUS\" = '" + ORDER_STATUS + "');";


		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}

	public static String get_fields_From_GM_CIN(String selectCol, String conditionCol, String conditionVal)
			throws Exception {
		query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"GM_CIN\" where \"" + conditionCol + "\" ='"
				+ conditionVal + "');";

		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}
	public static String get_fields_From_GM_CIN_by_Mobile(String selectCol, String conditionCol, String conditionVal)
			throws Exception {
		query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"GM_CIN\" where \"" + conditionCol + "\" like '%"
				+ conditionVal + "%');";

		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}
	
	
	// get column from shInvoice
	public static String get_fields_From_ShInvoice(String selectCol, String conditionCol, String conditionVal)
			throws Exception {
		query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"SH_INVOICE\" where \"" + conditionCol + "\" ='"
				+ conditionVal + "' and \"DEALER_MAP_CD\"=" + dealer_Code + ");";

		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}

	
	
	/*
	 * public static String allotmentNumber(String OrderNum) throws Exception {
	 * query =
	 * "(SELECT \"ALLOT_NUM\" FROM \"MULDMS\".\"SH_ORDBOOK\" where \"ORDER_NUM\" ='"
	 * + OrderNum + "' and \"DEALER_MAP_CD\"=" + dealer_Code + ");";
	 * System.out.println(query); String data = ReadFromDB.getData(Database.MULDMS,
	 * query).get(0); return data; }
	 * 
	 * public static String allotmentDate(String OrderNum) throws Exception { query
	 * =
	 * "(SELECT \"ALLOT_DATE\" FROM \"MULDMS\".\"SH_ORDBOOK\" where \"ORDER_NUM\" ='"
	 * + OrderNum + "' and \"DEALER_MAP_CD\"=" + dealer_Code + ");";
	 * System.out.println(query); String data = ReadFromDB.getData(Database.MULDMS,
	 * query).get(0); return data; }
	 */

	public static String customerName(String OrderNum) throws Exception {
		String custCode = get_fields_From_ShOrderBook("CUST_CD", "ORDER_NUM", OrderNum);
		String title = get_fields_From_GM_CIN("TITLE_CD", "CUST_CD", custCode);
		String custName = get_fields_From_GM_CIN("FULL_NAME", "CUST_CD", custCode);
		return title + " " + custName;
	}

	public static String mobileNumber(String OrderNum) throws Exception {
		String custCode = get_fields_From_ShOrderBook("CUST_CD", "ORDER_NUM", OrderNum);
		String mobileNo = get_fields_From_GM_CIN("MOBILE_PHONE", "CUST_CD", custCode);
		return mobileNo;
	}

	
	public static String cityDesc(String OrderNum) throws Exception {

		String cityCode = get_fields_From_ShOrderBook("CITY_CD", "ORDER_NUM", OrderNum);
		query = "(SELECT \"CITY_DESC\" FROM \"MULDMS\".\"GM_CITY\" where \"CITY_CD\" ='" + cityCode
				+ "\"PRINCIPAL_MAP_CD\" ='" + principal_map_cd + ");";
		System.out.println(query);
		String cityDesc = ReadFromDB.getData(Database.MULDMS, query).get(0);

		return cityDesc;
	}

	public static String corporateName(String OrderNum) throws Exception {

		String corporateCode = get_fields_From_ShOrderBook("CORPORATE", "ORDER_NUM", OrderNum);
		query = "(SELECT \"CP_NAME\" FROM \"MULDMS\".\"MUL_CORPORATE\" where \"CP_NUMBER\" ='" + corporateCode
				+ "\"PRINCIPAL_MAP_CD\" ='" + principal_map_cd + ");";
		System.out.println(query);
		String CName = ReadFromDB.getData(Database.MULDMS, query).get(0);

		return CName;
	}

	public static List<String> sellingPriceFor(String OrderNum) throws Exception {
		String locCode = get_fields_From_ShOrderBook("LOC_CD", "ORDER_NUM", OrderNum);
		query = "(SELECT \"MUL_FOR_CD\" FROM \"MULDMS\".\"SM_SPRICE_FOR_MAPPING\" where + \"DEALER_MAP_CD\"="
				+ dealer_Code + " AND \"LOC_CD\"='" + locCode + "');";
		System.out.println(query);
		List<String> sellingPriceCodeList = ReadFromDB.getData(Database.MULDMS, query);

		String s = CoreFunctions.appendingStringValues(sellingPriceCodeList);
		System.out.println(s);
		query = "(SELECT \"FOR_DESC\" FROM \"MULDMS\".\"GM_FOR\" where  \"FOR_CD\" IN (" + s + "));";
		System.out.println(query);
		List<String> sellingForDescList = ReadFromDB.getData(Database.MULDMS, query);
		return sellingForDescList;

	}

	// Get custCD based on invoice number
	public static String customerCodeBasisOFInvoice(String invoiceNum) throws Exception {
		String orderNum = get_fields_From_ShInvoice("ORDER_NUM", "INV_NUM", invoiceNum);
		String custCode = get_fields_From_ShOrderBook("CUST_CD", "ORDER_NUM", orderNum);
		return custCode;
	}

	public static String get_StateDesc(String OrderNum) throws Exception {
		String stateCD = get_fields_From_ShOrderBook("STATE_CD", "ORDER_NUM", OrderNum);
		query = "(SELECT \"STATE_DESC\" FROM \"MULDMS\".\"GM_STATE\" where \"STATE_CD\"='" + stateCD + "');";
		System.out.println(query);
		String getStateDesc = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return getStateDesc;
	}
	public static List<String> getAllOrderId() throws Exception {
		query = "(select s1_0.\"ORDER_NUM\",s1_0.\"CUST_CD\",g1_0.\"FULL_NAME\",g1_0.\"MOBILE_PHONE\",\r\n"
				+ "to_char(s1_0.\"ORDER_DATE\",'YYYY-MM-DD') from \"MULDMS\".\"SH_ORDBOOK\" s1_0\r\n"
				+ "join \"MULDMS\".\"GM_CIN\" g1_0\r\n"
				+ "on s1_0.\"CUST_CD\"=g1_0.\"CUST_CD\" where\"DEALER_MAP_CD\" = " + dealer_Code + ""
				+ " AND \"LOC_CD\" = '" + LOC_CD+"'"
				+ " AND \"COMP_FA\" = '" + COMP_FA +"'"
				+ " AND \"PARENT_GROUP\" = '" + PARENT_GROUP + "'"
				+ " AND \"ORDER_STATUS\" = '" + ORDER_STATUS + "' order by s1_0.\"ORDER_DATE\" desc limit 5);";
				
		System.out.println(query);
		List<String> count_CampName = ReadFromDB.getData(Database.MULDMS, query);
		return count_CampName;
	}
	
	
	public static String get_fields_From_GM_MOD(String selectCol, String conditionCol, String conditionVal)
			throws Exception {
		query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"GM_MOD\" where \"" + conditionCol + "\" ='"
				+ conditionVal + "');";
 
		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}
	public static String get_fields_From_GM_VAR(String selectCol, String conditionCol, String conditionVal)
			throws Exception {
		query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"GM_VAR\" where \"" + conditionCol + "\" ='"
				+ conditionVal + "');";
 
		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}
	
	public static String get_fields_From_GM_ECLR(String selectCol, String conditionCol, String conditionVal)
			throws Exception {
		query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"GM_ECLR\" where \"" + conditionCol + "\" ='"
				+ conditionVal + "');";
 
		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}
	
	public static String get_fields_From_SD_GRN(String selectCol, String conditionCol, String conditionVal)
			throws Exception {
		query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"SD_GRN\" where \"" + conditionCol + "\" ='"
				+ conditionVal + "' AND \"DEALER_MAP_CD\" = " + dealer_Code + ");";
 
		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}
	
	// get column from STAllot
	public static String get_fields_From_STAllot(String selectCol, String conditionCol, String conditionVal) throws Exception {
//		query = "(SELECT \"" + column + "\" FROM \"MULDMS\".\"ST_ALLOT\" where \"ORDER_NUM\" ='" + orderNum
//				+ "' and \"DEALER_MAP_CD\"=" + dealer_Code + ");";
		query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"ST_ALLOT\" where \""+conditionCol+"\" ='" + conditionVal + "' );";
		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}
	
	public static String get_fields_From_SM_PRICE_FOR(String selectCol, String conditionCol, String conditionVal)
			throws Exception {
		query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"SM_SPRICE_FOR\" where \"" + conditionCol + "\" ='"
				+ conditionVal + "');";
 
		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}
	

//	public static List<String> countCampNameSearchedOnDashboard(String CampName) throws Exception {
//		query = "(select campaign_name from public.campaign_master where campaign_name ILIKE '" + CampName +"%')";
//		System.out.println(query);
//		List<String> count_CampName = ReadFromDB.getData(Database.COMMON_SUPERVISOR, query);
//		return count_CampName;
//	}

}

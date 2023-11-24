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
	public static String get_All_fields_From_GM_CIN(String selectCol, String conditionCol, String conditionVal)
			throws Exception {
		query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"GM_CIN\" where \"" + conditionCol + "\" ='"
				+ conditionVal + "');";

		System.out.println(query);
		List<String> data = ReadFromDB.getData(Database.MULDMS, query);
		
		return CoreFunctions.appendingStringValues(data);
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
	
	public static String get_fields_From_GM_VIN(String selectCol, String conditionCol, String conditionVal)
			throws Exception {
		query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"GM_VIN\" where \"" + conditionCol + "\" ='"
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
	public static String get_fields_From_NI_NEW_MINUS(String selectCol, String conditionCol, String conditionVal)
			throws Exception {
		query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"NI_NEW_MINS\" where \"" + conditionCol + "\" ='"
				+ conditionVal + "' limit 1);";
 
		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}
	
	public static String get_fields_From_POC_MSIL_GM_VIN(String selectCol, String conditionCol, String conditionVal)
			throws Exception {
		query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"POC_MSIL_GM_VIN\" where \"" + conditionCol + "\" ='"
				+ conditionVal + "' limit 1);";
 
		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}
	
	public static String search_for_invoice(String selectCol, String conditionCol, String conditionVal)
			throws Exception {
		String query="( select s1_0.\""+selectCol+"\" from \"MULDMS\".\"SH_INVOICE\" s1_0 "
		  +"  join \"MULDMS\".\"GM_CIN\" g1_0 on s1_0.\"ORDER_PARTY_CD\" = g1_0.\"CUST_CD\" "
		   +" where "
			+"s1_0.\""+conditionCol+"\" = '"+conditionVal+"'"
			+"and s1_0.\"DEALER_MAP_CD\" = "+dealer_Code+" )";
 
		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}
	
	public static String search_for_gmcin_for_invoice(String selectCol, String conditionCol, String conditionVal)
			throws Exception {
		String query="( select g1_0.\""+selectCol+"\" from \"MULDMS\".\"SH_INVOICE\" s1_0 "
		  +"  join \"MULDMS\".\"GM_CIN\" g1_0 on s1_0.\"ORDER_PARTY_CD\" = g1_0.\"CUST_CD\" "
		   +" where "
			+"s1_0.\""+conditionCol+"\" = '"+conditionVal+"'"
			+"and s1_0.\"DEALER_MAP_CD\" = "+dealer_Code+" )";
 
		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}	
	public static String search_for_gmcin_for_invoice_mobile(String selectCol, String conditionCol, String conditionVal)
			throws Exception {
		String query="( select s1_0.\""+selectCol+"\" from \"MULDMS\".\"SH_INVOICE\" s1_0 "
		  +"  join \"MULDMS\".\"GM_CIN\" g1_0 on s1_0.\"ORDER_PARTY_CD\" = g1_0.\"CUST_CD\" "
		   +" where "
			+"g1_0.\""+conditionCol+"\" = '"+conditionVal+"'"
			+"and s1_0.\"DEALER_MAP_CD\" = "+dealer_Code+" )";
 
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
	
	public static String get_fields_From_GD_LOYALTY_ENROL(String selectCol, String conditionCol1, String conditionVal1,String conditionCol2, String conditionVal2)
			throws Exception {
		
		
		//select "CHANNEL"  from "MULDMS"."GD_LOYALTY_ENROL" where "REG_MOBILE" ='9425204904' and "CARD_TYPE" ='R' and "CARD_STATUS" not in ('C', 'S');
		
		
		
		query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"GD_LOYALTY_ENROL\" where \"" + conditionCol1 + "\" ='"
				+ conditionVal1 + "' AND \""+conditionCol2+"\" = '" + conditionVal2 + "' and \"CARD_STATUS\" not in ('C', 'S'));";
 
		
		
		
		
		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}	
	
	public static String get_fields_From_GM_LOYALTY_MASTER(String selectCol, String conditionCol1, String conditionVal1,String conditionCol2, String conditionVal2,String conditionCol3, String conditionVal3)
			throws Exception {
		
		
		//select "CHANNEL"  from "MULDMS"."GD_LOYALTY_ENROL" where "REG_MOBILE" ='9425204904' and "CARD_TYPE" ='R' and "CARD_STATUS" not in ('C', 'S');
		
		
		
		query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"GM_LOYALTY_MASTER\" WHERE \"" + conditionCol1 + "\" = '" + conditionVal1 + "' AND \"" + conditionCol2 + "\" = '" + conditionVal2 + "' AND \""+conditionCol3+"\" = '" + conditionVal3 + "'  AND \"START_DATE\" <= CURRENT_DATE AND (\"END_DATE\" >= CURRENT_DATE OR \"END_DATE\" IS NULL));";
		
		
		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}	
	public static String search_for_gmcin_for_stateCD(String selectCol, String conditionCol1, String conditionVal1)
			throws Exception {
		String query="( select cin.\""+selectCol+"\" from \"MULDMS\".\"SH_ORDBOOK\" sh "
		  +"  join \"MULDMS\".\"GM_CIN\" cin on sh.\"ORDER_PARTY_CD\" = cin.\"CUST_CD\" "
		   +" where "
			+conditionCol1+"\" = '"+conditionVal1+"'"
			+"and LOC_CD\" = '"+LOC_CD+"'"
			+"and DEALER_MAP_CD\" = "+dealer_Code+" )";
 
		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}	
	
	public static String get_fields_From_AM_DEALER_LOC(String selectCol)
			throws Exception {
		
		
		//query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"AM_DEALER_LOC\" where \"" + conditionCol + "\" ='"
	//			+ conditionVal + "' and \"DEALER_MAP_CD\"=" + dealer_Code + ");";
		
		query = "(SELECT \"" + selectCol + "\" FROM \"MULDMS\".\"SH_ORDBOOK\" where \"LOC_CD\" ='"+ LOC_CD + "' and \"DEALER_MAP_CD\"="
				+ dealer_Code + ");";
		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}	
	
	public static String fetch_loyalty_exchange_benefits(String orderId) throws Exception {
		String text=get_fields_From_ShOrderBook("CUST_CD", "ORDER_NUM", orderId);
		String mobileNo=get_fields_From_GM_CIN("MOBILE_PHONE", "CUST_CD", text);
		query="(\r\n"
				+ "SELECT \"MULDMS\".\"GD_LOYALTY_ENROL\".\"CARD_NUM\" "
				+ "FROM \"MULDMS\".\"GD_LOYALTY_ENROL\" JOIN \"MULDMS\".\"AM_LIST_RANGE\"\r\n"
				+ "ON \"MULDMS\".\"GD_LOYALTY_ENROL\".\"CARD_TYPE\" =\"MULDMS\".\"AM_LIST_RANGE\".\"LIST_CODE\"\r\n"
				+ "AND \"MULDMS\".\"AM_LIST_RANGE\".\"LIST_GRP_CODE\" =\"MULDMS\".\"GD_LOYALTY_ENROL\".\"CHANNEL\"\r\n"
				+ "WHERE \"MULDMS\".\"GD_LOYALTY_ENROL\".\"REG_MOBILE\" in\r\n"
				+ "(SELECT \"REG_MOBILE\"  FROM \"MULDMS\".\"GD_LOYALTY_ENROL\"\r\n"
				+ "WHERE \"REG_MOBILE\" in ('"+mobileNo+"'))\r\n"
				+ "AND \"MULDMS\".\"GD_LOYALTY_ENROL\".\"CARD_STATUS\"  in ('P')\r\n"
				+ "AND \"MULDMS\".\"AM_LIST_RANGE\".\"PRINCIPAL_MAP_CD\" =1\r\n"
				+ "AND \"MULDMS\".\"AM_LIST_RANGE\".\"LIST_NAME\" ='CARD_TYPE')";
		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}
	
	public static String get_entire_order_count()
			throws Exception {
		String query="( select count(*) from \"MULDMS\".\"SH_ORDBOOK\" sh "
		  +"  join \"MULDMS\".\"GM_CIN\" cin on sh.\"CUST_CD\" = cin.\"CUST_CD\" "
		   +" where "
			+"  \"ORDER_STATUS\" = '"+ORDER_STATUS+"'"
			+" and \"PARENT_GROUP\" = '"+PARENT_GROUP+"' "
			+" and \"LOC_CD\" = '"+LOC_CD+"'"
			+" and \"DEALER_MAP_CD\" = "+dealer_Code+" )";
 
		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}
	
	
	public static String get_order_count_based_on_dates(String fromDate, String toDate)
			throws Exception {
//		String query="(select count(*) from \"MULDMS\".\"SH_ORDBOOK\" sh "
//		  +"  join \"MULDMS\".\"GM_CIN\" cin on sh.\"CUST_CD\" = cin.\"CUST_CD\" "
//		   +" where "
//			
//			+"and ORDER_STATUS\" = '"+ORDER_STATUS+"'"
//			+"and PARENT_GROUP\" = "+PARENT_GROUP+" "
//			+"and LOC_CD\" = '"+LOC_CD+"'"
//			+"and DEALER_MAP_CD\" = "+dealer_Code+" "
//			+conditionCol1+"\" >= '"+conditionVal1+" 00:00:00'"
//			+conditionCol2+"\" <= '"+conditionVal2+" 24:00:00'')";
		
String query="(\r\n"
		+ "select count(*) from \"MULDMS\".\"SH_ORDBOOK\" sh join \"MULDMS\".\"GM_CIN\" cin on sh.\"CUST_CD\"= cin.\"CUST_CD\"  where \"DEALER_MAP_CD\"=12356 and \"LOC_CD\"='GRN' and\r\n"
		+ "\"PARENT_GROUP\"='PREM' and \"ORDER_STATUS\"='A' and \"COMP_FA\"='PREM' "
		+ "and \"ORDER_DATE\">='"+fromDate+" 00:00:00' and \"ORDER_DATE\"<='"+toDate+" 24:00:00'\r\n"
		+ ")";
 
		System.out.println(query);
		String data = ReadFromDB.getData(Database.MULDMS, query).get(0);
		return data;
	}

}

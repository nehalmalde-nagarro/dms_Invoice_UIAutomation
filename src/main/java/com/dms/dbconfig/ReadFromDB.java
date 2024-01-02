package com.dms.dbconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.dms.core.CoreFunctions;
import com.dms.utils.ReadFromProperty;

public class ReadFromDB extends ReadFromProperty {

	ReadFromProperty r=new ReadFromProperty();

	public static final Logger Log =  LogManager.getLogger(ReadFromDB.class);
		
		public static List<String> getData(String dbName, String query) throws Exception 
		{	
			Class.forName("org.postgresql.Driver");
			System.out.println("DB_Name: "+dbName);
			Log.info("Executing query: " + query);
			List<String> reqData = new ArrayList<>();
			Connection connection = null;
			if (CoreFunctions.readConfig("environment").equalsIgnoreCase("qa"))
			 connection=DBConnectionUtils.forQA(dbName);
			if (CoreFunctions.readConfig("environment").equalsIgnoreCase("dev"))
				 connection=DBConnectionUtils.forDEV(dbName);
			if (CoreFunctions.readConfig("environment").equalsIgnoreCase("uat"))
				 connection=DBConnectionUtils.forUAT(dbName);

			try (PreparedStatement stm = connection.prepareStatement(query)) {
				try (ResultSet resultSet = stm.executeQuery()) {
					while (resultSet.next()) {
						reqData.add(resultSet.getString(1));
					}
				}

			} catch (SQLException e1) {
				Log.error(e1.getMessage());
			}

			return reqData;
		}
		
}

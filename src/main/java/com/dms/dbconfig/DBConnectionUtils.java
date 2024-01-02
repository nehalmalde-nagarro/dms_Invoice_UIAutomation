package com.dms.dbconfig;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.dms.logs.Logs;

public class DBConnectionUtils{

	public static Connection forQA(String dbName) throws SQLException
	{
		Connection connection=null;
		switch (dbName)
		{
		case Database.MULDMS:
			connection = DriverManager.getConnection(Database.QA.URL, Database.QA.MULDMS.USERNAME, Database.QA.MULDMS.PASSWORD);

			break;
//		case Database.COMMON_SUPERVISOR:
//			connection = DriverManager.getConnection(Database.QA.URL+dbName, Database.QA.COMMON_SUPERVISOR.USERNAME, Database.QA.COMMON_SUPERVISOR.PASSWORD);
//
//			break;

		default:
			Logs.logger.error("Enter correct Database name");
			break;
		}
		return connection;
	}
	public static Connection forDEV(String dbName) throws SQLException
	{
		Connection connection=null;
		switch (dbName)
		{
		case Database.MULDMS:
			connection = DriverManager.getConnection(Database.DEV.URL, Database.DEV.MULDMS.USERNAME, Database.DEV.MULDMS.PASSWORD);

			break;
//		case Database.COMMON_SUPERVISOR:
//			connection = DriverManager.getConnection(Database.QA.URL+dbName, Database.QA.COMMON_SUPERVISOR.USERNAME, Database.QA.COMMON_SUPERVISOR.PASSWORD);
//
//			break;

		default:
			Logs.logger.error("Enter correct Database name");
			break;
		}
		return connection;
	}
	public static Connection forUAT(String dbName) throws SQLException
	{
		Connection connection=null;
		switch (dbName)
		{
		case Database.MULDMS:
			connection = DriverManager.getConnection(Database.UAT.URL, Database.UAT.MULDMS.USERNAME, Database.UAT.MULDMS.PASSWORD);

			break;
//		case Database.COMMON_SUPERVISOR:
//			connection = DriverManager.getConnection(Database.QA.URL+dbName, Database.QA.COMMON_SUPERVISOR.USERNAME, Database.QA.COMMON_SUPERVISOR.PASSWORD);
//
//			break;

		default:
			Logs.logger.error("Enter correct Database name");
			break;
		}
		return connection;
	}


}

package com.dms.dbconfig;

public class Database {

	public static final String MULDMS = "MULDMS";

//	public static final String COMMON_SUPERVISOR = "common-supervisor";
	
	
	
	public static final class QA {

		public static final String URL = "jdbc:postgresql://localhost:6969/postgres";
		public static final class MULDMS {
			public static final String USERNAME = "nagarro_read_write";
			public static final String PASSWORD = "nagarro_read_write";
		}
		
		
	}
	public static final class DEV {

		public static final String URL = "jdbc:postgresql://localhost:6868/postgres";
		public static final class MULDMS {
			public static final String USERNAME = "nagarro_read_write";
			public static final String PASSWORD = "nagarro_read_write";
		}
		
		
	}
	
	public static final class UAT {

		public static final String URL = "jdbc:postgresql://dms-data-replication-cluster1-uat-cluster-cluster.cluster-chmfomtejoqu.ap-south-1.rds.amazonaws.com:5432/DMSPROD2";
		public static final class MULDMS {
			public static final String USERNAME = "nagarro_read_write";
			public static final String PASSWORD = "nagarro_read_write";
		}

		
	}
	

}

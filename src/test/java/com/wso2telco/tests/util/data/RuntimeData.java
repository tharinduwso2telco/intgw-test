package com.wso2telco.tests.util.data;

import java.io.Serializable;

// TODO: Auto-generated Javadoc
/**
 * The Class RuntimeData.
 */
public class RuntimeData implements Serializable {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3838056876100503589L;
	
	/** The runtime query. */
	private static String runtimeQuery;
	
	/** The download excel. */
	private static String downloadExcel;

	/**
	 * Gets the runtime query.
	 *
	 * @author SulakkhanaW
	 * @return the runtime query
	 */
	public String getRuntimeQuery() {
		return runtimeQuery;
	}

	/**
	 * Sets the runtime query.
	 *
	 * @author SulakkhanaW
	 * @param runtimeQuery the new runtime query
	 */
	public void setRuntimeQuery(String runtimeQuery) {
		RuntimeData.runtimeQuery = runtimeQuery;
	}

	/**
	 * Gets the download excel.
	 *
	 * @author SulakkhanaW
	 * @return the download excel
	 */
	public String getDownloadExcel() {
		return downloadExcel;
	}

	/**
	 * Sets the download excel.
	 *
	 * @author SulakkhanaW
	 * @param nbDownloadExcel the new download excel
	 */
	public void setDownloadExcel(String nbDownloadExcel) {
		RuntimeData.downloadExcel = nbDownloadExcel;
	}	
	
	/**
	 * Convert nb excel column name.
	 *
	 * @author SulakkhanaW
	 * @param columnName the column name
	 * @return the string
	 */
	public String convertExcelColumnName(String columnName){
		String returnName = null;
		if (!(columnName.isEmpty())) {
			switch (columnName) {
			case "Charging Plan":
				returnName = "Plan";
				break;
		
			case "Count":
				returnName = "Count";
				break;
		
			case "Usage Charge":
				returnName = "Usage Charge";
				break;
		
			case "Tax":
				returnName = "Tax";
				break;
		
			case "Credit":
				returnName = "Credit";
				break;

			case "Grand Total":
				returnName = "Grand Total";
				break;
					
			default:
				break;
			}
		}
		return returnName;
	}
}

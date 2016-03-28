package com.wso2telco.tests.util.data;

import java.io.Serializable;

public class RuntimeData implements Serializable {

	private static final long serialVersionUID = -3838056876100503589L;
	
	private static String runtimeQuery;
	
	private static String nbDownloadExcel;

	public String getRuntimeQuery() {
		return runtimeQuery;
	}

	public void setRuntimeQuery(String runtimeQuery) {
		RuntimeData.runtimeQuery = runtimeQuery;
	}

	public String getNbDownloadExcel() {
		return nbDownloadExcel;
	}

	public void setNbDownloadExcel(String nbDownloadExcel) {
		RuntimeData.nbDownloadExcel = nbDownloadExcel;
	}	
	
	/**
	 * Convert nb excel column name.
	 *
	 * @author SulakkhanaW
	 * @param columnName the column name
	 * @return the string
	 */
	public String convertNBExcelColumnName(String columnName){
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

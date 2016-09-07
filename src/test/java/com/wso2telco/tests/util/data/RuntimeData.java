package com.wso2telco.tests.util.data;

import java.io.Serializable;

// TODO: Auto-generated Javadoc

/**
 * The Class RuntimeData.
 */
public class RuntimeData implements Serializable {

    /**
     * The Constant serialVersionUID.
     */
    private static final long serialVersionUID = -3838056876100503589L;

    /**
     * The runtime query.
     */
    private static String runtimeQuery;

    /**
     * The download excel.
     */
    private static String downloadExcel;

    /**
     * Gets the runtime query.
     *
     * @return the runtime query
     * @author SulakkhanaW
     */
    public String getRuntimeQuery() {
        return runtimeQuery;
    }

    /**
     * Sets the runtime query.
     *
     * @param runtimeQuery the new runtime query
     * @author SulakkhanaW
     */
    public void setRuntimeQuery(String runtimeQuery) {
        RuntimeData.runtimeQuery = runtimeQuery;
    }

    /**
     * Gets the download excel.
     *
     * @return the download excel
     * @author SulakkhanaW
     */
    public String getDownloadExcel() {
        return downloadExcel;
    }

    /**
     * Sets the download excel.
     *
     * @param nbDownloadExcel the new download excel
     * @author SulakkhanaW
     */
    public void setDownloadExcel(String nbDownloadExcel) {
        RuntimeData.downloadExcel = nbDownloadExcel;
    }

    /**
     * Convert nb excel column name.
     *
     * @param columnName the column name
     * @return the string
     * @author SulakkhanaW
     */
    public String convertExcelColumnName(String columnName) {
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

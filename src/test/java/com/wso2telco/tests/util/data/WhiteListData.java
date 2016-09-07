package com.wso2telco.tests.util.data;

import java.io.Serializable;

/**
 * The Class WhiteListData.
 */
public class WhiteListData implements Serializable {

    /**
     * The Constant serialVersionUID.
     */
    private static final long serialVersionUID = -1230307494600088166L;

    /**
     * The min numberof number range.
     */
    private static String minNumberofNumberRange;

    /**
     * The max numberof number range.
     */
    private static String maxNumberofNumberRange;

    /**
     * The Redundent value.
     */
    private static String RedundentValue;

    /**
     * Gets the redundent value.
     *
     * @return the redundent value
     * @author IsuruM
     */
    public String getRedundentValue() {
        return RedundentValue;
    }

    /**
     * Sets the redundent value.
     *
     * @param redval the new redundent value
     * @author IsuruM
     */
    public void setRedundentValue(String redval) {
        WhiteListData.RedundentValue = redval;
    }

    /**
     * Gets the min numberof number range.
     *
     * @return the min numberof number range
     * @author IsuruM
     */
    public String getMinNumberofNumberRange() {
        return minNumberofNumberRange;
    }

    /**
     * Sets the min numberof number range.
     *
     * @param minNumberofNumberRange the new min numberof number range
     * @author IsuruM
     */
    public void setMinNumberofNumberRange(String minNumberofNumberRange) {
        WhiteListData.minNumberofNumberRange = minNumberofNumberRange;
    }

    /**
     * Gets the max numberof number range.
     *
     * @return the max numberof number range
     * @author IsuruM
     */
    public String getMaxNumberofNumberRange() {
        return maxNumberofNumberRange;
    }

    /**
     * Sets the max numberof number range.
     *
     * @param maxNumberofNumberRange the new max numberof number range
     * @author IsuruM
     */
    public void setMaxNumberofNumberRange(String maxNumberofNumberRange) {
        WhiteListData.maxNumberofNumberRange = maxNumberofNumberRange;
    }


}

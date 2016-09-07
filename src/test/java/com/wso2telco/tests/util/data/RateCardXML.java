package com.wso2telco.tests.util.data;

import java.io.Serializable;

/**
 * The Class RateCardXML.
 */
public class RateCardXML implements Serializable {

    /**
     * The Constant serialVersionUID.
     */
    private static final long serialVersionUID = 1L;

    /**
     * The rate card x ml.
     */
    private static String rateCardXMl;

    /**
     * Gets the rate card x ml.
     *
     * @return the rate card x ml
     * @author SulakkhanaW
     */
    public String getRateCardXMl() {
        return rateCardXMl;
    }

    /**
     * Sets the rate card x ml.
     *
     * @param rateCardXMl the new rate card x ml
     * @author SulakkhanaW
     */
    public void setRateCardXMl(String rateCardXMl) {
        RateCardXML.rateCardXMl = rateCardXMl;
    }

}

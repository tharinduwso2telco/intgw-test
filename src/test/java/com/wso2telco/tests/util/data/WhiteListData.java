package com.wso2telco.tests.util.data;

import java.io.Serializable;

public class WhiteListData implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1230307494600088166L;

	private static String minNumberofNumberRange; 
	
	private static String maxNumberofNumberRange;
	
	private static String RedundentValue;
	
	public  String getRedundentValue() {
		return RedundentValue;
	}

	public  void setRedundentValue(String redval) {
		WhiteListData.RedundentValue = redval;
	}
	
	public  String getMinNumberofNumberRange() {
		return minNumberofNumberRange;
	}

	public  void setMinNumberofNumberRange(String minNumberofNumberRange) {
		WhiteListData.minNumberofNumberRange = minNumberofNumberRange;
	}

	public  String getMaxNumberofNumberRange() {
		return maxNumberofNumberRange;
	}

	public  void setMaxNumberofNumberRange(String maxNumberofNumberRange) {
		WhiteListData.maxNumberofNumberRange = maxNumberofNumberRange;
	}

	
}

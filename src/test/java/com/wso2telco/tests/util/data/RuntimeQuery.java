package com.wso2telco.tests.util.data;

import java.io.Serializable;

public class RuntimeQuery implements Serializable {

	private static final long serialVersionUID = -3838056876100503589L;
	
	private static String runtimeQuery;

	public String getRuntimeQuery() {
		return runtimeQuery;
	}

	public void setRuntimeQuery(String runtimeQuery) {
		RuntimeQuery.runtimeQuery = runtimeQuery;
	}
	
}

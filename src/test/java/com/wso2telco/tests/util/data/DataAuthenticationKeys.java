package com.wso2telco.tests.util.data;

import java.io.Serializable;

/**
 * The Class DataAuthenticationKeys.
 */
public class DataAuthenticationKeys implements Serializable {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -2838583374830398202L;
	
	/** The production consumer key. */
	private static String productionConsumerKey;
	
	/** The prod consumer secret key. */
	private static String prodConsumerSecretKey;
	
	/** The sandbox consumer key. */
	private static String sandboxConsumerKey;
	
	/** The sandbox consumer secret key. */
	private static String sandboxConsumerSecretKey;

	/**
	 * Gets the production consumer key.
	 *
	 * @author SulakkhanaW
	 * @return the production consumer key
	 */
	public String getProductionConsumerKey() {
		return productionConsumerKey;
	}

	/**
	 * Sets the production consumer key.
	 *
	 * @author SulakkhanaW
	 * @param productionConsumerKey the new production consumer key
	 */
	public void setProductionConsumerKey(String productionConsumerKey) {
		DataAuthenticationKeys.productionConsumerKey = productionConsumerKey;
	}

	/**
	 * Gets the prod consumer secret key.
	 *
	 * @author SulakkhanaW
	 * @return the prod consumer secret key
	 */
	public String getProdConsumerSecretKey() {
		return prodConsumerSecretKey;
	}

	/**
	 * Sets the prod consumer secret key.
	 *
	 * @author SulakkhanaW
	 * @param prodConsumerSecretKey the new prod consumer secret key
	 */
	public void setProdConsumerSecretKey(String prodConsumerSecretKey) {
		DataAuthenticationKeys.prodConsumerSecretKey = prodConsumerSecretKey;
	}

	/**
	 * Gets the sandbox consumer key.
	 *
	 * @author SulakkhanaW
	 * @return the sandbox consumer key
	 */
	public String getSandboxConsumerKey() {
		return sandboxConsumerKey;
	}

	/**
	 * Sets the sandbox consumer key.
	 *
	 * @author SulakkhanaW
	 * @param sandboxConsumerKey the new sandbox consumer key
	 */
	public void setSandboxConsumerKey(String sandboxConsumerKey) {
		DataAuthenticationKeys.sandboxConsumerKey = sandboxConsumerKey;
	}

	/**
	 * Gets the sandbox consumer secret key.
	 *
	 * @author SulakkhanaW
	 * @return the sandbox consumer secret key
	 */
	public String getSandboxConsumerSecretKey() {
		return sandboxConsumerSecretKey;
	}

	/**
	 * Sets the sandbox consumer secret key.
	 *
	 * @author SulakkhanaW
	 * @param sandboxConsumerSecretKey the new sandbox consumer secret key
	 */
	public void setSandboxConsumerSecretKey(String sandboxConsumerSecretKey) {
		DataAuthenticationKeys.sandboxConsumerSecretKey = sandboxConsumerSecretKey;
	}

}

package com.wso2telco.tests.util.data;

import java.io.Serializable;

/**
 * The Class DataAuthenticationKeys.
 */
public class DataAuthenticationKeys implements Serializable {

    /**
     * The Constant serialVersionUID.
     */
    private static final long serialVersionUID = -2838583374830398202L;

    /**
     * The production consumer key.
     */
    private static String productionConsumerKey;

    /**
     * The prod consumer secret key.
     */
    private static String prodConsumerSecretKey;

    /**
     * The sandbox consumer key.
     */
    private static String sandboxConsumerKey;

    /**
     * The sandbox consumer secret key.
     */
    private static String sandboxConsumerSecretKey;

    /**
     * The production access token.
     */
    private static String productionAccessToken;

    /**
     * The producion regenerate acess token.
     */
    private static String producionRegenerateAcessToken;

    /**
     * The sandbox access token.
     */
    private static String sandboxAccessToken;

    /**
     * The sandbox regenerate access token.
     */
    private static String sandboxRegenerateAccessToken;


    /**
     * Gets the sandbox access token.
     *
     * @return the sandbox access token
     * @author SulakkhanaW
     */
    public String getSandboxAccessToken() {
        return sandboxAccessToken;
    }

    /**
     * Sets the sandbox access token.
     *
     * @param sandboxAccessToken the new sandbox access token
     * @author SulakkhanaW
     */
    public void setSandboxAccessToken(String sandboxAccessToken) {
        DataAuthenticationKeys.sandboxAccessToken = sandboxAccessToken;
    }

    /**
     * Gets the sandbox regenerate access token.
     *
     * @return the sandbox regenerate access token
     * @author SulakkhanaW
     */
    public String getSandboxRegenerateAccessToken() {
        return sandboxRegenerateAccessToken;
    }

    /**
     * Sets the sandbox regenerate access token.
     *
     * @param sandboxRegenerateAccessToken the new sandbox regenerate access token
     * @author SulakkhanaW
     */
    public void setSandboxRegenerateAccessToken(String sandboxRegenerateAccessToken) {
        DataAuthenticationKeys.sandboxRegenerateAccessToken = sandboxRegenerateAccessToken;
    }

    /**
     * Gets the production access token.
     *
     * @return the production access token
     * @author SulakkhanaW
     */
    public String getProductionAccessToken() {
        return productionAccessToken;
    }

    /**
     * Sets the production access token.
     *
     * @param productionAccessToken the new production access token
     * @author SulakkhanaW
     */
    public void setProductionAccessToken(String productionAccessToken) {
        DataAuthenticationKeys.productionAccessToken = productionAccessToken;
    }

    /**
     * Gets the producion regenerate acess token.
     *
     * @return the producion regenerate acess token
     * @author SulakkhanaW
     */
    public String getProducionRegenerateAcessToken() {
        return producionRegenerateAcessToken;
    }

    /**
     * Sets the producion regenerate acess token.
     *
     * @param producionRegenerateAcessToken the new producion regenerate acess token
     * @author SulakkhanaW
     */
    public void setProducionRegenerateAcessToken(String producionRegenerateAcessToken) {
        DataAuthenticationKeys.producionRegenerateAcessToken = producionRegenerateAcessToken;
    }

    /**
     * Gets the production consumer key.
     *
     * @return the production consumer key
     * @author SulakkhanaW
     */
    public String getProductionConsumerKey() {
        return productionConsumerKey;
    }

    /**
     * Sets the production consumer key.
     *
     * @param productionConsumerKey the new production consumer key
     * @author SulakkhanaW
     */
    public void setProductionConsumerKey(String productionConsumerKey) {
        DataAuthenticationKeys.productionConsumerKey = productionConsumerKey;
    }

    /**
     * Gets the prod consumer secret key.
     *
     * @return the prod consumer secret key
     * @author SulakkhanaW
     */
    public String getProdConsumerSecretKey() {
        return prodConsumerSecretKey;
    }

    /**
     * Sets the prod consumer secret key.
     *
     * @param prodConsumerSecretKey the new prod consumer secret key
     * @author SulakkhanaW
     */
    public void setProdConsumerSecretKey(String prodConsumerSecretKey) {
        DataAuthenticationKeys.prodConsumerSecretKey = prodConsumerSecretKey;
    }

    /**
     * Gets the sandbox consumer key.
     *
     * @return the sandbox consumer key
     * @author SulakkhanaW
     */
    public String getSandboxConsumerKey() {
        return sandboxConsumerKey;
    }

    /**
     * Sets the sandbox consumer key.
     *
     * @param sandboxConsumerKey the new sandbox consumer key
     * @author SulakkhanaW
     */
    public void setSandboxConsumerKey(String sandboxConsumerKey) {
        DataAuthenticationKeys.sandboxConsumerKey = sandboxConsumerKey;
    }

    /**
     * Gets the sandbox consumer secret key.
     *
     * @return the sandbox consumer secret key
     * @author SulakkhanaW
     */
    public String getSandboxConsumerSecretKey() {
        return sandboxConsumerSecretKey;
    }

    /**
     * Sets the sandbox consumer secret key.
     *
     * @param sandboxConsumerSecretKey the new sandbox consumer secret key
     * @author SulakkhanaW
     */
    public void setSandboxConsumerSecretKey(String sandboxConsumerSecretKey) {
        DataAuthenticationKeys.sandboxConsumerSecretKey = sandboxConsumerSecretKey;
    }

}

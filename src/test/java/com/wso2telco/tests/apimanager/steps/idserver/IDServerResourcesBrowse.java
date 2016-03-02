package com.wso2telco.tests.apimanager.steps.idserver;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.StringReader;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Source;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerFactoryConfigurationError;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.stream.StreamSource;

import org.junit.Assert;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.wso2telco.identityserver.pageobjects.carbon.CarbonResourceBrowse;
import com.wso2telco.tests.apimanager.base.BasicTestObject;
import com.wso2telco.tests.util.data.RateCardXML;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class IDServerResourcesBrowse extends BasicTestObject {
	
	@Then("^I should see the identity server Resources Browse page header as \"([^\"]*)\"$")
	public void i_should_see_the_identity_server_Resources_Browse_page_header_as(String arg1) throws Throwable {
		CarbonResourceBrowse browsePage = new CarbonResourceBrowse(driver);
		Assert.assertTrue("Resources Browse page not load properly", browsePage.isBrowsePage(arg1));
	}
	
	@When("^I search rate card by providing \"([^\"]*)\" location$")
	public void i_search_rate_card_by_providing_location(String arg1) throws Throwable {
		CarbonResourceBrowse browsePage = new CarbonResourceBrowse(driver);
		browsePage.serachRateCard(arg1);
	}
	
	@Then("^I should be able to search rate card$")
	public void i_should_be_able_to_search_rate_card() throws Throwable {
		CarbonResourceBrowse browsePage = new CarbonResourceBrowse(driver);
		Assert.assertTrue("Rate card did not search", browsePage.isRateCardSearch());
	}
	
	@When("^I click on rate card display as text link$")
	public void i_click_on_rate_card_display_as_text_link() throws Throwable {
		CarbonResourceBrowse browsePage = new CarbonResourceBrowse(driver);
		browsePage.clickDisplayAsText();
		String rateCardText = browsePage.getRateCard();
		RateCardXML rateCard = new RateCardXML();
		rateCard.setRateCardXMl(rateCardText);
		Document doc = handleXML(rateCard.getRateCardXMl());
		NodeList nodes = doc.getElementsByTagName("Operators");
		nodes.getLength();
	}
	
	public Document handleXML(String xml) throws TransformerConfigurationException, TransformerException, TransformerFactoryConfigurationError{
/*	    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	    DocumentBuilder builder = factory.newDocumentBuilder();
	    InputSource is = new InputSource(new StringReader(xml));
	    builder.parse(is);*/
/*	    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

	    factory.setNamespaceAware(true);
	    DocumentBuilder builder = factory.newDocumentBuilder();

	    builder.parse(new ByteArrayInputStream(xml.getBytes()));*/
/*		String asd = "ads";
		InputSource is= new InputSource(new StringReader(xml));
    	DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    	factory.setNamespaceAware(true);
    	DocumentBuilder builder = null;
    	builder = factory.newDocumentBuilder();
    	Document doc = builder.parse(is);*/
	    Source source = new StreamSource(new StringReader(xml));
	    DOMResult result = new DOMResult();
	    TransformerFactory.newInstance().newTransformer().transform(source , result);
	    return (Document) result.getNode();
	}

}

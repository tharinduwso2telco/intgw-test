package com.wso2telco.tests.util.data;

import org.apache.log4j.Logger;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

public class LocationDataValidation extends BasicTestObject {
	
	Logger logger = Logger.getLogger(LocationDataValidation.class);

	/** The address. */
	private static String address;
	
	/** The requested accuracy. */
	private static String requestedAccuracy;
	
	/** The altitude. */
	private static String altitude;
	
	/** The latitude. */
	private static String latitude;
	
	/** The longitude. */
	private static String longitude;
	
	/** The location retrieval status. */
	private static String locationRetrievalStatus;
	
	/**
	 * Gets the address.
	 *
	 * @author SulakkhanaW
	 * @return the address
	 */
	public static String getAddress() {
		return address;
	}

	/**
	 * Sets the address.
	 *
	 * @author SulakkhanaW
	 * @param address the new address
	 */
	public void setAddress(String address) {
		LocationDataValidation.address = address;
	}

	/**
	 * Gets the requested accuracy.
	 *
	 * @author SulakkhanaW
	 * @return the requested accuracy
	 */
	public static String getRequestedAccuracy() {
		return requestedAccuracy;
	}

	/**
	 * Sets the requested accuracy.
	 *
	 * @author SulakkhanaW
	 * @param requestedAccuracy the new requested accuracy
	 */
	public void setRequestedAccuracy(String requestedAccuracy) {
		LocationDataValidation.requestedAccuracy = requestedAccuracy;
	}

	/**
	 * Gets the altitude.
	 *
	 * @author SulakkhanaW
	 * @return the altitude
	 */
	public static String getAltitude() {
		return altitude;
	}

	/**
	 * Sets the altitude.
	 *
	 * @author SulakkhanaW
	 * @param altitude the new altitude
	 */
	public void setAltitude(String altitude) {
		LocationDataValidation.altitude = altitude;
	}

	/**
	 * Gets the latitude.
	 *
	 * @author SulakkhanaW
	 * @return the latitude
	 */
	public static String getLatitude() {
		return latitude;
	}

	/**
	 * Sets the latitude.
	 *
	 * @author SulakkhanaW
	 * @param latitude the new latitude
	 */
	public void setLatitude(String latitude) {
		LocationDataValidation.latitude = latitude;
	}

	/**
	 * Gets the longitude.
	 *
	 * @author SulakkhanaW
	 * @return the longitude
	 */
	public static String getLongitude() {
		return longitude;
	}

	/**
	 * Sets the longitude.
	 *
	 * @author SulakkhanaW
	 * @param longitude the new longitude
	 */
	public void setLongitude(String longitude) {
		LocationDataValidation.longitude = longitude;
	}

	/**
	 * Gets the location retrieval status.
	 *
	 * @author SulakkhanaW
	 * @return the location retrieval status
	 */
	public static String getLocationRetrievalStatus() {
		return locationRetrievalStatus;
	}

	/**
	 * Sets the location retrieval status.
	 *
	 * @author SulakkhanaW
	 * @param locationRetrievalStatus the new location retrieval status
	 */
	public void setLocationRetrievalStatus(String locationRetrievalStatus) {
		LocationDataValidation.locationRetrievalStatus = locationRetrievalStatus;
	}
	
	/**
	 * Checks if is altitude.
	 *
	 * @author SulakkhanaW
	 * @param altitude the altitude
	 * @return true, if is altitude
	 * @throws Exception the exception
	 */
	public boolean isAltitude(String altitudeVal) throws Exception{
		boolean flag = false;
		try {
			logger.debug("Validating location altitude");
			if (altitudeVal.equalsIgnoreCase(getAltitude())){
				flag = true;
				logger.debug("Location altitude matched");
			} else {
				logger.debug("Location altitude mismatched");
			}
		} catch (Exception e) {
			logger.debug("Exception While Validating location altitude 'isAltitude()'" + e.getMessage());
			throw new Exception("Exception While Validating location altitude 'isAltitude()'" + e.getLocalizedMessage());
		}
		return flag;
	}
	
	/**
	 * Checks if is latitude.
	 *
	 * @author SulakkhanaW
	 * @param latitudeVal the latitude val
	 * @return true, if is latitude
	 * @throws Exception the exception
	 */
	public boolean isLatitude(String latitudeVal) throws Exception{
		boolean flag = false;
		try {
			logger.debug("Validating location latitude");
			if (latitudeVal.equalsIgnoreCase(getAltitude())){
				flag = true;
				logger.debug("Location latitude matched");
			} else {
				logger.debug("Location latitude mismatched");
			}
		} catch (Exception e) {
			logger.debug("Exception While Validating location latitude 'isLatitude()'" + e.getMessage());
			throw new Exception("Exception While Validating location latitude 'isLatitude()'" + e.getLocalizedMessage());
		}
		return flag;
	}
	
	/**
	 * Checks if is longitude.
	 *
	 * @author SulakkhanaW
	 * @param longitudeVal the longitude val
	 * @return true, if is longitude
	 * @throws Exception the exception
	 */
	public boolean isLongitude(String longitudeVal) throws Exception{
		boolean flag = false;
		try {
			logger.debug("Validating location Longitude");
			if (longitudeVal.equalsIgnoreCase(getAltitude())){
				flag = true;
				logger.debug("Location Longitude matched");
			} else {
				logger.debug("Location Longitude mismatched");
			}
		} catch (Exception e) {
			logger.debug("Exception While Validating location Longitude 'isLongitude()'" + e.getMessage());
			throw new Exception("Exception While Validating location Longitude 'isLongitude()'" + e.getLocalizedMessage());
		}
		return flag;
	}
	
	/**
	 * Checks if is location retrieval status.
	 *
	 * @author SulakkhanaW
	 * @param LocationRetrievalStatusVal the location retrieval status val
	 * @return true, if is location retrieval status
	 * @throws Exception the exception
	 */
	public boolean isLocationRetrievalStatus(String LocationRetrievalStatusVal) throws Exception{
		boolean flag = false;
		try {
			logger.debug("Validating location Longitude");
			if (LocationRetrievalStatusVal.equalsIgnoreCase(getLocationRetrievalStatus())){
				flag = true;
				logger.debug("Location Retrieval Status matched");
			} else {
				logger.debug("Location Retrieval Status mismatched");
			}
		} catch (Exception e) {
			logger.debug("Exception While Validating location  Retrieval Status 'isLocationRetrievalStatus()'" + e.getMessage());
			throw new Exception("Exception While Validating  Location Retrieval Status 'isLocationRetrievalStatus()'" + e.getLocalizedMessage());
		}
		return flag;
	}
	
	/**
	 * Checks if is location response payload.
	 *
	 * @author SulakkhanaW
	 * @param json the json
	 * @return true, if is location response payload
	 */
	public boolean isLocationResponsePayload(String json){
		if (!getAddress().isEmpty()){
			String responseAddress = getValueFromJsonLocation("address", json);
			if (!responseAddress.equalsIgnoreCase(getAddress())){
				return false;
			}
		}
		if (!getLocationRetrievalStatus().isEmpty()){
			String responseLocationRetrievalStatus = getValueFromJsonLocation("locationRetrievalStatus", json);
			if (!responseLocationRetrievalStatus.equalsIgnoreCase(getLocationRetrievalStatus())){
				return false;
			}
		}
		if (!getAltitude().isEmpty()){
			String responseAltitude = getValueFromJsonLocation("altitude", json);
			if (!responseAltitude.equalsIgnoreCase(getAltitude())){
				return false;
			}
		}
		if (!getLongitude().isEmpty()){
			String responseLongitude = getValueFromJsonLocation("longitude", json);
			if (!responseLongitude.equalsIgnoreCase(getLongitude())){
				return false;
			}
		}
		if (!getLatitude().isEmpty()){
			String responseLatitude = getValueFromJsonLocation("latitude", json);
			if (!responseLatitude.equalsIgnoreCase(getLatitude())){
				return false;
			}
		}
		if (!getRequestedAccuracy().isEmpty()){
			String responseRequestedAccuracy = getValueFromJsonLocation("accuracy", json);
			if (!responseRequestedAccuracy.equalsIgnoreCase(getRequestedAccuracy())){
				return false;
			}
		}
		return true;
	}
	
	/**
	 * Gets the value from json location.
	 *
	 * @author SulakkhanaW
	 * @param tag the tag
	 * @param json the json
	 * @return the value from json location
	 */
	public String getValueFromJsonLocation(String tag, String json) {
		JsonElement jsonElement = new JsonParser().parse(json);
		JsonObject jsonObject = jsonElement.getAsJsonObject();
		String returnValue = null;
		switch (tag) {

		case "address":	
		case "locationRetrievalStatus":
			returnValue = getValueTerminalLocation(tag, jsonObject);
			break;
			
		case "altitude":
		case "longitude":
		case "latitude":
		case "accuracy":
			returnValue = getValueCurrentLocation(tag, jsonObject);
			break;
			
		default:
			break;
		}
		return returnValue;
	}
	
	/**
	 * Gets the value terminal location.
	 *
	 * @author SulakkhanaW
	 * @param tag the tag
	 * @param jsonObject the json object
	 * @return the value terminal location
	 */
	private String getValueTerminalLocation(String tag, JsonObject jsonObject){
		jsonObject = jsonObject.getAsJsonObject("terminalLocationList");
		jsonObject = jsonObject.getAsJsonObject("terminalLocation");
		String returnValue = jsonObject.get(tag).toString();
		String firstCharacter = Character.toString(returnValue.charAt(0));
		if (firstCharacter.equalsIgnoreCase("\"")){
			returnValue = returnValue.substring(1, returnValue.length()-1);
		}
		return returnValue;
	}
	

	
	private String getValueCurrentLocation(String tag, JsonObject jsonObject){
		jsonObject = jsonObject.getAsJsonObject("terminalLocationList");
		jsonObject = jsonObject.getAsJsonObject("terminalLocation");
		jsonObject = jsonObject.getAsJsonObject("currentLocation");
		String returnValue = jsonObject.get(tag).toString();
		String firstCharacter = Character.toString(returnValue.charAt(0));
		if (firstCharacter.equalsIgnoreCase("\"")){
			returnValue = returnValue.substring(1, returnValue.length()-1);
		}
		return returnValue;
	}

}

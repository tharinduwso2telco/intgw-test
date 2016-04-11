echo "Running jmeter script";

cd D:\WSO2Telco_Automation\api-manager-tests\src\test\resources\DataScripts\apache-jmeter-2.13\bin
call jmeter -n -t D:\WSO2Telco_Automation\api-manager-tests\src\test\resources\DataScripts\APIs.jmx -l D:\WSO2Telco_Automation\api-manager-tests\src\test\resources\DataScripts\APIs.jtl
echo "End jmeter script";
exit

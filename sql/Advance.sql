SELECT 
    Patient_ID,
    ROUND(`Billing Amount`) AS TOTAL_BILL,
    ROUND(`Health Insurance Amount`) AS INSURANCE_COVER,
    ROUND(`Billing Amount` - `Health Insurance Amount`) AS Patient_Paid,
    ROUND(SUM(`Billing Amount`) OVER ()) AS Total_Billing,
    ROUND(SUM(`Health Insurance Amount`) OVER ()) AS Insurance_Total,
    ROUND(SUM(`Billing Amount` - `Health Insurance Amount`) OVER ()) AS Total_Patient_Paid
FROM patient_details;


/*----------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------*/

SELECT 
    Patient_ID,
    ROUND(`Billing Amount`) AS TOTAL_BILL,
    ROUND(`Health Insurance Amount`) AS INSURANCE_COVER,
    ROUND(`Billing Amount` - `Health Insurance Amount`) AS Patient_Paid
FROM patient_details

UNION ALL

SELECT 
    'TOTAL' AS Patient_ID,
    ROUND(SUM(`Billing Amount`)),
    ROUND(SUM(`Health Insurance Amount`)),
    ROUND(SUM(`Billing Amount` - `Health Insurance Amount`))
FROM patient_details;
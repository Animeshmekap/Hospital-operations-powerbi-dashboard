/* 1. Retrive total number of patient per disease */

CREATE VIEW Total_Patients_Per_Disease AS
SELECT Disease, COUNT(Patient_ID) AS Total_Patients
FROM health_care.patient_details
GROUP BY Disease;


/*2. Which 5 disease is most common */

CREATE VIEW Most_Common_Disease AS
SELECT Disease, COUNT(*) AS Total_Cases
FROM patient_details
GROUP BY Disease
ORDER BY Total_Cases DESC
LIMIT 5;


/* 3.Retrive all doctor with patients */

CREATE VIEW total_Patient_per_Doctor as
SELECT Doctor, COUNT(*) AS Total_Patients FROM patient_details
GROUP BY Doctor
ORDER BY Total_Patients DESC;


/* 4. Number of cases handled by each doctor for each disease */

CREATE VIEW cases_handled_by_doctor_for_each_disease  AS
SELECT Doctor, Disease, COUNT(*) AS Total_Cases FROM patient_details
GROUP BY Doctor , Disease
ORDER BY Doctor , Total_Cases DESC;

/*5. What is the average billing amount per disease */
CREATE VIEW  average_billing_amount_per_disease AS
SELECT Disease, AVG(`Billing Amount`) AS Avg_billing FROM patient_details
GROUP BY Disease;


/*6.Which patient has the total highest bill */
CREATE VIEW highest_bill_of_patient as
SELECT Patient_ID, SUM(`Billing Amount`) AS total_bill
FROM patient_details
GROUP BY Patient_ID 
ORDER BY total_bill DESC LIMIT 1;


/* 7. Which disease requires the longest hospital stay? */
CREATE VIEW longest_hospital_stay_of_which_Disease as
SELECT Disease, AVG(DATEDIFF(Discharge_Date, Admit_Date)) AS Avg_Stay
FROM patient_details
GROUP BY Disease
ORDER BY Avg_Stay DESC
LIMIT 1;


/* 8. What is the maximum and minimum hospital stay duration? */
CREATE VIEW MAX_MIN_STAY_DURATION AS
SELECT 
MAX(DATEDIFF(Discharge_Date, Admit_Date)) AS Max_Stay_Days,
MIN(DATEDIFF(Discharge_Date, Admit_Date)) AS Min_Stay_Days
FROM patient_details;


/*10.Which test is performed most frequently */
CREATE VIEW TEST_COUNT AS 
SELECT Test, COUNT(*) AS Test_Count
FROM patient_details
GROUP BY Test
ORDER BY Test_Count DESC;


/*11.Bed occupancy analysis (which type is used most?)*/
CREATE VIEW BED_USAGE_COUNT AS
SELECT Bed_Occupancy, COUNT(*) AS Usage_Count
FROM patient_details
GROUP BY Bed_Occupancy
ORDER BY Usage_Count DESC;

/* 9. How much amount is covered by insurance vs paid by patient? */
CREATE VIEW total_bill_insurance as
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
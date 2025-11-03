create database diabetes;
select * from diabetes_dataset;

 ALTER TABLE DIABETES_DATASET
 ADD COLUMN PATIENT_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
 
 ALTER TABLE DIABETES_DATASET
 MODIFY COLUMN PATIENT_ID INT FIRST;
 
 -- Q1.Retrieve all patients who have been diagnosed with diabetes.
 select * from diabetes_dataset;
 
 SELECT COUNT(*) AS TOTALPATIENTS,
 SUM(DIAGNOSED_DIABETES) AS TOTALDIABETES,
 ROUND(SUM(DIAGNOSED_DIABETES)*100.0/COUNT(*),2) AS DIABETICPERCENT
 FROM DIABETES_DATASET;
 
 -- Q2.List all unique employment statuses in the dataset.
select * from diabetes_dataset;

SELECT distinct(EMPLOYMENT_STATUS)
FROM diabetes_dataset;

-- Q3.Display the top 10 patients with the highest BMI.
SELECT PATIENT_ID, 
BMI
FROM diabetes_dataset
ORDER BY BMI DESC LIMIT 10;

-- Q4.Show all patients whose fasting glucose level is above 120.
select * from diabetes_dataset;
SELECT PATIENT_ID,
AGE,
GLUCOSE_FASTING
FROM DIABETES_DATASET
WHERE GLUCOSE_FASTING > 120;

-- Q5.Find the average systolic and diastolic blood pressure for all patients.
SELECT PATIENT_ID,
AGE,
AVG(SYSTOLIC_BP) AS AVG_SYSTOLIC_BP,
AVG(DIASTOLIC_BP) AS AVG_DIASTOLIC_BP
FROM diabetes_dataset
GROUP BY PATIENT_ID
HAVING AGE>50 AND (AVG(SYSTOLIC_BP) > 140 OR AVG(DIASTOLIC_BP) > 90);

-- Q6.Retrieve the number of male and female patients in the dataset.
SELECT GENDER,
COUNT(GENDER) AS COUNT_GENDER
FROM diabetes_dataset
GROUP BY GENDER
ORDER BY COUNT_GENDER DESC;

-- Q7.List all patients who sleep less than 6 hours per day 
-- and have screen time greater than 6 hours per day.
SELECT PATIENT_ID,
AGE,
SLEEP_HOURS_PER_DAY,
screen_time_hours_per_day
FROM diabetes_dataset
WHERE SLEEP_HOURS_PER_DAY < 6 AND screen_time_hours_per_day >6;

-- Q8.Find the total number of patients with a family history of diabetes.
SELECT COUNT(*) AS TOTALPATIENTS,
SUM(family_history_diabetes) AS family_history_diabetes
FROM DIABETES_DATASET;

-- Q9.Calculate the average BMI, fasting glucose, and HbA1c for each diabetes stage.
SELECT DIABETES_STAGE,
AVG(BMI) AS AVG_BMI,
AVG(glucose_fasting) AS AVG_GLUCOSE_FASTING,
AVG(hba1c) AS AVG_HBA1C
FROM DIABETES_DATASET
GROUP BY diabetes_stage;

-- Q10.Find the average physical activity minutes per week for each employment status.
SELECT EMPLOYMENT_STATUS,
AVG(physical_activity_minutes_per_week)
FROM diabetes_dataset
GROUP BY EMPLOYMENT_STATUS;

-- Q11.Get the count of patients by smoking_status.
SELECT SMOKING_STATUS,
COUNT(SMOKING_STATUS) AS PATIENTS_BY_SMOKING_STATUS
FROM diabetes_dataset
GROUP BY SMOKING_STATUS;

-- Q12.Show the average diabetes risk score grouped by age group (e.g. <30, 30–50, >50).
SELECT
CASE WHEN AGE < 30 THEN '<30'
WHEN AGE BETWEEN 30 AND 50 THEN '30-50'
ELSE '>50'
END AS AGE_GROUP,
AVG(diabetes_risk_score) AS AVG_DIABETES_RISK_SCORE
FROM diabetes_dataset
GROUP BY AGE_GROUP;

-- Q13.Find the top 3 ethnicities with the highest average diabetes risk score.
SELECT ETHNICITY,
AVG(diabetes_risk_score) AS HIGHEST_AVERAGE_DIABETES_RISK_SCORE
FROM diabetes_dataset
GROUP BY ETHNICITY
ORDER BY HIGHEST_AVERAGE_DIABETES_RISK_SCORE DESC
LIMIT 3;

-- Q14.Calculate the percentage of patients diagnosed with diabetes in each gender category.
SELECT GENDER,
ROUND(SUM(DIAGNOSED_DIABETES)*100.0/COUNT(*),2) AS DIABETICPERCENT
FROM diabetes_dataset
GROUP BY GENDER;

-- Q15.Find the average HDL, LDL, 
-- and total cholesterol levels for patients with and without diagnosed diabetes.
SELECT
CASE WHEN DIAGNOSED_DIABETES = 1 THEN 'WITH'
ELSE 'WITHOUT'
END AS PATIENTS_WITH_WITHOUT_DIABETES,
AVG(hdl_cholesterol),
AVG(ldl_cholesterol),
AVG(cholesterol_total)
FROM diabetes_dataset
GROUP BY PATIENTS_WITH_WITHOUT_DIABETES;

-- Q16.Create a BMI category column (Underweight, Normal, Overweight, Obese) using a CASE statement, 
-- and find the count of patients in each category.
SELECT 
CASE WHEN BMI < 18.5 THEN 'UNDERWEIGHT'
WHEN BMI BETWEEN 18.5 AND 24.9 THEN 'NORMAL'
WHEN BMI BETWEEN 25.0 AND 29.9 THEN 'OVERWEIGHT'
ELSE 'OBESE'
END AS BMI_CATEGORY,
COUNT(*) AS PATIENTS
FROM diabetes_dataset
GROUP BY BMI_CATEGORY;

-- Q17.Determine which diet_score range (e.g. 0–4, 5–7, 8–10)
-- has the lowest average diabetes risk score.
SELECT 
CASE WHEN diet_score BETWEEN 0 AND 4 THEN '0-4'
WHEN diet_score BETWEEN 5 AND 7 THEN '5-7'
ELSE '8-10'
END AS diet_score_range,
AVG(diabetes_risk_score) as lowest_average_diabetes_risk_score
FROM diabetes_dataset
GROUP BY diet_score_range
ORDER BY lowest_average_diabetes_risk_score;

-- Q18.Rank all patients by diabetes_risk_score (1 = highest risk).
SELECT PATIENT_ID,
DIABETES_RISK_SCORE,
RANK() OVER(ORDER BY DIABETES_RISK_SCORE DESC) AS RISK
FROM diabetes_dataset;

-- Q19.Find the top 10 highest-risk patients based on diabetes risk score,
-- fasting glucose, and HbA1c combined
-- (you can use a formula or order by multiple columns).
SELECT PATIENT_ID,
diabetes_risk_score,
glucose_fasting,
hba1c
FROM diabetes_dataset
ORDER BY diabetes_risk_score DESC,glucose_fasting DESC,hba1c DESC LIMIT 10;

-- 20.Compare the average BMI and glucose levels between 
-- patients who have hypertension history vs those who don’t.
SELECT 
CASE WHEN hypertension_history = 0 THEN 'NO'
ELSE 'YES'
END AS HYPERTENSION_HISTORY_PATIENT,
AVG(BMI) AS AVG_BMI,
AVG(GLUCOSE_FASTING) AS GLUCOSE_LEVEL_PREMEAL,
AVG(glucose_postprandial) AS GLUCOSE_LEVEL_POSTMEAL
FROM diabetes_dataset
GROUP BY HYPERTENSION_HISTORY_PATIENT;

-- Q21.Find the correlation pattern between physical activity minutes and 
-- diabetes_risk_score (you can approximate using grouped averages).
SELECT 
CASE WHEN diabetes_risk_score BETWEEN 0 AND 10 THEN '0-10'
WHEN diabetes_risk_score BETWEEN 11 AND 20 THEN '11-20'
WHEN diabetes_risk_score BETWEEN 21 AND 30 THEN '21-30'
WHEN diabetes_risk_score BETWEEN 31 AND 40 THEN '31-40'
WHEN diabetes_risk_score BETWEEN 41 AND 50 THEN '41-50'
WHEN diabetes_risk_score BETWEEN 51 AND 60 THEN '51-60'
ELSE '61-70' 
END AS diabetes_risk_score_range,
AVG(physical_activity_minutes_per_week) AS PHYSICAL_ACTIVITY
FROM diabetes_dataset
GROUP BY diabetes_risk_score_range
ORDER BY  PHYSICAL_ACTIVITY DESC;

-- Q22.Identify patients who are at high risk (risk score > 50) 
-- but are not yet diagnosed with diabetes.
SELECT 
    gender,
    COUNT(*) AS high_risk_not_diagnosed
FROM diabetes_dataset
WHERE diabetes_risk_score > 50
  AND diagnosed_diabetes = 0
GROUP BY gender;

-- Q23.Get the average blood pressure and cholesterol for patients with both 
-- hypertension and cardiovascular history.
SELECT 
    CASE 
        WHEN hypertension_history = 1 AND cardiovascular_history = 1 THEN 'BOTH'
        WHEN hypertension_history = 1 THEN 'HYPERTENSION ONLY'
        WHEN cardiovascular_history = 1 THEN 'CARDIOVASCULAR ONLY'
        ELSE 'NEITHER'
    END AS PATIENT_HISTORY,
    AVG(systolic_bp) AS AVG_SYSTOLIC_BP,
    AVG(diastolic_bp) AS AVG_DIASTOLIC_BP,
    AVG(cholesterol_total) AS AVG_CHOLESTEROL
FROM diabetes_dataset
GROUP BY PATIENT_HISTORY;

-- Q24 Diabetic Percent by Smoking status
SELECT SMOKING_STATUS,
COUNT(SMOKING_STATUS) AS PATIENTS_BY_SMOKING_STATUS,
ROUND(SUM(DIAGNOSED_DIABETES)*100.0/COUNT(*),2) AS DIABETICPERCENT
FROM diabetes_dataset
where diagnosed_diabetes = 1
GROUP BY SMOKING_STATUS ;

-- Q25 Diabetic Percent by Education_Level
SELECT education_level,
COUNT(education_level) AS PATIENTS_BY_EDUCATION_LEVEL,
ROUND(SUM(DIAGNOSED_DIABETES)*100.0/COUNT(*),2) AS DIABETICPERCENT
FROM diabetes_dataset
GROUP BY education_level ;

-- Q26 Diabetic Percent by Employment_status
SELECT employment_status,
COUNT(employment_status) AS PATIENTS_BY_EMPLOYMENT_STATUS,
ROUND(SUM(DIAGNOSED_DIABETES)*100.0/COUNT(*),2) AS DIABETICPERCENT
FROM diabetes_dataset
GROUP BY employment_status;

-- Q27 Diabetes percentage of alcoholics vs non alcoholic
SELECT 
CASE WHEN alcohol_consumption_per_week = 0 THEN "Non- Drinker"
else "Drinker"
END as ALCOHOL_STATUS,
ROUND(SUM(DIAGNOSED_DIABETES)*100.0/COUNT(*),2) AS DIABETICPERCENT
FROM diabetes_dataset
GROUP BY ALCOHOL_STATUS ;

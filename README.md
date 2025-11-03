# 🩺 Diabetes Risk Analysis | Power BI + SQL Project

## 📘 Project Overview
This project analyzes a **100,000-record diabetes dataset** with **31 features** using **SQL** and **Power BI**.  
The goal is to uncover key lifestyle, demographic, and health-related patterns influencing diabetes risk, and to identify **high-risk but undiagnosed** individuals.

The project combines **data querying**, **DAX-based Power BI modeling**, and **data storytelling** through interactive dashboards.

---

## 🎯 Objectives
- Analyze diabetes prevalence across **gender, education, employment, and lifestyle** factors.
- Identify **high-risk undiagnosed** patients using risk scores.
- Explore correlations between **BMI, cholesterol, blood pressure, glucose, and HbA1c**.
- Build an **interactive, multi-page Power BI dashboard** to visualize health insights.
- Practice **SQL + Power BI integration** for real-world analytics.

---

## 🧩 Dataset Details
- **Rows:** 100,000  
- **Columns:** 31  
- **Key Fields:**
  - `patient_id`
  - `gender`
  - `age`
  - `diagnosed_diabetes` (0 = No, 1 = Yes)
  - `diabetes_risk_score`
  - `smoking_status`, `alcohol_consumption_per_week`, `physical_activity_minutes_per_week`
  - `bmi`, `cholesterol_total`, `glucose_fasting`, `glucose_postprandial`, `hba1c`
  - `education_level`, `employment_status`, `family_history`

---

## 🧠 Key Insights

| Category | Key Findings |
|-----------|---------------|
| 🧮 **Overall Stats** | 60% of patients are diabetic (59,990 out of 100K) |
| ⚧ **Gender Distribution** | Female: 59.85% diabetic · Male: 60.07% · Others: 62.2% |
| 🧬 **Family History** | 21,941 have a diabetic family history |
| ❤️ **High Cholesterol** | 4.86% of patients show high cholesterol (≥240 mg/dL) |
| 🚨 **High-Risk Undiagnosed** | 263 patients (26.3%) flagged as high risk (risk score >50) but not yet diagnosed |
| 🚬 **Lifestyle Impact** | Smoking, alcohol, and physical activity have marginal effect (~60% diabetic rate) |
| 🎓 **Education Impact** | Postgraduates show slightly lower diabetic rate (59.35%) |
| 💼 **Employment Impact** | Unemployed group shows higher diabetic rate (60.22%) |

---

## 🧮 SQL Analysis
The SQL layer was used for initial data exploration and validation before Power BI modeling.

## 📈 Outcomes
- Gained hands-on experience in data storytelling with Power BI.
- Strengthened SQL query writing for analytical problems.
- Learned to use DAX for advanced KPI calculations.
- Understood real-world healthcare analytics and feature correlation.

📫 Connect

👋 Feel free to explore the dataset, recreate visuals, or suggest new insights!

📧 Author: Shreerajsingh Chouhan
🔗 LinkedIn: https://www.linkedin.com/in/shreerajsingh-c-chouhan-098820215/

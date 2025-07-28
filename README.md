# 🏥 Patient No-Show Analysis – SQL + Looker Studio

This project analyzes a real-world dataset from Brazilian medical appointments to uncover patterns behind patient no-shows. Using SQL in BigQuery and visualized through Looker Studio, the goal is to provide actionable insights for improving patient attendance.


![image]()

<details>
<summary><strong>📑 Table of Contents</strong></summary>

- [Project Overview](#project-overview)  
- [Key Questions](#key-questions) 
- [Dataset Description](#dataset-description)  
- [Data Cleaning](#data-cleaning) 
- [Exploratory Data Analysis (EDA)](#exploratory-data-analysis)  
- [SQL Techniques Used](#sql-techniques-used)  
- [Tools Used](#tools-used)
- [Key SQL Queries & Business Insights](#key-sql-queries--business-insights)  
  <!-- - [Query 1: Total Revenue](#query-1-total-revenue-from-transaction-and-subscription-fees)   -->
  <!-- - [Query 2: Revenue by Plan Type](#query-2-revenue-breakdown-by-plan-type-free-vs-premium)   -->
  <!-- - [Query 3: Profitability Classification](#query-3-profitability-classification-using-cte--case)   -->
  <!-- - [Query 4: Estimated ROI per User](#query-4-estimated-roi-per-user-assuming-5-costuser)   -->
<!-- - [Data Visualization / Dashboard](#data-visualization--dashboard)   -->
<!-- - [Recommendations](#recommendations)   -->
<!-- - [Challenges Faced](#challenges-faced)   -->
<!-- - [Conclusion](#conclusion)   -->
<!-- - [Next Steps / Future Work](#next-steps--future-work)   -->
- [Author & License](#author--license)

</details>

## Project Overview

To investigate behavioral and logistical factors contributing to patient no-shows, and provide data-driven recommendations for reducing missed appointments.


## Key Questions
- What days of the week have the highest no-show rates?

- Does receiving an SMS reminder reduce no-shows?

- Are younger patients more likely to miss appointments?

- Is there a correlation between wait time and no-shows?

- Do health conditions influence attendance?


## Dataset Description
- **Source**: [Kaggle - Medical Appointment No Shows](https://www.kaggle.com/datasets/joniarroba/noshowappointments)
- **Rows**: 110,000+records

| Table Name       | Description                       | 
|------------------|-----------------------------------|
| PatientId        | Unique identifier for the patient | 
| AppointmentID    | Unique appointment ID | 
| Gender           | Male or Female | 
| ScheduledDay     | Date the appointment was scheduled | 
| AppointmentDay   | Actual day of the appointment |
| Age	           | Age of the patient |
| Neighbourhood	   | Location of the clinic |
| Scholarship	   | 1 = enrolled in welfare program |
| Hypertension	   | 1 = has hypertension |
| Diabetes	       | 1 = has diabetes |
| Alcoholism	   | 1 = recorded as alcoholic |
| Handcap	       | 0–4 (degree of disability) |
| SMS_received	   | 1 = patient got an SMS reminder |
| No-show	       | 1 = didn’t show up, 0 = came to the appointment |


## Data Cleaning 
✔️ Removed duplicates

✔️ Handled nulls and incorrect dates

✔️ Normalized column types

✔️ Created views for clean analysis

## Exploratory Data Analysis 

✅ Key Findings
| Metric           | Insights                      | 
|------------------|-----------------------------------|
| 📅 Day of Week   | Monday, Tuesday, Wednesday, and Friday had high no-show rates | 
| 📲 SMS Reminder  | Surprisingly, those who received SMS reminders had more no-shows | 
| ⏳ Wait Time     | Longer wait time = higher no-show rate| 
| 🧒 Young Adults  | Most at-risk age group for missing appointments | 
| 🩺 Health Conditions   | Not strong predictors of no-shows — behavior > medical|


## SQL Techniques Used

- Common Table Expressions (CTEs)

- CASE statements for bucketing and formatting

- Aggregations, groupings, and joins

- Derived metrics (no-show rate, wait time, age groups)

- Conditional formatting for visuals

## Tools Used
- Google BigQuery for data cleaning and transformation

- Looker Studio for visualization


<!-- ## Data Cleaning & Preparation

- Ensured referential integrity across user_id and goal_id  
- Validated date formats and ensured complete monthly data  
- Checked for missing values in financial columns (fee_amount)  
- Verified consistent value ranges (e.g., realistic goal targets and fees) -->

<!-- ## Exploratory Data Analysis (EDA)

- Monthly transaction and subscription volume trends  
- Distribution of users by plan and user type  
- Outlier detection in revenue and goal target amounts  
- Correlation between target amount and transaction frequency -->


## Key SQL Queries & Business Insights

### Query 1: Wait Time (Days Between Booking and Appointment)

**Purpose:** Measure the number o waiting days between scheduled date and appointment date

![image](https://github.com/user-attachments/assets/b7d0a92f-85c7-4b7e-8b96-69b47944ec38)

**Insight:**  
- Longer wait times correlated with higher no-show rates.
- Patients who waited more than 7 days had nearly double the no-show rate (28%) compared to those with shorter wait times.

### Query 2: Revenue Breakdown by Plan Type (Free vs Premium)

**Purpose:** Evaluate how user plans contribute to overall revenue.

![image](https://github.com/user-attachments/assets/9cf13184-fa5a-4dad-b65a-6813ff1c6c63)

**Insight:**  
Premium users (266) contributed $1,793.96, averaging $6.74 per user
Free users generated $2,790.16 total
Despite being a smaller group, Premium users underperformed Free users in total revenue, indicating a potential pricing or feature value mismatch that warrants further investigation.

### Query 3: Profitability Classification (Using CTE + CASE)

**Purpose:** Categorize users into profitability tiers based on their revenue contribution.

![image](https://github.com/user-attachments/assets/ee8faa7b-5f9a-48da-9dc2-1cd160e3c35b)

**Insight:**  
Users were grouped as:
- Profitable: ≥ $10  
- Marginal: $5–9.99  
- Loss: < $5  

Only 369 out of 1000 users (36.9%) reached break-even or better.  
Most users incurred more cost than revenue, signaling retention or engagement challenges.


### Query 4: Estimated ROI Per User (Assuming $5 Cost/User)

**Purpose:** Estimate ROI using total revenue minus assumed operating cost.

![image](https://github.com/user-attachments/assets/c89c263b-ff24-4bbd-b52b-fbcb58e509e4)

**Insight:**  
- ROI leaders generated $40–45+ per user in value  
- However, about 63% of users were unprofitable (ROI < 0)  
These results reinforce the need for better segmentation, smarter onboarding, and more Premium upgrades.


## Data Visualization / Dashboard

A Looker Studio dashboard was created to summarize:
- Overall No-Show Rate	i.e % of total appointments missed
- No-Show Rate by Day of Week	i.e % missed per weekday
- No-Show Rate by Age Group i.e	% missed by age segments
- No-Show Rate by SMS Reminder	i.e Compare those who got reminders vs. not 
- No-Show Rate by Wait Time Bracket i.e	% missed based on wait duration

![front](https://github.com/user-attachments/assets/b988c40a-adc8-459b-b485-d565346a5c01)

https://github.com/user-attachments/assets/05616ccf-2ca4-4423-be76-e18d7a2dcd60

<!-- ## Recommendations

1. Scale Premium acquisition – high ARPU and ROI per user  
2. Target Free users with upsell campaigns  
3. Streamline cost-to-serve operations for low-value users  
4. Expand focus on top-performing goals (e.g., Retirement, Education)  
5. Monitor break-even ratio quarterly to track sustainability -->

<!-- ## Challenges Faced

- Interpreting user value with flat cost assumptions  
- Mock dataset lacked nuanced user behavior (e.g., churn signals)  
- Maintaining consistent joins and CTE logic across all queries   -->

<!-- ## Conclusion

This analysis shows QuickSave has strong potential via Premium users and certain goal types, but currently relies on a small percentage of users for most revenue.  
Data supports continued development with product optimization and targeted marketing. -->

<!-- ## Next Steps / Future Work

- Add churn and lifetime value modeling  
- Automate profitability scoring using SQL procedures  
- Introduce clustering for user behavior segmentation  
- Develop goal conversion funnels and engagement scoring -->

<!-- ## Author & License

This project was created as part of a professional portfolio to demonstrate practical financial analytics using SQL & Power BI.

- TikTok: [@wanja_analyst](https://www.tiktok.com/@wanja_analyst)
- GitHub: [https://github.com/wanja-susan](https://github.com/wanja-susan)    
- LinkedIn: [Susan Wanja Kariuki](https://www.linkedin.com/in/susan-wanja-1b63a6234/)  

© 2025 | Susan Wanja | Data Analytics Portfolio -->


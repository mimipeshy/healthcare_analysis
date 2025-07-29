# 🏥 Patient No-Show Analysis – SQL + Looker Studio

This project analyzes a real-world dataset from Brazilian medical appointments to uncover patterns behind patient no-shows. Using SQL in BigInsight and visualized through Looker Studio, the goal is to provide actionable insights for improving patient attendance.

<details>
<summary><strong>📑 Table of Contents</strong></summary>

- [Project Overview](#project-overview)  
- [Key Questions](#key-questions) 
- [Dataset Description](#dataset-description)  
- [Data Cleaning](#data-cleaning) 
- [Exploratory Data Analysis (EDA)](#exploratory-data-analysis)  
- [SQL Techniques Used](#sql-techniques-used)  
- [Tools Used](#tools-used)
- [Key Business Insights](#key-business-insights)  
  - [Insight 1: Overall No-Show Rate](#insight-1-overall-no-show-rate)  
  - [Insight 2: Wait Time (Days Between Booking and Appointment)](#insight-2-wait-time-days-between-booking-and-appointment)  
  - [Insight 3: No-Show Rate by SMS Reminder (Unexpected Trend)](#insight-3-no-show-rate-by-sms-reminder-unexpected-trend)  
  - [Insight 4: No-Show Rate by Age Group ](#insight-4-no-show-rate-by-age-group)  
  - [Insight 5: Day of Week Patterns](#insight-5-day-of-week-patterns) 
<!-- - [Data Visualization / Dashboard](#data-visualization--dashboard)   -->
- [Recommendations](#recommendations)  
<!-- - [Challenges Faced](#challenges-faced)   -->
- [Conclusion](#conclusion)  
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

## Exploratory Data Analysis (EDA)

- Monthly transaction and subscription volume trends  
- Distribution of users by plan and user type  
- Outlier detection in revenue and goal target amounts  
- Correlation between target amount and transaction frequency


## Key Business Insights

### Insight 1: Overall No-Show Rate 
**Purpose:** Measures scale of the problem

![image](./images/summary.PNG)

**Insight:**  
- Longer wait times correlated with higher no-show rates.
- High no-show rates occurred on Monday, Tuesday, Wednesday, and Friday.
- Saturday had the highest no-show percentage (23%) but a very small sample size — only 39 appointments.

### Insight 2: Wait Time (Days Between Booking and Appointment)

**Purpose:** Measure the number o waiting days between scheduled date and appointment date

![image](./images/wait%20time%20vs%20noshow.PNG)

**Insight:**  
- Longer wait times correlated with higher no-show rates.
- Patients who waited more than 7 days had nearly double the no-show rate (28%) compared to those with shorter wait times.

### Insight 3: No-Show Rate by SMS Reminder (Unexpected Trend)

**Purpose:** Tests effectiveness of SMS outreach and Compare those who got reminders vs. not

![image](./images/sms.PNG)

**Insight:**  
- Suprisingly 62.3% of patients who received SMS reminders missed their appointments vs 37.7% for those who didn’t receive SMS.
- Indicates that the current reminder strategy may not be effective or may even cause complacency.



### Insight 4: No-Show Rate by Age Group 

**Purpose:** Identifies at-risk age groups


![image](./images/age.PNG)

**Insight:**  
- Young adults exhibited the highest no-show rates, suggesting age-related behavioral trends.
- This age group may require targeted strategies to improve appointment adherence.
- Older adults (65+) had the lowest no-show rate (15.3%), indicating a potentially
different set of factors influencing their behavior.
- This age group may be a good target for outreach and engagement efforts.

### Insight 5: Day of Week Patterns

**Purpose:** Estimate ROI using total revenue minus assumed operating cost.

![image](./images/day_of_week.PNG)

**Insight:**  
- High no-show rates occurred on Monday, Tuesday, Wednesday, and Friday.
- Saturday had the highest no-show percentage (23%) but a very small sample size — only 39 appointments.
- This may indicate a scheduling bias or other factors at play.
- Further investigation is needed to understand these patterns.


## Data Visualization / Dashboard

A Looker Studio dashboard was created to summarize:
- Overall No-Show Rate	i.e % of total appointments missed
- No-Show Rate by Day of Week	i.e % missed per weekday
- No-Show Rate by Age Group i.e	% missed by age segments
- No-Show Rate by SMS Reminder	i.e Compare those who got reminders vs. not 
- No-Show Rate by Wait Time Bracket i.e	% missed based on wait duration
- Summary Table 

![front](https://lookerstudio.google.com/s/hg8QbvC6mmc)

https://github.com/user-attachments/assets/05616ccf-2ca4-4423-be76-e18d7a2dcd60

## Recommendations

Based on the analysis, I recommend:

1. Shorten wait times between booking and appointments
2. Test new SMS formats (e.g., conversational, emoji-rich, personalized)
3. Target young adults with behaviorally informed reminders or incentives
4. Add filters like day-of-week when overbooking to reduce loss
5. Invest in deeper behavioral research, not just medical profiling
6. Send SMS reminders to all patients, ideally 1 day before.
7. Consider offering flexible scheduling options for young adults

## Challenges Faced

- Interpreting user value with flat cost assumptions  
- Mock dataset lacked nuanced user behavior (e.g., churn signals)  
- Maintaining consistent joins and CTE logic across all queries  


## Next Steps / Future Work

- Add churn and lifetime value modeling  
- Automate profitability scoring using SQL procedures  
- Introduce clustering for user behavior segmentation  
- Develop goal conversion funnels and engagement scoring

<!-- ## Author & License

This project was created as part of a professional portfolio to demonstrate practical financial analytics using SQL & Power BI.

- TikTok: [@wanja_analyst](https://www.tiktok.com/@wanja_analyst)
- GitHub: [https://github.com/wanja-susan](https://github.com/wanja-susan)    
- LinkedIn: [Susan Wanja Kariuki](https://www.linkedin.com/in/susan-wanja-1b63a6234/)  

© 2025 | Susan Wanja | Data Analytics Portfolio -->

# Conclusion

This analysis shows QuickSave has strong potential via Premium users and certain goal types, but currently relies on a small percentage of users for most revenue.  
Data supports continued 
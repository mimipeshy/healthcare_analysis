# No-Show Appointments Analysis for Healthcare Optimization

I analyzed over 100K medical appointments to uncover why patients miss their scheduled visits. Using SQL and data storytelling, I identified key patterns,like longer wait times and lack of SMS reminders — that strongly predict no-shows. My insights help clinics reduce missed appointments, optimize staff scheduling, and ultimately improve patient care. It’s a small shift in data — but a big impact on operations.


![image]()

<!-- <details>
<summary><strong>📑 Table of Contents</strong></summary>

- [Project Overview](#project-overview)  
- [Problem Statement](#problem-statement)  
- [Objective](#objective)  
- [Dataset Description](#dataset-description)  
- [Tools & Technologies](#tools--technologies)  
- [Data Cleaning & Preparation](#data-cleaning--preparation)  
- [Exploratory Data Analysis (EDA)](#exploratory-data-analysis-eda)  
- [Key SQL Queries & Business Insights](#key-sql-queries--business-insights)  
  - [Query 1: Total Revenue](#query-1-total-revenue-from-transaction-and-subscription-fees)  
  - [Query 2: Revenue by Plan Type](#query-2-revenue-breakdown-by-plan-type-free-vs-premium)  
  - [Query 3: Profitability Classification](#query-3-profitability-classification-using-cte--case)  
  - [Query 4: Estimated ROI per User](#query-4-estimated-roi-per-user-assuming-5-costuser)  
- [Data Visualization / Dashboard](#data-visualization--dashboard)  
- [Recommendations](#recommendations)  
- [Challenges Faced](#challenges-faced)  
- [Conclusion](#conclusion)  
- [Next Steps / Future Work](#next-steps--future-work)  
- [Author & License](#author--license)

</details> -->

## Project Overview

Missed appointments in healthcare create operational inefficiencies, increase wait times for other patients, and cost clinics thousands in lost revenue annually. This project analyzes over 100K medical appointments to uncover the behavioral and demographic patterns behind patient no-shows.

Using exploratory data analysis and SQL-based data cleaning, we identified key drivers such as waiting time, age, chronic conditions, and SMS reminders that significantly influence patient attendance.

The insights derived empower healthcare providers to:

- Predict and preempt no-shows using simple flags like waiting days or absence of reminders.

- Tailor communication strategies for high-risk patients.

- Optimize resource allocation by overbooking intelligently or shifting capacity where needed.

With a focused intervention strategy, clinics can reduce their no-show rate, improve patient flow, and deliver better care at lower cost.

<!-- ## Problem Statement

The leadership team at Ziwatech needs to determine:
- Is QuickSave generating enough revenue to continue?
- Are user segments cost-effective?
- Which features or segments should be optimized, scaled, or phased out?

## Objective

- Calculate total revenue from fee-based and subscription income  
- Analyze monetization by user plan (Free vs Premium)  
- Segment users based on profitability  
- Estimate per-user ROI using assumed operational costs  
- Support business decisions with data-backed recommendations  

## Dataset Description

This dataset simulates 12 months of usage from Jan–Dec 2024 and includes four related tables:

| Table Name       | Columns                                | Purpose |
|------------------|----------------------------------------|---------|
| quicksave_users  | user_id, signup_date, user_type, plan_name | User demographics & subscription type |
| transactions     | transaction_id, user_id, date, amount, fee_amount, goal_id | Micro-savings logs + fee generation |
| subscriptions    | user_id, start_date, end_date, fee_amount | Premium subscription tracking |
| goals            | goal_id, goal_name, target_amount | Goal categorization and target logic |

Note: This dataset was randomly generated.



## Tools & Technologies

- MYSQL – querying, joins, CTEs, CASE logic  
- Power BI – visualization, performance dashboard  
- Excel – KPI tracking and raw data cross-checks  
- GitHub – project publishing and documentation

## Data Cleaning & Preparation

- Ensured referential integrity across user_id and goal_id  
- Validated date formats and ensured complete monthly data  
- Checked for missing values in financial columns (fee_amount)  
- Verified consistent value ranges (e.g., realistic goal targets and fees)

## Exploratory Data Analysis (EDA)

- Monthly transaction and subscription volume trends  
- Distribution of users by plan and user type  
- Outlier detection in revenue and goal target amounts  
- Correlation between target amount and transaction frequency


## Key SQL Queries & Business Insights

### Query 1: Total Revenue from Transaction and Subscription Fees

**Purpose:** Measure the total income QuickSave generated in 2024.

![image](https://github.com/user-attachments/assets/b7d0a92f-85c7-4b7e-8b96-69b47944ec38)

**Insight:**  
QuickSave generated $4,584.12 in total revenue:
- $3,788.78 from transaction fees  
- $795.34 from premium subscriptions  
This indicates a working hybrid model, though transactions dominate.

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

An interactive Power BI dashboard was created to summarize:
- Monthly revenue and user activity  
- Revenue by plan and user type  
- Goal performance (e.g., Home Renovation, Education)  
- Break-even analysis  
- Top users by ROI

![front](https://github.com/user-attachments/assets/b988c40a-adc8-459b-b485-d565346a5c01)

https://github.com/user-attachments/assets/05616ccf-2ca4-4423-be76-e18d7a2dcd60

## Recommendations

1. Scale Premium acquisition – high ARPU and ROI per user  
2. Target Free users with upsell campaigns  
3. Streamline cost-to-serve operations for low-value users  
4. Expand focus on top-performing goals (e.g., Retirement, Education)  
5. Monitor break-even ratio quarterly to track sustainability

## Challenges Faced

- Interpreting user value with flat cost assumptions  
- Mock dataset lacked nuanced user behavior (e.g., churn signals)  
- Maintaining consistent joins and CTE logic across all queries  

## Conclusion

This analysis shows QuickSave has strong potential via Premium users and certain goal types, but currently relies on a small percentage of users for most revenue.  
Data supports continued development with product optimization and targeted marketing.

## Next Steps / Future Work

- Add churn and lifetime value modeling  
- Automate profitability scoring using SQL procedures  
- Introduce clustering for user behavior segmentation  
- Develop goal conversion funnels and engagement scoring

## Author & License

This project was created as part of a professional portfolio to demonstrate practical financial analytics using SQL & Power BI.

- TikTok: [@wanja_analyst](https://www.tiktok.com/@wanja_analyst)
- GitHub: [https://github.com/wanja-susan](https://github.com/wanja-susan)    
- LinkedIn: [Susan Wanja Kariuki](https://www.linkedin.com/in/susan-wanja-1b63a6234/)  

© 2025 | Susan Wanja | Data Analytics Portfolio
 -->

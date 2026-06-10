# 🚲 Cyclistic Bike-Share: Data Analytics Case Study
**Author:** Luigi Tallarico | Business & Data Analyst  
**Date:** June 2026 | **Tools Used:** SQL (BigQuery), Tableau, Google Sheets, Google Slides.

*<img width="1199" height="1199" alt="Dashboard 1" src="https://github.com/user-attachments/assets/40dd370c-a7d8-4ffa-9ba1-56b16fe8d166" />*

## 📊 Executive Summary
The goal of this project is to analyze historical bike-trip data for "Cyclistic" (a fictional bike-share company in Chicago) to understand the behavioral differences between **Casual Riders** and **Annual Members**. The ultimate business objective is to design a targeted marketing strategy to convert casual riders into profitable annual members. 

By analyzing over 5.5 Million rows of data, I identified key usage patterns and developed 3 actionable business recommendations to drive subscription growth.

## 🎯 The Business Task
*   **Problem:** Casual riders are profitable, but annual members are the key to long-term financial growth.
*   **Objective:** Identify how casual riders and annual members use Cyclistic bikes differently.
*   **Stakeholders:** Director of Marketing, Cyclistic Executive Team.

## 🛠️ Data Preparation & Processing
*   **Data Source:** 12 months of historical trip data (public dataset).
*   **Data Cleaning (SQL):** 
    *   Removed null values and duplicates.
    *   Filtered out trips with negative duration or duration less than 60 seconds.
    *   Created new calculated fields: `ride_length` and `day_of_week`, `month_start_number`,`season`.

## 📈 Key Insights & Analysis
1. **Weekend vs. Weekday:** Casual riders peak during the weekends for leisure, while Annual Members use bikes consistently during weekdays for commuting.
2. **Ride Duration:** On average, Casual riders ride 2x longer than Annual members.
3. **Seasonality:** Both groups peak during summer months, but Casual rider drop-off in winter is significantly sharper.

## 💡 Actionable Business Recommendations
1. **01 - Weekend‑only pass 🗓️:** Offer a lower‑cost membership valid only on Saturdays and Sundays.Promote via social media on Friday afternoons.
2. **02 - Winter warm‑up membership ❄️:** Discounted 3‑month membership (Dec–Feb) with hot beverage vouchers. Target casuals who rode in autumn but stopped in winter.
3. **03 - Leisure loyalty programme 🏆:** For long‑ride casuals: every 5th ride free if they join as a member.Highlight “ride twice as long for half the price” messaging.

## 🔗 Links to Project Files
*   [View the Interactive Tableau Dashboard Here](https://public.tableau.com/views/GoogleDataAnalyticsCapstoneProject-Cyclisticbikeuserbehavior/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
*   [View the SQL Data Cleaning Queries Here](3.-4._Process_Analyze)

# Mall-Customer-Segmentation-Data
Analyzed mall customer data using Python for cleaning and preprocessing, and SQL for querying and segmenting customers by age, income, and spending behavior. Identified key customer segments and actionable insights to support targeted marketing strategies and improve business decision-making.

# Mall Customer Segmentation Analysis (SQL-Based)

## Project Overview
This project analyzes mall customer data to understand how customers differ in **age, annual income, and spending score**.  
The analysis focuses on answering **real business questions** using SQL to support better marketing and customer targeting decisions.

This is a **business-driven SQL analysis project**, not a machine learning model.

---

## Business Objective
As a business owner, the goal is to:
- Identify which customer groups spend more
- Understand whether age and income influence spending behavior
- Decide which customer segments should be targeted for marketing offers

---

## Tools Used
- **SQL** – querying, grouping, comparisons, insights
- **Excel / CSV** – dataset storage
- **GitHub** – project documentation and version control

---

## Dataset Information
- Dataset: Mall Customers
- Total records: 200
- Columns used in analysis:
  - CustomerID
  - Gender
  - Age
  - AnnualIncome
  - SpendingScore

---

## Analysis Performed (What I Actually Did)

Using SQL queries, I answered the following business questions:

- Do younger customers spend differently than older customers?
- How does spending behavior change across income levels?
- Are high-income customers always high spenders?
- Which age group shows the highest average spending score?
- Which customer segment should be prioritized for marketing?

The analysis was done using:
- `GROUP BY`
- `CASE WHEN`
- `AVG()` and comparison logic
- Ordered results to identify patterns (not assumptions)

---

## Key Findings

- Younger customers tend to have **higher average spending scores**
- High income **does not guarantee** high spending
- Some mid-income customers show **strong spending behavior**
- Spending patterns vary by age even within the same income group

These insights show that **customer behavior matters more than income alone**.

---

## Project Files
- `Mall_Customers.csv` → Raw customer dataset
- `Mall_Customer_SegmentData.sql` → All SQL queries used for analysis

---

## Business Recommendations

- Target **high-spending customers**, not just high-income customers
- Design promotions focused on **younger and mid-income segments**
- Avoid assuming income = spending while planning campaigns
- Use data-driven segmentation instead of general assumptions

---






## 👩‍💻 Author
Aspiring Data Analyst | SQL • Data Analysis

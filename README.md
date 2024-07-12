# SQL Project Data Job Analysis

## Introduction
This repository provides a comprehensive analysis of SQL data jobs in 2023, focusing on trends in required skills, average salaries, and industry demand. By leveraging a dataset of top-paying SQL data job postings, we aim to uncover the key factors that drive high compensation in this field. This analysis is intended to guide data professionals in understanding the current job market and identifying valuable skill sets for career advancement. 

Click the link down below to view SQL queries written in this project.

[project_sql folder](/project_sql/)

## Background
Driven by a desire to navigate the data analyst job market more effectively, this project aims to identify top-paid and in-demand skills, streamlining the process for others to find optimal jobs. 

The data, sourced from [SQL course](https://lukebarousse.com/sql) by Luke Barousse, is rich with insights on job titles, salaries, locations, and essential skills. 

The SQL queries were designed to answer the following questions: 
1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn or improve upon?

## Tools I Used
For my deep dive into the data analyst job market, I used several key tools:

- **SQL**: The backbone of my analysis, allowing me to query the database and unearth critical insights.

- **PostgreSQL**: The chosen database management system, ideal for handling the job posting data.

- **Visual Studio Code**: My go-to for database management and executing SQL queries.

- **Git & GitHub**: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

- **Excel**: For visualizing the filtered data into graphs, tables, and interactive workbooks

## The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:
### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the lucrative opportunities in the field, providing a clear picture of where the most rewarding positions are located and what they entail.

```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE   
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
**Highest paying data analyst job in 2023:** Mantys offers $650,000 annually, significantly above other roles, indicating unique opportunities or special requirements.

**Diversity in roles:** Top-paying positions include Director of Analytics, Associate Director- Data Insights, Principal Data Analyst, and ERM Data Analyst, spanning different levels and specializations.

**Prominent companies and remote opportunities:** Meta, AT&T, Pinterest, and SmartAsset offer top salaries, reflecting high demand and acceptance of remote work in the data analytics industry.

![Top Paying Roles](assets\Top-Paying-Jobs_Pivot-Chart.png)

### 2. What skills are required for these top-paying jobs?


## What I Learned
## Conclusions

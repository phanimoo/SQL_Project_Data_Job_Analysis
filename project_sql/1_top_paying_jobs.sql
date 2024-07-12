/*
    What are the top-paying data nalyst jobs?
        -ID the top 10 highesting-paying Data Analyst roles that are available remotely
        -Focus on job postings with specified salaries (remove nulls)
        -Highlight the top-paying opportunities for Data Analysts, offering insights into the most optimal roles and skills
*/

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
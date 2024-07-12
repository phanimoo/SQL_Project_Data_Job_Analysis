SELECT
    job_id,
    job_title,
    salary_year_avg,
    CASE   
        WHEN salary_year_avg > 100000 THEN 'High Salary'
        WHEN salary_year_avg BETWEEN 60000 AND 99999 THEN 'Standard Salary'
        ELSE 'Low Salary'
    END
FROM job_postings_fact   
WHERE
    salary_year_avg IS NOT NULL 
    AND
    job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC;
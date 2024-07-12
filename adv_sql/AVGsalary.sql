SELECT 
    
    job_schedule_type,
    AVG(salary_year_avg) AS Avg_Yearly_Salary,
    AVG(salary_hour_avg) AS Avg_Hourly_Salary
FROM job_postings_fact
WHERE  
    job_posted_date > '2023-06-01'
GROUP BY   
    job_schedule_type
ORDER BY
    job_schedule_type;
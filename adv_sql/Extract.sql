SELECT  
    
    EXTRACT (MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month,
    COUNT (*) AS job_count
FROM   
    job_postings_fact
GROUP BY
    month
ORDER BY
    month;
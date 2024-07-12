SELECT
    COUNT(job_postings_fact.job_id) AS job_count,
    company_dim.name AS company_name
    
FROM job_postings_fact

INNER JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_health_insurance = TRUE
    AND EXTRACT (QUARTER FROM job_postings_fact.job_posted_date)=2
GROUP BY
    company_name
HAVING
    COUNT(job_postings_fact.job_id) > 0
ORDER BY
    job_count DESC;

SELECT 
	company_id,
  name,
	-- Categorize companies
  CASE
	  WHEN job_count < 10 THEN 'Small'
    WHEN job_count BETWEEN 10 AND 50 THEN 'Medium'
    ELSE 'Large'
  END AS company_size

FROM 
-- Subquery to calculate number of job postings per company 
(
  SELECT 
		company_dim.company_id, 
		company_dim.name, 
		COUNT(job_postings_fact.job_id) as job_count
  FROM 
		company_dim
  INNER JOIN job_postings_fact ON company_dim.company_id = job_postings_fact.company_id
  GROUP BY 
		company_dim.company_id, 
		company_dim.name
) AS company_job_count;
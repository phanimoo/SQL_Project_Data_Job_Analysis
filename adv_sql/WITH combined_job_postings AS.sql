WITH combined_job_postings AS 
(
            (
            SELECT
                *
            FROM 
                job_postings_fact
            WHERE
                job_posted_date BETWEEN '2023-01-01' AND '2023-01-31'
            )

            UNION ALL

            (
            SELECT
                *
            FROM 
                job_postings_fact
            WHERE
                job_posted_date BETWEEN '2023-02-01' AND '2023-02-28'
            )

            UNION ALL

            (
            SELECT
                *
            FROM 
                job_postings_fact
            WHERE
                job_posted_date BETWEEN '2023-03-01' AND '2023-03-31'
            )
),
-- CTE for calculating monthly skill demand based on the combined postings
monthly_skill_demand AS (
  SELECT
    job_title_short,
    skills_dim.skills,  
    EXTRACT(YEAR FROM combined_job_postings.job_posted_date) AS year,  
    EXTRACT(MONTH FROM combined_job_postings.job_posted_date) AS month,  
    COUNT(combined_job_postings.job_id) AS postings_count 
  FROM
    combined_job_postings
	    LEFT JOIN skills_job_dim ON combined_job_postings.job_id = skills_job_dim.job_id  
	    LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id  
  GROUP BY
    job_title_short,
    skills_dim.skills, 
    year, 
    month
)
-- Main query to display the demand for each skill during the first quarter
SELECT
  *
FROM
  monthly_skill_demand
WHERE
    job_title_short = 'Data Analyst'
ORDER BY
  postings_count DESC;
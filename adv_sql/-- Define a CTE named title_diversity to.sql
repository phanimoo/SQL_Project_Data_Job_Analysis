WITH title_diversity AS (
    SELECT
        company_id,
        COUNT(DISTINCT job_title) AS unique_titles
    FROM job_postings_fact
    GROUP BY
        company_id
)
SELECT  
    company_dim.name,
    title_diversity.unique_titles
FROM title_diversity
    INNER JOIN company_dim ON title_diversity.company_id = company_dim.company_id
ORDER BY 
    unique_titles DESC
LIMIT 10;

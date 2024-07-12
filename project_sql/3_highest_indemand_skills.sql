/*
    Question: What are the most in-demand skills for data analysts?
        - Join job postings to inner join table similar to query 2
        - ID the top 5 in-demand skills for a data analyst
        - Focus on all job postngs
        - BONUS: See the highest in-demand skills for data analysts in Phoenix, AZ
        - Why? Provide insights into the most valuable skills for job seekers
*/

SELECT 
    skills,
    COUNT(skills_job_dim.skill_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Phoenix, AZ'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 10;
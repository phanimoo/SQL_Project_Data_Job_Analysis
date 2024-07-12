/*
    Question: What are the most optimal skills to learn (aka it's in high demand AND a high-paying skill)?
    - ID skills in high demand and associated with high average salaries for Data Analyst roles
    - Concentrates on remote positions with specified salaries (no null)
    - Why? To target skills that offer job security (high demand) and financial benefits (high salaries),
        offering strategic insights for career development in data analytics
    
    
    -- CTEs for queries 3-4
WITH skills_demand AS 
(
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.skill_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = 'TRUE'
    GROUP BY
        skills_dim.skill_id
), 
    avg_salary AS 
(
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        ROUND (AVG(salary_year_avg), 2) AS avg_salary_yearly
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = 'TRUE'
    GROUP BY
        skills_dim.skill_id
)
    -- Combine CTE into main query
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary_yearly
FROM  
    skills_demand
INNER JOIN avg_salary ON avg_salary.skill_id = skills_demand.skill_id
WHERE
    demand_count > 10
ORDER BY
    avg_salary_yearly DESC,
    demand_count DESC
    
LIMIT 25*/

    -- More concise query
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.skill_id) AS demand_count,
    ROUND (AVG(salary_year_avg), 2) AS avg_salary_yearly
FROM  
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL 
    AND job_work_from_home = 'TRUE'
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) >= 20
ORDER BY
    avg_salary_yearly DESC,
    demand_count DESC
LIMIT 25

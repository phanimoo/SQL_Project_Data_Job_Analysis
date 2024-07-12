/*
    Question: What are the most in-demand skills for data analysts?
        - Join job postings to inner join table similar to query 2
        - ID the top 10 in-demand skills for a data analyst
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

/*
    -- Top 10 in-demand skills for Data Analysts overall
[
  {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  },
  {
    "skills": "r",
    "demand_count": "2142"
  },
  {
    "skills": "sas",
    "demand_count": "1866"
  },
  {
    "skills": "looker",
    "demand_count": "868"
  },
  {
    "skills": "azure",
    "demand_count": "821"
  },
  {
    "skills": "powerpoint",
    "demand_count": "819"
  }
]

    --Top 10 in-demand skills in Phoenix, AZ
[
  {
    "skills": "phoenix",
    "demand_count": "27"
  },
  {
    "skills": "sql",
    "demand_count": "24"
  },
  {
    "skills": "python",
    "demand_count": "23"
  },
  {
    "skills": "sas",
    "demand_count": "20"
  },
  {
    "skills": "r",
    "demand_count": "12"
  },
  {
    "skills": "snowflake",
    "demand_count": "12"
  },
  {
    "skills": "tableau",
    "demand_count": "12"
  },
  {
    "skills": "excel",
    "demand_count": "9"
  },
  {
    "skills": "aws",
    "demand_count": "8"
  },
  {
    "skills": "azure",
    "demand_count": "8"
  }
]
*/
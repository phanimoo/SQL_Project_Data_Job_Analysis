SELECT
    job_posts_Q1.job_id,
    job_posts_Q1.job_title_short,
    job_posts_Q1.job_location,
    job_posts_Q1.job_via,
    job_posts_Q1.salary_year_avg,
    skills_to_job.skill_id,
    monthly_skill_demand.postings_count,
    monthly_skill_demand.year,
    monthly_skill_demand.month
    skills,
    type
FROM skills_dim
LEFT JOIN skills_job_dim AS skills_to_job ON skills_dim.skill_id = skills_to_job.skill_id
LEFT JOIN                       
        (
            (
            SELECT
                job_id,
                job_title_short,
                job_location,
                job_via,
                salary_year_avg,
                job_posted_date
            FROM 
                job_postings_fact
            WHERE
                job_posted_date BETWEEN '2023-01-01' AND '2023-01-31'
            )

            UNION ALL

            (
            SELECT
                job_id,
                job_title_short,
                job_location,
                job_via,
                salary_year_avg,
                job_posted_date
            FROM 
                job_postings_fact
            WHERE
                job_posted_date BETWEEN '2023-02-01' AND '2023-02-28'
            )

            UNION ALL

            (
            SELECT
                job_id,
                job_title_short,
                job_location,
                job_via,
                salary_year_avg,
                job_posted_date
            FROM 
                job_postings_fact
            WHERE
                job_posted_date BETWEEN '2023-03-01' AND '2023-03-31'
            )
        ) AS job_posts_Q1 ON skills_to_job.job_id = job_posts_Q1.job_id
WHERE
    job_posts_Q1.salary_year_avg > 70000
ORDER BY
    job_posts_Q1.job_id


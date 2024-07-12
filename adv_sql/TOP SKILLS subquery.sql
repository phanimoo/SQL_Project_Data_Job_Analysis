SELECT skills_dim.skills
FROM skills_dim
INNER JOIN (
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM skills_job_dim
    GROUP BY
        skill_id
    ORDER BY    
        skill_count DESC
    LIMIT 5
) AS top_skills ON skills_dim.skill_id = top_skills.skill_id
ORDER BY
    top_skills.skill_count DESC;
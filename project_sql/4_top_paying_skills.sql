/*
    Question: What are the top skills based on salary?
    - Look at the average salary associated with each skill for Data Analyst roles
    - Focuses on roles with specified salaries, regardless of location (no nulls)
    - Why? To reveal how different skills impact salary levels for Data Analysts and help ID the most financially reqards skills to acquire or improve
*/

SELECT 
    skills,
    ROUND (AVG(salary_year_avg), 2) AS avg_salary_yearly
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = 'TRUE'
GROUP BY
    skills
ORDER BY
    avg_salary_yearly DESC
LIMIT 25;

/*
### JSON ###
[
  {
    "skills": "pyspark",
    "avg_salary_yearly": "208172.25"
  },
  {
    "skills": "bitbucket",
    "avg_salary_yearly": "189154.50"
  },
  {
    "skills": "couchbase",
    "avg_salary_yearly": "160515.00"
  },
  {
    "skills": "watson",
    "avg_salary_yearly": "160515.00"
  },
  {
    "skills": "datarobot",
    "avg_salary_yearly": "155485.50"
  },
  {
    "skills": "gitlab",
    "avg_salary_yearly": "154500.00"
  },
  {
    "skills": "swift",
    "avg_salary_yearly": "153750.00"
  },
  {
    "skills": "jupyter",
    "avg_salary_yearly": "152776.50"
  },
  {
    "skills": "pandas",
    "avg_salary_yearly": "151821.33"
  },
  {
    "skills": "elasticsearch",
    "avg_salary_yearly": "145000.00"
  },
  {
    "skills": "golang",
    "avg_salary_yearly": "145000.00"
  },
  {
    "skills": "numpy",
    "avg_salary_yearly": "143512.50"
  },
  {
    "skills": "databricks",
    "avg_salary_yearly": "141906.60"
  },
  {
    "skills": "linux",
    "avg_salary_yearly": "136507.50"
  },
  {
    "skills": "kubernetes",
    "avg_salary_yearly": "132500.00"
  },
  {
    "skills": "atlassian",
    "avg_salary_yearly": "131161.80"
  },
  {
    "skills": "twilio",
    "avg_salary_yearly": "127000.00"
  },
  {
    "skills": "airflow",
    "avg_salary_yearly": "126103.00"
  },
  {
    "skills": "scikit-learn",
    "avg_salary_yearly": "125781.25"
  },
  {
    "skills": "jenkins",
    "avg_salary_yearly": "125436.33"
  },
  {
    "skills": "notion",
    "avg_salary_yearly": "125000.00"
  },
  {
    "skills": "scala",
    "avg_salary_yearly": "124903.00"
  },
  {
    "skills": "postgresql",
    "avg_salary_yearly": "123878.75"
  },
  {
    "skills": "gcp",
    "avg_salary_yearly": "122500.00"
  },
  {
    "skills": "microstrategy",
    "avg_salary_yearly": "121619.25"
  }
]

### Trends in Top Paying Skills for Data Analysts in 2023

    1. **Big Data and Cloud Technologies**:
    - **PySpark**: The highest paying skill ($208,172.25/year) indicates a strong demand for expertise in big data 
        processing and distributed computing.
    - **Databricks**: ($141,906.60/year) is another high-paying skill related to big data and analytics platforms.
    - **GCP (Google Cloud Platform)**: ($122,500/year) highlights the importance of cloud computing skills.

    2. **Version Control and Collaboration Tools**:
    - **Bitbucket**: ($189,154.50/year) and **GitLab**: ($154,500/year) show that version control and collaboration 
        tools are highly valued, reflecting the importance of software development practices in data analysis.
    - **Jenkins**: ($125,436.33/year) further emphasizes the value of continuous integration and deployment (CI/CD) tools.

    3. **Machine Learning and Data Science Libraries**:
    - **Pandas**: ($151,821.33/year), **Numpy**: ($143,512.50/year), and **Scikit-learn**: ($125,781.25/year) are key 
        libraries in the Python ecosystem, underscoring the need for strong data manipulation and machine learning skills.
    - **DataRobot**: ($155,485.50/year) indicates the value of automated machine learning platforms.

    4. **Programming Languages**:
    - **Swift**: ($153,750/year) and **Golang**: ($145,000/year) show that proficiency in versatile programming languages 
        can command high salaries.
    - **Scala**: ($124,903/year) is also valued, likely for its use in data processing frameworks like Apache Spark.

    5. **Specialized Databases and Search Technologies**:
    - **Couchbase**: ($160,515/year) and **Elasticsearch**: ($145,000/year) highlight the demand for skills in NoSQL 
        databases and search engines.
    - **PostgreSQL**: ($123,878.75/year) demonstrates the enduring value of expertise in relational databases.

    6. **AI and Cognitive Services**:
    - **Watson**: ($160,515/year) indicates a significant demand for skills related to IBM's AI and cognitive services.

    7. **DevOps and Containerization**:
    - **Kubernetes**: ($132,500/year) reflects the importance of container orchestration skills in modern data 
        infrastructure.

    8. **Data Orchestration and Workflow Management**:
    - **Airflow**: ($126,103/year) shows the value of expertise in managing complex data workflows.

### Additional Noteworthy Skills
    - **Jupyter**: ($152,776.50/year) emphasizes the importance of interactive data analysis and visualization.
    - **MicroStrategy**: ($121,619.25/year) represents the demand for skills in enterprise analytics and business 
        intelligence tools.
    - **Linux**: ($136,507.50/year) remains a crucial skill, highlighting the need for proficiency in operating systems 
        widely used in data environments.
    - **Atlassian**: ($131,161.80/year) tools, like JIRA and Confluence, indicate the importance of project management and 
        collaboration software.
    - **Twilio**: ($127,000/year) and **Notion**: ($125,000/year) skills show that knowledge in specific SaaS products can 
        also command high salaries.

### Summary
    The trends suggest that top-paying skills for data analysts are heavily oriented towards big data processing, cloud 
        computing, machine learning, and modern software development practices. Expertise in specialized databases, 
        AI services, and data orchestration tools are also highly valued. Proficiency in popular programming languages 
        and data science libraries is crucial, along with strong knowledge of DevOps and containerization technologies.
*/
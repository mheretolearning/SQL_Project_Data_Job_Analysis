/*🧑‍💻 **Scenario:** 

**Question: What are the top-paying data analyst jobs, and what skills are required?** 

- Identify the top 10 highest-paying Data Analyst jobs and the specific skills required for these roles.
- Filters for roles with specified salaries that are remote
- Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries */

    WITH top_paying_data_analyst_jobs AS (
    SELECT
        job_id,
        job_title,
        name AS company_name,
        salary_year_avg       
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    WHERE
        salary_year_avg IS NOT NULL
        AND job_title_short = 'Data Analyst'
        AND job_location= 'Anywhere'
    ORDER BY
        salary_year_avg DESC
    LIMIT 10 
    )

    SELECT
        top_paying_data_analyst_jobs.job_id,
        top_paying_data_analyst_jobs.company_name,
        job_title,
        skills_dim.skills,
        salary_year_avg
    FROM top_paying_data_analyst_jobs
    INNER JOIN 
    skills_job_dim ON skills_job_dim.job_id = top_paying_data_analyst_jobs.job_id
    INNER JOIN 
    skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id


    -- If we do not limit first ten jobs, then result will be different. Because important part of this problem to find the first 10 jobs. Then the other conditions are coming....
    -- this query gives us the first highest ten Data analyst jobs requires those skills. 
    -- we have to use CTE to get the correct result, because each job postings might be including more than 10 skills. if we do not use cte and starts the query by limiting 10, then the result has to filter from ten row results

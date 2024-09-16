/**Question: What are the top-paying data analyst jobs?**

- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries.
- Why? Aims to highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

SELECT
    company_dim.name AS company_name,
    job_id,
    job_postings_fact.job_title,
    salary_year_avg
FROM job_postings_fact
INNER JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE salary_year_avg IS NOT NULL
AND job_location='Anywhere'
AND job_title='Data Analyst'
ORDER BY
    salary_year_avg DESC
LIMIT 10
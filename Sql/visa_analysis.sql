1.Total Applications
----------------------------------------
select COUNT(*) as TotalApplications
from Visadataset
==========================================
2. Approval vs Denial
-----------------------------------------
select case_status,
		COUNT(*) as TotalApplications
from Visadataset
group by case_status

==========================================
3. Approval Percentage

select case_status,
		Round(
		count(*)*100/
		sum(count(*)) over(),
		1
		)as Percentage
from Visadataset
group by case_status

==============================================

4. Applications by Continent

select Continent,
		count(*) as Applications
from Visadataset
group by continent
order by Applications Desc

=================================

5. Certification Rate by Continent

select Continent,
		count(*) as TotalApplications,
		Sum(
			case
				when case_status = 'Certified'
				then 1
				else 0
			end
			) As CertifiedApplications
from Visadataset
group by Continent

========================================

6. Education Analysis

select education_of_employee,
		case_status,
		count(*)As Total
from Visadataset
group by education_of_employee,
		case_status
Order by education_of_employee

========================================
7. Average Wage by Status

select case_status,
		Avg(prevailing_wage) AverageWage
from Visadataset
group by case_status

======================================

8. Experience Analysis

select has_job_experience,
		case_status,
		count(*)As Total
from Visadataset
group by has_job_experience,
		case_status
Order by has_job_experience Desc

======================================

9. Job Training Analysis

select requires_job_training,
		case_status,
		Count(*)As Total
from Visadataset
Group by requires_job_training,
		case_status
Order by Total Desc

=======================================

10. Region Analysis

select region_of_employment,
		Count(*)As Applications
from Visadataset
group by region_of_employment 
Order by Applications desc

===========================================

Top 10 Highest Wage Applications

select Top 10
		case_id,
		education_of_employee,
		prevailing_wage,
		case_status
from Visadataset
Order by prevailing_wage Desc

===================================

12. Average Company Size

select case_status,
		Count(no_of_employees) As AverageEmployees
from Visadataset
Group by case_status
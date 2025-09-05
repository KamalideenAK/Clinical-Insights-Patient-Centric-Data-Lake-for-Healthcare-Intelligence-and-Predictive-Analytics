-- Count readmissions by department
SELECT department, COUNT(*) as admissions
FROM clinical.patient_admissions
WHERE year=2025 AND month=8
GROUP BY department;

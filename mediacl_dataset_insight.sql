-- These are the SQL queries I ran to understand and gain insight from my data.

-- total number of patients

SELECT COUNT(DISTINCT patient_id) AS total_patients
FROM medical_dataset_clean;

-- appointment status breakdown

SELECT appointment_status, COUNT(*) AS total
FROM medical_dataset_clean
GROUP BY appointment_status
ORDER BY total DESC;

-- total revenue collected (amount paid)
SELECT SUM(amount_paid) AS total_revenue
FROM medical_dataset_clean;

-- revenue by department
SELECT department, SUM(amount_paid) AS revenue
FROM medical_dataset_clean
GROUP BY department
ORDER BY revenue DESC;

-- doctor performance (completed appointments)

SELECT doctor_name, COUNT(*) AS completed_appointment
FROM medical_dataset_clean
WHERE appointment_status = 'completed'
GROUP BY doctor_name
ORDER BY completed_appointment DESC;

-- insurance provider distribution

SELECT insurance_provider, COUNT(*) AS total
FROM medical_dataset_clean
GROUP BY insurance_provider
ORDER BY -total DESC;

-- no-show rate

SELECT 
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN appointment_status = 'no show' THEN 1 END) AS no_shows,
    ROUND(
        (SUM(CASE WHEN appointment_status = 'no show' THEN 1 END) / COUNT(*)) * 100,
        2
    ) AS no_show_rate_percent
FROM medical_dataset_clean;

-- monthly appointment trends

SELECT appointment_year, appointment_month, COUNT(*) AS total_appointments
FROM medical_dataset_clean
GROUP BY appointment_year, appointment_month
ORDER BY appointment_year, appointment_month;

-- total pending revenue

SELECT SUM(amount_pending) AS total_unpaid_amount
FROM medical_dataset_clean;

-- patients with outstending balances

SELECT patient_name, amount_pending
FROM medical_dataset_clean
WHERE amount_pending > 0
ORDER BY amount_pending DESC;













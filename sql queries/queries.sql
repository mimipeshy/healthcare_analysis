/* Calculate Wait Time (Days Between Scheduling & Appointment*/
SELECT 
  patient_id,
  DATE(ScheduledDay) AS scheduled_date,
  DATE(AppointmentDay) AS appointment_date,
  DATE_DIFF(DATE(AppointmentDay), DATE(ScheduledDay), DAY) AS wait_days
FROM vw_clean_appointments


/*No-Show Rate by SMS Reminder*/

SELECT
  SMS_received,
  COUNT(*) AS total_appointments,
  SUM(CASE WHEN No_show = 'true' THEN 1 ELSE 0 END) AS no_shows,
  ROUND(SUM(CASE WHEN No_show = 'true' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS no_show_rate_pct
FROM appointments
GROUP BY SMS_received;


/*No-Show Rate by Day of the Week*/
SELECT
  appointment_day,
  COUNT(*) AS total_appointments,
  SUM(CASE WHEN No_show = 'true' THEN 1 ELSE 0 END) AS no_shows,
  ROUND(SUM(CASE WHEN No_show = 'true' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS no_show_rate_pct
FROM appointments
GROUP BY appointment_day
ORDER BY no_show_rate_pct DESC;


/*No-Show Rate by Age Group*/
SELECT
  age_group,
  COUNT(*) AS total_appointments,
  SUM(CASE WHEN No_show = 'true' THEN 1 ELSE 0 END) AS no_shows,
  ROUND(SUM(CASE WHEN No_show = 'true' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS no_show_rate_pct
FROM (
  SELECT *,
    CASE
      WHEN age BETWEEN 0 AND 17 THEN 'Child'
      WHEN age BETWEEN 18 AND 35 THEN 'Young Adult'
      WHEN age BETWEEN 36 AND 60 THEN 'Adult'
      ELSE 'Senior'
    END AS age_group
  FROM appointments
) sub
GROUP BY age_group
ORDER BY no_show_rate_pct DESC;






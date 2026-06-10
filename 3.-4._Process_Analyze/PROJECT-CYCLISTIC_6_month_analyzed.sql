SELECT 
    member_casual,
    EXTRACT(MONTH FROM started_at) AS month_start_number,
    COUNT(ride_id) AS month_ride_count,
FROM `gda-projects-2026.cyclistic_data.cleaned_combined_trips`
GROUP BY member_casual, month_start_number
ORDER BY member_casual, month_ride_count DESC;
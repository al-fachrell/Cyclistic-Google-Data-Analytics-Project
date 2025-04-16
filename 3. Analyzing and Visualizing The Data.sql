-- Title: Data Analysis

-- Total trips by customer type
SELECT
  member_casual,
  COUNT(*) AS total_trips,
  CAST(COUNT(*) AS FLOAT64) / SUM(COUNT(*)) OVER () * 100 AS percentage
FROM
  `pristine-sphere-456607-r7`.Case_Study.final_cleaned_combined_data
GROUP BY 1;

-- average ride length by customer type
-- Note: ride_length is in minutes
SELECT
  member_casual,
  AVG(ride_length) AS average_ride_length
FROM
  `pristine-sphere-456607-r7`.Case_Study.final_cleaned_combined_data
GROUP BY 1;

-- total rides by customer type and hour of the day
SELECT
  member_casual,
  EXTRACT(HOUR FROM started_at) AS hour_of_day,
  COUNT(*) AS num_trips
FROM
  `pristine-sphere-456607-r7`.Case_Study.final_cleaned_combined_data
GROUP BY 1, 2
ORDER BY hour_of_day;

-- average ride length and total trips 
-- by customer type and day of the week
SELECT
  member_casual,
  FORMAT_DATE('%A', DATE(started_at)) AS day_of_week,
    AVG(ride_length) AS average_ride_length,
  COUNT(*) AS num_trips
FROM
  `pristine-sphere-456607-r7`.Case_Study.final_cleaned_combined_data
GROUP BY 1, 2
ORDER BY CASE day_of_week
  WHEN 'Monday' THEN 1
  WHEN 'Tuesday' THEN 2
  WHEN 'Wednesday' THEN 3
  WHEN 'Thursday' THEN 4
  WHEN 'Friday' THEN 5
  WHEN 'Saturday' THEN 6
  WHEN 'Sunday' THEN 7
  ELSE 8
END;

-- total trips by customer type and month of the year
SELECT
  member_casual,
  FORMAT_DATE('%B', DATE(started_at)) AS month_of_year,
  COUNT(*) AS num_trips
FROM
  `pristine-sphere-456607-r7`.Case_Study.final_cleaned_combined_data
GROUP BY 1, 2
ORDER BY CASE month_of_year
  WHEN 'January' THEN 1
  WHEN 'February' THEN 2
  WHEN 'March' THEN 3
  WHEN 'April' THEN 4
  WHEN 'May' THEN 5
  WHEN 'June' THEN 6
  WHEN 'July' THEN 7
  WHEN 'August' THEN 8
  WHEN 'September' THEN 9
  WHEN 'October' THEN 10
  WHEN 'November' THEN 11
  WHEN 'December' THEN 12
  ELSE 13
END;

-- total rides by customer type and bike type
-- Note: rideable_type is the bike type
-- Note: bike types are 'electric_bike', 'docked_bike', 'classic_bike'
SELECT
  member_casual,
  rideable_type,
  COUNT(*) AS total_rides
FROM
  `pristine-sphere-456607-r7`.Case_Study.final_cleaned_combined_data
GROUP BY 1, 2;

-- casual riders that ride more than 2 standard deviations above the mean
SELECT
  ride_id,
  start_station_name,
  end_station_name,
  ride_length,
  day,
  month
FROM
  `pristine-sphere-456607-r7`.Case_Study.final_cleaned_combined_data
WHERE
  ride_length > (
    SELECT
      AVG(ride_length) + 2 * STDDEV(ride_length)
    FROM
      `pristine-sphere-456607-r7`.Case_Study.final_cleaned_combined_data
  ) AND start_station_name IS NOT NULL AND end_station_name IS NOT NULL AND member_casual = 'casual'
ORDER BY ride_length;

-- top 10 days where casual riders (non-members) took the longest total rides
-- grouped by the start station for each day. 
SELECT
  day,
  member_casual,
  start_station_name,
  SUM(ride_length) AS total_ride_length,
  AVG(ride_length) AS average_ride_length
FROM
  `pristine-sphere-456607-r7`.Case_Study.final_cleaned_combined_data
WHERE
  member_casual = 'casual'
GROUP BY 1, 2, 3
ORDER BY day, total_ride_length DESC
LIMIT 10;


-- lets continue to visualizing the data
-- i am using tableau 

-- Create a new table by combining all the data from the existing tables, pristine-sphere-456607-r7 is the project name, 
-- Case_Study is the dataset name, and 202401-divvy-tripdata is the table name.

CREATE OR REPLACE TABLE `pristine-sphere-456607-r7.Case_Study.combined_data` AS
SELECT * FROM `pristine-sphere-456607-r7.Case_Study.202401-divvy-tripdata`
UNION ALL
SELECT * FROM `pristine-sphere-456607-r7.Case_Study.202402-divvy-tripdata`
UNION ALL
SELECT * FROM `pristine-sphere-456607-r7.Case_Study.202403-divvy-tripdata`
UNION ALL
SELECT * FROM `pristine-sphere-456607-r7.Case_Study.202404-divvy-tripdata`
UNION ALL
SELECT * FROM `pristine-sphere-456607-r7.Case_Study.202405-divvy-tripdata`
UNION ALL
SELECT * FROM `pristine-sphere-456607-r7.Case_Study.202406-divvy-tripdata`
UNION ALL
SELECT * FROM `pristine-sphere-456607-r7.Case_Study.202407-divvy-tripdata`
UNION ALL
SELECT * FROM `pristine-sphere-456607-r7.Case_Study.202408-divvy-tripdata`
UNION ALL
SELECT * FROM `pristine-sphere-456607-r7.Case_Study.202409-divvy-tripdata`
UNION ALL
SELECT * FROM `pristine-sphere-456607-r7.Case_Study.202410-divvy-tripdata`
UNION ALL
SELECT * FROM `pristine-sphere-456607-r7.Case_Study.202411-divvy-tripdata`
UNION ALL
SELECT * FROM `pristine-sphere-456607-r7.Case_Study.202412-divvy-tripdata`;

-- The query will return the following statistics:
-- 1. Total number of rows in the combined data (5860568)
-- 2. Total number of distinct ride IDs (5860357)
-- 3. Number of rides with missing start station IDs (1073951)
-- 4. Number of rides with missing end station IDs (1104653)
-- 5. Earliest ride date (2024-01-01 00:00:39 UTC)
-- 6. Latest ride date (2024-12-31 23:59:55.705000 UTC)
-- This will help you understand the data quality and coverage.
SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT ride_id) AS distinct_ride_ids,
  COUNT(CASE WHEN start_station_id IS NULL THEN 1 END) AS missing_start_station_ids,
  COUNT(CASE WHEN end_station_id IS NULL THEN 1 END) AS missing_end_station_ids,
  MIN(started_at) AS earliest_ride,
  MAX(ended_at) AS latest_ride
FROM
  `pristine-sphere-456607-r7`.Case_Study.combined_data;


--checking data type
SELECT
  column_name,
  data_type
FROM
  `pristine-sphere-456607-r7`.Case_Study.INFORMATION_SCHEMA.COLUMNS
WHERE
  table_name = 'combined_data';

-- checking for null values
SELECT
  COUNT(*) AS total_rows,
  COUNT(start_station_name) AS non_null_start_station_names,
  COUNT(end_station_name) AS non_null_end_station_names
FROM
  `pristine-sphere-456607-r7`.Case_Study.combined_data;

-- checking for rides with a duration of less than 1 minute
  SELECT
  ride_id,
  started_at,
  ended_at
FROM
  `pristine-sphere-456607-r7`.Case_Study.combined_data
WHERE
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1;

-- checking for rides with a duration of more than 24 hours
  SELECT
  ride_id,
  started_at,
  ended_at
FROM
  `pristine-sphere-456607-r7`.Case_Study.combined_data
WHERE
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) >= 1440;

-- Create a new table without rows having null station names
-- The following query will create a new table called cleaned_combined_data
CREATE OR REPLACE TABLE
  `pristine-sphere-456607-r7`.Case_Study.cleaned_combined_data AS
SELECT
  *
FROM
  `pristine-sphere-456607-r7`.Case_Study.combined_data
WHERE
  start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL;

  -- Add ride_length in minutes column
ALTER TABLE `pristine-sphere-456607-r7`.Case_Study.cleaned_combined_data
ADD COLUMN ride_length NUMERIC;

-- Update the table with calculated ride lengths
UPDATE `pristine-sphere-456607-r7.Case_Study.cleaned_combined_data`
SET ride_length = TIMESTAMP_DIFF(ended_at, started_at, MINUTE)
WHERE TRUE;

-- Create a new table without rows having ride lengths less than 1 minute or more than 24 hours (1440 Minutes) (Outliers)
CREATE OR REPLACE TABLE
  `pristine-sphere-456607-r7`.Case_Study.final_cleaned_combined_data AS
SELECT
  *
FROM
  `pristine-sphere-456607-r7`.Case_Study.cleaned_combined_data
WHERE
  ride_length BETWEEN 1
  AND 1440;

-- add day and month columns
ALTER TABLE `pristine-sphere-456607-r7`.Case_Study.final_cleaned_combined_data ADD COLUMN day STRING,
  ADD COLUMN month STRING;
UPDATE `pristine-sphere-456607-r7`.Case_Study.final_cleaned_combined_data
SET
  day = FORMAT_DATE('%A', DATE(started_at)),
  month = FORMAT_DATE('%B', DATE(started_at))
WHERE TRUE;

-- check for duplicate ride_ids
SELECT
  ride_id,
  COUNT(*) AS count
FROM
  `pristine-sphere-456607-r7`.Case_Study.final_cleaned_combined_data
GROUP BY
  ride_id
HAVING
  COUNT(*) > 1;

-- delete duplicate ride_ids (242 rows)
DELETE `pristine-sphere-456607-r7`.Case_Study.final_cleaned_combined_data
WHERE
  ride_id IN (
    SELECT
      ride_id
    FROM
      `pristine-sphere-456607-r7`.Case_Study.final_cleaned_combined_data
    GROUP BY ride_id
    HAVING COUNT(*) > 1
  );

-- count the number of rows in the final cleaned table
SELECT
  COUNT(*)
FROM
  `pristine-sphere-456607-r7`.Case_Study.final_cleaned_combined_data;
-- returned 4.168.272 so 1.692.296 rows were deleted

-- lets continue to analyzing the data





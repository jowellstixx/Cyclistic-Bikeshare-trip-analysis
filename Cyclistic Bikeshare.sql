/* Loading the data to note the number of record it contains */

SELECT
	*
FROM
	jan_to_mar_tripdata;

/* Changing the variables day_of_week column from integer to text variables to represent the days of the week */

UPDATE
	jan_to_mar_tripdata
SET
	day_of_week = 'saturday'
WHERE
	day_of_week = 7

 --- Did this for the rest of the days of the week in the 'day_of_week' column.

/* Confirming there are no errors with the days of the week */

SELECT
	DISTINCT(day_of_week)
FROM
	jan_to_mar_tripdata;

/* Checking the types of bikes used at Bikeshare */

SELECT
	DISTINCT(rideable_type)
FROM
	jan_to_mar_tripdata;
 --- The types of bikes used are, electric, classic and docked bikes

/* Calculating the total riders */

SELECT
	COUNT(ride_id)
FROM
	jan_to_mar_tripdata
 --- There are 412,495

/* Calculating the number of casual riders */

SELECT
	COUNT(ride_id)
FROM
	jan_to_mar_tripdata
WHERE
	member_casual = 'casual';
 -- There are 99883 casual riders.

/* Calculating the number of riders that are members */

SELECT
	COUNT(ride_id)
FROM
	jan_to_mar_tripdata
WHERE
	member_casual = 'member';
 -- There are 312612 member riders.

/* Findig the most ridden/demanded type of bike */

SELECT
	COUNT(rideable_type) AS num_of_electric
FROM
	jan_to_mar_tripdata
WHERE
	rideable_type = 'electric_bike';
 -- Electric bikes = 179272

SELECT
	COUNT(rideable_type) AS num_of_classic
FROM
	jan_to_mar_tripdata
WHERE
	rideable_type = 'classic_bike';
 -- Classic bikes = 224435

SELECT
	COUNT(rideable_type) AS num_of_docked
FROM
	jan_to_mar_tripdata
WHERE
	rideable_type = 'docked_bike';
 -- Docked bikes = 8788
 
 -- Classic bikes are the most ridden/demanded bikes, followed by electric bikes and finally, docked bikes.

/* Finding the most popular day for riding */
 
SELECT
	COUNT(day_of_week),
	COUNT(CASE WHEN day_of_week = 'sunday' THEN 1 END) AS sunday,
	COUNT(CASE WHEN day_of_week = 'monday' THEN 2 END) AS monday,
	COUNT(CASE WHEN day_of_week = 'teusday' THEN 3 END) AS teusday,
	COUNT(CASE WHEN day_of_week = 'wednesday' THEN 4 END) AS wednesday,
	COUNT(CASE WHEN day_of_week = 'thursday' THEN 5 END) AS thursday,
	COUNT(CASE WHEN day_of_week = 'friday' THEN 6 END) AS friday,
	COUNT(CASE WHEN day_of_week = 'saturday' THEN 7 END) AS saturday
FROM
	jan_to_mar_tripdata
 -- Sunday: 53,835
 -- Monday:68,699
 -- Teusday: 65,170
 -- Wednesday: 67,150
 -- Thursday: 59,835
 -- Friday: 46,776
 -- Saturday: 51,030

 -- Monday is the most popular day

/* Finding the number of bike stations */

SELECT
	COUNT(DISTINCT start_station_name) AS stations
FROM
	jan_to_mar_tripdata
ORDER BY
	start_station_name ASC;
 
-- THere are 846 stations.

/* Changing the ride_length formart to MM:SS */

SELECT
	SUBSTR(ride_length, 3, 2) || ':' || SUBSTR(ride_length, 6, 2)
FROM
	jan_to_mar_tripdata

/* Separated the date and time from the 'started_at' and 'ended_at' columns */

SELECT
	*,
	SUBSTR(started_at, 1, 10) AS started_date,
	SUBSTR(started_at, 12,19) AS started_time,
	SUBSTR(ended_at, 1, 10) AS ended_date,
	SUBSTR(ended_at, 12, 19) AS ended_time
FROM
	jan_to_mar_tripdata;

 -- Saved the result and imported it as a new table 'updated_jan_to_mar_tripdata'

/* Loading the new table */

SELECT
	*
FROM
	updated_jan_to_mar_tripdata;

/* Delete 'started_at' and 'ended_at' columns */

ALTER TABLE updated_jan_to_mar_tripdata
DROP COLUMN started_at;

 -- Repeated the process for 'ended_at' column.

SELECT
	COUNT(ride_id)
FROM
	jan_to_mar_tripdata


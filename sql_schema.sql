-- Create the three tables we are going to import of csv data into.

CREATE TABLE CRIMES (
	CRIME_ID serial, 
	CRIME_DATE TIMESTAMP,
	STREET_NAME VARCHAR(100),
	CRIME_TYPE VARCHAR(150),
	CRIME_DESCRIPTION VARCHAR(250),
	LOCATION_DESCRIPTION VARCHAR(150),
	ARREST boolean, 
	DOMESTIC boolean, 
	COMMUNITY_ID int, 
	LATITUDE numeric, 
	LONGITUDE numeric, 
	PRIMARY KEY (CRIME_ID));


CREATE TABLE COMMUNITY (
	AREA_ID int, 
	COMMUNITY_NAME VARCHAR(250),
	POPULATION int, 
	AREA_SIZE numeric, 
	DENSITY numeric, 
	PRIMARY KEY (AREA_ID));


CREATE TABLE WEATHER (
	WEATHER_DATE date,
	TEMP_HIGH int, 
	TEMP_LOW int, 
	PRECIPITATION numeric, 
	PRIMARY KEY (WEATHER_DATE));
	
-- Copy and insert data from csv files to tables.

COPY CRIMES (
	CRIME_DATE,
	STREET_NAME,
	CRIME_TYPE,
	CRIME_DESCRIPTION,
	LOCATION_DESCRIPTION,
	ARREST,
	DOMESTIC,
	COMMUNITY_ID,
	LATITUDE,
	LONGITUDE)
FROM 'C:\Users\Jaime\Desktop\git-repo\chicago_crime_and_weather_2021\csv\chicago_crimes_2021.csv'
DELIMITER ',' CSV HEADER;

COPY COMMUNITY (
	AREA_ID, 
	COMMUNITY_NAME,
	POPULATION, 
	AREA_SIZE, 
	DENSITY)
FROM 'C:\Users\Jaime\Desktop\git-repo\chicago_crime_and_weather_2021\csv\chicago_areas.csv'
DELIMITER ',' CSV HEADER;

COPY WEATHER (
	WEATHER_DATE,
	TEMP_HIGH, 
	TEMP_LOW, 
	PRECIPITATION)
FROM 'C:\Users\Jaime\Desktop\git-repo\chicago_crime_and_weather_2021\csv\chicago_temps_2021.csv'
DELIMITER ',' CSV HEADER;
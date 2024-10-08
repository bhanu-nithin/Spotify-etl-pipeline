// CREATING ALBUM TABLE

CREATE OR REPLACE TABLE SPOTIFY_DB.PUBLIC.album_table(
    album_id VARCHAR(255),
    name VARCHAR(255),
    release_date DATE,
    total_tracks INT,
    url VARCHAR(255)
);

// CREATING FILE FORMAT
CREATE OR REPLACE FILE FORMAT CSV_FILE_FORMAT
    TYPE = 'CSV'
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    SKIP_HEADER = 1
    NULL_IF = ('NULL', 'null', '');

// CREATING STAGE FOR ALBUM DATA IN S3

CREATE OR REPLACE STAGE SPOTIFY_DB.PUBLIC.album_stage
URL = 's3://spotify-etl-project-bhanu/transformed-data/album-data/' 
STORAGE_INTEGRATION = s3_init
FILE_FORMAT = CSV_FILE_FORMAT;

// LISTING FILES IN THE STAGE

LIST @SPOTIFY_DB.PUBLIC.album_stage;

// CREATING SNOWPIPE AND COPYING DATA FROM S3 WHENEVER THERE IS A NEW DATA ADDED

CREATE OR REPLACE PIPE SPOTIFY_DB.PUBLIC.album_pipe
AUTO_INGEST = TRUE
AS
COPY INTO SPOTIFY_DB.PUBLIC.album_table 
FROM @SPOTIFY_DB.PUBLIC.album_stage;

// ACCESSING EVENT NOTIFICATION FROM S3

DESC PIPE SPOTIFY_DB.PUBLIC.album_pipe;

// CHECKING UPDATED DATA

SELECT * FROM SPOTIFY_DB.PUBLIC.album_table;

// TRUNCATING THE ARTIST TABLE

TRUNCATE TABLE SPOTIFY_DB.PUBLIC.album_table;

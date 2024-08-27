# Spotify ETL End to End Pipeline Using Snowflake

# Project Summary


The Spotify ETL (Extract, Transform, Load) Pipeline is an end-to-end solution that automates the process of extracting, transforming, and loading data, specifically designed to analyze the top 50 global songs. The pipeline begins by leveraging the Spotify API to extract data on the most popular songs globally, including key details like track names, artists, and popularity metrics. 

The raw data is initially processed in Jupyter Notebook, where it undergoes comprehensive cleaning. This step involves handling missing values, standardizing formats, and enriching the dataset to ensure consistency and readiness for further processing.We will be creating 2 folders for raw data and tranformed data respectively, So first the raw data will be stored in the raw folder and then afteer transformation the data goes into transformation folder.
Following the data organization in S3, AWS Lambda functions are employed to further process the cleaned data. Lambda, a serverless computing service, executes the code in response to specific triggers, automatically scaling based on demand. These Lambda functions perform critical transformations, such as aggregating the data or reformatting it for optimal loading into a data warehouse.

The processed data is then seamlessly integrated into Snowflake, a cloud-based data warehouse known for its robust performance and scalability. Snowflake serves as the central repository for the processed data, where it can be efficiently queried and analyzed. The integration between AWS and Snowflake ensures that data flows smoothly from the extraction stage to the analysis stage.

Finally, the pipeline culminates in the integration with Power BI, a leading business intelligence tool. Power BI is used to create dynamic and interactive dashboards that visualize the insights derived from the top 50 global songs dataset. These dashboards provide users with actionable insights, enabling data-driven decision-making and deeper understanding of trends in the music industry. This entire pipeline, from data extraction to insight generation, is designed to be efficient, scalable, and reliable, ensuring that users have access to up-to-date and accurate data for their analytical needs.

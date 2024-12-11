
BACKGROUND
Cyclistic is a bike-sharing service offering a diverse fleet of over 5,800 bikes and 600 docking stations across Chicago. The program includes a range of bike types such as recumbent bikes, hand tricycles, and cargo bikes to accommodate riders with disabilities or those who cannot use standard two-wheeled bikes. Established in 2016, Cyclistic has expanded significantly, now encompassing a geotracked network of 692 stations. Riders can unlock a bike at any station and return it to another at their convenience.
Historically, Cyclistic's marketing approach focused on raising awareness and appealing to a broad consumer base. The service offers flexible pricing options, including single-ride passes, full-day passes, and annual memberships. Casual riders are those who opt for single-ride or full-day passes, while annual members subscribe for a year-long commitment.
My Role
In this project, I am acting as a junior data analyst at Cyclistic, and my team's goal is to develop strategies to convert casual riders into annual members.
Overall Goal
The primary objective is to design marketing strategies that encourage casual riders to become annual members.
Business Question
"How do the usage patterns of annual members and casual riders differ on Cyclistic bikes?"
Below, I will outline the step-by-step process I followed to complete this project. If you’re interested in the business insights, feel free to skip ahead to the "Insights" section.


PROCESS
Overview:
I began by analyzing the data on a monthly basis using Excel, then moved to R for a comprehensive yearly analysis. Finally, I created a dashboard in Tableau and utilized Figma to enhance the visual design elements.
Microsoft Excel
I initially chose Excel for its familiarity, which allowed for a quicker, high-level understanding of the data. Due to the large file sizes, I avoided combining all the data into one, as it would have required more processing power than my computer could handle.
I obtained the data from the link provided in the document and downloaded all of the data for the year 2021. Afterward, I converted the .csv files into Excel spreadsheets. The data I used includes the following months:
•	January 2021
•	February 2021
•	March 2021
•	April 2021
•	May 2021
•	June 2021
•	July 2021
•	August 2021
•	September 2021
•	October 2021
•	November 2021
•	December 2021
To this dataset, I added two new columns:
•	Ride Length: Calculated by subtracting the start_at time from the end_at time for each trip.
•	Day of the Week: Determined based on the date in the start_at column.

R
While I initially intended to use SQL, the data files were too large to upload, and I was unable to set up Google Cloud Platform. Instead, I used R, which handled the large dataset more efficiently and allowed me to enhance my R skills. Below is a summary of the process I followed in R (I’ve excluded details about mistakes and missteps for brevity).
For the complete code, you can view my GitHub repository for this project.
I began by loading libraries such as tidyverse, lubridate, hms, and data.table. Then, I used read_csv to load individual CSV files into separate data frames, one for each month. The data for each month was stored in variables such as aug08_df, sep09_df, etc.
I merged the 12 months of data into a single dataset using rbind to create a unified view for the entire year. A new data frame, cyclistic_date, was created to house the additional calculated columns.
I added new columns for:
•	Ride Length: Subtracted the end_at time from the start_at time.
•	Day of the Week
•	Month
•	Day
•	Year
•	Time: Converted to HH:MM:SS format.
•	Hour
•	Season: Categorized as Spring, Summer, Winter, or Fall.
•	Time of Day: Categorized as Morning, Afternoon, Evening, or Night.
I then performed analysis on the following variables:
•	Total Rides by User Time: Analyzed the total number of rides per time of day, segmented by member type (casual vs. annual).
•	Ride Duration by User Type: Calculated the average ride duration for casual and annual riders, separated by different time periods.
•	Rides by Month: Analyzed the total number of rides for each month throughout the year.
•	Rides by Season: Compared the total number of rides across different seasons (Spring, Summer, Fall, Winter).
•	Rides per Month: Analyzed the rides for each month to identify trends and peak times.
•	Most Popular Bike Type by Time: Analyzed which bike types (classic, docked, electric) were most commonly used during different times of the day.
•	Total Rides by Hour: Examined the total number of rides by hour to identify peak usage times.


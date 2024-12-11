
BACKGROUND
Cyclistic is a bike-sharing service offering a diverse fleet of over 5,800 bikes and 600 docking stations across Chicago. The program includes a range of bike types such as recumbent bikes, hand tricycles, and cargo bikes to accommodate riders with disabilities or those who cannot use standard two-wheeled bikes. Established in 2016, Cyclistic has expanded significantly, now encompassing a geotracked network of 692 stations. Riders can unlock a bike at any station and return it to another at their convenience.
Historically, Cyclistic's marketing approach focused on raising awareness and appealing to a broad consumer base. The service offers flexible pricing options, including single-ride passes, full-day passes, and annual memberships. Casual riders are those who opt for single-ride or full-day passes, while annual members subscribe for a year-long commitment.
My Role
In this project, I am acting as a junior data analyst at Cyclistic, and my team's goal is to develop strategies to convert casual riders into annual members.
Overall Goal
The primary objective is to design marketing strategies that encourage casual riders to become annual members.
Business Question
"How do the usage patterns of annual members and casual riders differ on Cyclistic bikes?"

Below, I will outline the step-by-step process I followed to complete this project.


PROCESS
Overview:
I began by analyzing the data on a monthly basis using Excel, then moved to R for a comprehensive yearly analysis. 
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

Findings:
Usage Patterns by User Type:
•	Casual riders predominantly use bikes on weekends, while annual members have consistent usage throughout the week.
•	Casual riders take longer rides on average compared to annual members.
Seasonal and Monthly Trends:
•	Summer months (June–August) see the highest number of rides, indicating peak usage during warmer weather.
•	Casual riders contribute significantly to this seasonal spike, especially on weekends.
Bike Preferences:
•	Electric bikes and classic bikes are the most popular, with casual riders favoring electric bikes for longer rides.
Hourly Trends:
•	Most rides occur during late mornings and afternoons, with a notable spike during leisure hours for casual riders.
Ride Length Differences:
•	Casual riders tend to have longer ride durations, while members typically use bikes for shorter, consistent trips.

Marketing Strategies to Convert Casual Riders into Annual Members
1.	Introduce “Weekend Warrior” Membership Plans
o	Observation: Casual riders are most active on weekends.
o	Strategy: Offer a tailored “Weekend Membership Plan” for weekend riders at a reduced rate, including perks like discounted weekday rides. Promote upgrades to full annual memberships with added benefits like exclusive access to special promotions or events.
2.	Gamify the Membership Experience
o	Observation: Casual riders may lack a strong incentive to switch to annual plans.
o	Strategy: Launch a rewards program where casual riders earn points for rides. Points can unlock free rides, exclusive discounts, or merchandise. Highlight how annual members earn rewards faster, creating a sense of achievement and added value.
3.	Personalized Marketing Campaigns
o	Observation: Casual riders exhibit specific patterns, such as long ride durations or preferences for weekends.
o	Strategy: Use personalized email or app notifications to demonstrate how annual memberships align with their behavior. Examples: 
	“Save $$ on your weekend rides with an annual membership!”
	“You’ve spent 10 hours riding this month. Imagine the savings with a membership!”
These strategies focus on tailoring offerings to casual riders’ habits, incentivizing loyalty, and communicating tangible benefits effectively.

Conclusion:
The analysis highlights clear differences in how casual riders and annual members utilize Cyclistic bikes. Casual riders are more inclined toward recreational and seasonal use, favoring weekends and longer ride durations, while annual members use bikes more consistently for likely commuting or regular activities.
These insights underline opportunities for targeted marketing strategies aimed at converting casual riders into annual members. Offering tailored membership plans, rewards for frequent usage, and personalized marketing campaigns can effectively address casual riders’ habits and preferences, incentivizing them to transition to annual memberships.

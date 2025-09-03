# Cyclistic Bike Sharing: Project Overview and Analysis

## Background
Cyclistic is a bike-sharing service offering a diverse fleet of over 5,800 bikes and 600 docking stations across Chicago. The program includes various bike types such as recumbent bikes, hand tricycles, and cargo bikes to cater to riders with disabilities or those who cannot use standard two-wheeled bikes. Established in 2016, Cyclistic has grown significantly, now encompassing a geotracked network of 692 stations. Riders can unlock bikes at any station and return them at another location of their choice.

Historically, Cyclistic's marketing strategy focused on raising awareness and appealing to a broad consumer base. The service provides flexible pricing options, including single-ride passes, full-day passes, and annual memberships. Casual riders typically use single-ride or full-day passes, while annual members commit to a year-long membership.

## My Role
In this project, I worked as a Junior Data Analyst at Cyclistic. My team's objective was to develop strategies to convert casual riders into annual members.

## Overall Goal
The primary objective of the project was to design marketing strategies that will encourage casual riders to become annual members.

## Business Question
**"How do the usage patterns of annual members and casual riders differ on Cyclistic bikes?"**

Below is the step-by-step process I followed to complete this project. If you're interested in the business insights, feel free to skip ahead to the "Insights" section.



## Process

### Overview:
The analysis was carried out in two phases:
1. **R**: In-depth analysis on a yearly basis.
2. **Tableau**: Data visualization for insights.


### Microsoft Excel
I started by using **Excel** due to its familiarity and ease of use. To avoid performance issues with large datasets, I kept the files separate by month.

- **Data Files**: I worked with CSV files for each month of 2021, including:
  - January 2021 to December 2021
- **Additional Columns**:
  - `Ride Length`: Calculated by subtracting the `start_at` time from the `end_at` time.
  - `Day of the Week`: Based on the `start_at` date.

### R Analysis
For deeper analysis, I used **R** to handle large datasets efficiently and perform advanced analysis. I loaded CSV files for each month, merged them into a single dataset, and created additional columns for further analysis:

- **Additional Columns** Created in R:
  - `Ride Length`, `Day of the Week`, `Month`, `Day`, `Year`, `Hour`, `Season` (Spring, Summer, Winter, Fall), and `Time of Day` (Morning, Afternoon, Evening, Night).

- **Key Analysis**:
  - Total Rides by User Time (Casual vs. Annual)
  - Ride Duration by User Type
  - Rides by Month and Season
  - Bike Preferences by Time of Day
  - Rides by Hour

### Tableau Visualization
In **Tableau**, I created visualizations to summarize key trends:

- **Graphs**:
  - User Type (Casual vs. Annual)
  - Total Rides by Bike Type
  - Ride Length by Weekday
  - Total Rides by Weekday, Hour, and Month
  - Most Popular Bike Type by Time of Day

I then developed an initial dashboard prototype and refined it for the final version.



## Findings

### Usage Patterns by User Type:
- **Casual Riders**: Predominantly use bikes on weekends with longer ride durations.
- **Annual Members**: Use bikes consistently throughout the week with shorter, more frequent trips.

### Seasonal and Monthly Trends:
- **Peak Usage**: The summer months (June–August) see the highest number of rides, especially from casual riders during weekends.

### Bike Preferences:
- **Electric and Classic Bikes**: These are the most popular types, with casual riders favoring electric bikes for longer rides.

### Hourly Trends:
- Most rides occur during late mornings and afternoons, with a notable spike during leisure hours, especially for casual riders.

### Ride Length Differences:
- **Casual Riders**: Tend to have longer ride durations.
- **Annual Members**: Typically use bikes for shorter, more consistent trips.



## Marketing Strategies to Convert Casual Riders into Annual Members

1. **Introduce “Weekend Warrior” Membership Plans**
   - **Observation**: Casual riders are most active on weekends.
   - **Strategy**: Offer a discounted weekend membership plan, including weekday ride discounts. Promote upgrades to full annual memberships with added benefits.

2. **Gamify the Membership Experience**
   - **Observation**: Casual riders may not feel incentivized to switch to annual memberships.
   - **Strategy**: Launch a rewards program where casual riders earn points for every ride. Points can unlock free rides, exclusive discounts, or merchandise. Emphasize that annual members earn rewards faster.

3. **Personalized Marketing Campaigns**
   - **Observation**: Casual riders show distinct usage patterns (e.g., longer ride durations, weekend preferences).
   - **Strategy**: Use personalized emails or app notifications to demonstrate how an annual membership aligns with their habits. Examples:
     - “Save $$ on your weekend rides with an annual membership!”
     - “You’ve spent 10 hours riding this month. Imagine the savings with a membership!”


## Conclusion
The analysis revealed key differences in how casual riders and annual members utilize Cyclistic bikes. Casual riders primarily use the service for recreational and seasonal purposes, with longer rides on weekends. Annual members use the service more consistently, likely for commuting or regular activities.

By targeting these differences with tailored marketing strategies, Cyclistic can encourage casual riders to transition to annual memberships, increasing revenue and customer loyalty.


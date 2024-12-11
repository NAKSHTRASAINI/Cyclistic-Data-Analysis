# Load necessary libraries
library(readxl)   # For reading Excel files
library(dplyr)    # For data manipulation
library(janitor)  # For cleaning column names
library(tidyr)
library(lubridate) #dates 
library(hms) #time
library(data.table) #exporting data frame
library(ggplot2) #for visualization stuff



# Importing datasets
jan21_df <- read_excel("C:\\Users\\Nakshtra Roshal\\Desktop\\New folder\\202101.xlsx")
feb21_df <- read_excel("C:\\Users\\Nakshtra Roshal\\Desktop\\New folder\\202102.xlsx")
march21_df <- read_excel("C:\\Users\\Nakshtra Roshal\\Desktop\\New folder\\202103.xlsx")
april21_df <- read_excel("C:\\Users\\Nakshtra Roshal\\Desktop\\New folder\\202104.xlsx")
may21_df <- read_excel("C:\\Users\\Nakshtra Roshal\\Desktop\\New folder\\202105.xlsx")
jun21_df <- read_excel("C:\\Users\\Nakshtra Roshal\\Desktop\\New folder\\202106.xlsx")
july21_df <- read_excel("C:\\Users\\Nakshtra Roshal\\Desktop\\New folder\\202107.xlsx")
august21_df <- read_excel("C:\\Users\\Nakshtra Roshal\\Desktop\\New folder\\202108.xlsx")
sept21_df <- read_excel("C:\\Users\\Nakshtra Roshal\\Desktop\\New folder\\202109.xlsx")
oct21_df <- read_excel("C:\\Users\\Nakshtra Roshal\\Desktop\\New folder\\202110.xlsx")
nov21_df <- read_excel("C:\\Users\\Nakshtra Roshal\\Desktop\\New folder\\202111.xlsx")
dec21_df <- read_excel("C:\\Users\\Nakshtra Roshal\\Desktop\\New folder\\202112.xlsx")

# Combine all datasets into one
all_data <- bind_rows(jan21_df, feb21_df, march21_df, april21_df, may21_df,
                      jun21_df, july21_df, august21_df, sept21_df,
                      oct21_df, nov21_df, dec21_df)


# Ensure the columns are in the correct datetime format
all_data <- all_data %>%
  mutate(
    started_at = as.POSIXct(started_at, format = "%d-%m-%Y %H:%M"),
    ended_at = as.POSIXct(ended_at, format = "%d-%m-%Y %H:%M")
  )

# Calculate ride length in seconds and format as MM:SS
all_data <- all_data %>%
  mutate(
    ride_length = difftime(ended_at, started_at, units = "secs") %>% as.numeric(), # Calculate duration in seconds
    ride_length = sprintf("%02d:%02d", ride_length %/% 60, ride_length %% 60) # Format as MM:SS
  )

# Convert ride_length back to numeric for calculations (in seconds or minutes as per earlier steps)
all_data$ride_length_numeric <- as.numeric(difftime(all_data$ended_at, all_data$started_at, units = "mins"))

# Calculate the mean
mean_ride_length <- mean(all_data$ride_length_numeric, na.rm = TRUE)
cat("Mean Ride Length (in minutes):", mean_ride_length, "\n")

# Calculate the maximum
max_ride_length <- max(all_data$ride_length_numeric, na.rm = TRUE)
cat("Maximum Ride Length (in minutes):", max_ride_length, "\n")

  # Convert 'started_at' to POSIXct format if not already
  all_data$started_at <- as.POSIXct(all_data$started_at, format = "%d-%m-%Y %H:%M:%S", tz = "UTC")
  
  # Extract the day of the week (1 = Sunday, 2 = Monday, ..., 7 = Saturday)
  all_data$day_of_week <- weekdays(all_data$started_at)


# Calculate mode
calculate_mode <- function(x) {
  unique_x <- unique(x)
  unique_x[which.max(tabulate(match(x, unique_x)))]
}

mode_day_of_week <- calculate_mode(all_data$day_of_week)
cat("Mode of Day of Week:", mode_day_of_week, "\n")


# Calculate average ride length for members and casual riders
avg_ride_length_by_member <- all_data %>%
  group_by(member_casual) %>%
  summarise(avg_ride_length = mean(ride_length_numeric, na.rm = TRUE))

print(avg_ride_length_by_member)

# Calculate average ride length by day_of_week and member type
avg_ride_length_by_day <- all_data %>%
  group_by(member_casual, day_of_week) %>%
  summarise(avg_ride_length = mean(ride_length_numeric, na.rm = TRUE)) %>%
  pivot_wider(names_from = day_of_week, values_from = avg_ride_length)

print(avg_ride_length_by_day)

# Calculate the count of rides
count_rides_by_day <- all_data %>%
  group_by(member_casual, day_of_week) %>%
  summarise(number_of_rides = n()) %>%
  pivot_wider(names_from = day_of_week, values_from = number_of_rides)

print(count_rides_by_day)

# Plot average ride length by member type
ggplot(avg_ride_length_by_member, aes(x = member_casual, y = avg_ride_length, fill = member_casual)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Ride Length by Member Type", x = "Member Type", y = "Average Ride Length (minutes)") +
  theme_minimal()

#total rides by members and casuals
total_rides <- all_data %>%
  group_by(member_casual) %>%
  summarise(total_rides = n())

ggplot(total_rides, aes(x = member_casual, y = total_rides, fill = member_casual)) +
  geom_bar(stat = "identity") +
  labs(title = "Total Rides by User Type", x = "User Type", y = "Total Rides") +
  theme_minimal()

#average ride duration by members and causals
avg_ride_duration <- all_data %>%
  group_by(member_casual) %>%
  summarise(avg_ride_length = mean(ride_length_numeric, na.rm = TRUE))

ggplot(avg_ride_duration, aes(x = member_casual, y = avg_ride_length, fill = member_casual)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Ride Duration by User Type", x = "User Type", y = "Average Ride Length (Minutes)") +
  theme_minimal()

#month with max rides
all_data <- all_data %>%
  mutate(month = format(as.Date(started_at, format = "%d-%m-%Y"), "%B"))

rides_per_month <- all_data %>%
  group_by(month) %>%
  summarise(total_rides = n()) %>%
  arrange(desc(total_rides))

ggplot(rides_per_month, aes(x = reorder(month, total_rides), y = total_rides, fill = month)) +
  geom_bar(stat = "identity") +
  labs(title = "Rides by Month", x = "Month", y = "Total Rides") +
  theme_minimal() +
  coord_flip()

#season ride numbers
all_data <- all_data %>%
  mutate(season = case_when(
    month %in% c("December", "January", "February") ~ "Winter",
    month %in% c("March", "April", "May") ~ "Spring",
    month %in% c("June", "July", "August") ~ "Summer",
    month %in% c("September", "October", "November") ~ "Fall"
  ))

rides_per_season <- all_data %>%
  group_by(season) %>%
  summarise(total_rides = n())

ggplot(rides_per_season, aes(x = season, y = total_rides, fill = season)) +
  geom_bar(stat = "identity") +
  labs(title = "Rides by Season", x = "Season", y = "Total Rides") +
  theme_minimal()

#month wise ride summary
rides_per_month <- all_data %>%
  mutate(month = format(as.Date(started_at, format = "%d-%m-%Y"), "%B"),
         month_num = as.numeric(format(as.Date(started_at, format = "%d-%m-%Y"), "%m"))) %>%
  group_by(month, month_num) %>%
  summarise(total_rides = n()) %>%
  arrange(month_num)  # Arrange by month number to keep months in order

# Plot the bar chart
ggplot(rides_per_month, aes(x = reorder(month, month_num), y = total_rides, fill = month)) +
  geom_bar(stat = "identity") +
  labs(title = "Rides Per Month", x = "Month", y = "Total Rides") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_brewer(palette = "Set3") +
  guides(fill = "none")  # Remove legend for fill color

# Count the number of rides by bike type
bike_type_counts <- all_data %>%
  group_by(rideable_type) %>%
  summarise(total_rides = n()) %>%
  arrange(desc(total_rides))

# Plot the most popular bike type
ggplot(bike_type_counts, aes(x = rideable_type, y = total_rides, fill = rideable_type)) +
  geom_bar(stat = "identity") +
  labs(title = "Most Popular Bike Type", x = "Bike Type", y = "Total Rides") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set3") +
  guides(fill = "none")  # Remove legend

# Extract hour from 'started_at' and count rides by hour
rides_by_hour <- all_data %>%
  mutate(hour = format(as.POSIXct(started_at, format = "%d-%m-%Y %H:%M:%S"), "%H")) %>%
  group_by(hour) %>%
  summarise(total_rides = n())

# Plot total rides by the hour
ggplot(rides_by_hour, aes(x = as.numeric(hour), y = total_rides)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "red", size = 2) +
  labs(title = "Total Rides by Hour", x = "Hour of the Day", y = "Total Rides") +
  theme_minimal()


write.csv(all_data, "C:\\Users\\Nakshtra Roshal\\Desktop\\New folder\\2021_final.csv", row.names = FALSE)







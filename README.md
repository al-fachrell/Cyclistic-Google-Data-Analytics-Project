# Google Data Analytics Capstone: Cyclistic Bike-Share Analysis
Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)

## Introduction
Hi, my name is Faiq Al Fachrell Putra Viendra and I'm doing this to add case study to my portfolio project. 

This repository contains the work for the Google Data Analyics Cyclistic Bike-Share Capstone Case Study. The analysis aims to compare the behaviors of casual riders and annual members, with the goal of designing a marketing strategy to convert casual riders into annual members. The data provided is historical trip data from Fictional Company Cyclistic's bike-share system. The analysis steps were conducted in phases as follows: [Ask](https://github.com/al-fachrell/Cyclistic-Google-Data-Analytics-Project/blob/main/README.md#ask), [Prepare](https://github.com/al-fachrell/Cyclistic-Google-Data-Analytics-Project/blob/main/README.md#prepare), [Process](https://github.com/al-fachrell/Cyclistic-Google-Data-Analytics-Project/blob/main/README.md#process), [Analyze](https://github.com/al-fachrell/Cyclistic-Google-Data-Analytics-Project/blob/main/README.md#analyze-and-share), [Share](https://github.com/al-fachrell/Cyclistic-Google-Data-Analytics-Project/blob/main/README.md#analyze-and-share) and [Act](https://github.com/al-fachrell/Cyclistic-Google-Data-Analytics-Project/blob/main/README.md#act). There is also a [Summary](https://github.com/al-fachrell/Cyclistic-Google-Data-Analytics-Project/blob/main/README.md#summary).
### Links:
Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) [I'm using data from 2024]  

SQL Queries:

[1. Create Tables](https://github.com/al-fachrell/Cyclistic-Google-Data-Analytics-Project/blob/main/1.%20Create%20Tables.sql)

[2. Cleaning Data](https://github.com/al-fachrell/Cyclistic-Google-Data-Analytics-Project/blob/main/2.%20Cleaning%20Data.sql)

[3. Analyzing And Visualizing](https://github.com/al-fachrell/Cyclistic-Google-Data-Analytics-Project/blob/main/3.%20Analyzing%20and%20Visualizing%20The%20Data.sql)

## Overview
### Cyclistic

Cyclistic is a leading bike-share company based in Chicago, offering an extensive fleet of over 5,800 bicycles across 600 docking stations. Launched in 2016, Cyclistic has grown to become a key player in the city's transportation ecosystem, providing an environmentally friendly and convenient solution for both locals and visitors. The company stands out by offering a diverse range of bike options, including traditional bikes, reclining bikes, hand tricycles, and cargo bikes, making it accessible for riders with disabilities or those who require special biking options. Cyclistic operates on a flexible pricing model, offering single-ride passes, full-day passes, and annual memberships, catering to a broad spectrum of customers.

Cyclistic’s business model focuses on providing flexible and affordable transportation options for various purposes, whether it's for leisure, commuting, or occasional use. The company serves a wide range of riders, with a significant portion using the bikes for daily commuting, while others opt for a more leisurely experience. As the company continues to expand, the marketing team is exploring ways to increase annual membership subscriptions, as they are more profitable compared to casual rides. With this goal in mind, Cyclistic is leveraging data analytics to understand customer behaviors, particularly the differences between casual riders and annual members, to design targeted marketing strategies aimed at boosting membership conversions.

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.

### Scenario
I am a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve my recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## Phases Overview
## Ask

### Task
Design marketing strategies aimed at converting casual riders into annual members.

### Guidance Questions
Three questions will guide the future marketing program:  
1. How do annual members and casual riders use Cyclistic bikes differently?  
2. Why would casual riders buy Cyclistic annual memberships?  
3. How can Cyclistic use digital media to influence casual riders to become members? 

## Prepare
### Source
I will be using Cyclistic's trip data from Jan 2024 to Dec 2024 that can be downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement). 
### Data
There are 12 files, each named using the format YYYYMM-divvy-tripdata, with each file containing data for a specific month. The data includes details such as the ride ID, bike type, start and end times, start and end stations, start and end locations, and the rider's membership status. The relevant columns in each file are `ride_id`, `rideable_type`, `started_at`, `ended_at`, `start_station_name`, `start_station_id`, `end_station_name`, `end_station_id`, `start_lat`, `start_lng`, `end_lat`, `end_lng`, and `member_casual`.

## Process
I used Bigquery to combine the datasets into one single tables, and clean it.
### Combining Datasets
Query: [Create Tables](https://github.com/al-fachrell/Cyclistic-Google-Data-Analytics-Project/blob/main/1.%20Create%20Tables.sql)
Uploading 12 files and create final table named `final_cleaned_combined_data`
### Checking and Cleaning The Data
Query: [Clean Data](https://github.com/al-fachrell/Cyclistic-Google-Data-Analytics-Project/blob/main/2.%20Cleaning%20Data.sql)
#### Discoveries:
1. Column names and the data types

![Image](https://drive.google.com/uc?export=view&id=1h7H3ZorO4pbxaTSAPEfo0LUOQAysB8UD
)

2. Check for null values in `start_station_name` and `end_station_name`

![Image 2](https://drive.google.com/uc?export=view&id=1vL-Yx0_6PQWhECT_V_lbfihQYz10L52P
)

Checking for null values in `start_station_name` and `end_station_name` is crucial because these columns represent the starting and ending points of bike trips, which are key to analyzing trip patterns, popular routes, and station usage.

3. Check for rides with duration less than 1 minutes

![Image 3](https://drive.google.com/uc?export=view&id=1-7uucLQPghazV0DZlklWWYPfDX_YDolf
)

Rides with a duration of less than 1 minute are typically considered outliers because they are unusually short for bike trips. Such durations might indicate errors in the data, like a ride being logged when a bike was checked out and immediately returned without being ridden, or it could represent a system glitch. In real-world scenarios, most bike rides, even short ones, tend to last longer than a minute, so durations under this threshold are often not meaningful and can skew the analysis if included. Identifying and handling these outliers helps ensure that the data accurately reflects typical bike usage.

4. Check for rides of more than 24 hours

![Image](https://drive.google.com/uc?export=view&id=1xp_wRqlruDqe7fH_jTFpAYE1A6Be7deZ
)

Same like rides with a duration less than 1 minute, rides lasting more than 24 hours are considered outliers. They are typically data errors, as bike trips rarely last that long. Including such rides can distort the analysis, so identifying and handling them ensures the data reflects normal usage.

5. Create a new table without rows having null station names
The table named `cleaned_combined_data`
Remaining rows, 5.860.568 - 1.652.259 = 4.208.309 Rows 

6. Add and Update `ride_length` in minutes column

![Image](https://drive.google.com/uc?export=view&id=13rCmLQm-B9A2K2jVSEiC0xLKscNM3YF0
)

7. Create a new table without rows having ride lengths less than 1 minute or more than 24 hours (1440 Minutes) (Outliers)
The table named `final_cleaned_combined_data`
Remaining rows, 4.208.309 - 40.037 = 4.168.272

8. Add day and month columns

![Image](https://drive.google.com/uc?export=view&id=1majnkMw0p-fyrx3h0HfLaJy0OlvB4EN2
)

Adding `day` and `month` columns helps analyze bike usage patterns by day of the week or season. Visualizing this data can reveal trends, like higher usage on weekends or specific months, allowing for better insights into demand and optimization strategies.

9. Check and delete duplicate ride_ids
Deleting 242 rows

![Image](https://drive.google.com/uc?export=view&id=1O2foRUB6og3rdqzI0UcerTkVsP86XV1k
)

The `ride_id` column contains unique identifiers for each bike ride, ensuring that each trip is recorded separately. If there are duplicate `ride_id` entries, it means that the same ride is being counted more than once, which can lead to inaccurate analysis. This duplication can artificially inflate ride counts, distort average ride durations, and skew other metrics like station usage or trip frequency. Identifying and removing duplicates ensures the integrity of the data, providing accurate insights into bike usage and helping avoid misleading conclusions.

10. Count the remaining number of rows in the `final_cleaned_combined_data` table

![Image](https://drive.google.com/uc?export=view&id=1Zul3Kapi8jPA-qfgEufxNtUeAEq8T0XG
)

## Analyze and Share
Query: [Analysis](https://github.com/al-fachrell/Cyclistic-Google-Data-Analytics-Project/blob/main/3.%20Analyzing%20and%20Visualizing%20The%20Data.sql)

Visualization: Tableau
1. Comparing Total Trips `Members` and `Casual`

![Image](https://drive.google.com/uc?export=view&id=12Z5tKAYYnflj5mL7hSUoqCorIJXKBZ-6
)

    `Members` took the most rides with 63,87% (1.506.079 Trips) of the total trips compared to 36,13% (2662.193) for `Casual`

    **The key takeaway from the ride duration difference is that casual riders tend to use the service for more leisurely purposes, whereas members rely on it for more frequent, shorter trips.**


2. Average Ride Length `Members` and `Casual`

![Image](https://drive.google.com/uc?export=view&id=1LebTHhfxcUotxeUos-DfFIEvLIiiGltW)
`Casual` riders averaged 23,68 minutes per ride while `Member` riders averaged 12,06 minutes per rides.

    **This difference indicates that `Casual` riders typically take longer trips compared to `Members`, with casual trips being more than twice as long on average.**


3. Bike Demand By Hour

![Image](https://drive.google.com/uc?export=view&id=1GAndcb7UkbYKZFlFmg-INxvXmY7wHzud
)
This is when the demand peaks for both `Members` and `Casual` riders. The rush at **17:00** is especially notable for `Members`, likely **reflecting the end of the workday or shift**, when people are returning home or heading out for personal errands. 

    Since the peak demand time shows a clear gap between `Casual` and `Member` riders, the service could focus on converting more `Casual` riders into `Members`, particularly those who use the service during the busy times like 17:00.


4. Bike Demand Daily

![Image](https://drive.google.com/uc?export=view&id=1h7FiRzy0FrlHYVI8LcyWnXetY2rLo-_H
)


The busiest day in the week for `Members` were Tuesday to Thursday, and the busiest day for `Casual` were Friday to Sunday

This data reinforces the differing behavior between `Members` and `Casual` riders. `Members` are consistent users who rely on the service for daily activities, while `Casual` riders primarily use the bikes for leisure and recreational purposes, with demand peaking on weekends.

5. Bike Demand Monthly

![Image](https://drive.google.com/uc?export=view&id=1XLSQ2bPGxoGKQb4dI2HY7sbCV5cId0Qv)

The busiest month in 2024 for both `Members` and `Casual` were July through September. 

This aligns with the warmer months of the year during the summer, suggesting that weather plays a significant role in encouraging higher usage for both types of riders.

Marketing campaigns could leverage this peak period, offering seasonal promotions or discounts to attract more riders, particularly for `Casual` users who seem to ride more during these months. Partnerships with local attractions or events could also drive bike usage for `Casual` riders during the high season.

**Offering membership incentives or discounts could encourage `Casual` riders to become `Members` and increase their commitment to regular usage.**

6. Total Trips by Different Bike Types

![Image](https://drive.google.com/uc?export=view&id=1i3TKDu9JrJR-lln90OjfjOudtVJpcjy8
)

The classic bike is the most popular bike type for both `Casual` and `Member`.

The data shows data the electric scooters for `Members` were 21.673 users and the `Casual` were slightly more, 25.273 users. Marketing analyst team should identify where is the place to put marketing campaign and strategy.

Electric scooters are best suited for people who need a quick, convenient, and low-effort mode of transport for short distances, such as commuters, tourists, and students. They are also appealing to casual riders who want a fun and easy experience. To increase their usage, the bike-sharing service might consider positioning electric scooters in areas with high foot traffic, promoting them to specific user groups, or improving their availability during peak times.

7. Casual Type Riders That Rides More Than 2 times Standard Deviation

![Image](https://drive.google.com/uc?export=view&id=1tFiWbG3ioerazr5gczuOdvktfWiQGiij
)

Based on the data that **55,448 `Casual` riders** are riding for more than 60 minutes, and the fact that they fall beyond 2 standard deviations of the average ride time, this presents an excellent opportunity for the marketing team to target these users and potentially convert them into **`Members`**.

The **55,448 `Casual` riders** who consistently ride for more than 60 minutes represent a key opportunity for conversion into **`Members`**. By analyzing their behavior, location, date, and time, the marketing team can run targeted campaigns that specifically appeal to this group, offering discounts or tailored memberships to encourage them to make the switch. Focusing on high-traffic areas and peak times will ensure that these campaigns reach the right users and maximize the likelihood of conversion.

8. Top 10 Start Station Name for `Casual`

![Image](https://drive.google.com/uc?export=view&id=19onE4HKXi-zRv5XZ4gO3wKW9y4b-1joR
)

The **Top 10 Start Station Names for ``Casual`` riders** show that bikes are predominantly used in **tourist areas** and **recreational hotspots**. The stations with the highest total ride lengths are located near popular attractions like **Millennium Park**, **Shedd Aquarium**, and the **waterfront**, indicating that **``Casual`` riders** are using bikes for longer, more leisurely trips. These insights can guide **marketing strategies** targeting **tourists** and **recreational riders**, as well as help with **fleet management** and **membership promotions**.

### Summary
| **Aspect**               | **``Members``**                         | **``Casual``**                            |
|--------------------------|-----------------------------------------|-------------------------------------------|
| **Frequency of Use**      | High frequency (daily/regular)          | Low frequency (occasional or weekend use) |
| **Busiest Days**          | Tuesday to Thursday (weekdays)          | Friday to Sunday (weekends/holidays)      |
| **Time of Day**           | Morning and evening (commute hours)     | Afternoon and evening (leisure activities)|
| **Average Ride Duration** | 12.06 minutes (shorter rides)           | 23.68 minutes (longer rides)              |
| **Key Locations**         | Residential and business districts      | Tourist spots, parks, and recreational areas |
| **Usage Motivation**      | Practical, commuting, and errands       | Leisure, exploration, and recreation      |
| **Bike Type Preference**  | Classic bikes (for daily commuting)     | Electric scooter (for leisurely trips)      |
| **Marketing Focus**       | Efficiency, reliability, and savings    | Fun, exploration, and convenience         |
| **Potential for Conversion**| Already loyal, focus on discounts or perks | Target for conversion with membership offers and incentives |

## Act
In the **Act phase**, Cyclistic can implement targeted strategies and campaigns to encourage **Casual riders** to transition into **Annual Members**, focusing on personalized offers, digital media engagement, and incentives that highlight the long-term benefits of membership.

Based on the findings, here are the top 5 recommendations for Cyclistic to effectively convert **Casual riders** into **Annual Members**.

**1. Target Marketing Campaigns During Peak Usage Times (17:00):**

    Promote membership benefits such as unlimited ride time or discounts on frequent usage. Additionally, special offers like trial memberships or free extended ride time for those using bikes during peak times could entice Casual riders to switch to a more economical membership.

**2. Leverage Popular Tourist and Recreational Areas for Membership Promotions**
    
    Focus on targeted marketing campaigns in high-traffic tourist and recreational zones. Offer membership promotions tailored to tourists or leisure users, emphasizing the convenience and cost-effectiveness of an annual membership for frequent sightseeing or recreational trips. Consider partnerships with local attractions to offer exclusive membership discounts or special deals for people using bikes in these areas.

**3. Promote Electric Bikes and Scooters for Casual Riders to Encourage Membership**

    Enhance the availability of electric bikes and electric scooters in tourist-heavy areas or places with high foot traffic. Offer discounted membership rates for electric bike and electric scooter users to promote longer rides at a lower cost. By making electric bikes and scooters a central part of membership packages, you could convert Casual riders into Members by aligning their preferred ride type with membership benefits.

**4. Transforming Long-Ride Casual Riders into Loyal Members with Targeted Campaigns**

    The 55,448 Casual riders who regularly ride for over 60 minutes present a valuable opportunity for conversion into Members. By analyzing their behavior, location, and usage patterns, the marketing team can design targeted campaigns with personalized offers, discounts, and tailored memberships to effectively encourage this group to transition to annual membership.

**5. Harnessing Digital Strategies to Promote Membership Among Casual Riders**

    Cyclistic can convert **Casual riders** into **Members** by using targeted digital campaigns on social media, highlighting the fun and convenience of biking, offering exclusive discounts, and leveraging influencers. Personalized email marketing, retargeting ads, and geolocation-based offers can further encourage conversions, especially near popular tourist spots. These strategies emphasize the value and convenience of an annual membership for **Casual riders**.



















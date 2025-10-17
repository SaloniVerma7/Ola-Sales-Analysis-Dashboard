#SQL Questions:
USE ola;
#1. Retrieve all successful bookings:
CREATE OR REPLACE VIEW Successful_Bookings AS
    SELECT 
        *
    FROM
        ola.bookings_ola
    WHERE
        Booking_Status = 'Success';
#Short form of this query---
SELECT * FROM Successful_Bookings;

#2. Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS
    SELECT 
        Vehicle_Type, AVG(Ride_Distance) AS avg_distance
    FROM
        ola.bookings_ola
    GROUP BY Vehicle_Type;
#Short form of this query---
SELECT * FROM ola.ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
CREATE OR REPLACE VIEW total_cancelled_rides_by_customers AS
    SELECT 
        COUNT(*)
    FROM
        ola.bookings_ola
    WHERE
        Booking_Status = 'Canceled by Customer';
#Short form of this query---
SELECT `count(*)` FROM total_cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW top_5_customers AS
    SELECT 
        Customer_ID, COUNT(Booking_ID) AS total_rides
    FROM
        ola.bookings_ola
    GROUP BY Customer_ID
    ORDER BY total_rides DESC
    LIMIT 5;
#Short form of this query---
SELECT * FROM top_5_customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE OR REPLACE VIEW cancelled_rides_by_drivers_to_personal_car_related_issues AS
    SELECT 
        COUNT(*)
    FROM
        ola.bookings_ola
    WHERE
        Canceled_Rides_by_Driver = 'Personal & Car related issue'; 
#Short form of this query---
SELECT * FROM cancelled_rides_by_drivers_to_personal_car_related_issues;

#6. Find the  Min or max Driver_Ratings from Prime Sedan bookings:
CREATE OR REPLACE VIEW driver_ratings_of_Prime_Sedan AS
    SELECT 
        MAX(Driver_Ratings) AS max_rating,
        MIN(Driver_Ratings) AS min_rating
    FROM
        ola.bookings_ola
    WHERE
        Vehicle_Type = 'Prime Sedan';
#Short form of this query---
SELECT * FROM driver_ratings_of_Prime_Sedan;

#7. Retrieve all rides where payment was made using UPI:
CREATE OR REPLACE VIEW payment_by_UPI AS
    SELECT 
        *
    FROM
        ola.bookings_ola
    WHERE
        Payment_Method = 'UPI';
#Short form of this query---
SELECT * FROM payment_by_UPI;

#8. Find the average customer rating per vehicle type:
CREATE OR REPLACE VIEW avg_customer_rating_of_vehicle AS
    SELECT 
        Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
    FROM
        ola.bookings_ola
    GROUP BY Vehicle_Type;
#Short form of this query---
SELECT * FROM avg_customer_rating_of_vehicle;

#9. Calculate the total booking value of rides completed successfully:
CREATE OR REPLACE VIEW total_success_rides_booking AS
    SELECT 
        SUM(Booking_Value) AS success_booking
    FROM
        ola.bookings_ola
    WHERE
        Booking_Status = 'Success';
#Short form of this query---
SELECT * FROM total_success_rides_booking;

#10. List all incomplete rides along with the reason:
CREATE OR REPLACE VIEW incomplete_rides_for_reason AS
    SELECT 
        Booking_ID, Incomplete_Rides_Reason
    FROM
        ola.bookings_ola
    WHERE
        Incomplete_Rides = 'Yes';
#Short form of this query---
SELECT  * FROM incomplete_rides_for_reason;

create database Ola;
use Ola;

#1. Retrieve all successful bookings:
Create view Booking_status as 
SELECT * FROM bookings 
WHERE Booking_Status = 'Success';
SELECT * FROM Booking_status


#2. Find the average ride distance for each vehicle type:
Create View ride_distance_for_each_vehicle As
SELECT Vehicle_Type, AVG(Ride_Distance) as avg_distance FROM bookings GROUP BY
Vehicle_Type;
SELECT * FROM ride_distance_for_each_vehicle

#3. Get the total number of cancelled rides by customers:
Create View cancelled_rides_by_customer As
SELECT COUNT(*) FROM bookings WHERE Booking_Status = 'cancelled by Customer';
select * from cancelled_rides_by_customer;



#4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers as 
SELECT Customer_ID, COUNT(Booking_ID) as total_rides 
FROM bookings GROUP BY Customer_ID
 ORDER BY total_rides DESC LIMIT 5;
select *from Top_5_Customers;



#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Rides_cancelled_by_driver_due_to_personal_and_car_related_issues as
SELECT COUNT(*) FROM bookings
 WHERE canceled_Rides_by_Driver = 'Personal & Car
related issue';
select*from Rides_cancelled_by_driver_due_to_personal_and_car_related_issues



#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create View Max_Min_Driver_Ratings as
SELECT MAX(Driver_Ratings) as max_rating,
 MIN(Driver_Ratings) as min_rating
 FROM bookings WHERE Vehicle_Type = 'Prime Sedan';
 select*from Max_Min_Driver_Ratings

#7. Retrieve all rides where payment was made using UPI:
create view UPI_Payments as
SELECT * FROM bookings
 WHERE Payment_Method = 'UPI';
 select*from UPI_Payments

#8. Find the average customer rating per vehicle type:
create view Average_Customer_Rating as
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
 FROM bookings
GROUP BY Vehicle_Type;
 select*from Average_Customer_Rating

#9. Calculate the total booking value of rides completed successfully:
create view Total_successful_ride_value as 
SELECT SUM(Booking_Value) as total_successful_value
 FROM bookings WHERE
Booking_Status = 'Success';
 select*from Total_successful_ride_value

#10. List all incomplete rides along with the reason:
Create view Incomplete_rides_with_reason as
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM bookings WHERE Incomplete_Rides ='Yes';
select*from Incomplete_rides_with_reason

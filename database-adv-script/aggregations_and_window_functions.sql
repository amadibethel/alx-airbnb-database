-- File: aggregations_and_window_functions.sql
-- Query 1: Total bookings per user
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    users u
LEFT JOIN 
    bookings b
ON 
    u.user_id = b.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name
ORDER BY 
    total_bookings DESC;

-- Query 2: Rank properties by total bookings
SELECT 
    property_id,
    property_name,
    COUNT(booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(booking_id) DESC) AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(booking_id) DESC) AS booking_row_number
FROM 
    bookings
JOIN 
    properties USING(property_id)
GROUP BY 
    property_id, property_name
ORDER BY 
    booking_rank;

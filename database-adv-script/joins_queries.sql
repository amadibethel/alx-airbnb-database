-- File: joins_queries.sql
-- Query 1: INNER JOIN - Bookings with their users
SELECT 
    b.booking_id,
    b.property_id,
    b.booking_date,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    bookings b
INNER JOIN 
    users u
ON 
    b.user_id = u.user_id
ORDER BY 
    b.booking_date DESC;

-- Query 2: LEFT JOIN - Properties with reviews
SELECT 
    p.property_id,
    p.property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM 
    properties p
LEFT JOIN 
    reviews r
ON 
    p.property_id = r.property_id
ORDER BY 
    p.property_name;


-- Query 3: FULL OUTER JOIN - Users and bookings
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.booking_date
FROM 
    users u
FULL OUTER JOIN 
    bookings b
ON 
    u.user_id = b.user_id
ORDER BY 
    u.user_id;

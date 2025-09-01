-- File: subqueries.sql
-- Query 1: Non-correlated subquery - Properties with avg rating > 4.0
SELECT 
    property_id,
    property_name,
    location
FROM 
    properties
WHERE 
    property_id IN (
        SELECT 
            property_id
        FROM 
            reviews
        GROUP BY 
            property_id
        HAVING 
            AVG(rating) > 4.0
    )
ORDER BY 
    property_name;

-- Query 2: Correlated subquery - Users with > 3 bookings
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    users u
WHERE 
    3 < (
        SELECT 
            COUNT(*)
        FROM 
            bookings b
        WHERE 
            b.user_id = u.user_id
    )
ORDER BY 
    u.user_id;

-- File: database-adv-script/database_index.sql

-- Index on users.user_id for JOINs

CREATE INDEX idx_users_user_id ON users(user_id);

-- Index on bookings.user_id for JOINs

CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id for JOINs

CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on bookings.booking_date for filtering/sorting

CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Index on properties.location for filtering queries

CREATE INDEX idx_properties_location ON properties(location);

-- Before adding indexes

EXPLAIN SELECT * FROM bookings b 
JOIN users u ON b.user_id = u.user_id
WHERE b.booking_date > '2025-01-01';

-- After adding indexes

ANALYZE SELECT * FROM bookings b 
JOIN users u ON b.user_id = u.user_id
WHERE b.booking_date > '2025-01-01';



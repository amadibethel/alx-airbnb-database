-- File: database-adv-script/database_index.sql

-- database-adv-script/database_index.sql

-- ===============================
-- Step 1: Measure query performance BEFORE indexes
-- ===============================
EXPLAIN ANALYZE 
SELECT * 
FROM bookings b
JOIN users u ON b.user_id = u.user_id
WHERE b.booking_date > '2025-01-01';

EXPLAIN ANALYZE 
SELECT * 
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id
WHERE p.location = 'New York';

-- ===============================
-- Step 2: Create indexes
-- ===============================
CREATE INDEX idx_users_user_id ON users(user_id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);
CREATE INDEX idx_properties_location ON properties(location);

-- ===============================
-- Step 3: Measure query performance AFTER indexes
-- ===============================
EXPLAIN ANALYZE 
SELECT * 
FROM bookings b
JOIN users u ON b.user_id = u.user_id
WHERE b.booking_date > '2025-01-01';

EXPLAIN ANALYZE 
SELECT * 
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id
WHERE p.location = 'New York';


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


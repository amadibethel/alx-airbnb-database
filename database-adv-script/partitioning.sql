-- database-adv-script/partitioning.sql

-- 1. Create a new partitioned booking table
CREATE TABLE bookings_partitioned (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    booking_status VARCHAR(20),
    amount DECIMAL(10,2)
) PARTITION BY RANGE (start_date);

-- 2. Create partitions for each year
CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 3. Optional: Default partition for other dates
CREATE TABLE bookings_future PARTITION OF bookings_partitioned
    DEFAULT;

-- Insert data from the original bookings table
INSERT INTO bookings_partitioned (booking_id, user_id, property_id, start_date, end_date, booking_status, amount)
SELECT booking_id, user_id, property_id, start_date, end_date, booking_status, amount
FROM bookings;

-- Query: Fetch bookings in 2024
EXPLAIN ANALYZE
SELECT *
FROM bookings_partitioned
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';


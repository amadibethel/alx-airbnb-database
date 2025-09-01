# Objective

Identify and create indexes to improve query performance for high-usage columns.

Step 1: Identify High-Usage Columns

Focus on columns frequently used in:

WHERE clauses

JOIN conditions

ORDER BY statements

Examples:

users.user_id joins with bookings.user_id

bookings.property_id joins with properties.property_id

bookings.booking_date often filtered or ordered by date

properties.location often filtered in queries

-- File: database-adv-script/database_index.sql
database_index.sql

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

alx-airbnb-database/
│
└── database-adv-script/
    ├── database_index.sql   -- SQL commands to create indexes
    └── index_performance.md -- Documentation of index usage and performance

# ALX Airbnb Database - Indexing and Performance

## Task 3: Implement Indexes for Optimization

### Objective

Identify and create indexes to improve query performance on high-usage columns.

### Indexes Created

| Table     | Column          | Index Name                  | Purpose                            |
|-----------|----------------|----------------------------|------------------------------------|
| users     | user_id         | idx_users_user_id           | Optimize JOINs                     |
| bookings  | user_id         | idx_bookings_user_id        | Optimize JOINs                     |
| bookings  | property_id     | idx_bookings_property_id    | Optimize JOINs                     |
| bookings  | booking_date    | idx_bookings_booking_date   | Optimize WHERE / ORDER BY queries |
| properties| location        | idx_properties_location     | Optimize filtering by location     |

### Performance Measurement

1. Run queries **before adding indexes** using `EXPLAIN` or `ANALYZE`.
2. Create indexes with `CREATE INDEX`.
3. Run the same queries **after adding indexes** and compare cost and execution time.
4. Document improvements.

### How to Use

1. Open `database_index.sql` in your SQL client.
2. Execute the file to create all indexes.
3. Verify performance improvements with your test queries.



# ALX Airbnb Database - Advanced Queries

## Project Structure

alx-airbnb-database/
│
└── database-adv-script/
    ├── joins_queries.sql   -- Your SQL queries
    └── README.md           -- Documentation

alx-airbnb-database/
│
└── database-adv-script/
    ├── subqueries.sql    -- Your SQL subqueries
    └── README.md         -- Documentation

alx-airbnb-database/
│
└── database-adv-script/
    ├── aggregations_and_window_functions.sql
    └── README.md


## Task 0: Write Complex Queries with Joins

### Objective

Master SQL joins by retrieving data from multiple tables in complex scenarios.

### Queries

1. **INNER JOIN**
- Retrieves all bookings along with the users who made them.

2. **LEFT JOIN**
- Retrieves all properties and their reviews.  
- Includes properties with no reviews.

3. **FULL OUTER JOIN**
- Retrieves all users and all bookings.  
- Includes users with no bookings and bookings with no linked users.

### How to Run

1. Connect to the Airbnb database using your preferred SQL client.
2. Open `joins_queries.sql`.
3. Execute each query individually.
4. Verify results match expected output as described above.
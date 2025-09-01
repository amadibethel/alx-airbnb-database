# ALX Airbnb Database - Partitioning Large Tables

## Task 5: Partitioning Large Tables

### Objective

Optimize query performance for the Booking table by implementing **range partitioning** on the `start_date` column.

### Implementation

1. Created `bookings_partitioned` table with `PARTITION BY RANGE (start_date)`.
2. Added yearly partitions for 2023, 2024, and 2025.
3. Inserted existing bookings data into the partitioned table.

### Performance Testing

- Query: Fetch bookings for 2024
- Before partitioning:
  - Query scanned all rows in `bookings` table (~millions of rows)
  - Execution time: higher
- After partitioning:
  - Query scanned only `bookings_2024` partition
  - Execution time: significantly reduced
  - Fewer rows scanned → faster performance

### Conclusion

Partitioning the Booking table by `start_date` drastically improves performance for date-range queries. Future partitions can be added for upcoming years to maintain efficiency.

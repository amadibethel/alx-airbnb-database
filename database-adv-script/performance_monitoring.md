# ALX Airbnb Database - Performance Monitoring and Refinement

## Task 6: Monitor and Refine Database Performance

### Objective

Continuously monitor query performance and optimize the schema and indexes to improve efficiency.

### Monitoring Queries

- Frequently used queries were analyzed using `EXPLAIN ANALYZE`.
- Examples include fetching bookings by user, fetching reviews by property, and aggregating total bookings per user.

### Identified Bottlenecks

| Query | Bottleneck | Fix Implemented |
|-------|-----------|----------------|
| Bookings by user | Sequential scan of large table | Created index on `user_id` |
| Reviews by property | No index on `property_id` | Created index on `property_id` |
| Aggregations | Scanning entire partitioned table | Partitioned `bookings` table by `start_date` |

### Results

- Query performance improved significantly:
  - Fewer rows scanned
  - Faster execution times
  - Reduced database load

### Conclusion

Regular performance monitoring and incremental improvements (indexes, partitioning, query optimization) ensure that the database can handle high-volume queries efficiently.

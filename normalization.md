# Database Normalization for Airbnb Database

This document explains the normalization process applied to the **Airbnb Database Schema**, ensuring it complies with **Third Normal Form (3NF)**.

---

## 1. First Normal Form (1NF)

**Rule**: Eliminate repeating groups and ensure atomic values.

- All entities (User, Property, Booking, Review, Payment, Message) have atomic attributes.
- No multi-valued attributes exist (e.g., phone numbers are stored as a single value).
- Each table has a primary key.

The schema satisfies **1NF**.

---

## 2. Second Normal Form (2NF)

**Rule**: Eliminate partial dependency (non-key attributes must depend on the whole primary key).

- All entities have single-attribute primary keys (e.g., `user_id`, `property_id`, `booking_id`).
- No non-key attribute depends on part of a composite key, since composite keys are not used.

The schema satisfies **2NF**.

---

## 3. Third Normal Form (3NF)

**Rule**: Eliminate transitive dependency (non-key attributes must depend only on the primary key).

- In the **User** entity, attributes like `email`, `name`, and `password` depend only on `user_id`.
- In the **Property** entity, attributes like `title`, `description`, `price_per_night`, and `location` depend only on `property_id`.
- In the **Booking** entity, attributes like `check_in_date`, `check_out_date`, and `status` depend only on `booking_id`.
- In the **Review** entity, `rating` and `comment` depend only on `review_id`.
- In the **Payment** entity, `amount`, `payment_date`, and `status` depend only on `payment_id`.
- In the **Message** entity, `content` and `timestamp` depend only on `message_id`.

The schema satisfies **3NF**.

---

## Conclusion

The Airbnb database schema is normalized to **Third Normal Form (3NF)**.  
- No repeating groups (1NF)  
- No partial dependencies (2NF)  
- No transitive dependencies (3NF)  

This ensures **data integrity, reduced redundancy, and efficient query performance**.

# Airbnb Database Schema

This directory contains the **DDL SQL schema** for the Airbnb clone database.  
It defines all entities, attributes, relationships, and indexes.

## Entities & Tables

1. **Users** → Stores user details.
2. **Properties** → Listings created by users (hosts).
3. **Bookings** → Reservations made by users for properties.
4. **Payments** → Records transactions linked to bookings.
5. **Reviews** → Feedback and ratings from users after a booking.
6. **Property_Images** → Stores multiple images for each property.

## Keys & Relationships

- **Users → Properties**: One user can host many properties.
- **Users → Bookings**: One user can make many bookings.
- **Properties → Bookings**: Each booking is tied to one property.
- **Bookings → Payments**: Each booking has a payment record.
- **Bookings → Reviews**: Each booking can have a review.
- **Properties → Property_Images**: Each property can have multiple images.

## Indexing Strategy

- **Users.email** → Fast lookup for login/authentication.
- **Properties.location** → Optimizes property search by city/location.
- **Bookings.check_in + check_out** → Efficient queries for availability.

## File List

- **schema.sql** → SQL DDL statements for schema creation.
- **README.md** → Documentation of schema and relationships.

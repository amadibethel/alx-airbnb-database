# Airbnb Database – ERD Requirements

## 1. Entities and Attributes

### User

Represents all users of the platform (guests, hosts, admins).

- **user_id**: UUID, PK, Indexed  
- **first_name**: VARCHAR, NOT NULL  
- **last_name**: VARCHAR, NOT NULL  
- **email**: VARCHAR, UNIQUE, NOT NULL  
- **password_hash**: VARCHAR, NOT NULL  
- **phone_number**: VARCHAR, NULL  
- **role**: ENUM (guest, host, admin), NOT NULL  
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

---

### Property

Represents a property listed by a host.

- **property_id**: UUID, PK, Indexed  
- **host_id**: FK → User(user_id)  
- **name**: VARCHAR, NOT NULL  
- **description**: TEXT, NOT NULL  
- **location**: VARCHAR, NOT NULL  
- **pricepernight**: DECIMAL, NOT NULL  
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
- **updated_at**: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP  

---

### Booking

Represents a reservation made by a guest.

- **booking_id**: UUID, PK, Indexed  
- **property_id**: FK → Property(property_id)  
- **user_id**: FK → User(user_id)  
- **start_date**: DATE, NOT NULL  
- **end_date**: DATE, NOT NULL  
- **total_price**: DECIMAL, NOT NULL  
- **status**: ENUM (pending, confirmed, canceled), NOT NULL  
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

---

### Payment

Represents a payment transaction for a booking.

- **payment_id**: UUID, PK, Indexed  
- **booking_id**: FK → Booking(booking_id)  
- **amount**: DECIMAL, NOT NULL  
- **payment_date**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
- **payment_method**: ENUM (credit_card, paypal, stripe), NOT NULL  

---

### Review

Represents guest feedback on properties.

- **review_id**: UUID, PK, Indexed  
- **property_id**: FK → Property(property_id)  
- **user_id**: FK → User(user_id)  
- **rating**: INTEGER, CHECK (1 ≤ rating ≤ 5), NOT NULL  
- **comment**: TEXT, NOT NULL  
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

---

### Message

Represents private communication between users.

- **message_id**: UUID, PK, Indexed  
- **sender_id**: FK → User(user_id)  
- **recipient_id**: FK → User(user_id)  
- **message_body**: TEXT, NOT NULL  
- **sent_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

---

## 2. Relationships

- **User ↔ Property**: One User (host) can list many Properties → *1-to-many*  
- **User ↔ Booking**: One User (guest) can make many Bookings → *1-to-many*  
- **Property ↔ Booking**: One Property can have many Bookings → *1-to-many*  
- **Booking ↔ Payment**: One Booking can have one or more Payments → *1-to-1 or 1-to-many*  
- **User ↔ Review ↔ Property**: Many-to-many, resolved by Review entity  
- **User ↔ Message ↔ User**: Self-referencing 1-to-many (sender → recipient)  

---

## 3. Constraints

### User Table

- Unique constraint on `email`.  
- Non-null on required fields.  

### Property Table

- FK constraint on `host_id`.  
- Non-null on essential attributes.  

### Booking Table

- FK constraints on `property_id` and `user_id`.  
- `status` restricted to (pending, confirmed, canceled).  

### Payment Table

- FK constraint on `booking_id`.  
- Ensures payments are linked to valid bookings.  

### Review Table

- `rating` constrained to 1–5.  
- FK constraints on `property_id` and `user_id`.  

### Message Table

- FK constraints on `sender_id` and `recipient_id`.  

---

## 4. Indexing

- **Primary Keys**: Automatically indexed.  
- **Additional Indexes**:  
  - `email` in **User**  
  - `property_id` in **Property** and **Booking**  
  - `booking_id` in **Booking** and **Payment**  

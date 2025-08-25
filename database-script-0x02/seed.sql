-- =========================================================
-- Airbnb Database Sample Data Seed
-- =========================================================

-- USERS
INSERT INTO Users (first_name, last_name, email, phone, password_hash)
VALUES
('Alice', 'Smith', 'alice@example.com', '0812345678', 'hash1'),
('Bob', 'Johnson', 'bob@example.com', '0823456789', 'hash2'),
('Charlie', 'Brown', 'charlie@example.com', '0834567890', 'hash3');

-- PROPERTIES
INSERT INTO Properties (user_id, title, description, location, price_per_night, max_guests)
VALUES
(1, 'Cozy Apartment', '2-bedroom apartment in downtown.', 'Cape Town, SA', 100.00, 4),
(2, 'Luxury Villa', '5-bedroom villa with pool.', 'Johannesburg, SA', 350.00, 10),
(1, 'Beach House', '3-bedroom house near beach.', 'Durban, SA', 200.00, 6);

-- BOOKINGS
INSERT INTO Bookings (user_id, property_id, check_in, check_out, total_price, status)
VALUES
(3, 1, '2025-09-01', '2025-09-05', 400.00, 'confirmed'),
(3, 2, '2025-10-10', '2025-10-15', 1750.00, 'pending');

-- PAYMENTS
INSERT INTO Payments (booking_id, amount, payment_method, status)
VALUES
(1, 400.00, 'credit_card', 'completed'),
(2, 1750.00, 'paypal', 'pending');

-- REVIEWS
INSERT INTO Reviews (booking_id, rating, comment)
VALUES
(1, 5, 'Excellent stay! Very comfortable and clean.'),
(2, 4, 'Great property, but a bit far from city center.');

-- PROPERTY_IMAGES
INSERT INTO Property_Images (property_id, image_url)
VALUES
(1, 'https://example.com/images/property1_1.jpg'),
(1, 'https://example.com/images/property1_2.jpg'),
(2, 'https://example.com/images/property2_1.jpg'),
(3, 'https://example.com/images/property3_1.jpg');

-- MESSAGES
INSERT INTO Messages (sender_id, recipient_id, message_body)
VALUES
(3, 1, 'Hi Alice, I am interested in booking your apartment.'),
(1, 3, 'Hello! The apartment is available for your dates.'),
(3, 2, 'Hi Bob, can you provide more details about the villa?');

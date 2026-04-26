-- =====================================
-- Database Selection
-- =====================================
USE real_estate_db;

-- =====================================
-- 1. Revenue by Developer
-- =====================================
SELECT 
    Developer_Name,
    SUM(Ticket_Price_Cr) AS total_revenue
FROM real_estate_data
WHERE Booking_Status = 'Booked'
GROUP BY Developer_Name
ORDER BY total_revenue DESC;

-- =====================================
-- 2. Quarterly Booking Trends
-- =====================================
SELECT 
    Purchase_Quarter,
    COUNT(*) AS total_bookings
FROM real_estate_data
WHERE Booking_Status = 'Booked'
GROUP BY Purchase_Quarter
ORDER BY Purchase_Quarter;

-- =====================================
-- 3. Conversion Rate by Micro Market
-- =====================================
SELECT 
    Micro_Market,
    SUM(CASE WHEN Booking_Status = 'Booked' THEN 1 ELSE 0 END) * 1.0 
    / COUNT(*) AS conversion_rate
FROM real_estate_data
GROUP BY Micro_Market;

-- =====================================
-- 4. Demand by BHK Configuration
-- =====================================
SELECT 
    BHK,
    COUNT(*) AS total_demand
FROM real_estate_data
WHERE Booking_Status = 'Booked'
GROUP BY BHK
ORDER BY BHK;

-- =====================================
-- 5. Sales Channel Efficiency
-- =====================================
SELECT 
    Sales_Channel,
    SUM(CASE WHEN Booking_Status = 'Booked' THEN 1 ELSE 0 END) * 1.0 
    / COUNT(*) AS conversion_rate
FROM real_estate_data
GROUP BY Sales_Channel;

-- =====================================
-- 6. Developer Revenue Ranking (Advanced)
-- =====================================
SELECT 
    Developer_Name,
    SUM(Ticket_Price_Cr) AS total_revenue,
    RANK() OVER (ORDER BY SUM(Ticket_Price_Cr) DESC) AS revenue_rank
FROM real_estate_data
WHERE Booking_Status = 'Booked'
GROUP BY Developer_Name;
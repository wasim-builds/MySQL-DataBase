-- Find overlapping date ranges in bookings
SELECT b1.booking_id, b2.booking_id, b1.start_date, b1.end_date, b2.start_date, b2.end_date
FROM bookings b1
JOIN bookings b2 ON b1.room_id = b2.room_id
                 AND b1.booking_id < b2.booking_id
                 AND b1.start_date <= b2.end_date
                 AND b1.end_date >= b2.start_date;
/* Using A Join */

SELECT s.name, s.description, s.location, s.price, b.check_in, u.name AS host_name
FROM spaces AS s
INNER JOIN bookings AS b
ON b.space_id = s.space_id
INNER JOIN users AS u
ON s.host_id = u.user_id
WHERE b.guest_id = '#{id}'
AND b.booked = FALSE

/* Using A Subquery */

SELECT *
FROM spaces AS s
WHERE s.space_id IN (
    SELECT b.space_id
    FROM bookings AS b
    WHERE b.guest_id = '#{id}'
    AND b.booked = FALSE
)
/* Using A Join */

SELECT s.name, s.description, s.location, s.price, b.check_in, u.name AS guest_name, u.email
FROM spaces AS s
INNER JOIN bookings AS b
ON b.space_id = s.space_id
INNER JOIN users AS u
ON b.guest_id = u.user_id
WHERE s.host_id = '#{id}'
AND b.booked = FALSE
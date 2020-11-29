# SQL Queries for MakersBnB

## Database Tables

<img width="698" alt="Screenshot 2020-11-28 at 16 21 58" src="https://user-images.githubusercontent.com/71923215/100520496-de09bb80-3195-11eb-8da5-a4b5578e5c92.png">

## Requests Made

The ```Booking.requests_as_guest``` method takes the signed in user's id as an argument - which is obtained from the session - and returns all of the booking requests the signed in user has made, which have not yet been confirmed or denied by the host of the space(s). 

With the join query in ```requests_as_guest.sql```, we can display on the client all of the information about each space,
along with the host's name and the requested booking check in date. On the other hand, our subquery doesn't extract the host's name or booking check in date from the database. Nonetheless, in order to retrieve the host's name, we can take the ```space.host_id``` and pass this into our ```User.find``` method, inside our view.

## Requests Received

The ```Booking.requests_as_host``` method also takes in the current signed in user's id as an argument, however, this method returns all the requests the signed in user has received, for the properties this user has listed.

The join query for this method - in ```requests_as_host.sql``` - extracts the guest name, email and requested check in date directly from the database, because like the sql join query for requests made, it too joins all three tables.

## Bookings I have had confirmed

The ```Booking.confirmed_as_guest``` method takes in the signed in user's id as an argument and returns all the booking requests they have had accepted, by other users (hosts).

Here we can use a join query and a hybrid join/subquery, both of which can be found in ```confirmed_as_guest.sql```, however, the limitation with the hybrid query is that we don't directly retrieve the booking check in date from the database.

## Bookings I have confirmed

The ```Booking.confirmed_as_host``` method takes in the signed in user's id as an argument and returns all the bookings said user has confirmed for guests wanting to stay at his or her listed properties.

The join query used in this method can be found in ```confirmed_as_host.sql```.
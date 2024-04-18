/* The following code first joins the event table with 
the table event_location, then joins with the table ad, 
and it filters results so that the results show events
at Hungarian locations with ads. */

WITH hungarian_events_ads as (

    SELECT event.id as  event_id
    FROM event
    INNER JOIN event_location ON event.location_id = event_location.id
    INNER JOIN ad ON event.id = ad.event_id
    WHERE event_location.country = 'HU'
    )

/* Here is the percentage calculation. The code takes the
count from the above mentioned CTE, and then uses a subquery
to calculate the total amount of ads. */

SELECT count(*)  * 100.0 / (SELECT count(*) FROM ad)
FROM hungarian_events_ads

/* For this question, I decided not to use a CTE.
The query uses an inner join to join the ad table with the event table, 
then uses another inner join to join the event table with the event location table.
The query filters out results for the Netherlands, adn calculates the average original price.*/
SELECT 
    AVG(original_price) AS average_original_price
FROM 
    ad
INNER JOIN event ON ad.event_id = event.id
INNER JOIN event_location ON event.location_id = event_location.id
WHERE 
    event_location.country = 'NL';

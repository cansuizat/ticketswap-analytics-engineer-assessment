/*This first part of the code filters out the events 
table with results for Pixies events. I use the lower()
function here, as I saw that in the data there were entries 
for "Pixies" in multiple ways, such as "Pixies", and "pixies". 
By using the lower() funciton, we can ensure that
all the results for Pixies are counted.
Here the upper() function can also be used. I have used a CTE, as I 
think it makes the code more readable, however I know there are 
also other ways to write the following queries. For example it could be 
written in one query with no CTE.*/

WITH pixies_events AS (
    SELECT
        id AS event_id 
    FROM event
    WHERE lower(title)= 'pixies'

    )

/*The next part of the code joins the results with the ad table.
I use a left join to ensure that we do not miss any results from the events table.*/

SELECT
count(*)
FROM pixies_events 
LEFT JOIN ad ON pixies_events.event_id = ad.event_id
WHERE ad.is_sold =1

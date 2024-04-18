/*The following code is rewritten from the README.md file so the code is more readable.
I have formatted the code, changed the clauses so they are all in capital letters,
adjusted the subqueries so that they are not written in one line, removed 
the redundant False in the case statement, adjusted the GROUP BY clauses,
named the column where there is a SUM and case statement, and added
AS clauses.*/

SELECT
    a.id,
    adt.id,
    ev.event_end,
    adt.counter,
    SUM(
        CASE 
            WHEN ev.is_expired = 1
            THEN 1 
            ELSE 0 
        END) AS expired_count
FROM 
    website.ad AS a
LEFT JOIN (
    SELECT * 
    FROM website.event 
    WHERE is_verified = 1
    ORDER BY created_at
) AS ev ON a.event_id = ev.id
LEFT JOIN (
    SELECT ad_id, COUNT(*) AS counter 
    FROM website.ad_ticket 
    GROUP BY ad_id
) AS adt ON a.id = adt.ad_id
WHERE 
    a.source NOT IN ('web-mobile', 'web', NULL)
GROUP BY 
    a.id, adt.id, ev.event_end, adt.counter;

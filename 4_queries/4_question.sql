-- Select just a single row here and name it average_assistance_request_duration
-- In Postgres, we can subtract two timestamps 
-- to find the duration between them. (timestamp1 - timestamp2)
-- Get the average time of an assistance request.

SELECT AVG(assistance_requests.completed_at - assistance_requests.started_at)
AS average_assistance_request_duration
FROM assistance_requests;
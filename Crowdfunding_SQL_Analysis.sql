-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

SELECT cf_id, 
		backers_count
--INTO live_campaigns
FROM campaign
WHERE outcome = 'live'
GROUP BY cf_id
ORDER BY backers_count DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

SELECT cf_id, COUNT(backer_id) AS "Total Backers"
--INTO total_backers
FROM backers
GROUP BY cf_id
ORDER BY "Total Backers" DESC;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT goal - pledged AS remaining_goal_amount,
		contact_id,
		outcome
INTO goal_amount
FROM campaign
WHERE outcome = 'live';

SELECT co.first_name,
		co.last_name,
		co.email,
		g.remaining_goal_amount
--INTO email_contacts_remaining_goal_amount
FROM goal_amount as g
INNER JOIN contacts as co
ON g.contact_id = co.contact_id
ORDER BY remaining_goal_amount DESC;


-- Check the table

SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 



-- Check the table



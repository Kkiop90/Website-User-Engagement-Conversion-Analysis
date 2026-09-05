-- Website Analytics - SQL practice dataset
-- Sessions, pageviews, events, users, and campaigns for a SaaS marketing site - built for funnels, conversion rates, and attribution.
--
-- Free to use for any purpose, including commercially. No attribution required.
-- Browse, query, and re-download at https://sqlshed.com/practice-datasets/
--
-- 5 tables, 161 rows. Standard SQL: runs on
-- PostgreSQL, MySQL, SQLite, DuckDB, and SQL Server without edits.

DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS pageviews;
DROP TABLE IF EXISTS sessions;
DROP TABLE IF EXISTS campaigns;
DROP TABLE IF EXISTS users;

-- users: One row per known (signed-up) user.
CREATE TABLE users (
  user_id INTEGER,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  signup_date DATE,
  country VARCHAR(255),
  plan VARCHAR(255)
);

INSERT INTO users (user_id, first_name, last_name, signup_date, country, plan) VALUES
  (1, 'Maya', 'Cole', '2024-05-01', 'GB', 'pro'),
  (2, 'Eli', 'Park', '2024-02-05', 'AU', 'pro'),
  (3, 'Priya', 'Shah', '2024-01-05', 'DE', 'free'),
  (4, 'Tom', 'Reed', '2024-02-02', 'DE', 'free'),
  (5, 'Sara', 'Lund', '2024-01-20', 'US', 'free'),
  (6, 'Jon', 'Diaz', '2024-04-08', 'CA', 'free'),
  (7, 'Ana', 'Roy', '2024-03-20', 'AU', 'pro'),
  (8, 'Kwame', 'Mensah', '2024-05-14', 'GB', 'pro'),
  (9, 'Lena', 'Vogt', '2024-06-20', 'CA', 'free'),
  (10, 'Raj', 'Nair', '2024-03-21', 'CA', 'pro'),
  (11, 'Iris', 'Frost', '2024-04-17', 'CA', 'pro'),
  (12, 'Ben', 'Hale', '2024-05-23', 'DE', 'free');

-- campaigns: Marketing campaigns with their channel and UTM tags.
CREATE TABLE campaigns (
  campaign_id INTEGER,
  campaign_name VARCHAR(255),
  channel VARCHAR(255),
  utm_source VARCHAR(255),
  utm_medium VARCHAR(255)
);

INSERT INTO campaigns (campaign_id, campaign_name, channel, utm_source, utm_medium) VALUES
  (1, 'Spring Launch', 'paid', 'google', 'cpc'),
  (2, 'Newsletter Drive', 'email', 'mailchimp', 'email'),
  (3, 'Social Promo', 'social', 'facebook', 'social'),
  (4, 'Retargeting', 'paid', 'google', 'display'),
  (5, 'Summer Sale', 'paid', 'bing', 'cpc');

-- sessions: One row per visit. Anonymous visits have a null user_id; organic and direct visits have a null campaign_id.
CREATE TABLE sessions (
  session_id INTEGER,
  user_id INTEGER,
  session_date DATE,
  channel VARCHAR(255),
  campaign_id INTEGER,
  device VARCHAR(255),
  duration_seconds INTEGER
);

INSERT INTO sessions (session_id, user_id, session_date, channel, campaign_id, device, duration_seconds) VALUES
  (1, 9, '2024-01-05', 'organic', NULL, 'desktop', 319),
  (2, 3, '2024-05-21', 'organic', NULL, 'desktop', 261),
  (3, 5, '2024-06-19', 'social', 3, 'desktop', 135),
  (4, 10, '2024-06-09', 'direct', NULL, 'mobile', 379),
  (5, NULL, '2024-05-08', 'social', 3, 'tablet', 163),
  (6, NULL, '2024-02-03', 'organic', NULL, 'desktop', 188),
  (7, NULL, '2024-04-15', 'paid', 5, 'desktop', 168),
  (8, NULL, '2024-01-18', 'social', 3, 'mobile', 519),
  (9, 2, '2024-01-25', 'paid', 1, 'mobile', 81),
  (10, NULL, '2024-06-08', 'social', 3, 'desktop', 479),
  (11, 12, '2024-01-18', 'organic', NULL, 'mobile', 304),
  (12, 4, '2024-05-21', 'email', 2, 'desktop', 377),
  (13, 2, '2024-05-11', 'organic', NULL, 'mobile', 537),
  (14, NULL, '2024-01-01', 'direct', NULL, 'desktop', 205),
  (15, 11, '2024-06-18', 'paid', 5, 'mobile', 293),
  (16, NULL, '2024-06-28', 'organic', NULL, 'desktop', 452),
  (17, 7, '2024-02-14', 'organic', NULL, 'tablet', 415),
  (18, 7, '2024-03-21', 'organic', NULL, 'tablet', 104),
  (19, NULL, '2024-06-01', 'direct', NULL, 'desktop', 281),
  (20, 3, '2024-02-08', 'paid', 5, 'desktop', 219),
  (21, NULL, '2024-03-05', 'social', 3, 'desktop', 205),
  (22, NULL, '2024-04-02', 'paid', 1, 'desktop', 600),
  (23, 8, '2024-04-16', 'social', 3, 'mobile', 61),
  (24, NULL, '2024-02-02', 'direct', NULL, 'mobile', 501),
  (25, 5, '2024-06-02', 'social', 3, 'tablet', 305),
  (26, 3, '2024-04-24', 'social', 3, 'tablet', 216),
  (27, NULL, '2024-04-01', 'email', 2, 'mobile', 343),
  (28, NULL, '2024-02-08', 'organic', NULL, 'desktop', 368),
  (29, 3, '2024-02-08', 'paid', 1, 'desktop', 488),
  (30, 6, '2024-06-16', 'organic', NULL, 'tablet', 196);

-- pageviews: One row per page viewed within a session, in view_order.
CREATE TABLE pageviews (
  pageview_id INTEGER,
  session_id INTEGER,
  path VARCHAR(255),
  view_order INTEGER
);

INSERT INTO pageviews (pageview_id, session_id, path, view_order) VALUES
  (1, 1, '/blog', 1),
  (2, 1, '/blog', 2),
  (3, 1, '/features', 3),
  (4, 1, '/', 4),
  (5, 2, '/', 1),
  (6, 2, '/checkout', 2),
  (7, 3, '/', 1),
  (8, 4, '/', 1),
  (9, 4, '/features', 2),
  (10, 5, '/', 1),
  (11, 5, '/blog', 2),
  (12, 6, '/docs', 1),
  (13, 6, '/signup', 2),
  (14, 7, '/', 1),
  (15, 7, '/features', 2),
  (16, 8, '/', 1),
  (17, 9, '/', 1),
  (18, 9, '/', 2),
  (19, 9, '/features', 3),
  (20, 10, '/', 1),
  (21, 11, '/', 1),
  (22, 11, '/', 2),
  (23, 11, '/blog', 3),
  (24, 11, '/checkout', 4),
  (25, 12, '/blog', 1),
  (26, 12, '/pricing', 2),
  (27, 13, '/', 1),
  (28, 14, '/docs', 1),
  (29, 14, '/', 2),
  (30, 15, '/', 1),
  (31, 16, '/', 1),
  (32, 16, '/blog', 2),
  (33, 16, '/checkout', 3),
  (34, 17, '/features', 1),
  (35, 17, '/features', 2),
  (36, 17, '/blog', 3),
  (37, 17, '/checkout', 4),
  (38, 18, '/pricing', 1),
  (39, 18, '/features', 2),
  (40, 18, '/pricing', 3),
  (41, 19, '/', 1),
  (42, 19, '/', 2),
  (43, 19, '/docs', 3),
  (44, 20, '/', 1),
  (45, 20, '/pricing', 2),
  (46, 20, '/pricing', 3),
  (47, 21, '/docs', 1),
  (48, 21, '/docs', 2),
  (49, 21, '/features', 3),
  (50, 21, '/pricing', 4),
  (51, 22, '/', 1),
  (52, 22, '/checkout', 2),
  (53, 23, '/pricing', 1),
  (54, 23, '/checkout', 2),
  (55, 24, '/', 1),
  (56, 24, '/checkout', 2),
  (57, 24, '/', 3),
  (58, 25, '/features', 1),
  (59, 25, '/signup', 2),
  (60, 25, '/pricing', 3),
  (61, 26, '/', 1),
  (62, 27, '/', 1),
  (63, 27, '/blog', 2),
  (64, 27, '/checkout', 3),
  (65, 27, '/signup', 4),
  (66, 28, '/pricing', 1),
  (67, 28, '/features', 2),
  (68, 29, '/', 1),
  (69, 29, '/docs', 2),
  (70, 29, '/signup', 3),
  (71, 29, '/docs', 4),
  (72, 30, '/', 1),
  (73, 30, '/checkout', 2),
  (74, 30, '/features', 3),
  (75, 30, '/blog', 4);

-- events: Funnel events (signup, add_to_cart, checkout, purchase). Only purchase events carry a value.
CREATE TABLE events (
  event_id INTEGER,
  session_id INTEGER,
  event_name VARCHAR(255),
  value DECIMAL(12,2)
);

INSERT INTO events (event_id, session_id, event_name, value) VALUES
  (1, 1, 'signup', NULL),
  (2, 1, 'add_to_cart', NULL),
  (3, 1, 'checkout', NULL),
  (4, 1, 'purchase', 79.82),
  (5, 2, 'signup', NULL),
  (6, 3, 'add_to_cart', NULL),
  (7, 4, 'signup', NULL),
  (8, 4, 'add_to_cart', NULL),
  (9, 4, 'checkout', NULL),
  (10, 4, 'purchase', 81.72),
  (11, 8, 'add_to_cart', NULL),
  (12, 9, 'add_to_cart', NULL),
  (13, 9, 'checkout', NULL),
  (14, 10, 'add_to_cart', NULL),
  (15, 10, 'checkout', NULL),
  (16, 10, 'purchase', 94.99),
  (17, 11, 'signup', NULL),
  (18, 13, 'signup', NULL),
  (19, 13, 'add_to_cart', NULL),
  (20, 13, 'checkout', NULL),
  (21, 13, 'purchase', 33.25),
  (22, 14, 'add_to_cart', NULL),
  (23, 15, 'add_to_cart', NULL),
  (24, 17, 'signup', NULL),
  (25, 18, 'add_to_cart', NULL),
  (26, 18, 'checkout', NULL),
  (27, 19, 'add_to_cart', NULL),
  (28, 20, 'signup', NULL),
  (29, 22, 'add_to_cart', NULL),
  (30, 22, 'checkout', NULL),
  (31, 23, 'add_to_cart', NULL),
  (32, 23, 'checkout', NULL),
  (33, 23, 'purchase', 21.65),
  (34, 24, 'add_to_cart', NULL),
  (35, 25, 'add_to_cart', NULL),
  (36, 25, 'checkout', NULL),
  (37, 25, 'purchase', 29.71),
  (38, 28, 'add_to_cart', NULL),
  (39, 30, 'add_to_cart', NULL);
  
select  sum(s.session_id) as "total_count" ,
sum(e.session_id),count(*)from sessions s join events e;
show tables;
desc pageviews;
-- *User Engagement**
   -- How many sessions does each user start?
   -- Which users have the highest number of pageviews?
   -- Average session length (if you have timestamps).
select u.user_id,count(s.session_id) from sessions s join users u on 
s.session_id=u.user_id 
group by s.session_id
order by  s.session_id
limit 5;
use website;
-- 2
select *from  sessions;
select u.user_id,count(p.pageview_id)as 'pageview'from users u join sessions s
on u.user_id=s.user_id join pageviews p 
on s.session_id = p.pageview_id
group by u.user_id
order by pageview desc  
limit 5;
-- 3
select
avg(duration_seconds) as 'avg_session_length'
from sessions;
describe sessions;
-- most common event
select *from events;
select event_name , count(*) from events
group by event_name
order by event_name desc;
-- “How many events happen per session on average?”
select avg(event_count) as avg_event_count from (select session_id,count(event_id) as event_count from events
group by session_id
limit 5) as session_events;
-- Which sessions had unusually high activity?
select session_id,count(event_id) as event_count 
from events group by session_id
order by event_count desc limit 5;
-- pageview insights
-- which pages are viewed the most?
select*from pageviews;
desc pageviews;
select path,count(pageview_id) from
pageviews
group by path 
order by path ;
-- unique users visiting each page?
select p.path ,count(distinct s.user_id) from pageviews p join sessions s 
on p.session_id=s.session_id join users u
on s.user_id = u.user_id
group by path
limit 5;
-- : Bounce rate — sessions with only one pageview

select round(
(select count(*) as bounce_rate from(
select session_id from
pageviews
group by session_id
having count(*) =1)as bounce_rate)*100.0/count( distinct session_id), 2)as bounce_rate_average from pageviews;
-- total session
select event_id,count( distinct session_id) from pageviews
;
-- How many sessions lead to a purchase event?
select *from events;
select count(distinct session_id) from events
where event_name = 'purchase';
desc events;
-- Drop-off: Pageviews → Add to Cart → Purchase
select count(distinct session_id) as pageview from pageviews;
select count(distinct session_id) from events
where event_name = 'purchase';
-- How many users return for multiple sessions?
select user_id,count(session_id) as multiple_session from 
sessions group by user_id
having multiple_session>1 ; 

select count(distinct session_id) from events
where event_name = 'add_to_cart';
-- Distribution of sessions per user (New vs Returning)
select user_id ,count(session_id) as total_session ,case when count(session_id)=1 then 'new uses'
else 'returning user'  end as user_type
 from sessions  
group by user_id
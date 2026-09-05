# Website User Engagement & Conversion Analysis

## 📌 Project Overview

This project analyzes website user behavior using MySQL, SQL, and Power BI.

The analysis focuses on user engagement, website pageviews, events,
conversion funnel performance, bounce rate, and user retention.

## 🛠️ Tools Used

- MySQL
- SQL
- Power BI
- GitHub

## 📂 Dataset

The dataset contains 5 tables:

- Users
- Sessions
- Pageviews
- Events
- Campaigns

The dataset is designed for website funnel, conversion rate, and
marketing attribution analysis.

## 🎯 Business Questions

### 1. User Engagement

- How many sessions does each user start?
- Which users have the highest number of pageviews?
- What is the average session length?

### 2. Event Analysis

- What are the most common events?
- How many events happen per session on average?
- Which sessions had unusually high activity?

### 3. Pageview Insights

- Which pages are viewed the most?
- How many unique users visit each page?
- What is the bounce rate?

### 4. Conversion Funnel

- How many sessions lead to a purchase?
- What is the drop-off from pageviews to add-to-cart to purchase?

### 5. User Retention

- How many users return for multiple sessions?
- What is the distribution of new vs returning users?

## 📊 Key Findings

| Metric | Result |
|---|---:|
| Total Sessions | 30 |
| Total Pageviews | 75 |
| Average Session Duration | 305.4 seconds |
| Bounce Rate | 20% |
| Purchase Sessions | 6 |
| Add-to-Cart Sessions | 17 |
| Checkout Sessions | 9 |
| Most Viewed Page | `/` |
| Most Viewed Pageviews | 26 |
| Most Common Event | `add_to_cart` |
| Returning Users | 4 |

## 📈 Event Analysis

The most frequently recorded events were:

- Add to Cart — 17
- Checkout — 9
- Signup — 7
- Purchase — 6

## 🔄 Conversion Funnel

The website funnel contained:

- Pageview Sessions — 30
- Add-to-Cart Sessions — 17
- Purchase Sessions — 6

### Funnel Insights

- Pageview → Add-to-Cart drop-off: 43.3%
- Add-to-Cart → Purchase drop-off: 64.7%
- Overall Pageview → Purchase conversion: 20%

## 👥 User Retention

Users with multiple sessions were classified as returning users.

- Returning Users — 4
- New Users — 8

Returning users included users with more than one recorded session.

## 👀 Pageview Insights

The most viewed pages were:

| Page | Pageviews |
|---|---:|
| `/` | 26 |
| `/features` | 11 |
| `/blog` | 9 |
| `/checkout` | 9 |
| `/pricing` | 9 |
| `/docs` | 7 |
| `/signup` | 4 |

## 📊 Power BI Dashboard

The Power BI dashboard presents:

- Total Sessions
- Total Pageviews
- Average Session Duration
- Bounce Rate
- Purchase Sessions
- Events by Event Type
- Pageviews by Page
- Sessions by Device

## 💡 Key Business Insights

- The homepage `/` was the most viewed page.
- Add-to-cart was the most common recorded event.
- 6 sessions resulted in purchases.
- The overall bounce rate was 20%.
- 4 known users returned for multiple sessions.
- A significant drop-off occurred between add-to-cart and purchase.

## 📁 Project Files

- `website_analytics.sql` — SQL database setup and analysis queries
- `Website_Analytics_Dashboard.pbix` — Power BI dashboard
- `dashboard.png` — Dashboard preview

## 🔗 Dataset Source

SQLShed Practice Dataset

https://sqlshed.com/practice-datasets/

## 👨‍💻 Skills Demonstrated

- SQL querying
- Joins
- Aggregations
- GROUP BY and HAVING
- Subqueries
- CASE statements
- DISTINCT counting
- Conversion funnel analysis
- Bounce rate calculation
- Power BI data modeling
- Power BI dashboard development

# Olist E-Commerce Analytics

## Project Overview

An end-to-end e-commerce analytics project using the Brazilian Olist marketplace dataset.

The project transforms raw e-commerce data into business insights through Python, PostgreSQL, SQL, and Power BI.

## Business Objective

The objective is to understand:

- Sales and revenue performance
- Customer purchasing behavior
- Customer retention
- Product and category performance
- Seller performance
- Delivery performance
- Customer satisfaction
- Geographic sales distribution
- High-value orders
- Business opportunities and improvement areas

## Project Workflow

Raw Olist Data
↓
Python Data Cleaning & Transformation
↓
Exploratory Data Analysis
↓
Statistical Analysis
↓
Processed Data
↓
PostgreSQL
↓
SQL Business Analysis
↓
Power BI Dashboard
↓
Business Insights & Recommendations

## Tools & Technologies

- Python
- NumPy
- Pandas
- Matplotlib
- Seaborn
- SciPy
- PostgreSQL
- SQL
- Power BI
- Jupyter Notebook

## Data Preparation

The raw Olist datasets were cleaned and transformed using Python.

Major activities included:

- Data cleaning
- Missing-value handling
- Data type correction
- Data transformation
- Feature engineering
- Dataset integration
- Delivery analysis
- Customer analysis
- Product and category analysis
- Seller analysis
- Statistical analysis

## Key Analysis Areas

### Sales Analysis

Analyzed:

- Total revenue
- Total orders
- Average order value
- Revenue trends
- High-value orders
- Revenue by category

### Customer Analysis

Analyzed:

- Customer frequency
- One-time vs repeat customers
- Customer spending
- Average customer value
- Customer distribution by state

### Product & Category Analysis

Analyzed:

- Product sales
- Category revenue
- Category order volume
- Top-performing categories

### Seller Analysis

Analyzed:

- Seller order volume
- Seller revenue
- Seller average order value
- Top-performing sellers

### Delivery Analysis

Analyzed:

- Delivery duration
- Early deliveries
- On-time deliveries
- Late deliveries
- Delivery delays
- Delivery time vs customer satisfaction

### Customer Satisfaction

Analyzed:

- Review score distribution
- Average review score
- Review score by delivery performance
- Relationship between delivery time and customer satisfaction

## Statistical Analysis

Statistical testing was performed to evaluate relationships between:

- Delivery performance and review scores
- Customer type and spending

The analysis found a significant association between delivery performance and customer satisfaction, with late deliveries receiving substantially lower review scores.

Repeat customers also showed substantially higher spending than one-time customers.

These results indicate association rather than causation.

## Power BI Dashboard

The final Power BI dashboard contains two pages.

### Page 1 — Olist Commerce Intelligence

Includes:

- Total Revenue
- Total Orders
- Average Order Value
- Total Customers
- Average Review Score
- Revenue Performance
- Revenue by State
- Category Performance
- Average Delivery
- Repeat Customer Percentage

### Page 2 — Customer & Delivery Analytics

Includes:

- Delivery Rate
- Late Delivery Rate
- Repeat Customer Percentage
- High-Value Orders
- High-Value Revenue
- Delivery Status
- Delivery Time vs Customer Satisfaction
- Customer Spending
- Revenue by Delivery Status

Interactive features include:

- Year filtering
- Page navigation
- Reset filters

## Key Business Insights

- The majority of customers are one-time customers.
- Repeat customers spend substantially more than one-time customers.
- São Paulo generates the highest revenue among Brazilian states.
- Health & beauty and watches/gifts are among the strongest revenue-generating categories.
- Most orders are delivered early.
- Late deliveries are strongly associated with lower customer review scores.
- High-value orders represent an important revenue segment.
- Delivery performance is an important area for improving customer satisfaction.

## Business Recommendations

1. Improve customer retention strategies to convert one-time customers into repeat customers.

2. Investigate causes of late deliveries and improve logistics performance.

3. Prioritize high-performing product categories for inventory and marketing decisions.

4. Develop targeted campaigns for high-value customers.

5. Monitor seller and delivery performance continuously.

6. Use customer satisfaction metrics alongside operational KPIs when evaluating business performance.

## Project Structure

```text
Olist_Ecommerce_Analytics/
│
├── Data/
├── images/
├── Notebooks/
│   └── Olist_Ecommerce_Analysis.ipynb
├── powerBI/
├── processed_data/
├── SQL/
├── README.md
└── anaconda_projects/
# 🛒 Jaffle Shop

## 📌 Project Overview

The goal of this project is to transform raw transactional data (customers, orders, and payments) into clean, well-documented, and analytics-ready models, following analytics engineering best practices. The refined data is then used to build an interactive dashboard that supports business analysis and decision-making.

## 📊 Live Dashboard (Tableau Public)

Explore the Jaffle Shop Analytics Dashboard:

🔗 https://public.tableau.com/app/profile/leonardo.lopes.da.costa/viz/JaffleShop_17702365428990/General

This dashboard provides insights into revenue and order performance over time and by customer.

## 🏗️ Architecture Overview
Data Flow:
1. Raw source data (customers, orders, payments)
2. Data ingestion into BigQuery
3. Data transformation and modeling using dbt
4. Data quality tests and documentation with dbt
5. Refined analytics tables in BigQuery
6. Business dashboard built in Tableau

## 🧰 Tech Stack
- Data Warehouse: Google BigQuery
- Transformation Tool: dbt
- Data Visualization: Tableau
- Version Control: GitHub

## 🧪 Data Modeling & Quality
The transformation layer was built using dbt best practices:
- Staging models to standardize raw data
- Intermediate models to centralize business logic (payments, orders, customers)
- Fact and dimension models optimized for analytics
- BI-oriented wide table for dashboard performance
- Generic tests: unique, not null and accepted values
- Data documentation using dbt docs

## 📊 Dashboard Highlights
- KPIs: Revenue, Orders, Customers
- Revenue and orders analysis over time
- Revenue and orders distribution by order status
- Revenue and orders per customer
- Orders vs revenue scatter plot

## 🎯 Key Skills Demonstrated
- Analytics engineering with dbt
- Data modeling using staging, intermediate, and mart layers
- Data quality testing and documentation
- Data visualization
- Version control

**← [Back to main README](../../README.md)**
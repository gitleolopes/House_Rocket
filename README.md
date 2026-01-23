# 📊 Data Cost Observability (GCP)

## 📌 Project Overview
This project demonstrates a data pipeline focused on Data Cost Observability using Google Cloud Platform (GCP) and analytics engineering best practices.

The main goal is to simulate a scenario where raw data is ingested, transformed, documented, tested and visualized through an dashboard to support cost monitoring.


## 🏗️ Architecture Overview
Data Flow:
1. Mock data generation using Python
2. Raw data ingestion into BigQuery
3. Data Transformation and Modeling using DBT
4. Data Quality Tests and Documentation with DBT
5. Refined data ingestion into BigQuery
6. Cost Dashboard built in Tableau

## 🧰 Tech Stack
- Data Warehouse: BigQuery
- Transformation Tool: DBT
- Data Visualization: Tableau
- Version Control: GitHub

## 🧪 Data Modeling & Quality
The transformation layer was built using DBT:
- Staging model to standardize raw data
- Mart models to optimize data for analytics and reporting
- Generic tests: unique, not null and acceptable values
- Documentation using DBT docs

## 📊 Dashboard Highlights
- KPIs (Jobs, TBytes, Price, Users, Projects)
- Total cost and processing over time
- Cost and processing distribution per project
- Highlight of users responsible for more than 10% of project cost

## 🎯 Key Skills Demonstrated
- Cloud data ingestion and storage
- Analytics engineering with DBT
- Data quality testing and documentation
- Cost observability concepts
- Data visualization
- Version control

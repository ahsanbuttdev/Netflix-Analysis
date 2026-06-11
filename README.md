# Netflix Movies & TV Shows Content Analysis 🎬📊

## 📌 Project Overview
This project delivers an end-to-end data analytics solution focused on exploring, cleaning, and visualizing global Netflix content trends. Moving from raw, inconsistent data to structured database schemas, the workflow concludes with an interactive, high-contrast, data-driven dashboard. The goal is to uncover insights regarding content distribution, viewer ratings, financial metrics, and localized media availability.

---

## 🛠️ Tech Stack & Tools Used
* **Data Cleaning & Preprocessing:** Python, Pandas 
* **Database Management & Modeling:** PostgreSQL 
* **Data Visualization & Design:** Tableau Public 

---

## 📂 Dataset Source
The data utilized in this project was originally sourced from the **Netflix Movies and TV Shows** dataset available on **Kaggle**. It tracks historical release timelines, global country reach, genres, ratings, and associated performance metrics.

---

## ⚙️ Data Pipeline Architecture

### 1. Data Cleaning & Transformation (Python & Pandas)
Before importing the raw data into the SQL database, a Python script was used to standardize fields, fix formatting anomalies, and isolate target analysis features:
* Handled alphanumeric identifiers and missing data cells.

### 2. Relational Database Staging & Views (PostgreSQL)
Cleaned structured files were imported into a PostgreSQL backend for deeper relational exploration:
* Structured clean staging tables to preserve raw, normalized inputs.

### 3. Interactive Visualization Design (Tableau Public)
The finalized data schema was connected directly to Tableau to build a highly professional, interactive analytics interface.
* **Design Aesthetic:** Crafted using a custom dark-themed interface utilizing high-contrast color accents (Red, Black, and Light Gray) optimized for maximum visibility and modern user experiences.
* **Key Visualizations:**
  * Global KPI Cards tracking total volumes, average ratings, and historical milestones.
  * *Top 5 Movies by Revenue* dynamic horizontal bar chart.
  * *Top 5 TV Shows by Revenue* dynamic horizontal bar chart.
  * *Movie Revenue Trends Over Time* granular line timeline.
  * *TV Shows Revenue Trends Over Time* granular line timeline.
  * *Top 5 Movie Genres* volume breakdown.
  * *Top 5 TV Shows Genres* volume breakdown.
  * Interactive filtering layers across Country, Genre, Language, and Arrival Dates.

---

## 📊 Live Interactive Dashboard
The finalized dashboard has been published live and is fully interactive. You can click filters, explore trends, and navigate pages directly from your web browser:

👉 **[Live Tableau Public Dashboard](https://public.tableau.com/app/profile/muhammad.ahsan7262/viz/netflix_project_tableau/Home#4))**

---

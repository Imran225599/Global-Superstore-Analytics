🌍 Global Superstore Sales Analysis
📌 Project Overview
End-to-end data analysis of 51,290+ global retail orders across multiple markets, regions, and product categories — covering data cleaning, feature engineering, SQL querying, Excel summaries, Python EDA, and Power BI dashboarding.

🛠️ Tools & Technologies
ToolPurposePython (Pandas, Matplotlib, Seaborn)Data cleaning, EDA, feature engineering, visualizationSQL ServerBusiness queries, KPI extraction, loss analysisPower BIInteractive dashboard, visual storytellingExcelPivot tables — category, region, segment summaries

📁 Project Structure
Global-Superstore-Analytics/
│
├── Data/
│   ├── Global_Superstore2.csv              # Raw dataset
│   └── Global_Superstore_Final.csv         # Cleaned dataset (Python output)
│
├── notebooks/
│   └── Global_Superstore_Analysis.ipynb    # Python EDA + cleaning + charts
│
├── sql/
│   └── GlobalStoreDB_Analysis.sql          # SQL queries (5 sections)
│
├── excel/
│   └── Global_Superstore_Analysis.xlsx     # Pivot table analysis
│
├── dashboards/
│   └── Global_Superstore_Dashboard.pbix    # Power BI dashboard
│
├── images/
│   ├── Sales Overview.png                  # Power BI — Sales overview page
│   ├── Category wise Sales.png             # Power BI — Category analysis
│   ├── Region wise Sales + Profit.png      # Power BI — Region analysis
│   ├── Segment wise Sales + Profit.png     # Power BI — Segment analysis
│   ├── Detailed Analysis.png               # Power BI — Detailed view
│   ├── chart1_category_sales_profit.png    # Python — Category Sales & Profit
│   ├── chart2_region_profit.png            # Python — Region-wise Profit
│   ├── chart3_yearly_trend.png             # Python — Year-wise Trend
│   ├── chart4_loss_subcategory.png         # Python — Loss Sub-Categories
│   ├── chart5_segment_distribution.png     # Python — Segment Distribution
│   └── chart6_shipping_mode.png            # Python — Shipping Mode Analysis
│
└── README.md

📸 Dashboard Preview
Power BI — Sales Overview
Show Image
Power BI — Category wise Sales
Show Image
Power BI — Region wise Sales & Profit
Show Image
Power BI — Detailed Analysis
Show Image

📊 Excel Pivot Analysis
Category wise Sales & Profit
Show Image
Region wise Sales & Profit
Show Image
Segment wise Sales & Profit
Show Image
Ship Mode wise Orders Count
Show Image

🐍 Python Charts
Category-wise Sales & Profit
Show Image
Region-wise Profit Analysis
Show Image
Year-wise Sales & Profit Trend
Show Image
Loss-Making Sub-Categories & Avg Discount
Show Image
Segment-wise Distribution
Show Image
Shipping Mode Analysis
Show Image

🔄 Project Workflow
Raw Data (CSV)
     ↓
Python — Data Cleaning + Feature Engineering + Visualization
     ↓
Cleaned CSV → SQL Server → Business Queries
     ↓
Excel → Pivot Table Summaries
     ↓
Power BI → Interactive Dashboard

📊 Key Business Insights
#Insight1💻 Technology is the top revenue category — $4.74M in sales2🪑 Furniture has highest avg discount (16.8%) → lowest profit margin3🌍 Central region leads in profit — $311K4⚠️ Southeast Asia has 27.2% avg discount → only $17K profit5🔴 Turkey is the biggest loss market — (-$98K) profit6📉 Tables sub-category carries 29% avg discount → net loss7🚨 24.46% of all orders are loss-making — 1 in every 4 orders!8🚚 Standard Class shipping dominates — 60% of total orders

🗂️ SQL Analysis — 5 Sections

Database Setup — Create and use GlobalStoreDB
Table Creation — Schema with derived columns (ProfitMargin, IsLoss, ShippingDays)
Data Verification — Row count + data preview
Business Analysis Queries — Category, Country (top/loss), Shipping, Loss sub-categories
Key Business Insights — Summary comments


🐍 Python Notebook — 8 Sections

Data Loading
Exploratory Data Analysis (EDA)
Data Cleaning
Feature Engineering
Save Cleaned Data
Data Analysis (7 sub-analyses)
Data Visualization (6 charts)
Key Business Insights


📦 Dataset

Source: Kaggle — Global Superstore Dataset
Rows: 51,290 orders
Columns: 24 (+ 5 engineered features)
Coverage: Global markets, 2011–2014


👤 Author
**Imran Makandar**
📧 imranmakandar699423@gmail.com
🔗 www.linkedin.com/in/imrannoorallimakandar
🐙 github.com/Imran225599

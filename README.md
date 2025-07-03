# Digital Wallet Transaction Analysis

This project demonstrates a comprehensive end-to-end data analytics pipeline built using SQL, Excel, Power BI, and Python (Google Colab). The goal was to analyze and visualize user behavior, merchant performance, transaction patterns, and platform efficiency for a digital wallet system using a real-world inspired transaction dataset.

---

## Dataset Description

The dataset simulates transactional data for a digital wallet application. It includes over 4,700 records and contains fields like:

- Transaction ID, User ID, Transaction Date
- Product Category, Merchant Name, Payment Method
- Product Amount, Cashback, Loyalty Points
- Device Type, Location, Transaction Status

The dataset spans transactions between August 2023 and August 2024, making it ideal for trend and behavioral analysis.

---

## Tools and Technologies Used

- **PostgreSQL** – Data cleaning, aggregation, and view creation
- **SQL** – Custom queries and KPI calculations
- **Power BI** – Interactive dashboard with slicers, cards, and charts
- **Python (Google Colab)** – In-depth analysis and visualizations using `pandas`, `matplotlib`, and `seaborn`
- **Excel** – Summary file exports for business reporting

---

## File Descriptions

- `digital_wallet_views.sql` – All SQL view creation queries used for Power BI and Python analysis
- `digital_wallet_dashboard.pbix` – Interactive Power BI dashboard file
- `digital_wallet_analysis.ipynb` – Python (Colab) notebook for trend analysis, visualizations, and exports
- `.xlsx` files – Summary exports for top merchants, revenue trends, and other KPIs
- `.png` files – Screenshots of dashboard and visual plots
- `README.md` – Documentation for the entire project

---

## Step-by-Step Project Workflow

1. **Data Loading & Setup**
   - Loaded `.csv` data into PostgreSQL using pgAdmin
   - Created structured tables and verified schema

2. **SQL Analysis & View Creation**
   - Built views for monthly revenue, top merchants, product category revenue, cashback trends, etc.
   - Validated views for use in Power BI and Python

3. **Power BI Dashboard Development**
   - Connected Power BI to PostgreSQL views
   - Created 3 pages: Executive Overview, Customer Insights, Merchant Performance
   - Used slicers, KPIs, bar/line charts, pie charts

4. **Python Analysis in Google Colab**
   - Uploaded SQL view exports to Colab
   - Performed detailed trend analysis, failed transaction breakdown, and behavioral segmentation
   - Visualized findings using `seaborn` and `matplotlib`

5. **Excel Exports**
   - Exported cleaned summary tables for reporting
   - Saved top insights like monthly growth, category trends, and merchant performance

6. **Conclusion & Recommendations**
   - Interpreted all findings into business insights for product, marketing, and operational decisions

---

## Analysis Findings

### Revenue & Transaction Trends
- The digital wallet experienced strong revenue growth from August 2023 to July 2024, peaking at ₹2.15M in July.
- A sharp 42% drop occurred in August 2024, potentially due to seasonal dips or platform performance issues.
- Average transaction value remained stable at approximately ₹4.9K, indicating consistent user spend behavior.

### Payment Behavior
- UPI and Wallets were the most-used payment methods in terms of volume.
- However, Credit/Debit Cards contributed significantly higher revenue per transaction.
- This suggests two user segments: price-sensitive (UPI/Wallet) vs. high-value (Cards).

### Product Category Performance
- Electronics and Fashion generated the highest revenue.
- Food and Lifestyle had higher transaction frequency but lower average values.

### Merchant & Cashback Insights
- The top-performing merchant generated the most revenue and gave the highest cashback.
- Loyalty programs with consistent point rewards led to better merchant repeatability.

### Failed Transaction Analysis
- Declined payments and network errors were primary failure reasons, contributing to 8–12% revenue leakage.
- Reducing failures could improve overall platform performance significantly.

### Device & Channel Preferences
- Mobile devices accounted for the majority of transactions.
- Desktop users had fewer transactions but higher average order values, suggesting enterprise or high-ticket buyers.

---

## Strategic Recommendations

- Investigate August revenue drop and implement reactivation campaigns or technical audits
- Focus promotional offers and cashback on high-performing categories and merchants
- Improve UPI and wallet transaction success rates through technical optimization
- Personalize mobile user journeys and build targeted engagement flows for top segments

---

## Final Note

This project reflects real-world data storytelling using SQL, BI tools, and Python, combining business context with technical depth. It demonstrates end-to-end proficiency from database design to insight generation and dashboard delivery.

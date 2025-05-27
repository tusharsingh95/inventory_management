# Data Analytics Project: End-to-End (E2E)

## Overview

This project demonstrates an end-to-end data analytics workflow using a Kaggle dataset. The process involves downloading the dataset using Python, cleaning and processing the data with Pandas, storing it in an MS SQL Server database, performing SQL-based analysis, and creating interactive dashboards in Power BI.

## Key Components

1. **Data Download**: The dataset is sourced from Kaggle and downloaded using Python libraries.
2. **Data Cleaning**: Pandas is used to clean and preprocess the data, preparing it for analysis.
3. **Data Storage**: Cleaned data is stored in an MS SQL Server database to facilitate structured queries and analysis.
4. **Data Analysis**: SQL is used to perform various analytical queries, providing insights into sales performance, profitability, discounts, and other key metrics.
5. **Data Visualization**: Power BI is used to create interactive dashboards that visually represent the findings and insights from the data analysis.

## Project Structure

Here is an overview of the project structure:

```
DataAnalyticsProject_E2E/ (main directory)
│
├── docs/ 
│   ├── requirements.txt
│   └── KaggleDataAnalyticsProjectArchitecture.png
│
├── dataset/
│   └── Orders.csv
│
├── Notebooks/
│   ├── .ipynb_checkpoints/
│   └── Retail Order Analysis.ipynb
│
├── Power-Bi Reports/
│   ├── RetailOrderProjectDashboard.pbix
│   └── insights.md
│
├── Scripts/
│   ├── kaggleDataAnalytics_e2e_sql_scripts.sql
│   └── kaggleDataAnalytics_e2e_sql_scripts_PowerBi_Validations.sql
│
└── readme.md
```

### Directory Details

- **docs/**: Documentation files, including a requirements list and architecture diagram.
  - `requirements.txt`: Lists required Python libraries and packages.
  - `KaggleDataAnalyticsProjectArchitecture.png`: Visual representation of the project’s architecture.

- **dataset/**: Contains the raw data file used for analysis.
  - `Orders.csv`: Main dataset for the project.

- **Notebooks/**: Jupyter Notebook files for data processing and analysis.
  - `.ipynb_checkpoints/`: Automatic checkpoint files created by Jupyter.
  - `Retail Order Analysis.ipynb`: Notebook for data downloading, cleaning, preprocessing, and analysis.

- **Power-Bi Reports/**: Power BI files for data visualization.
  - `RetailOrderProjectDashboard.pbix`: Power BI report with interactive dashboards.
  - `insights.md`: Documented insights and findings from the analysis.

- **Scripts/**: SQL scripts for data analysis and validation.
  - `kaggleDataAnalytics_e2e_sql_scripts.sql`: SQL scripts for analyzing data in MS SQL Server.
  - `kaggleDataAnalytics_e2e_sql_scripts_PowerBi_Validations.sql`: SQL scripts for Power BI data validation.

- **readme.md**: This file provides an overview of the entire project, including its purpose, structure, setup instructions, and usage.

## Getting Started

### Prerequisites

- **Python 3.x**: Ensure Python is installed on your machine.
- **Jupyter Notebook**: Required to run the analysis notebook (`Retail Order Analysis.ipynb`).
- **MS SQL Server**: Required for storing data and performing SQL-based analysis.
- **Power BI Desktop**: Needed to view and edit the Power BI dashboard (`RetailOrderProjectDashboard.pbix`).

### Setup Instructions

1. **Clone the Repository**: Clone the project repository to your local machine.
   ```bash
   git clone <repository-url>
   ```
   
2. **Install Required Packages**: Navigate to the `docs/` directory and install the necessary Python packages listed in `requirements.txt`.
   ```bash
   pip install -r docs/requirements.txt
   ```

3. **Run Jupyter Notebook**: Open and run `Retail Order Analysis.ipynb` in the `Notebooks/` directory to download, clean, and preprocess the data.

4. **Load Data into MS SQL Server**: Use the SQL scripts in the `Scripts/` directory to load the cleaned data into your MS SQL Server database and perform analysis.

5. **Open Power BI Report**: Open `RetailOrderProjectDashboard.pbix` in Power BI Desktop to view and interact with the dashboards.

## Insights

The `insights.md` file in the `Power-Bi Reports/` directory summarizes the key findings and recommendations based on the data analysis performed in this project. It highlights critical metrics such as total sales, profits, discounts, and regional performance, providing actionable insights for business decision-making.

## Conclusion

This project provides a comprehensive overview of an end-to-end data analytics workflow, showcasing how data can be transformed into actionable insights using a combination of Python, SQL, and Power BI. The structured approach and detailed documentation make it easy for anyone to understand and replicate the process.

Feel free to explore each component of the project to gain a deeper understanding of the techniques and tools used.
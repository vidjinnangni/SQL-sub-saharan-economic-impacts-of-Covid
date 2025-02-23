#📊 Sub-Saharan Economic Impacts of COVID-19 - SQL Portfolio
This project explores **the economic impacts of COVID-19 in Sub-Saharan Africa** using a dataset from *Kaggle*. The objective is to structure and analyze the data using **MySQL** and produce visualizations.

[Dataset Kaggle - Sub-Saharan Economic Impacts of COVID-19
](https://www.kaggle.com/datasets/mpwolke/cusersmarildownloadssubsaharancsv/code)

## 📂 Project structure
The project is organized as follows:

```
📂 sub_saharan_covid
├── 📜 README.md
├── 📜 db_schema.sql        # SQL script for database and table creation
├── 📜 insert_data.sql      # SQL script for inserting data into tables
├── 📜 queries.sql.         # SQL queries for data analysis
└── 📂 data                 # Source dataset file (CSV)

```
## 🛠️ Technologies used

- **MySQL**: Relational database management
- **TablePlus**: SQL query exploration and visualization tool

*Python (Pandas, Matplotlib, Seaborn): For additional analyses*

## 🏗️ Project steps

### 1️⃣ Data preparation

- Importing the dataset from Kaggle
- Cleaning and normalizing the data into multiple relational tables

### 2️⃣ Database setup
- [db_schema.sql](./db_schema.sql): SQL script for table creation
- [insert_data.sql](./insert_data.sql): SQL script for inserting cleaned data into MySQL

### 3️⃣ SQL exploration & analysis

[queries.sql](./queries.sql) contains queries to analyze:

- Employment trends
- COVID-19’s impact on income
- Financial assistance received
- Mobile payment usage
- Government priorities

## 📊 Example SQL Queries

### Total number of surveyed individuals

```sql
SELECT COUNT(*) AS total_people FROM Person;
```
### Employment type distribution
```sql
SELECT Job_Type, COUNT(*) AS count FROM Jobs
GROUP BY Job_Type
ORDER BY count DESC;
```
### Average monthly expenses by country
```sql
SELECT P.Country, ROUND(AVG(Income_Expenses.Monthly_Need), 2) AS average_expenses
FROM Income_Expenses
JOIN Person P ON Income_Expenses.ID = P.ID
GROUP BY P.Country
ORDER BY average_expenses DESC;
```

## 🚀 Installation & usage

### 1️⃣ Clone the Project
```bash
git clone https://github.com/vidjinnangni/SQL-sub-saharan-economic-impacts-of-Covid.git
cd SQL-sub-saharan-economic-impacts-of-Covid
```

### 2️⃣ Import database to MySQL
```bash
SOURCE db_schema.sql;
SOURCE insert_data.sql;
```

---
You can use **TablePlus** to open SQL files, execute SQL queries, and produce visualizations.


## 🤝 Contributions

Contributions are welcome! You can submit improvements via pull requests.

## 📜 License

This project is licensed under the MIT License.


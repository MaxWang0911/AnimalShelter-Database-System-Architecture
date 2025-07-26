# 🐾 Animal Shelter Database System

This project presents a relational database system designed to support the operations of an animal shelter, including adoption and foster services. It was developed as part of the **31271 Database Fundamentals** course at the University of Technology Sydney (UTS).

## 📌 Objectives

- Design an Entity Relationship Diagram (ERD) using book-style notation.
- Build PostgreSQL tables with appropriate keys and constraints.
- Insert and query sample data to simulate real-world animal shelter scenarios.
- Support adoption and foster workflows through a normalized database schema.

## 🧱 Key Entities

- `Customer`: People applying for foster or adoption.
- `Animal`: All animals in the shelter system.
- `Branch`: Shelter branches housing the animals.
- `Staff`, `Coordinator`, `Reviewer`: Employees involved in order management.
- `Order_T`: Orders for fostering animals.
- `Animal_for_foster_detail`: Categories of foster needs.
- `Order_detail`: Links orders to foster categories.

## 📂 Files Included

| File Name | Description |
|-----------|-------------|
| `DBanimalservice.sql` | SQL script for building and populating the database. |
| `AnimalShelter_ERD.png` | ERD diagram showing entity relationships. |
| `AnimalShelter-database-report.pdf` | Final database design and documentation report. |

## 🔍 Sample Queries

The SQL script includes useful queries such as:
- Get number of customers by city.
- List animals selected for fostering by customer.
- Identify customers not living in apartments.

## 🌐 Reference

- [AWL NSW](https://www.awlnsw.com.au/): Real-world animal welfare organization referenced in project scope.

## 👤 Author

- **Zheng Wang** | zheng.wang-15@student.uts.edu.au  

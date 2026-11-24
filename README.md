# SEG2102 – Database Management Systems Final Assessment

## 1. Project Overview

This project focuses on the design and implementation of a University Course Registration System using CockroachDB and MongoDB.

The system manages student information, course information, and course registration records. Both database systems are prepared with different dataset sizes to support database operations and further performance testing.

## 2. Database Technologies

The project uses the following database technologies:

- **CockroachDB:** Relational database management system.
- **MongoDB:** NoSQL document-oriented database.
- **MongoDB Compass:** Graphical interface for managing MongoDB databases.
- **DBeaver:** Database management and SQL execution tool.

## 3. Dataset Information

Three different dataset sizes are prepared for testing.

| Dataset | Students | Courses | Registrations |
| Original | 3 | 3 | 3 |
| Small | 1,000 | 100 | 5,000 |
| Medium | 5,000 | 250 | 25,000 |
| Large | 10,000 | 500 | 50,000 |

**CockroachDB:** 12 tables containing 96,859 rows in total.

**MongoDB:**
- Original database: 9 documents.
- Test database: 96,850 documents across 9 collections.

## 4. Repository Structure

```text
SEG2102-Database-Management-System/
│
├── README.md
│
├── CockroachDB/
│   ├── Schema/
│   ├── Data/
│   ├── Implementation/
│   └── Validation/
│
├── MongoDB/
│   ├── Original/
│   ├── Test/
│   └── Scripts/
│
├── ERD/
│
└── Database-Architecture/
```

## 5. CockroachDB

The CockroachDB section contains:

- Database schema and table definitions.
- SQL data files for Original, Small, Medium, and Large datasets.
- Database implementation SQL scripts.
- Data validation SQL scripts.

The database consists of 12 tables, including primary keys, foreign keys, and unique constraints.

## 6. MongoDB

The MongoDB section contains:

- Original database backup.
- Test database backup.
- MongoDB implementation scripts.

The original and test databases are maintained separately.

## 7. Database Design Documentation

The repository also includes:

- Entity Relationship Diagram (ERD).
- Database Architecture documentation.

These documents describe the database structure and relationships within the University Course Registration System.

## 8. Database Restoration

### CockroachDB

1. Create a database.
2. Execute the schema SQL file.
3. Import the student and course data first.
4. Import the registration data after the parent tables.
5. Execute validation queries to verify the records.

### MongoDB

The original and test database backups are provided separately. They can be restored using MongoDB Database Tools (`mongorestore`).

## 9. Project Purpose

This repository provides the database design, implementation files, datasets, backup files, and supporting documentation for the SEG2102 Database Management Systems Final Assessment.

It also serves as a shared resource for database restoration, implementation, and subsequent performance testing.

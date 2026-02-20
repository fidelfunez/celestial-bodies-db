# Celestial Bodies Database
A PostgreSQL project built as part of the **freeCodeCamp Relational Database Certification**. Apparently years of experience and an engineering degree are not sufficent validation or proof of experience lmao. So yeah, look foward to more course projects on my portfolio.

## Quick Overview
This project involved designing and populating a relational database representing the universe. It maps the hierarchical relationships between **Galaxies, Stars, Planets, and Moons**, along with an additional table for **Constellations**.

## Tech Stack
- **Database:** [PostgreSQL](https://www.postgresql.org)
- **Concepts:** Primary/Foreign Keys, UNIQUE constraints, Non-NULL constraints, and various data types (TEXT, BOOLEAN, NUMERIC, BIGINT).

## Schema Highlights
- **5 Tables:** `galaxy`, `star`, `planet`, `moon`, `constellation`.
- **Custom Logic:** Includes astronomical data like light-years, orbital periods, and "visible to naked eye" boolean flags.
- **Scale:** Supports distances in the billions of light-years and ages in billions of years using high-precision numeric types.

## How to Run
Should you for whatever reason want to recreate the database locally, use the provided SQL dump below:
```bash
psql -U postgres < universe.sql

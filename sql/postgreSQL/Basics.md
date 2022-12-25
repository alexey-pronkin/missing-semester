```sql
CREATE TABLE weather (
city varchar(80),
temp_lo int, -- low temperature
temp_hi int, -- high temperature
prcp real, -- precipitation
date date
);

CREATE TABLE cities (
name varchar(80),
location point
);
```

```sql
INSERT INTO weather VALUES ('San Francisco', 46, 50, 0.25,
'1994-11-27');
INSERT INTO cities VALUES ('San Francisco', '(-194.0, 53.0)');
```
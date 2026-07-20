DROP TABLE IF EXISTS production;
DROP TABLE IF EXISTS drilling;
DROP TABLE IF EXISTS wells;

CREATE TABLE wells (
    well_id     INTEGER PRIMARY KEY,
    well_name   TEXT,
    field       TEXT,
    reservoir   TEXT,
    pump_type   TEXT,
    status      TEXT
);

INSERT INTO wells VALUES
 (1,'A101','Alpha','Sand A','ESP','Active'),
 (2,'A102','Alpha','Sand A','Rod Pump','Active'),
 (3,'B101','Bravo','Sand B','Gas Lift','Active'),
 (4,'C101','Charlie','Carbonate C','ESP','Shut-in'),
 (5,'C102','Charlie','Carbonate C','ESP','Active');

CREATE TABLE production (
    record_id   INTEGER PRIMARY KEY,
    well_id     INTEGER,
    date        TEXT,
    oil_bbl     REAL,
    gas_mscf    REAL,
    water_bbl   REAL
);

INSERT INTO production VALUES
 (1001,1,'2026-07-01',3150,470,520),
 (1002,2,'2026-07-01',1950,310,760),
 (1003,3,'2026-07-01',2810,430,640),
 (1004,4,'2026-07-01',0,0,0),
 (1005,5,'2026-07-01',3550,510,480);

CREATE TABLE drilling (
    well_id     INTEGER PRIMARY KEY,
    rig         TEXT,
    depth_m     REAL,
    rop         REAL,
    bit_type    TEXT,
    npt_hr      REAL
);

INSERT INTO drilling VALUES
 (6,'Rig-21',850,18.4,'PDC',2),
 (7,'Rig-19',1100,9.5,'Roller Cone',7),
 (8,'Rig-25',1320,21.3,'PDC',1),
 (9,'Rig-21',950,13.2,'Hybrid',4),
 (10,'Rig-19',780,8.4,'Roller Cone',9);

--Retrieve only columns an engineer needs
SELECT * FROM wells;
SELECT well_name,field,
pump_type FROM wells;

--Case Study 1: List every active well(exclude shut-in)
SELECT well_name, field,
status FROM wells WHERE
status= 'Active';

--Tuesday select practice

--Q1: Well name + Pump type

SELECT well_name, pump_type
FROM wells;

-- Q2: Well name + Reservoir

SELECT well_name, reservoir
FROM wells;

--Q3: Field + status
SELECT field, status FROM
wells;

--Q4 Everything

SELECT * FROM wells;

--Wesnesday  - WHERE (filter rows)

--Top producers: oil > 3000 bbl/day
SELECT well_id, oil_bbl FROM
production WHERE oil_bbl >
3000;

-- Drilling optimization needed: ROP < 10 m/hr
SELECT rig, depth_m, rop FROM
drilling WHERE rop < 10;

--Thursday - ORDER BY (sort)

--Highest producers first

SELECT well_id, oil_bbl FROM
production ORDER BY oil_bbl
DESC;

--Lowest producers first

SELECT well_id, oil_bbl FROM
production ORDER BY oil_bbl
ASC;

--Friday DISTINCT & LIMIT

--Which field exists

  SELECT DISTINCT field FROM
wells;

--Top 3 producing wells
SELECT well_id, oil_bbl FROM
production ORDER BY oil_bbl
DESC LIMIT 3;

-- Saturday Mini Project

--Production Engineer Scenario

-- 1) All active wells 
  SELECT well_name, field,
status FROM wells WHERE
status ='Active';

--2) All shut-in wells
SELECT well_name, field 
status FROM wells WHERE
status = 'shut-in';

--3) Show wells producing above 3000 bbl/day
SELECT p.well_id,
w.well_name, p.oil_bbl
FROM production p 
  JOIN wells w ON p.well_Id = w.well_Id
WHERE p.oil_bbl >3000;

--4) Show wells producing below 1500 bbl/day
SELECT p.well_id,
w.well_name, p.oil_bbl
FROM production p 
JOIN wells w ON p.well_id = w.well_id
WHERE p.oil_bbl < 1500;

--5) Highest producers
SELECT well_id, oil_bbl FROM
production ORDER BY oil_bbl
DESC;

--6) Lowest producers
SELECT well_id, oil_bbl FROM
production ORDER BY oil_bbl

--7) Show every Field
SELECT DISTINCT field FROM
wells;

--8) Show all ESP wells
SELECT well_name, field,
pump_type FROM wells WHERE
pump_type='ESP';

---Drilling Engineer Scenario

--1) Show wells with ROP below 10
SELECT well_id, rig, rop FROM
drilling WHERE rop < 10;

--2) Highest ROP
SELECT well_id,rig , rop FROM
drilling ORDER BY rop DESC

--3) Roller cone wells
SELECT well_id, rig, bit_type
FROM drilling WHERE
bit_type ='Roller cone';

--4) Wells with NPT > 5 hrs
SELECT well_id, rig, npt_hr
FROM drilling WHERE npt_hr >
5;

--5) Deepest wells
SELECT well_id, rig, depth_m
FROM drilling ORDER BY
depth_m DESC;










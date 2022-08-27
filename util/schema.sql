CREATE TABLE IF NOT EXISTS log (
    host TEXT,
    port INTEGER,
    interface VARCHAR(255),
    time REAL,
    bytes INTEGER
);
.mode csv
.import /dev/stdin log

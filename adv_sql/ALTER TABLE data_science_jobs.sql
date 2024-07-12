ALTER TABLE data_science_jobs
ADD COLUMN remote BOOLEAN;

ALTER TABLE data_science_jobs
ALTER COLUMN remote SET DEFAULT FALSE;

ALTER TABLE data_science_jobs
RENAME COLUMN post_date TO posted_on;

UPDATE data_science_jobs
SET remote = 'TRUE'
WHERE job_id = 2;
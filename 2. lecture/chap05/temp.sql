DROP TABLE job_grades PURGE;    -- 테이블 삭제

CREATE TABLE  job_grades (
    grade_level VARCHAR2(3) -- 월급여등급
        CONSTRAINT job_gra_level_pk PRIMARY KEY,
    lowest_sal NUMBER,      -- 최소 월급여
    highest_sal NUMBER      -- 최대 월급여
);

DESC job_grades;

INSERT INTO job_grades VALUES('A', 1000, 2999);
INSERT INTO job_grades VALUES('B', 3000, 5999);
INSERT INTO job_grades VALUES('C', 6000, 9999);
INSERT INTO job_grades VALUES('D', 10000, 14999);
INSERT INTO job_grades VALUES('E', 15000, 24999);
INSERT INTO job_grades VALUES('F', 25000, 40000);

COMMIT;
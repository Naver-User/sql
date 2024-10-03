-- sample2.sql


-- ------------------------------------------------------
-- 2. UPDATE 문
-- ------------------------------------------------------
--  가. 테이블에 저장된 데이터 수정.
--  나. 한 번 수행으로, 여러 개의 행들을 수정할 수 있음.
--  다. WHERE 절은 *생략가능* (일반적이지 않음)
--      이 경우엔, 해당 테이블의 모든 데이터가 수정됨.
-- ------------------------------------------------------
-- Basic Syntax)
--
--  UPDATE 테이블명     -- 변경(수정)할 테이블명 지정.
--  SET                -- 변경할 한개 이상의 컬럼명=값 형식 지정
--      컬럼명1 = 변경값1,
--      [컬럼명2 = 변경값2],
--      ...
--      [컬럼명n = 변경값n]
--  [WHERE 조건식];
--
-- ------------------------------------------------------
-- * Please refer to the chapter 07, page N.
-- ------------------------------------------------------

-- 직무(job_id)별, 평균급여(Average Salary)를 구하라!!
-- 단, 일반 사무직 사원은 제외하고...
SELECT
    job_id, 
    avg(salary) as "Avg Salary"
FROM
    Employees
WHERE 
    job_id NOT LIKE '%CLERK%'
GROUP BY 
    job_id
HAVING 
    avg(salary) > 10000
ORDER BY 
    avg(salary) DESC;


UPDATE mydept
SET
    dname = '영업',
    loc = '경기'
WHERE
    deptno = 40;


-- ------------------------------------------------------
-- 2-1. 서브쿼리(=부속질의)를 이용한 UPDATE 문
-- ------------------------------------------------------
--  가. UPDATE의 SET 절에서 서브쿼리를 이용하면, 서브쿼리의 실행
--      결과값으로, 테이블 수정가능.
--  나. 이 문장으로, 기존 다른 테이블의 데이터를 이용하여, 혀재
--      지정 테이블의 특정 컬럼값의 변경이 가능.  
-- ------------------------------------------------------
-- Basic Syntax)
--
--  UPDATE 테이블명     -- 변경(수정)할 테이블명 지정.
--  SET                -- 변경할 한개 이상의 컬럼명=값 형식 지정
--      컬럼명1 = (Sub-query 1),    -- 서브쿼리 결과로 컬럼변경
--     [컬럼명2 = (Sub-query 2)],
--      ...
--     [컬럼명n = (Sub-query N)]
--  [WHERE 조건식];
--
-- ------------------------------------------------------
-- Please refer to the chap07, page 30.
-- ------------------------------------------------------
DESC mydept;

SELECT * FROM mydept;


-- 서브쿼리를 사용한 UPDATE 문 실행
UPDATE mydept
SET
    -- Thus, The following sub-query must return `Scalar` like 1x1 shape.
    dname = (SELECT dname FROM dept WHERE deptno = 10),
    loc   = (SELECT loc FROM dept WHERE deptno = 20)
WHERE
    deptno = 40;

-- ------------------------------------------------------

SELECT
    *
FROM
    mydept
WHERE
    deptno = 40;
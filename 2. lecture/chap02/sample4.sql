-- sample4.sql


-- ******************************************************
-- SELECT 문의 기본구조와 각 절의 실행순서
-- ******************************************************
--  - Clauses -                 - 실행순서 -
--
-- SELECT clause                    (5) <- SELECTION 연산 수행 : 출력할 컬럼들을 결정
-- FROM clause                      (1) <- 테이블의 행을 하나씩 제공
-- [WHERE clause]                   (2) <- 1차 필터링 (조건식)
-- [GROUP BY clause]                (3) <- 끼리끼리 모이자!!! -> 그룹생성
-- [HAVING clause]                  (4) <- 2차 필터링 (조건식) -> 그룹을 필터링하자!!!
-- [ORDER BY clause]                (6) <- 정렬 수행
-- ******************************************************


-- ------------------------------------------------------
--        *** SELECT 문의 기본문법 구조 ***
-- ------------------------------------------------------
-- SELECT [DISTINCT] { * | column [AS] [alias], ... }
-- FROM <테이블명>
-- ------------------------------------------------------

-- ------------------------------------------------------
-- 1. To remove duplicated data (중복제거)
-- ------------------------------------------------------
-- SELECT [DISTINCT | ALL] column1[, column2, ..., columnN]
-- FROM table;
-- ------------------------------------------------------
SELECT
    -- ALL
    job_id
FROM
    employees;


SELECT
    -- DISTINCT: SELECT 절이 만들어낸 결과셋에서 행의 중복을 제거
    -- 행의 중복이란, 
    -- SELECT 절에 나열된 모든 컬럼의 값이 같은 행을 의미
    DISTINCT job_id
FROM
    employees;


SELECT
    DISTINCT last_name, first_name
-- SELECT
    -- DISTINCT *
FROM
    employees;


-- 현재의 세션(즉, 물리적인 연결)에만 적용된다!
-- 다른말로 하면, 다른 세션에서는 적용되지 않는다!!!
ALTER SESSION SET NLS_DATE_FORMAT = 'yyyy-MM-dd HH24:mi:ss';

SELECT
    current_date,
    current_timestamp
FROM
    dual;    


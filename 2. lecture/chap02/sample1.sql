-- sample1.sql


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
--        (중복제거: 오른쪽 중괄호 블록에서 지정된 컬럼들에 대해서, 모든컬럼의 값이 같은 행 제거)
-- SELECT [DISTINCT] { * | column [AS] [alias], ... }
-- FROM <테이블명>
-- ------------------------------------------------------

-- ------------------------------------------------------
-- 1. To project all columns of the table
-- ------------------------------------------------------
-- SELECT *
-- FROM table;
-- ------------------------------------------------------
SELECT *
FROM employees;



SELECT *
FROM departments;

-- ------------------------------------------------------
-- 2. To project only the specified columns of the table
-- ------------------------------------------------------
-- SELECT column1[, column2, ..., columnN]
-- FROM table;
-- ------------------------------------------------------
DESCRIBE employees;
DESC employees;

SELECT
    employee_id,    -- 사번
    last_name,      -- 성(이름 중에)
    hire_date,      -- 채용일자
    salary          -- 월급여
FROM
    employees;

-- ------------------------------------------------------
-- 3. 산술연산자의 활용 ( +, - , *, / )
-- ------------------------------------------------------
-- SELECT column1 + column2 FROM table;
-- SELECT column1 - column2 FROM table;
-- SELECT column1 * column2 FROM table;
-- SELECT column1 / column2 FROM table;
-- ------------------------------------------------------
SELECT
    salary,
    salary + 100
FROM employees;

SELECT
    salary,
    salary - 100
FROM
    employees;

SELECT
    salary,
    salary * 100 
FROM
    employees;

SELECT
    salary,
    salary / 100
FROM
    employees;

SELECT
    last_name,
    salary,
    salary * 12
FROM
    employees;

-- ------------------------------------------------------
-- 4. About SYS.DUAL table
-- ------------------------------------------------------
-- SYS account owns this DUAL table.
-- If you don't need a table, the DUAL table needed.
-- ------------------------------------------------------
DESC dual;

SELECT * FROM dual;

SELECT 245 * 567
FROM
    dual;          -- 참고로, MySQL/Mariadb/Postgresql 에서는 생략가능!


DESC sys.dual;
DESC dual;          -- 소유자를 기재하지 않고도, dual 테이블을 사용가능한
                    -- 이유는, 뒤에서 배우실, 동의어(Synonym) 객체를 통해가능


SELECT
    *
FROM
    dual;       -- 동의어(Synonym)

SELECT
    * 
FROM
    sys.dual;   -- 보안상, 접근제어를 완화시킨것!!!
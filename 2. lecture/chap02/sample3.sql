-- sample3.sql


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
-- SELECT [DISTINCT] { *, column [AS] [alias], ... }
-- FROM <테이블명>
-- ------------------------------------------------------

-- ------------------------------------------------------
-- 1. Concatenation Operator: ||
-- ------------------------------------------------------
-- SELECT column1 || column2
-- FROM table;
-- ------------------------------------------------------
-- (1) 문자열 + 숫자
SELECT
    last_name || salary AS "이름 월급"
FROM
    employees;


-- (2) 문자열 + 날짜
SELECT
    last_name || hire_date AS "이름 날짜"
FROM
    employees;


-- ------------------------------------------------------
-- 2. Concatenation Operator: ||
-- ------------------------------------------------------
-- SELECT column || literal
-- FROM table;
-- ------------------------------------------------------
-- (3) 문자열 + 리터럴(문자열)
SELECT
    last_name || '사원'
FROM
    employees;


-- ------------------------------------------------------
-- 3. Concatenation Operator: ||
-- ------------------------------------------------------
-- SELECT column1 || literal || column2 || literal || column3
-- FROM table;
-- ------------------------------------------------------
SELECT
    last_name || '의 직무는 ' || job_id || ' 입니다.' AS "사원별 직무"
FROM 
    employees;


SELECT
    last_name || ' 의 직무는 ' || job_id, first_name
FROM
    employees
WHERE   -- 1차 필터링 : 행을 필터링
    -- SQL에서 동등비교연산자는 '=', '!='입니다.
    -- '='기호를 두개 사용하시면 안됩니다! (주의사항)
    last_name = 'Smith';    -- = : 동등비교연산자


SELECT 
    -- 오라클에서는, 아래와 같이 DB기준으로 날짜와 시간값을 반환하는
    -- 함수로, (1) sysdate (2) systimestamp 
    --         (3) current_date (4) current_timestamp 가 있습니다.
    -- 중요한 것은, 이 4개가 모두 "함수" 입니다. (***)

    to_char(current_date, 'YYYY/MM/DD HH24:MI:SS') AS T1,
    to_char(current_timestamp, 'yyyy/MM/dd hh24:mi:ss') AS T2,
    to_char(sysdate, 'yyyy/MM/dd hh24:mi:ss') AS T3,
    to_char(systimestamp, 'yyyy/MM/dd hh24:mi:ss') AS T4

    -- 오라클에서는, "강제형변환(casting)" 아래와 같이 함수를 제공합니다:
    -- (1) to_char(column, 'format') : 문자데이터로 변환
    -- (2) to_number(column, 'format') : 숫자데이터로 변환
    -- (3) to_date(column, 'format') : 날짜데이터로 변환
FROM
    dual;


-- sample2.sql


-- ******************************************************
-- SELECT 문의 기본구조와 각 절의 실행순서
-- ******************************************************
--  - Clauses -                 - 실행순서 -
--
-- SELECT clause                    (5)
-- FROM clause                      (1)
-- [WHERE clause]                   (2)
-- [GROUP BY clause]                (3)
-- [HAVING clause]                  (4)
-- [ORDER BY clause]                (6)
-- ******************************************************


-- ------------------------------------------------------
--        *** SELECT 문의 기본문법 구조 ***
-- ------------------------------------------------------
-- SELECT [DISTINCT] { * | column [AS] [alias], ... }
-- FROM <테이블명>
-- ------------------------------------------------------

-- ------------------------------------------------------
-- 1. 특정 컬럼에 alias(별칭) 만들기
-- ------------------------------------------------------
-- SELECT column1 [[as] alias]
-- FROM table;
-- ------------------------------------------------------
SELECT
    last_name,
    salary,
    salary * 12
FROM
    employees;

--

SELECT
    last_name AS 이름,
    salary 월급,
    salary * 12 AS 연봉
FROM
    employees;


-- ------------------------------------------------------
-- 2. To test alias including special characters or whitespaces
-- ------------------------------------------------------
-- (Whitespace: 공백문자, 탭문자 등)
-- Caution) In this case, you should use double quotation mark("")
-- ------------------------------------------------------
SELECT
    last_name AS "사원 이름",
    salary "사원 월급",
    salary * 12 AS "연 봉"
FROM
    employees;


-- ------------------------------------------------------
-- 3. NULL 값 이해하기
-- ------------------------------------------------------
--    분석입장에서는, "결측치(Missing Value)"라고 함.
--    이러한 결측치가 발생하는 경우는,
--       (1) 실험측정시, 측정이 안되는 경우
--       (2) 실험측정장치의 오동작
--       (3) 관찰로 얻어지는 경우라면, 관찰이 안된 경우
--       (4) 관찰자(사람)의 실수 등 다양함
-- ------------------------------------------------------
-- * Caution: To test NULL
-- ------------------------------------------------------
SELECT
    employee_id,
    last_name,
    job_id,
    commission_pct
FROM
    employees;

--

SELECT
    last_name 이름,     -- AS 키워드 생략
    salary 월급,
    commission_pct 수수료,
    (salary * 12) AS 기본연봉,
    (salary * 12) * (1 + (commission_pct/100)) AS 연봉1,
    (salary * 12) + ( (salary * 12) * (commission_pct / 100) ) AS 연봉2
FROM
    employees;

-- 여기할 차례임: 2024.02.15 <---- *******************
-- ------------------------------------------------------
-- 4. NULL 값의 기본값 처리: NVL() 함수 사용하기
--    결측치의 처리: 분석에서는, 결측치 처리가 매우 다양하고
--                  사용방법에 따라, 통계량이 변경되기 때문에
--                  매우 주의해서 처리함
--
--    결측치 처리예: 대표값(= 특성값) - 평균/중위수/최빈값/
--                         합계/제거!/보간(interpolation)
-- ------------------------------------------------------
-- * Caution: To use NVL(column, defaultValue) built-in function
-- ------------------------------------------------------
SELECT
    last_name 이름,
    salary 월급,
    commission_pct 수수료,
    salary * 12 + nvl(commission_pct, 0) AS 연봉
FROM
    employees;





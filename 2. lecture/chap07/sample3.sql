-- sample3.sql

-- ------------------------------------------------------
-- 3. DELETE 문
-- ------------------------------------------------------
--  가. 테이블에 저장된 데이터 삭제.
--  나. 한번에 여러 행들을 삭제가능.
--  다. WHERE 절은 *생략가능* (**주의**)
--      생략하면, 지정 테이블의 모든 데이터(행)가 삭제됨.
-- ------------------------------------------------------
-- Basic Syntax)
--
--  DELETE FROM 테이블명    -- 데이터를 삭제할 테이블 지정
--  [WHERE 조건식];         -- 조건이 참인 행들만 삭제
-- 만일, WHERE 절이 나오지 않는 경우에는, 아래와 같이 단축형 문법가능
--  DELETE 태이블명;
-- 
-- ------------------------------------------------------
-- * Please refer to the chapter 07, page N.
-- ------------------------------------------------------
DESC mydept;

SHOW AUTOCOMMIT;
SET AUTOCOMMIT OFF;
SHOW AUTOCOMMIT;

SELECT * FROM mydept;

BEGIN       -- To start a transaction.

    DELETE FROM mydept
    WHERE deptno = 70;          -- DML1: TX Unit #1
    
    SAVEPOINT s1;               -- 일종의 복원지점임(여기에 이름을 붙임)

    DELETE FROM mydept
    WHERE deptno = 80;          -- DML2 : TX Unit #2
    
    SAVEPOINT s2;               -- 일종의 복원지점임(여기에 이름을 붙임)

    -- COMMIT TO s2;            -- 구문오류: SAVEPOINT는 롤백에만 적용
END;        -- To end a transaction.


SELECT
    *
FROM
    mydept;


-- ------------------------------------------------------
-- 3-1. 서브쿼리(=부속질의)를 이용한 DELETE 문
-- ------------------------------------------------------
--  가. DELETE 문의 WHERE 절에서, 서브쿼리 사용.
--  나. 서브쿼리의 실행 결과값으로, 테이블의 데이터 삭제가능.
--  다. 이 방법을 사용하면, 기존 테이블에 저장된 데이터를 사용하여,
--      현재 테이블의 특정 데이터 삭제가능.
--  라. 서브쿼리의 실행결과 값의 개수와 타입이, 메인쿼리의 WHERE절
--      에 지정된 조건식의 컬럼의 개수와 타입이 반드시 동일해야 함.
-- ------------------------------------------------------
-- Basic Syntax)
--
--  DELETE FROM 테이블명        -- 데이터를 삭제할 테이블 지정
--  [ WHERE <**Sub-query**> ]; -- 조건이 참인 행들만 삭제
--
-- ------------------------------------------------------
-- Please refer to the chap07, page 33.
-- ------------------------------------------------------
DESC mydept;


BEGIN       -- To start a transaction.

    DELETE FROM mydept
    WHERE loc = (
        SELECT DISTINCT loc
        FROM dept
        WHERE deptno = 20
    );
    
    -- 다중컬럼 조건식 지정 (Pairwise 방식)
    DELETE FROM mydept
    WHERE (loc, dname) = (
            SELECT loc, dname
            FROM dept
            WHERE deptno = 40
        );

    COMMIT;
    --ROLLBACK;
END;        -- To end a transaction.


SELECT
    *
FROM
    mydept;

-- -

DELETE FROM mydept;
DELETE mydept;     -- 삭제한 행의 로그(TX로그)를 남기면서 삭제 (DML문장)

COMMIT;

TRUNCATE TABLE mydept; -- 복구불가능하게, TX로그를 남기지 않고 바로 절삭 (DDL문장)
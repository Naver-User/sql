-- sample11.sql


-- ------------------------------------------------------
-- 4. 테이블 변경
-- ------------------------------------------------------
-- 가. 생성된 테이블의 구조를 변경
--     a. 컬럼의 추가/삭제
--     b. 컬럼의 타입/길이 변경
--     c. 컬럼의 제약조건 추가/삭제
-- 나. ALTER TABLE 문장 사용
-- 다. 테이블의 구조변경은 기존 저장된 데이터에 영향을 주게 됨
-- ------------------------------------------------------

DROP TABLE emp04 PURGE;

-- CTAS : 기존 테이블의 스키마와 데이터를 복제하는 기법
-- 단, 제약도 발생하는데, 바로 6개(공식적으로는 5개)의 제약
-- 조건 중에, 2개 밖에는 복제할 수가 없습니다. 즉, 기본 제약
-- 조건인 NULL 제약조건 + NOT NULL 제약조건만 복제가 가능하고
-- 나머지 4개의 다른 제약조건은 복제불가!!!(PK,UK,FK,CK)
CREATE TABLE emp04 AS
SELECT
    *
FROM
    emp;


DESC emp04;

SELECT * FROM emp04;


-- ------------------------------------------------------
-- (1) 컬럼 추가 (ALTER TABLE ADD 문장)
-- ------------------------------------------------------
-- a. 기존 테이블에 새로운 컬럼 추가
-- b. 추가된 컬럼은, 테이블의 마지막에 추가
-- c. 데이터는 자동으로 null 값으로 저장됨
-- d. DEFAULT 옵션 설정도 가능
-- ------------------------------------------------------
-- Basic Syntax:
--
--  ALTER TABLE 테이블명
--  ADD ( 컬럼명1 데이터타입 [, ..., 컬럼명n 데이터타입] );
-- ------------------------------------------------------
DESC emp04;


ALTER TABLE emp04
ADD ( 
        email VARCHAR2(10),
        address VARCHAR2(20) 
);


DESC emp04;

SELECT * FROM emp04;


-- ------------------------------------------------------
-- (2) 컬럼 변경 (ALTER TABLE MODIFY 문장)
-- ------------------------------------------------------
-- a. 기존 테이블에 기존 컬럼 변경
-- b. 컬럼의 타입/크기/DEFAULT값 변경가능
--    숫자/문자 컬럼의 전체길이의 증가/축소, 타입변경도 가능
-- c. DEFAULT 값 변경의 경우, 이후 입력되는 행에 대해서만 적용
-- ------------------------------------------------------
-- Basic Syntax:
--
--  ALTER TABLE 테이블명
--  MODIFY ( 컬럼명1 데이터타입 [, ..., 컬럼명n 데이터타입] );
-- ------------------------------------------------------
DESC emp04;


ALTER TABLE emp04
-- MODIFY ( email VARCHAR2(40) );
-- MODIFY ( email VARCHAR2(40) DEFAULT 'Yoseph@kh.or.kr' );
-- MODIFY ( email NUMBER(10) );

DESC emp04;

INSERT INTO emp04 (empno) VALUES (9999);


SELECT job
FROM emp04
WHERE job IS NULL;

ALTER TABLE emp04
-- MODIFY( ename VARCHAR2(20) );
MODIFY ( job VARCHAR2(20) CONSTRAINT emp04_job_nn NOT NULL );

DESC emp04;


-- ------------------------------------------------------
-- (2) 컬럼 삭제 (ALTER TABLE DROP 문장)
-- ------------------------------------------------------
-- a. 기존 테이블에 기존 컬럼 삭제
-- b. 컬럼은 값의 존재여부와 상관없이, 무조건 삭제됨
-- c. 동시에 여러 컬럼삭제가 가능
-- d. 최소한 1개의 컬럼은 반드시 존재해야 됨
-- ------------------------------------------------------
-- Basic Syntax:
--
--  ALTER TABLE 테이블명
--  DROP ( 컬럼명1, [컬럼명n] );
-- ------------------------------------------------------
DESC emp04;


ALTER TABLE emp04
DROP ( email, address );


DESC emp04;

-- 참조무결성 관계에서, 부모테이블인 부서테이블의 PK 컬럼(부서번호)도
-- 무리없이 삭제가 가능할까!? => 결론: 삭제불가
ALTER TABLE dept
DROP (deptno);




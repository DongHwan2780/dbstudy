/*
    DML
    1. Data Manipulation Language
    2. 데이터 조작어
    3. 데이터(행, Row)를 다루는 언어이다.
    4. 트랜잭션 처리가 필요하다.
    5. 종류
        1) 행 삽입 : INSERT INTO VALUES
        2) 행 수정 : UPDATE SET WHERE
        3) 행 삭제 : DELETE FROM WHERE
        
*/

/*
    트랜잭션
    1. 한 번에 수행해야 하는 작업을 의미한다. (원자성, All or Nothing)
    2. 2가지 이상의 작업이 하나의 트랜잭션으로 구성된다.
    3. 작업의 저장을 의미하는 COMMIT 작업의 취소를 의미하는 ROLLBACK이 필요하다.
    4. 예시 : 은행 이체 
        1) 내 통장에서 돈 빼기
        2) 너 통장으로 돈 넣기        
*/

/*
    시퀀스
    1. 일련번호를 생성하는 데이터베이스 객체
    2. 주로 기본키의 값을 생성할 때 사용한다.
    3. 함수
        1) 새 번호 생성하기 : NEXTVAL
        2) 현재 번호 확인하기 : CURRVAL
*/




-- 시퀀스 삭제
DROP SEQUENCE DEPT_SEQ;
DROP SEQUENCE EMP_SEQ;


-- 부서 테이블의 부서 번호를 생성하는 시퀀스 만들기
CREATE SEQUENCE DEPT_SEQ
    INCREMENT BY 1  --1씩 증가하는 번호 생성
    START WITH 1    --1부터 번호 생성
    NOMAXVALUE      --상한선 없음
    NOMINVALUE      --하한선 없음
    NOCYCLE         --번호 순환 없음
    CACHE 20        --20개의 번호 미리 생성
    NOORDER         --번호를 순서 없이 사용
;

-- 사원 테이블 사원 번호 생성하는 시퀀스
CREATE SEQUENCE EMP_SEQ
    START WITH 1001
    NOCACHE
;


DROP TABLE EMP_T;
DROP TABLE DEPT_T;

CREATE TABLE DEPT_T
(
    DEPT_NUM NUMBER NOT NULL,
    CONSTRAINT PK_DEPT PRIMARY KEY(DEPT_NUM),
    
    DEPT_NAME VARCHAR2(15 BYTE) NOT NULL,
    LOCATION VARCHAR2(15 BYTE) NOT NULL
);

CREATE TABLE EMP_T
(
    EMP_NUM NUMBER NOT NULL,
    CONSTRAINT PK_EMP PRIMARY KEY(EMP_NUM),
    
    NAME VARCHAR2(20 BYTE) NOT NULL,
    DEPART NUMBER NOT NULL,
    CONSTRAINT FK_MEP_DEPT FOREIGN KEY(DEPART) REFERENCES DEPT_T(DEPT_NUM) ON DELETE SET NULL,
    
    POSITION VARCHAR2(20 BYTE),
    GENDER CHAR(2 BYTE),
    HIRE_DATE DATE,
    SALARY NUMBER
);

-- 부서 테이블에 행 삽입하기
INSERT INTO DEPT_T(DEPT_NUM, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '영업부', '대구');
INSERT INTO DEPT_T(DEPT_NUM, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '인사부', '서울');
INSERT INTO DEPT_T(DEPT_NUM, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '총무부', '대구');
INSERT INTO DEPT_T(DEPT_NUM, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '기획부', '서울');

-- 사원 테이블에 행 삽입하기
INSERT INTO EMP_T VALUES(EMP_SEQ.NEXTVAL, '구창민', 1, '과장', 'M', '95/05/01', 5000000);
INSERT INTO EMP_T VALUES(EMP_SEQ.NEXTVAL, '김민서', 1, '사원', 'M', '17/09/01', 2500000);
INSERT INTO EMP_T VALUES(EMP_SEQ.NEXTVAL, '이은영', 2, '부장', 'F', '90/09/01', 5500000);
INSERT INTO EMP_T VALUES(EMP_SEQ.NEXTVAL, '한성일', 2, '과장', 'M', '93/04/01', 5000000);

-- 커밋
COMMIT;


/*
    수정
    UPDATE 테이블명 SET 업데이트할 내용(여러개 적어도 됨) WHERE 조건식 
*/

-- 1. DEPT_T에서 부서번호(DEPT_NUM)가 3인 부서의 지역을 인천으로 수정
UPDATE DEPT_T 
   SET LOCATION = '인천'  -- SET절의 등호는 대입 연산자
 WHERE DEPT_NUM = 3;  -- WHERE절의 등호는 동등 비교 연산자
 
-- 2. EMP_T에서 부서번호가 2인 부서의 사원들의 기본급을 10% 인상한다.
UPDATE EMP_T
    SET SALARY = SALARY * 1.1
 WHERE DEPART = 2;

--롤백        : 이전 커밋 지점 이후의 작업들을 되돌려줌
ROLLBACK;


/*
    삭제
    DELETE FROM 테이블명 WHERE 조건식
*/

-- 1. DEPT_T에서 부서번호가 3인 부서를 삭제(부서번호가 3인 사원은 없다 == 참조 무결성에 영향을 미치지 않음)
DELETE
    FROM DEPT_T
 WHERE DEPT_NUM = 3;
 
-- 2. EMP_T에서 부서번호가 1과 4인 사원을 삭제
DELETE
    FROM EMP_T
 WHERE DEPART IN(1,4);
 
-- 3. DEPT_T에서 부서번호가 2인 부서를 삭제(부서 번호가 2인 사원이 있다 == 사원 정보가 참조 무결성에 위배된다 / ON DELETE SET NULL 옵션을 주었기 때문에 사원 테이블의 부서 번호가 NULL로 함께 수정됨)
DELETE
    FROM DEPT_T
 WHERE DEPT_NUM = 2;

ROLLBACK;









    
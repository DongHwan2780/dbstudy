/*
    통계 함수(집계 함수)
    1. 합계 : SUM(EXPR)
    2. 평균 : AVG(EXPR)
    3. 최대값 : MAX(EXPR)
    4. 최소값 : MIN(EXPR)
    5. 개수 : COUNT(EXPR)
*/


--EMP_T

--1. 전체 사원의 기본 급여 합계
SELECT SUM(SALARY)
    FROM EMP_T;
--2. 전체 사원의 기본 급여 평균
SELECT AVG(SALARY)
    FROM EMP_T;
--3. 전체 사원의 기본 급여 최대값
SELECT MAX(SALARY)
    FROM EMP_T;
--4. 전체 사원의 기본 급여 최소값
SELECT MIN(SALARY)
    FROM EMP_T;
--5. 전체 사원 수 조회하기
SELECT COUNT(EMP_NUM)   -- 사원 번호의 개수
    FROM EMP_T;
SELECT COUNT(NAME)      -- 이름의 개수
    FROM EMP_T;
SELECT COUNT(*)         -- 모든 칼럼을 참조해서 개수(사원 수 구하는 용도 추천)
    FROM EMP_T;
    
--SAMPLE_T

--1. 국어 점수 합계
SELECT SUM(KOR)
    FROM SAMPLE_T;
--2. 국어 점수 평균
SELECT AVG(NVL(KOR, 0))
    FROM SAMPLE_T;
--3. 국어 점수 최대값    
SELECT MAX(NVL(KOR, 0))
    FROM SAMPLE_T;
--4. 국어 점수 최소값
SELECT MIN(NVL(KOR, 0))
    FROM SAMPLE_T;
--5. 전체 학생 수
SELECT COUNT(*)
    FROM SAMPLE_T;
    
-- HR 계정으로 접속
--1. 전체 연봉 합계
SELECT SUM(SALARY)
    FROM EMPLOYEES;
--2. 커미션 평균(커미션 = 커미션 + 월급)
SELECT AVG(SALARY + COMMISSION_PCT * SALARY)
    FROM EMPLOYEES;
    
SELECT AVG(SALARY + NVL(COMMISSION_PCT, 0) * SALARY)
    FROM EMPLOYEES;
    
--3. 가장 먼저 입사한 사원이 입사한 날짜
SELECT MIN(HIRE_DATE)
    FROM EMPLOYEES;
--4. 가장 늦게 입사한 사원이 입사한 날짜
SELECT MAX(HIRE_DATE)
    FROM EMPLOYEES;
--5. 사원들의 근무하고 있는 부서의 개수
SELECT COUNT(DISTINCT DEPARTMENT_ID) AS 부서개수
    FROM EMPLOYEES;



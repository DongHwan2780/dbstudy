--1. 암호화하기 (해시 알고리즘)
SELECT STANDARD_HASH('1111', 'SHA256')  -- SHA256 암호화 방식
    , STANDARD_HASH('1111', 'SHA384')   -- SHA384 암호화 방식
    , STANDARD_HASH('1111', 'SHA512')   -- SHA512 암호화 방식
    , STANDARD_HASH('1111', 'MD5')   -- MD5 암호화 방식
    FROM DUAL;
    
--2. 순위 구하기     -> 동점자 처리를 함 == 동점자가 같은 순위
SELECT EMP_NUM, NAME, SALARY
    ,RANK() OVER(ORDER BY SALARY ASC) AS 연봉적은순      --SALARY의 오름차순 정렬
    ,RANK() OVER(ORDER BY SALARY DESC) AS 연봉많은순     --SALARY의 내림차순 정렬
    FROM EMP_T;

--3. 행 번호 구하기   -> 동점자 처리를 안함 == 조회된 순서대로 부여
SELECT EMP_NUM, NAME, SALARY
    ,ROW_NUMBER() OVER(ORDER BY SALARY ASC) AS 연봉적은순 
    ,ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS 연봉많은순
    FROM EMP_T;

--4. 분기 처리하기

-- 문제. 사원번호, 사원명, 부서명 조회하기


--  1) DECODE 함수
SELECT EMP_NUM
    , NAME
    , DECODE(DEPART
        , 1, '영업부'
        , 2, '인사부'
        , 3, '총무부'
        , 4, '기획부') AS 부서명
    FROM EMP_T;

--  2) CASE WHEN 표현식
SELECT EMP_NUM
    ,NAME
    ,CASE 
        WHEN DEPART = 1 THEN '영업부'
        WHEN DEPART = 2 THEN '인사부'
        WHEN DEPART = 3 THEN '총무부'
        WHEN DEPART = 4 THEN '기획부'
        ELSE 'Unknown'
        END AS 부서명
    FROM EMP_T;

/*
    DQL
    1. Data Query Language
    2. 데이터 조회어
    3. 데이터(행, Row)를 조회할 때 사용한다.
    4. DQL을 실행해도 데이터베이스에 변화는 발생하지 않는다.
    5. 형식 
        1) SELECT 조회할 칼럼(여러개 검색 가능)
            FROM 테이블 명
         WHERE 조건식
         GROUP BY 그룹화할 칼럼(여러개 검색 가능)
         HAVING 그룹에 대한 조건식
        ORDER BY 정렬할 칼럼 ASC || DESC(여러개 가능)
*/      

-- 1. 부서 테이블의 모든 칼럼을 조회하시오.
SELECT DEPT_NUM, DEPT_NAME, LOCATION
    FROM DEPT_T;

SELECT *                    -- * == 모든 칼럼을 의미, 실제 개발할때는 사용 금지 -> 성능이 떨어져서
    FROM DEPT_T;
    
SELECT DEPT_T.DEPT_NUM, DEPT_T.DEPT_NAME, DEPT_T.LOCATION
    FROM DEPT_T;

SELECT D.DEPT_NUM, D.DEPT_NAME, D.LOCATION
    FROM DEPT_T D;   -- 테이블의 별명(ALIAS)을 D로 잡아준 것

-- 2. 부서 테이블의 모든 칼럼을 조회, 조회할 칼럼 명을 '부서번호', '부서명', '위치'로 지정
SELECT DEPT_NUM AS 부서번호,               -- 칼럼의 별명을 잡아준 것
        DEPT_NAME AS 부서명,
        LOCATION AS 위치
    FROM DEPT_T;
    
-- 3. 부서 테이블의 위치 칼럼을 중복을 제거하여 조회하시오
SELECT DISTINCT LOCATION
    FROM DEPT_T;
    
SELECT LOCATION
    FROM DEPT_T
    GROUP BY LOCATION;
    
/*
    주요 조건식 작성 방법
    1. 칼럼 = 값
    2. 칼럼 BETWEEN 값1 AND 값2
    3. 칼럼 IN(값1, 값2)
    4. 칼럼 IS NULL
    5. 칼럼 IS NOT NULL 
    6. 칼럼 LIKE 값
*/

-- 4. 부서 테이블에서 부서번호가 1인 부서 정보를 조회하시오
SELECT DEPT_NUM, DEPT_NAME, LOCATION
    FROM DEPT_T
 WHERE DEPT_NUM = 1;            -- DEPT_NUM 칼럼은 UNIQUE하므로 조회 결과는 1개 이하이다.

-- 5. 부서 테이블에서 지역이 서울인 부서 정보를 조회하시오
SELECT DEPT_NUM, DEPT_NAME, LOCATION
    FROM DEPT_T
 WHERE LOCATION = '서울';     -- LOCATION 칼럼은 UNIQUE하지 않기 때문에 조회 결과는 2개 이상이 가능
 
 
-- 6. 사원 테이블에서 기본급이 300만 이상인 사원을 조회하시오
SELECT *
    FROM EMP_T
 WHERE SALARY >= 3000000;
 
-- 7. 사원 테이블에서 기본급이 200 ~ 300만 이상인 사원을 조회하시오
SELECT *
    FROM EMP_T
 WHERE SALARY BETWEEN 2000000 AND 3000000; 
 
 -- 8. 사원 테이블에서 직급이 사원, 과장인 사원을 조회하시오
SELECT *
    FROM EMP_T
 WHERE POSITION IN('사원', '과장');
    
/*
    와일드 카드(WILD CARD)
    1. 만능 문자를 의미한다.
    2. 종류
        1) % : 글자수에 상관없는 만능 문자
        2) _ : 1글자를 의미하는 만능 문자
    3. 예시)
        1) 첫 번째 글자가 A인 모든 데이터 : A%          -> 자동검색완성 미리보기
        2) 두 번째 글자가 A인 모든 데이터 : _A%
        3) 마지막 글자가 A인 모든 데이터 : %A
        4) A를 포함하는 모든 데이터 : %A%
*/

/*
    LIKE 연산자
    와일드 카드를 이용해서 조회할 때 사용하는 연산자   
*/

-- 9. 사원 테이블에서 '한'씨를 조회하시오
SELECT * 
    FROM EMP_T
 WHERE NAME LIKE '한%';

-- 10. 사원 테이블에서 9월달에 입사한 사원을 조회하시오
SELECT *
    FROM EMP_T
 WHERE HIRE_DATE LIKE '%/09/%';









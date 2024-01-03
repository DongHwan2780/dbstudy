/*
    WITH 
    1. 자주 사용하거나 복잡한 쿼리문은 WITH 절로 등록시켜 놓을 수 있다.
    2. WITH 절에 등록된 쿼리문은 임시 저장 상태이므로 곧바로 사용해야 함
    3. WITH 절을 이용하면 쿼리문의 가독성이 좋아진다.
*/


-- 1. 연봉 2 ~ 3위 사원 정보를 조회하시오
SELECT EMP_NUM, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY
    FROM(SELECT RANK() OVER(ORDER BY SALARY DESC) AS RN, EMP_NUM, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY
        FROM EMP_T)
        WHERE RN BETWEEN 2 AND 3;
        
-- 2. WITH 절을 이용하여 연봉 2 ~ 3위 사원 정보를 조회하시오        
WITH RANKING_T
    AS(SELECT RANK() OVER(ORDER BY SALARY DESC) AS RN, EMP_NUM, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY
        FROM EMP_T)
    SELECT EMP_NUM, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY
        FROM RANKING_T
    WHERE RN BETWEEN 2 AND 3;

-- 3. 부서별 부서번호, 부서명, 연봉총액을 조회하시오
SELECT DEPT_NUM, DEPT_NAME, SUM(SALARY)
    FROM DEPT_T D INNER JOIN EMP_T E
    ON D.DEPT_NUM = E.DEPART
    GROUP BY DEPT_NUM, DEPT_NAME;
        
        
-- 4. WITH 절을 이용하여 부서별 부서번호, 부서명, 연봉총액을 조회하시오        
WITH GROUP_T
    AS(SELECT DEPART, SUM(SALARY) AS TOTAL_SALARY
        FROM EMP_T
        GROUP BY DEPART)
    SELECT D.DEPT_NUM
        ,D.DEPT_NAME
        ,G.TOTAL_SALARY
        FROM DEPT_T D INNER JOIN GROUP_T G
            ON D.DEPT_NUM = G.DEPART;




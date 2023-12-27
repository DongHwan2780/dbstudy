/*
    다대다 관계
    1. 2개의 테이블을 직접 관계 짓는 것은 불가능하다.
    2. 다대다 관계를 가지는 2개의 테이블과 연결된 중간 테이블이 필요하다.
    3. 일대다 관계를 2개 만들면 다대다 관계가 된다.
*/


CREATE TABLE STUDENT_T
(
    STUDENT_NUM NUMBER NOT NULL PRIMARY KEY,
    NAME VARCHAR2(128 BYTE) NOT NULL,
    GRADE NUMBER NOT NULL,
    CLASS NUMBER NULL,
    PH_NUM NUMBER NULL
);

CREATE TABLE OBJECT_T
(
    OBJECT_NUM NUMBER NOT NULL PRIMARY KEY,
    NAME VARCHAR2(128 BYTE) NOT NULL
);

CREATE TABLE SUBS_T
(
    STUDENT_NUM NUMBER REFERENCES STUDENT_T(STUDENT_NUM) ON DELETE CASCADE,
    OBJECT_NUM NUMBER REFERENCES OBJECT_T(OBJECT_NUM) ON DELETE SET NULL
);


DROP TABLE SUBS_T;
DROP TABLE OBJECT_T;
DROP TABLE STUDENT_T;



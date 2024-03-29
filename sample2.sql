DROP TABLE USER_T;
CREATE TABLE USER_T
(
    USER_NO NUMBER NOT NULL,
    USER_NAME VARCHAR2(100 BYTE),
    USER_TEL VARCHAR2(100 BYTE),
    JOIN_DT VARCHAR2(10 BYTE),
    CONSTRAINT PK_USER PRIMARY KEY(USER_NO)
);

DROP SEQUENCE USER_SEQ;
CREATE SEQUENCE USER_SEQ NOCACHE;
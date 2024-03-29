DROP TABLE SAMPLE_T;
CREATE TABLE SAMPLE_T (
    SAMPLE_NO      NUMBER              NOT NULL,
    SAMPLE_CONTENT VARCHAR2(100 BYTE),
    SAMPLE_EDITOR  VARCHAR2(100 BYTE),
    SAMPLE_DT      DATE,
    CONSTRAINT PK_SAMPLE PRIMARY KEY(SAMPLE_NO)
);

DROP SEQUENCE SAMPLE_SEQ;
CREATE SEQUENCE SAMPLE_SEQ NOCACHE;

SELECT SAMPLE_NO, SAMPLE_CONTENT, SAMPLE_EDITOR, TO_CHAR(SAMPLE_DT, 'YYYY-MM-DD HH24:MI:SS') FROM SAMPLE_T;

DROP TABLE TALK_T;
CREATE TABLE TALK_T (
    TALK_NO NUMBER NOT NULL PRIMARY KEY,
    TALK_CONTENT VARCHAR2(1000 BYTE),
    TALK_USER VARCHAR2(1000 BYTE),
    WRITTEN_AT TIMESTAMP
);

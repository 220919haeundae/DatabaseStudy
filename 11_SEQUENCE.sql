/*
    * ������ (SEQUENCE) 
     : �ڵ����� ��ȣ�� �߻������ִ� ������ �ϴ� ��ü
     ������ ���������� ������ ������ ������Ű�鼭 ����
     
     ex) �����ȣ, ȸ����ȣ, ������ȣ, ...
*/
/*
    * ������ �����ϱ� *
    
    CREATE SEQUENCE ��������
    [START WITH ����] --> ó�� �߻���ų ���۰� ���� [���� �� �⺻��: 1]
    [INCREMENT BY ����] --> �󸶸�ŭ�� ������ų �������� ���� �� ���� [���� �� �⺻��: 1]
    [MAXVALUE ����] --> �ִ밪 [���� �� �⺻��... ��ûŭ]
    [MINVALUE ����] --> �ּҰ� [�⺻��: 1]
    [CYCLE|NOCYCLE] --> ���� ��ȯ���� [�⺻��: NOCYCLE]
                    --> CYCLE: ����ʽ� ���� �ִ밪�� �����ϸ� �ּҰ����� �ٽ� ��ȯ�ϵ��� ����
                    --> NOCYCLE: ������ ���� �ִ밪�� �����ϸ� ���̻� ������Ű�� �ʵ��� ����
    [NOCACHE | CACHE ����] --> ĳ�ø޸� �Ҵ� ���� [�⺻��: CACHE 20]
                          --> ĳ�ø޸�: �̸� �߻��� ������ �����ؼ� �����صδ� ����
                                       : �Ź� ȣ���� ������ ���� ��ȣ�� �����ϴ� ���� �ƴ϶�
                                         ĳ�ø޸𸮶�� ������ �̸� ������ ������ �����ٰ� ���(�ӵ��� ����)
                                         
    [����]
    - �̸� �����ֱ� -
    * ���̺� : TB_
    * ��    : VW_
    * ������ : SEQ_
    * Ʈ���� : TRG_
*/
-- SEQ_TEST��� �̸��� ������ ����
CREATE SEQUENCE SEQ_TEST;
-- * ���� ������ ������ �ִ� ������ ��ȸ
SELECT * FROM USER_SEQUENCES;

SELECT * FROM EMPLOYEE;
-- SEQ_EMPNO��� �̸��� ������ ����
-- ���۹�ȣ�� 300, �������� 5, �ִ밪�� 310, ��ȯX, ĳ�ø޸�X
CREATE SEQUENCE SEQ_EMPNO
START WITH 300
INCREMENT BY 5
MAXVALUE 310
NOCYCLE
NOCACHE;

/*
    * ������ ����ϱ� *
    
    - ��������.CURRVAL : ���� ������ �� (���������� ������ NEXTVAL�� ������ ��)
    - ��������.NEXTVAL : ������ ���� ���� ���� �������� �߻��� �����
                        ���� ������ ������ INCREMENT BY ������ �� ��ŭ ������ ��
*/

SELECT SEQ_EMPNO.CURRVAL -- ���� �߻�. NEXTVAL�� �� ���� �������� ���� �̻� CURRVAL�� ����� �� ����
FROM DUAL;

SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; -- ���� �� ó�� ���� �� ���۰� : 300
SELECT SEQ_EMPNO.CURRVAL FROM DUAL; -- 300
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; -- 305
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; -- 310

SELECT * FROM USER_SEQUENCES;
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; -- 315 ==> ���� �߻�! �ִ밪�� 310���� �����Ǿ� �־� �� �̻��� ���� ��ȸ�ǹǷ� ���� �߻�
CREATE SEQUENCE �������� START WITH ���۰� INCREMENT ������ MAXVALUE �ִ밪 INVALUE �ּҰ� CYCLE|NOCYLE CACHE|NOCACHE;


/*
    * ������ ���� �����ϱ� *
    
    ALTER SEQUENCE ��������
    [INCREMENT BY ����]       --> ������(�⺻��: 1)
    [MAXVALUE ����]           --> �ִ밪 (�⺻��: ��û ŭ)
    [MINVALUE ����]           --> �ּҰ� (�⺻��: 1)
    [CYCLE | NOCYCLE]        --> �� ��ȯ���� (�⺻��: NOCYCLE)
    [CACHE | NOCACHE ����Ʈ ũ��]    --> ĳ�ø޸� ��뿩�� ����(����Ʈ����) (�⺻��: CACHE 20)
    
    START WITH ���� �Ұ�!
*/
-- SEQ_EMPNO �������� �������� 10, �ִ밪�� 400���� ����
ALTER SEQUENCE SEQ_EMPNO
INCREMENT BY 10
MAXVALUE 400;
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL;

-- ������ ���� : DROP SEQUENCE ��������;
-- SEQ_EMPNO ������ ����
DROP SEQUENCE SEQ_EMPNO;

SELECT * FROM USER_SEQUENCES;
--------------------------------------------------------------------------------
/*
    EMPLOYEE ���̺� ������ ����
    -> ������ ��� �÷�: ��� ��ȣ(EMP_ID)
*/
-- * ������ �����ϱ�
CREATE SEQUENCE SEQ_EID
START WITH 300      --> ���۹�ȣ : 300
NOCACHE;              --> ĳ�ø޸� ���X

-- ���۰� 300, ������ 1, ..., ��ȯ���� :NOCYCLE, �ִ밪 : ��û ū ��

-- * ������ ����ϱ� : EMPLOYEE ���̺� �����Ͱ� �߰��� ��
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, JOB_CODE, HIRE_DATE)
    VALUES (SEQ_EID.NEXTVAL, '���ǿ�', '990928-1111111', 'J4', SYSDATE);
    
SELECT * FROM EMPLOYEE;

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, JOB_CODE, HIRE_DATE)
    VALUES (SEQ_EID.NEXTVAL, '���Ǽ�', '990928-2111111', 'J4', SYSDATE);
    
ROLLBACK;

/*
    DDL : ������ ���Ǿ�� 
    
    ��ü ����(CREATE), ����(ALTER), ����(DROP)�ϴ� ����    
*/
/*
    ALTER : ��ü�� �����ϴ� ����
    
    ALTER TABLE ���̺�� ������ ����
    
    * ����Ǵ� ���� *
      - �������� �߰�/����(���� -> �߰�)/����
      - �÷���/�������Ǹ�/���̺�� ����
      - �÷� �߰�/����/����
*/
/*
    * �÷� �߰�/����/����
    
    - �÷� �߰� : ALTER TABLE ���̺�� ADD �÷��� �ڷ��� [�⺻��|��������];
*/
-- DEPT_TABLE ���̺� CNAME VARCHAR2(20) �÷� �߰�
ALTER TABLE DEPT_TABLE ADD CNAME VARCHAR2(20);
SELECT * FROM DEPT_TABLE;

ALTER TABLE DEPT_TABLE ADD LNAME VARCHAR2(20) DEFAULT '�ѱ�';
SELECT * FROM DEPT_TABLE;

/*
    �÷� ���� (MODIFY)
    - ������ Ÿ�� ���� ; ALTER TABLE ���̺�� MODIFY �÷��� �����ҵ�����Ÿ��
    - �⺻�� ���� : ALTER TABLE ���̺�� MODIFY �÷��� DEFAULT ������ �⺻��
*/

-- DEPT_TABLE ���̺��� DEPT_ID �÷��� ����
ALTER TABLE DEPT_TABLE MODIFY DEPT_ID CHAR(5);

-- * ���� Ÿ������ ����
-- ALTER TABLE DEPT_TABLE MODIFY DEPT_ID NUMBER; --> ���� ���� �߻� (����: ����Ÿ��, ����: ����Ÿ��) X
-- DEPT_TABLE ���̺��� DEPT_TITLE �÷��� ����
-- * ũ�⸦ 35����Ʈ -> 10����Ʈ�� ����
-- ALTER TABLE DEPT_TABLE MODIFY DEPT_TITLE VARCHAR(10); --> ũ�� ���� �߻�!

-- * ũ�⸦ 35����Ʈ -> 50����Ʈ�� ����
ALTER TABLE DEPT_TABLE MODIFY DEPT_TITLE VARCHAR(50);

-- EMP_TABLE ���̺��� SALARY �÷��� VARCHAR2(50)���� ����
-- ALTER TABLE EMP_TABLE MODIFY SALARY VARCHAR2(50); --> ���� ���� �߻�

-- ���� ���� �÷� ���� ����
ALTER TABLE DEPT_TABLE
    MODIFY DEPT_TITLE VARCHAR2(55)
    MODIFY LNAME DEFAULT '�ڸ���';

/*
    �÷� ���� : DROP COLUMN
    
    ALTER TABLE ���̺�� DROP COLUMN �÷���
*/
CREATE TABLE DEPT_COPY
AS SELECT * FROM DEPT_TABLE;

SELECT * FROM DEPT_COPY;

ALTER TABLE DEPT_COPY DROP COLUMN LNAME;
SELECT * FROM DEPT_COPY;
ALTER TABLE DEPT_COPY DROP COLUMN CNAME;
SELECT * FROM DEPT_COPY;
ALTER TABLE DEPT_COPY DROP COLUMN LOCATION_ID;
SELECT * FROM DEPT_COPY;
ALTER TABLE DEPT_COPY DROP COLUMN DEPT_TITLE;
SELECT * FROM DEPT_COPY;
ALTER TABLE DEPT_COPY DROP COLUMN DEPT_ID; -- ���� �߻�!
--> ���̺��� �ּ��� �� ���� �÷��� �����ؾ� ��
--------------------------------------------------------------------------------
-- �������� �߰�/���� (���� : ���� -> �߰�)
/*
    * �⺻Ű (PRIMARY KEY) : ALTER TABLE ���̺�� ADD PRIMARY KEY (�÷���)
    * �ܷ�Ű (FROEIGN KEY) : ALTER TABLE ���̺�� ADD FOREIGN KEY (�÷���) REFERENCES ������ ���̺��[(������ �÷���)]
    * UNIQUE (�ߺ��� ������� �ʴ� ��������) : ALTER TABLE ���̺�� ADD UNIQUE(�÷���)
    * CHECK (Ư�� ���鸸 �����ϰ��� �� �� ����ϴ� ��������, NULL�� ����) : ALTER TABLE ���̺�� ADD CHECK(�÷��� ���� ���ǽ�)
    * NOT NULL (NULL ���� ������� �ʴ� ��������) : ALTER TABLE ���̺�� MODIFY �÷��� NOT NULL
*/
-- DEPT_TABLE ���̺� �Ʒ� �������� �߰�
-- * DEPT_ID �÷��� PRIMARY KEY(�⺻Ű) �������� �߰�
-- * DEPT_TITLE �÷��� UNIQUE �������� �߰�
-- * LNAME �÷��� NOT NULL �������� �߰�

ALTER TABLE DEPT_TABLE
    ADD CONSTRAINT DT_PK PRIMARY KEY (DEPT_ID)
    ADD CONSTRAINT DT_UQ UNIQUE (DEPT_TITLE)
    MODIFY LNAME NOT NULL;
    
/*
    [�������� ����]
    ALTER TABLE ���̺�� DROP CONSTRAINT �������Ǹ� / NOT NULL�� ����
    ALTER TABLE ���̺�� MODIFY �÷��� NULL
*/

ALTER TABLE DEPT_TABLE DROP CONSTRAINT SYS_C008480;
ALTER TABLE DEPT_TABLE DROP CONSTRAINT SYS_C008481;
ALTER TABLE DEPT_TABLE MODIFY LNAME NULL;

--------------------------------------------------------------------------------

-- ���̺� ����...!
-- DROP TABLE ���̺��
DROP TABLE DEPT_TABLE;
--> ��򰡿� �����ǰ� �ִ� �θ����̺��� ���������� ����
-- ������� �� ���, 1) �ڽ����̺��� ���� ������ �� �θ����̺��� ����
--                  2) �θ����̺� �����ϴµ�, �������Ǳ��� ����
--                      DROP TABLE ���̺�� CASCADE CONSTRAINT
--------------------------------------------------------------------------------
CREATE TABLE DEPT_TABLE
AS SELECT * FROM DEPARTMENT;

/*
    �÷���, �������Ǹ�, ���̺�� ���� (RENAME)
*/

-- 1) �÷��� ���� : RENAME COLUMN �����÷��� TO �ٲ��÷���
-- DEPT_TITLE --> DEPT_NAME ����
ALTER TABLE DEPT_TABLE  RENAME COLUMN DEPT_TITLE TO DEPT_NAME;

SELECT * FROM DEPT_TABLE;

-- 2) �������Ǹ� ���� : RENAME CONSTRAINT ���� �������Ǹ� TO �ٲ� �������Ǹ� 
ALTER TABLE DEPT_TABLE RENAME CONSTRAINT SYS_C008482 TO DT_DEPTID_NN;


-- 3) ���̺�� ���� : RENAME TO �ٲ� ���̺��
ALTER TABLE DEPT_TABLE RENAME TO DEPT_END;
--------------------------------------------------------------------------------
-- * TRUNCATE : ���̺� �ʱ�ȭ
--   => DROP���� �ٸ��� ���̺��� �����͸��� ���� �����Ͽ� ���̺��� �ʱ���·� �����ִ� ��
SELECT * FROM DEPT_END;
TRUNCATE TABLE DEPT_END;











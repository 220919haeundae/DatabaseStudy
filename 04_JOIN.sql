/*
    JOIN
    : �� �� �̻��� ���̺��� �����͸� ��ȸ�ϰ��� �� �� ���Ǵ� ����
    : ��ȸ����� �ϳ��� �����(RESULT SET)�� ����
    
    * ������ �����ͺ��̽�(RDB)������ �ּ����� �����͸� ������ ���̺� ����
      �ߺ������� �ּ�ȭ�ϱ� ���� �ִ��� �ɰ��� ������
      
    => ������ �����ͺ��̽����� �������� �̿��� ���̺��� "����"�� �δ� ���
    (�� ���̺��� �����(�ܷ�Ű)�� ���ؼ� �����͸� ��Ī���� ��ȸ��)
    
    JOIN�� ũ�� "����Ŭ ���� ����"�� "ANSI ����" (�̱�����ǥ����ȸ)
    
            ����Ŭ ���� ����           |           ANSI ����
    ----------------------------------------------------------------------------
                � ����             |             ���� ����
              (EQUAL JOIN)           |         (INNER JOIN) --> JOIN USING/ON
    ----------------------------------------------------------------------------
                ���� ����             |         ���� �ܺ� ���� (LEFT OUUTER JOIN)
              (LEFT OUTER)           |         ������ �ܺ� ����(RIGHT OUTER JOIN)
              (RIGHT OUTER)          |          ��ü �ܺ� ����(FULL OUTER JOIN)
    ----------------------------------------------------------------------------
            ��ü ����(SELF JOIN)      |             JOIN ON
        �� ����(NON EQUAL JOIN)    | 
    ----------------------------------------------------------------------------
*/
-- ��ü ������� ���, �����, �μ��ڵ�
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE;

-- �μ��ڵ�, �μ��� ��ȸ(�μ� ������ ����� ���̺�: DEPARTMENT)
SELECT DEPT_ID, DEPT_TITLE FROM DEPARTMENT;

-- ��ü ������� ���, �����, �����ڵ� ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_CODE
FROM EMPLOYEE;

-- ���� �ڵ�, ���޸� ��ȸ
SELECT JOB_CODE, JOB_NAME 
FROM JOB;
/*
    * �����(EQUAL JOIN) / ��������(INNER JOIN)
    => �����Ű�� �÷��� ���� ��ġ�ϴ� ��鸸 ��ȸ(=> ��ġ���� �ʴ� ���� ��ȸ���� ����)
*/
-- ORACLE ���� ����
/*
    * FROM���� ��ȸ�ϰ��� �ϴ� ���̺��� ���� (,�� ����)
    * WHERE���� ��Ī��ų �÷��� ���� ������ �ۼ�
*/
-- ����� ���, �̸�, �μ����� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID;

-- => �� ���̺��� �����ϴ� ������ ������� ����

-- ����� ���, �̸�, ���޸��� ��ȸ
-- �� ���̺��� �÷����� ������ ��� ��Ī�� ���������ν� ������ �� ����
SELECT EMP_ID, EMP_NAME, JOB_NAME
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE;

-- ANSI ���� --
/*
    FROM���� ������ �Ǵ� ���̺��� �ϳ� �ۼ�
    JOIN���� �����ϰ��� �ϴ� ���̺��� ��� + ��Ī��Ű���� �ϴ� ������ ���� �ۼ�
    - JOIN USING    : �÷����� ���� ���
    - JOIN ON       : �÷����� ���ų� �ٸ� ���
*/
-- ���, �����, �μ��� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- ���, �����, ���޸� ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_NAME
FROM EMPLOYEE JOIN JOB USING (JOB_CODE);

SELECT EMP_ID, EMP_NAME, JOB_NAME
FROM EMPLOYEE E JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE);

-- �븮 ������ ����� ���, �����, ���޸�, �޿� ��ȸ
-- ����Ŭ ���� ���**
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE AND JOB_NAME = '�븮';
-- ANSI ���� ���**
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE JOIN JOB USING(JOB_CODE)
WHERE JOB_NAME = '�븮';
---------------------------------Quiz-------------------------------------------
-- [1] �μ��� �λ�������� ������� ���, �����, ���ʽ� ��ȸ
-- ** ����Ŭ **
SELECT EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID AND DEPT_TITLE = '�λ������';

-- ** ANSI **
SELECT EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
FROM EMPLOYEE JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE DEPT_TITLE = '�λ������';

-- [2] �μ��� ����(LOCATION) ������ �����Ͽ� ��ü �μ��� �μ��ڵ�, �μ���, �����ڵ�, ������ ��ȸ
-- ** ����Ŭ **
SELECT DEPT_ID �μ��ڵ�, DEPT_TITLE �μ���, LOCAL_CODE �����ڵ�, LOCAL_NAME ������
FROM DEPARTMENT, LOCATION
WHERE LOCATION_ID = LOCAL_CODE -- �����ڵ� DEPARTMENT.LOCATION_ID, LOCATION.LOCAL_CODE
ORDER BY 1;

-- ** ANSI **
SELECT DEPT_ID �μ��ڵ�, DEPT_TITLE �μ���, LOCAL_CODE �����ڵ�, LOCAL_NAME ������
FROM DEPARTMENT JOIN LOCATION ON ( LOCATION_ID = LOCAL_CODE)
ORDER BY 1;

-- [3] ���ʽ��� �޴� ������� ���, �����, ���ʽ�, �μ��� ��ȸ
-- ** ����Ŭ **
SELECT EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID AND BONUS IS NOT NULL;

-- ** ANSI **
SELECT EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
FROM EMPLOYEE JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE BONUS IS NOT NULL;

-- [4] �μ��� �ѹ��ΰ� �ƴ� ������� �����, �޿� ��ȸ
-- ** ����Ŭ **
SELECT EMP_NAME, SALARY, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID AND DEPT_TITLE != '�ѹ���';

-- ** ANSI **
SELECT EMP_NAME, SALARY, DEPT_TITLE
FROM EMPLOYEE JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
WHERE DEPT_TITLE != '�ѹ���';

--------------------------------------------------------------------------------
/*
    �������� / �ܺ����� (OUTER JOIN)
    : �� ���̺��� JOIN�� ��ġ���� �ʴ� �ൿ �����Ͽ� ��ȸ�ϴ� ����
    : ��, �ݵ�� LEFT/RIGHT�� �����ؾ� ��(������ �Ǵ� ���̺�)
*/
-- ��� �����, �μ���, �޿�, ���� ������ ��ȸ

-- * LEFT JOIN : �� ���̺� �� ���ʿ� �ۼ��� ���̺��� �������� ����
-- ** ����Ŭ ���� **
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12 ����
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID(+);

-- ** ANSI **
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12 ����
FROM EMPLOYEE LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);

-- * RIGHT JOIN : �� ���̺� �� �����ʿ� �ۼ��� ���̺� �������� ����
-- ** ����Ŭ ���� **
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12 ����
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE(+) = DEPT_ID
ORDER BY EMP_NAME;

-- ** ANSI **
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12 ����
FROM EMPLOYEE RIGHT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
ORDER BY EMP_NAME;

-- * FULL JOIN : �� ���̺��� ���� ��� ���� ��ȸ�ϴ� ���� ���� (����Ŭ ���� ���� X)
-- ** ANSI���� **
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12 ����
FROM EMPLOYEE FULL JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
ORDER BY EMP_NAME;

--------------------------------------------------------------------------------
/*
    �� ����(NOT EQUAL JOIN)
    : ��Ī ��ų �÷��� ���� ���� �ۼ� �� '='�� ������� �ʴ� ����
    
    * ANSI ���������� JOIN ON�� ��밡�� *
*/
-- ����� ���� �޿���� ��ȸ (�����, �޿�, �޿� ���)
-- ��� (EMPLOYEE), �޿���� (SAL_GRADE)
-- * ����Ŭ ���� *

SELECT EMP_NAME, SALARY, SAL_LEVEL
FROM EMPLOYEE, SAL_GRADE
WHERE SALARY >= MIN_SAL AND SALARY <= MAX_SAL;

-- * ANSI ���� *
SELECT EMP_NAME, SALARY, SAL_LEVEL
FROM EMPLOYEE JOIN SAL_GRADE ON SALARY BETWEEN MIN_SAL AND MAX_SAL;

/*
    ��ü ����(SELF JOIN)
    : ���� ���̺��� �ٽ� �� �� �����ϴ� ����
*/
-- ��ü ����� ���, �����, �μ��ڵ�, ������, ��� �����, ��� �μ��ڵ� ��ȸ
-- ���(EMPLOYEE), ���(���) (EMPLOYEE) --> ���̺���� �����ϹǷ� "��Ī"�� �ο�

-- * ����Ŭ ���� *
SELECT E.EMP_ID ���, E.EMP_NAME �����, E.DEPT_CODE �μ��ڵ�, E.MANAGER_ID �����,
        M.EMP_ID, M.EMP_NAME, M.DEPT_CODE
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER_ID = M.EMP_ID;   -- ����� �����ȣ�� ����� �������� �־� ��������� ��ȸ

-- * ANSI ���� *
SELECT E.EMP_ID ���, E.EMP_NAME �����, E.DEPT_CODE �μ��ڵ�, E.MANAGER_ID �����,
        M.EMP_ID, M.EMP_NAME, M.DEPT_CODE
FROM EMPLOYEE E LEFT JOIN EMPLOYEE M ON E.MANAGER_ID = M.EMP_ID;


--------------------------------------------------------------------------------

/*
    ���� ����
    : 2�� �̻��� ���̺��� �����ϴ� ��
*/
-- ���, �����, �μ���, ���޸� ��ȸ
-- ��� / �μ� / ����
-- * ����Ŭ ���� *
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE E, DEPARTMENT, JOB J
WHERE DEPT_CODE = DEPT_ID AND E.JOB_CODE = J.JOB_CODE;

-- * ANSI *
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE E 
    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID) 
    JOIN JOB USING(JOB_CODE);
    
-- ���, �����, �μ���, ������ ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE, DEPARTMENT, LOCATION
WHERE DEPT_CODE = DEPT_ID
    AND LOCATION_ID = LOCAL_CODE;

SELECT EMP_ID, EMP_NAME, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
    JOIN LOCATION ON LOCATION_ID = LOCAL_CODE; 
    
----------------------------- QUIZ ---------------------------------------------
-- 1) ���, �����, �μ���, ������, ������ ��ȸ

SELECT EMP_ID, EMP_NAME, DEPT_TITLE, LOCAL_NAME, NATIONAL_NAME
FROM EMPLOYEE, DEPARTMENT, LOCATION L, NATIONAL N
WHERE (DEPT_CODE = DEPT_ID) 
    AND LOCATION_ID = LOCAL_CODE 
    AND L.NATIONAL_CODE = N.NATIONAL_CODE;

SELECT EMP_ID, EMP_NAME, DEPT_TITLE, LOCAL_NAME, NATIONAL_NAME
FROM EMPLOYEE
    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    JOIN LOCATION  ON LOCATION_ID = LOCAL_CODE
    JOIN NATIONAL USING (NATIONAL_CODE);


-- 2) ���, �����, �μ���, ���޸�, ������, ������, �޿���� ��ȸ
--   ���� / �޿���� / 
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME, LOCAL_NAME, NATIONAL_NAME, SAL_LEVEL
FROM EMPLOYEE E, DEPARTMENT D, JOB J, LOCATION L, NATIONAL N, SAL_GRADE
WHERE DEPT_CODE = DEPT_ID 
    AND E.JOB_CODE = J.JOB_CODE 
    AND LOCATION_ID = LOCAL_CODE 
    AND L.NATIONAL_CODE = N.NATIONAL_CODE 
    AND SALARY BETWEEN MIN_SAL AND MAX_SAL;


SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME, LOCAL_NAME, NATIONAL_NAME, SAL_LEVEL
FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
    JOIN JOB USING(JOB_CODE)
    JOIN LOCATION ON LOCATION_ID = LOCAL_CODE
    JOIN NATIONAL USING(NATIONAL_CODE)
    JOIN SAL_GRADE ON SALARY BETWEEN MIN_SAL AND MAX_SAL;


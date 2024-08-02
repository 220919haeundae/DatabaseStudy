/*
    ������ ��ȸ(����) : SELECT
        
        SELECT ��ȸ�ϰ��� �ϴ� ����(�÷�) FROM ���̺��;
        SELECT * �Ǵ� �÷���1, �÷���2, ... FROM ���̺��;
*/
-- ��� ����� ������ ��ȸ
SELECT * FROM employee;

-- ��� ����� �̸�, �ֹε�Ϲ�ȣ, �ڵ�����ȣ�� ��ȸ
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE;

-- JOB ���̺��� �����̸��� ��ȸ
SELECT JOB_NAME 
FROM job;

-- DEPARTMENT ���̺��� ��� ������ ��ȸ
SELECT * 
FROM DEPARTMENT;

-- ��� ���̺��� �����, �̸���, ����ó, �Ի���, �޿� ��ȸ
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE, SALARY 
FROM employee;

/*
    �÷� ���� ��� �����ϱ�
    => SELECT���� �÷��� �ۼ��κп� ��������� �� �� ����
*/
-- ��� �̸�, ���� ���� ��ȸ�ϱ�
-- SALARY*12 : SALARY �÷� �����Ϳ� 12���ϱ� �������
SELECT EMP_NAME, SALARY*12
FROM EMPLOYEE;

-- ��� �̸�, �޿�, ���ʽ�, ����, ���ʽ� ���� ����(�޿� + (�޿�*���ʽ�))*12 ������ ��ȸ
SELECT EMP_NAME, SALARY, BONUS, SALARY*12, (SALARY + (SALARY*BONUS))*12 
FROM employee;

/*
    - ���糯¥�ð� ���� : SYSDATE
    - ���� ���̺�(�ӽ� ���̺�) : DUAL
*/
-- ���� �ð�����
SELECT SYSDATE FROM DUAL; --YY/MM/DD �������� ��ȸ��

-- ��� �̸�, �Ի���, �ٹ��ϼ� ��ȸ
-- DATEŸ�� - DATEŸ�� => �Ϸ� ǥ�õ�
SELECT EMP_NAME, HIRE_DATE, (SYSDATE - HIRE_DATE)"����ϼ�" 
FROM employee;

/*
    * �÷��� ��Ī ���� : ������� ����� ��� �ǹ��ľ��� ��Ʊ� ������, ��Ī�� �ο��Ͽ� ��Ȯ�ϰ� ����ϰ� ��ȸ ����
    
    [ǥ����] 1) �÷��� ��Ī
            2) �÷��� AS ��Ī
            3) �÷��� "��Ī"
            4) �÷��� AS "��Ī"
*/

-- ��� �̸�, �޿�, ���ʽ�, ����, ���ʽ� ���� ����(�޿� + (�޿�*���ʽ�))*12 ������ ��ȸ
SELECT EMP_NAME "��� �̸�", SALARY "�޿�", BONUS "���ʽ�", SALARY*12 "����", (SALARY + (SALARY*BONUS))*12 "���ʽ� ���� ����" 
FROM employee;

/*
    * ���ͷ� : ���Ƿ� ������ ���ڿ� ('')
        -> SELECT ���� ����ϴ� ��� ��ȸ�� ���(Result set)�� �ݺ������� ǥ�õ�
*/

-- �̸�, �޿�, '��' ��ȸ
SELECT EMP_NAME �̸�, SALARY �޿�, '��' ����
FROM EMPLOYEE;

/*
    ���� ������ : ||
*/
SELECT SALARY || '��' "�޿�"
FROM EMPLOYEE;

-- ���, �̸�, �޿��� �ѹ��� ��ȸ
SELECT EMP_NO || EMP_NAME || SALARY 
FROM EMPLOYEE;

-- XXX�� �޿��� XXXX���Դϴ�.
SELECT EMP_NAME||'�� �޿��� '||SALARY||'�Դϴ�.' "�޿� ����"
FROM EMPLOYEE;

-- ������̺��� �����ڵ� ��ȸ
SELECT JOB_CODE 
FROM EMPLOYEE;

/*
    * �ߺ� ���� : DISTNCT
*/

-- ������̺��� �����ڵ� ��ȸ(�ߺ�����)
SELECT DISTINCT JOB_CODE 
FROM EMPLOYEE;

-- ������̺��� �μ��ڵ� ��ȸ(�ߺ�����)
SELECT DISTINCT DEPT_CODE 
FROM EMPLOYEE;

-- DISTINCT�� �� ���� ��� ����(���� �÷��� ������ ���, �÷��� �����͵��� �ϳ��� ����Ͽ� �ߺ� ������ �ľ�)
SELECT DISTINCT JOB_CODE, DEPT_CODE 
FROM EMPLOYEE;
-- =============================================================================
/*
    * WHERE�� : ��ȸ�ϰ��� �ϴ� �����͸� Ư�� ���ǿ� ���� �����ϰ��� �� �� ���
    
    [ǥ����]
        SELECT �÷���, �÷�|������ ���� �����
        FROM ���̺��
        WHERE ����;
    
    - �񱳿�����
        * ��Һ� : >, <, >=, <=
        * ����� 
            - ������ : =
            - �ٸ��� : !=, <>, ^=
*/
-- ������̺��� �μ��ڵ尡 'D9'�� ����鸸 ��ȸ

SELECT DISTINCT *
FROM employee
WHERE DEPT_CODE='D9';

-- ������̺��� �μ��ڵ尡 'D1'�� ������� �����, �޿�, �μ��ڵ� ��ȸ
SELECT EMP_NAME "�����", SALARY "�޿�", DEPT_CODE "�μ� �ڵ�"
FROM employee
WHERE dept_code = 'D1';

-- �μ��ڵ尡 D1�� �ƴ� ������� ���� ��ȸ (�����, �޿�, �μ��ڵ�)
SELECT EMP_NAME "�����", SALARY "�޿�", DEPT_CODE "�μ� �ڵ�"
FROM employee
WHERE dept_code != 'D1';

-- �޿��� 40���� �̻��� ����� �����, �μ��ڵ�, �޿����� ��ȸ
SELECT EMP_NAME "�����", DEPT_CODE "�μ� �ڵ�", SALARY "�޿�"
FROM employee
WHERE SALARY >= 4000000;

--==============================================================================
-- 1. �޿��� 300���� �̻��� ������� �����, �޿�, �Ի���, ���� ��ȸ(��Ī ����)
SELECT EMP_NAME "��� �̸�", SALARY "�޿�", HIRE_DATE "�Ի���", SALARY*12 "����"
FROM EMPLOYEE
WHERE SALARY >= 3000000;
-- 2. ������ 5õ���� �̻��� ������� �����, �޿�, ����, �μ��ڵ� ��ȸ (��Ī ����)
SELECT EMP_NAME "��� �̸�", SALARY "�޿�", SALARY*12 "����", DEPT_CODE "�μ� �ڵ�" 
FROM EMPLOYEE
WHERE SALARY*12 >= 50000000;
-- 3. �����ڵ� 'J3'�� �ƴ� ������� ���, �����, �����ڵ�, ��翩�� ��ȸ (��Ī ����)
SELECT EMP_NO "��� ��ȣ", EMP_NAME "��� �̸�", JOB_CODE "�����ڵ�", ENT_YN "��������" 
FROM EMPLOYEE
WHERE JOB_CODE != 'J3';
-- 4. �޿��� 350���� �̻� 600���� ������ ��� ����� �����, ���, �޿� ��ȸ (��Ī ����)
SELECT EMP_NAME "��� �̸�", EMP_NO "��� ��ȣ", SALARY "�޿�"
FROM EMPLOYEE
WHERE  3500000<= SALARY AND SALARY <= 6000000;
--   �������� : AND, OR�� ������ ������ �� ����


-- 1. JOB ���̺��� ��� ���� ��ȸ
SELECT * FROM JOB;


-- 2. JOB ���̺��� ���� �̸� ��ȸ
SELECT JOB_NAME FROM JOB;

-- 3. DEPARTMENT ���̺��� ��� ���� ��ȸ
SELECT * FROM DEPARTMENT;


-- 4. EMPLOYEE���̺��� ������, �̸���, ��ȭ��ȣ, ����� ��ȸ
SELECT EMP_NAME "������", EMAIL "�̸���", PHONE "��ȭ��ȣ", HIRE_DATE "�����"
FROM employee;


-- 5. EMPLOYEE���̺��� �����, ��� �̸�, ���� ��ȸ
SELECT HIRE_DATE "�����", EMP_NAME "��� �̸�", SALARY "����"
FROM employee;


-- 6. EMPLOYEE���̺��� �̸�, ����, �Ѽ��ɾ�(���ʽ�����), �Ǽ��ɾ�(�Ѽ��ɾ� - (����*���� 3%)) ��ȸ
SELECT EMP_NAME "�̸�", SALARY*12 "����", (SALARY + SALARY*BONUS)*12 "�Ѽ��ɾ�", (SALARY + SALARY*BONUS)*12 -SALARY*12*0.03 "�Ǽ��ɾ�"
FROM EMPLOYEE;

-- 7. EMPLOYEE���̺��� �Ǽ��ɾ�(6�� ����)�� 5õ���� �̻��� ����� �̸�, ����, �Ǽ��ɾ�, ����� ��ȸ
SELECT EMP_NAME "��� �̸�", SALARY "����", (SALARY + SALARY*BONUS)*12 -SALARY*12*0.03 "�Ǽ��ɾ�", HIRE_DATE "�����"
FROM employee;

-- 8. EMPLOYEE���̺� ������ 4000000�̻��̰� JOB_CODE�� J2�� ����� ��ü ���� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE SALARY >= 4000000 AND JOB_CODE = 'J2';

-- 9. EMPLOYEE���̺� DEPT_CODE�� D9�̰ų� D5�� ��� �� 
--     ������� 02�� 1�� 1�Ϻ��� ���� ����� �̸�, �μ��ڵ�, ����� ��ȸ
SELECT EMP_NAME "��� �̸�", DEPT_CODE "�μ� �ڵ�", HIRE_DATE "�����"
FROM EMPLOYEE
WHERE HIRE_DATE < '02/01/01' AND (DEPT_CODE = 'D9' OR DEPT_CODE = 'D5');


-- =============================================================================
/*
    * BETWEEN AND : ���ǽĿ��� ���Ǵ� ���� 
        => ~�̻� ~������ ������ ���� ������ �����ϴ� ����
    
    [ǥ����]
            �񱳴�� �÷��� BETWEEN �ּڰ� AND �ִ�
            => �ش� �÷��� ���� �ּڰ� '�̻�'�̰� �ִ� '����'�� ���
*/
-- �޿��� 350���� �̻��̰� 600���� ������ ����� �����, ���, �޿� ��ȸ
SELECT EMP_NAME "�����", EMP_NO "���", SALARY "�޿�" 
FROM EMPLOYEE 
WHERE SALARY >= 3500000 AND SALARY <= 6000000;

-- �޿��� 350���� �̻��̰� 600���� ������ ����� �����, ���, �޿� ��ȸ (BETWEEN AND ����)
SELECT EMP_NAME "�����", EMP_NO "���", SALARY "�޿�" 
FROM EMPLOYEE 
WHERE SALARY BETWEEN 3500000 AND 6000000;

/*
    * NOT : ����Ŭ������ ������������
*/
-- �޿� 350���� �̸� �Ǵ� 600���� �ʰ��� ����� �����, ���, �޿� ��ȸ(NOT X)
SELECT EMP_NAME "�����", EMP_NO "���", SALARY "�޿�" 
FROM EMPLOYEE 
WHERE SALARY < 3500000 OR SALARY > 6000000;

-- �޿� 350���� �̸� �Ǵ� 600���� �ʰ��� ����� �����, ���, �޿� ��ȸ
SELECT EMP_NAME "�����", EMP_NO "���", SALARY "�޿�" 
FROM EMPLOYEE 
WHERE NOT SALARY BETWEEN 3500000 AND 6000000;
-- NOT�� BETWEEN �տ� ���̰ų� �÷��� �տ� �ٿ��� ��� ����

/*
    * IN : �񱳴�� �÷����� ������ ���� �߿� ��ġ�ϴ� ���� �ִ� ��� ��ȸ�ϴ� ������
    
    [ǥ����]
            �񱳴�� �÷��� IN ('��', '��2', '��3', ...)
*/
-- �μ��ڵ尡 D6�̰ų� D8�̰ų� D5�� ������� �����, �μ��ڵ�, �޿��� ��ȸ

SELECT EMP_NAME, DEPT_CODE, SALARY 
FROM EMPLOYEE 
WHERE DEPT_CODE = 'D6' OR DEPT_CODE = 'D8' OR DEPT_CODE = 'D5';

SELECT EMP_NAME, DEPT_CODE, SALARY 
FROM EMPLOYEE 
WHERE DEPT_CODE IN ('D5', 'D6', 'D8');

-- EMPLOYEE���̺� DEPT_CODE�� D9�̰ų� D5�� ��� �� 
--     ������� 02�� 1�� 1�Ϻ��� ���� ����� �̸�, �μ��ڵ�, ����� ��ȸ
SELECT EMP_NAME "��� �̸�", DEPT_CODE "�μ� �ڵ�", HIRE_DATE "�����"
FROM EMPLOYEE
WHERE HIRE_DATE < '02/01/01' AND DEPT_CODE IN('D9', 'D5');

-- =============================================================================
/*
    * LIKE : ���ϰ����ϴ� �÷��� ���� ������ Ư�� ���Ͽ� ������ ��� ��ȸ
    
        => Ư�� ���� : '%', '_'�� ���ϵ�ī��� ���
            * '%' : 0���� �̻�
              EX) �񱳴���÷��� LIKE '����%' => �񱳴�� �÷��� ���� ���ڷ� ���۵Ǵ� ���� ��ȸ
                  �񱳴���÷��� LIKE '%����' => �񱳴�� �÷��� ���� ���ڷ� ������ ���� ��ȸ
                  �񱳴���÷��� LIKE '%����%' => �񱳴���÷��� ���� ���ڰ� "����"�Ǵ� ���� ��ȸ(Ű����˻�)
                  
            * '_' : 1���� �ǹ�
              EX) �񱳴���÷��� LIKE '_����' => �񱳴���÷��� ������ ���� �տ� ������ �� ���ڰ� �� ��� ��ȸ
                  �񱳴���÷��� LIKE '__����' => �񱳴���÷��� ������ ���� �տ� ������ �� ���ڰ� �� ��� ��ȸ
                  �񱳴���÷��� LIKE '_����_' => �񱳴���÷��� ������ ���� ��, �ڿ� ������ �� ���ھ� ���� ��� ��ȸ
*/
-- ����� �߿� ������ ����� �����, �޿�, �Ի��� ��ȸ
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '��%';

SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��%';

-- ��� �̸��� ��� ���ڰ� ���� ���
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '_��_';

-- ����� �� ����ó�� 3���� �ڸ��� 1�� ����� ���, �����, ����ó, �̸��� ��ȸ
SELECT EMP_ID, EMP_NAME, PHONE, EMAIL
FROM EMPLOYEE
WHERE PHONE LIKE '__1%';

-- ����� �� �̸��Ͽ� _�� ������ �ش� ���� ���� 3������ ����� ���, �̸�, �̸��� ��ȸ
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '____%'; 
-- => ���ϵ�ī��� ���Ǵ� ���ڿ� �÷��� ��� ���ڰ� �����ϱ� ������ ��� ���ϵ�ī��� �νĵ�
-- ����, ������ ����� �� => ������ ���ϵ�ī�� ����ϱ�, ESCAPE�� ����Ͽ� ��� �� ����
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___$_%' ESCAPE '$'; 
-- =============================================================================
/*
    * IS NULL / IS NOT NULL : �÷����� NULL�� ���� ��� NULL���� ���� �� ����ϴ� ������
*/
-- ���ʽ��� ���� �ʴ� ������� ���, �̸�, �޿�, ���ʽ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE BONUS IS NULL;

-- ���ʽ��� �޴� ������� ���, �̸�, �޿�, ���ʽ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE NOT BONUS IS NULL;

-- ����� ���� ���(MANAGER_ID ���� NULL)���� �����, ��� ���, �μ��ڵ� ��ȸ
SELECT EMP_NAME, MANAGER_ID, DEPT_CODE
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL;

-- �μ� ��ġ�� ���� �ʾ�����(=> �μ��ڵ� ������ ����, DEPT_CODE�� ���� NULL), ���ʽ��� �ް��ִ� ����� �����, ���ʽ�, �μ��ڵ� ��ȸ
SELECT EMP_NAME, BONUS, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL;

-- =============================================================================
/*
    *������ �켱����
    (0) ()
    (1) ��������� : *, /, +, -, 
    (2) ���Ῥ���� :
    (3) �񱳿����� : > < >= <= = != ^= <> ...
    (4) IS NULL / LIKE '����' / IN
    (5) BTWEEN AND
    (6) NOT
    (7) AND
    (8) OR
*/

-- ���� �ڵ尡 J7�̰ų� J2�� ����� �� �޿��� 200���� �̻��� ����� ��� ������ ��ȸ
SELECT * 
FROM EMPLOYEE 
WHERE JOB_CODE IN ('J7', 'J2') AND SALARY >= 2000000;

-- =============================================================================
/*
    * ORDER BY : SELECT���� ���� ������ �ٿ� �ۼ�, ���� ���� ���� �������� ����
    
    [ǥ����]
            SELECT ��ȸ�� �÷�, ...
            FROM ���̺��
            WHERE ���ǽ�
            ORDER BY ���� ������ �Ǵ� �÷�|��Ī|�÷����� [ASC | DESC] [NULLS FIRST | NULLS LAST]
            
            * ASC : �������� ����(�⺻��)
            * DESC : �������� ����
            
            * NULLS FIRST : �����ϰ��� �ϴ� �÷��� ���� NULL�� ��� �ش� �����͸� �� �տ� ��ġ (DESC�� ��� �⺻��)
            * NULLS LAST : �����ϰ��� �ϴ� �÷��� ���� NULL�� ��� �ش� �����͸� �� �ڿ� ��ġ (ASC�� ��� �⺻��)
              => NULL���� ū ������ �з��Ǿ� ���ĵ�
*/

-- ��� ����� �����, ���� ��ȸ (������ �������� ����)
SELECT EMP_NAME, SALARY*12 "����" 
FROM EMPLOYEE 
ORDER BY 2 DESC;

-- ���ʽ� �������� �����غ���
SELECT *
FROM EMPLOYEE
ORDER BY BONUS DESC, SALARY ASC; -- => ���ʽ� ���� �������� �����ϴµ�, ���ʽ��� ���� ���̸� ���� ������ �������� ����


-- 1. EMPLOYEE ���̺� ������� 90/01/01 ~ 01/01/01�� ����� ��ü ������ ��ȸ
SELECT * FROM EMPLOYEE WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';

-- 2. �̸� ���� '��'���� ������ ����� �̸� ��ȸ
SELECT EMP_NAME 
FROM EMPLOYEE 
WHERE EMP_NAME LIKE '%��';

-- 3. ��ȭ��ȣ ó�� 3�ڸ��� 010�� �ƴ� ����� �̸�, ��ȭ��ȣ ��ȸ
SELECT EMP_NAME, PHONE 
FROM EMPLOYEE 
WHERE NOT PHONE LIKE '010%';

-- 4. �����ּ� '_'�� ���� 4���̸鼭 DEPT_CODE�� D9 �Ǵ� D6�̰� ������� 90/01/01 ~ 00/12/01�̰�, �޿��� 270���� �̻��� ����� ��ü�� ��ȸ
SELECT * 
FROM EMPLOYEE 
WHERE EMAIL LIKE '____#_%' ESCAPE '#' 
    AND DEPT_CODE IN('D9', 'D6') 
    AND HIRE_DATE BETWEEN '90/01/01' AND '00/12/01' 
    AND SALARY >= 2700000;

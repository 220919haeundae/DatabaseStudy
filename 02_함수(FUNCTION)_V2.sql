-- ** �Լ� �ι�° ���� **
/*
    �����Լ� 
            * DECODE(�񱳴��(�÷�/�����/�Լ���), �񱳰�1, �����1, �񱳰�2, �����2, ...)
            
            // �ڹٿ��� SWITCH
            SWITCH(�񱳴��) {
                CASE �񱳰�1 : �����
                CASE �񱳰�2 : �����
                ...
            }
*/
-- ���, �����, �ֹι�ȣ, ���� ��ȸ (1: '����' 3: '����')

SELECT EMP_ID, EMP_NAME �����, EMP_NO �ֹι�ȣ
    , DECODE(SUBSTR(EMP_NO,8,1), '1', '����', '2', '����', '3', '����', '4', '����', '�˼� ����') "����"
FROM EMPLOYEE;

-- �����, �����޿�, �λ�� �޿� ��ȸ
/*
    ������ J7�� ����� 10%�λ�
    ������ J6�� ����� 15%�λ�
    ������ J5�� ����� 20%�λ�
    �� �� 5%�λ�
*/

SELECT EMP_NAME, SALARY "���� �޿�", JOB_CODE "�μ�"
        , DECODE(JOB_CODE
        , 'J7', SALARY*1.1
        , 'J6', SALARY*1.15
        , 'J5', SALARY*1.2
        , SALARY*1.05) "�λ� �޿�"
FROM EMPLOYEE;
/*
    CASE WHEN THEN : ���ǽĿ� ���� ������� ��ȯ���ִ� �Լ�
    
    [ǥ����]
            CASE 
                WHEN ���ǽ�1 THEN �����1
                WHEN ���ǽ�2 THEN �����2
                ...
                ELSE �����
            END
*/
-- �����, �޿�, �޿��� ���� ��� ��ȸ
/*
    500���� �̻� '���'
    350���� �̻� '�߱�'
    �� �� '�ʱ�'
*/

SELECT EMP_NAME, SALARY, 
        CASE 
            WHEN SALARY >= 5000000 THEN '���' 
            WHEN SALARY >= 3500000 THEN '�߱�' 
            ELSE '�ʱ�'
        END "���"
FROM EMPLOYEE
ORDER BY 2;
--==============================================================================
-------------------------------- �׷� �Լ� --------------------------------------

/*
    * SUM : �ش� �÷��� ������ �� ���� ��ȯ���ִ� �Լ�
    
    [ǥ����]
            SUM(����Ÿ���÷�)
*/
-- ��ü ������� �� �޿��� ��ȸ

SELECT TO_CHAR(SUM(SALARY), 'L999,999,999') "�ѱ޿�" FROM EMPLOYEE;

-- ���ڻ������ �� �޿�
SELECT SUM(SALARY) 
FROM EMPLOYEE 
WHERE (SUBSTR(EMP_NO, 8, 1)) IN ('1', '3');

-- ���� ������� �� �޿�
SELECT SUM(SALARY) 
FROM EMPLOYEE 
WHERE (SUBSTR(EMP_NO, 8, 1)) IN ('2', '4');

-- �μ��ڵ尡 'D5'�� ������� �� �޿�

SELECT SUM(SALARY, DECODE(DEPT_CODE, 'D5', SALARY, 0)) FROM EMPLOYEE;

/*
    AVG : �ش� �÷��� ������ ����� ��ȯ���ִ� �Լ�
    
    [ǥ����]
            AVG(����Ÿ���÷�)
*/

SELECT TO_CHAR(ROUND(AVG(SALARY)), '9,999,999')||'��' "��� �������"
FROM EMPLOYEE;


/*

    MIN : �ش� �÷��� ���� �� ���� ���� �� ��ȯ���ִ� �Լ�
    
    [ǥ����] MIN(��� Ÿ��)

*/

SELECT MIN(EMP_NAME) "����Ÿ�� �ּڰ�", MIN(SALARY) "����Ÿ�� �ּڰ�", MIN(HIRE_DATE) "��¥Ÿ�� �ּڰ�" 
FROM EMPLOYEE;


/*

    MAX : �ش� �÷��� ���� �� ���� ū ���� ��ȯ���ִ� �Լ�
    
    [ǥ����] X(��� Ÿ��)

*/

SELECT MAX(EMP_NAME) "����Ÿ�� �ִ�", MAX(SALARY) "����Ÿ�� �ִ�", MAX(HIRE_DATE) "��¥Ÿ�� �ִ�" 
FROM EMPLOYEE;

/*
    COUNT : ���� ������ ��ȯ���ִ� �Լ� (��, ������ ���� ��� �ش� ���ǿ� �´� ���� ������ ��ȯ)
    
    [ǥ����]
            COUNT(*) : ��ȸ�� ����� ��� ���� ������ ��ȯ
            COUNT(�÷�) : �ش� �÷����� NULL�� �ƴ� �͸� ���� ������ ���� ��ȯ
            COUNT(DISTINCT �÷�) : �ش� �÷����� �ߺ��� ������ ���� ���� ������ ���� ��ȯ
                                    => �ߺ� ���� �� NULL�� �������� �ʰ� ������ ������
*/
-- ��ü ��� �� ��ȸ
SELECT COUNT(*) "��ü ��� ��" FROM EMPLOYEE;

-- ���� ��� �� ��ȸ

SELECT COUNT(*) "��ü ��� ��" 
FROM EMPLOYEE 
WHERE SUBSTR(EMP_NO, 8, 1) IN ('1', '3');

-- ���ʽ��� �޴� ����� �� ��ȸ

SELECT COUNT(BONUS) "��ü ��� ��" 
FROM EMPLOYEE;

SELECT COUNT(DEPT_CODE) FROM EMPLOYEE WHERE DEPT_CODE IS NOT NULL;

SELECT COUNT(DISTINCT DEPT_CODE) FROM EMPLOYEE WHERE DEPT_CODE IS NOT NULL;



-- 1. EMPLOYEE���̺��� ��� ��� ������ �ֹι�ȣ�� �̿��Ͽ� ����, ����, ���� ��ȸ
SELECT EMP_NAME, SUBSTR(EMP_NO, 1, 2)||'��' "����", SUBSTR(EMP_NO, 3, 2)||'��' "����", SUBSTR(EMP_NO, 5, 2)||'��' "����"
FROM EMPLOYEE;

-- 2. EMPLOYEE���̺��� �����, �ֹι�ȣ ��ȸ (��, �ֹι�ȣ�� ������ϸ� ���̰� �ϰ�, '-'���� ���� '*'�� �ٲٱ�)
-- SELECT EMP_NAME "�����", SUBSTR(EMP_NO,1,7)||'*******' "�������" FROM EMPLOYEE;
SELECT EMP_NAME "�����", RPAD(SUBSTR(EMP_NO,1,7), LENGTH(EMP_NO), '*') "�������" FROM EMPLOYEE;

-- 3. EMPLOYEE���̺��� �����, �Ի���-����, ����-�Ի��� ��ȸ
--     (��, �� ��Ī�� �ٹ��ϼ�1, �ٹ��ϼ�2�� �ǵ��� �ϰ� ��� ����(����), ����� �ǵ��� ó��)
SELECT EMP_NAME "�����"
    , FLOOR(ABS(HIRE_DATE-SYSDATE)) + 1||'��' "�ٹ��ϼ�1"
    , TRUNC(SYSDATE-HIRE_DATE) + 1||'��' "�ٹ��ϼ�2" 
FROM EMPLOYEE;

-- 4. EMPLOYEE���̺��� ����� Ȧ���� �������� ���� ��� ��ȸ
SELECT * 
FROM EMPLOYEE 
WHERE MOD(EMP_ID, 2) = 1;

-- 5. EMPLOYEE���̺��� �ٹ� ����� 20�� �̻��� ���� ���� ��ȸ
SELECT * FROM EMPLOYEE WHERE FLOOR((MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12)) >= 20;

-- 6. EMPLOYEE ���̺��� �����, �޿� ��ȸ (��, �޿��� '\9,000,000' �������� ǥ��)
SELECT EMP_NAME, TO_CHAR(SALARY, 'L9,999,999') "�޿�" -- L: �� ������ ���� ȭ����� ǥ��
FROM EMPLOYEE;

-- 7. EMPLOYEE���̺��� ���� ��, �μ��ڵ�, �������, ����(��) ��ȸ
--     (��, ��������� �ֹι�ȣ���� �����ؼ� 00�� 00�� 00�Ϸ� ��µǰ� �ϸ� 
--     ���̴� �ֹι�ȣ���� ����ؼ� ��¥�����ͷ� ��ȯ�� ���� ���)
SELECT EMP_NAME, DEPT_CODE
    , SUBSTR(EMP_NO,1,2)||'��'||SUBSTR(EMP_NO,3,2)||'��'||SUBSTR(EMP_NO,5,2)||'��' "�������"
    , TO_CHAR(TO_DATE(SUBSTR(EMP_NO, 1, 6)), 'YY"��" MM"��" DD"��"') �������
    , FLOOR((SYSDATE- TO_DATE(SUBSTR(EMP_NO, 1, 6)))/365)+ 2||'��' "������"
FROM EMPLOYEE;
 
-- 8. EMPLOYEE���̺��� �μ��ڵ尡 D5, D6, D9�� ����� ��ȸ�ϵ� D5�� �ѹ���, D6�� ��ȹ��, D9�� �����η� ó��
--     (��, �μ��ڵ� ������������ ����)
SELECT EMP_NAME, EMP_NAME, DEPT_CODE,
    DECODE(DEPT_CODE, 'D5', '�ѹ���', 'D6', '��ȹ��', 'D9', '������')  "�μ���"
FROM EMPLOYEE 
WHERE DECODE(DEPT_CODE, 'D5', '�ѹ���', 'D6', '��ȹ��', 'D9', '������') IS NOT NULL
ORDER BY 2;


SELECT EMP_NAME, EMP_NAME, DEPT_CODE, 
    CASE 
        WHEN DEPT_CODE = 'D5' THEN '�ѹ���'
        WHEN DEPT_CODE = 'D6' THEN '��ȹ��'
        WHEN DEPT_CODE = 'D9' THEN '������'
    END "�μ���"
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5','D6','D9')
ORDER BY 3;

    

-- 9. EMPLOYEE���̺��� ����� 201���� �����, �ֹι�ȣ ���ڸ�, �ֹι�ȣ ���ڸ�, 
--     �ֹι�ȣ ���ڸ��� ���ڸ��� �� ��ȸ
SELECT EMP_NAME
    , SUBSTR(EMP_NO, 1, 6) "���ڸ�"
    , SUBSTR(EMP_NO, 8) "���ڸ�"
    , SUBSTR(EMP_NO, 1, 6) + SUBSTR(EMP_NO, 8) "�ֹι�ȣ ���ڸ� + ���ڸ�"
FROM EMPLOYEE 
WHERE EMP_ID = 201;

-- 10. EMPLOYEE���̺��� �μ��ڵ尡 D5�� ������ ���ʽ� ���� ���� �� ��ȸ
SELECT SUM((SALARY + SALARY*NVL(BONUS, 0))*12) "D5 �μ� ���� ��" 
FROM EMPLOYEE 
WHERE DEPT_CODE = 'D5';

-- 11. �������� �Ի��Ϸκ��� �⵵�� ������ �� �⵵�� �Ի� �ο��� ��ȸ
-- ��ü ���� ��, 1999��, 2000��, 2001��, 2004��
SELECT COUNT(*) "��ü ������"
    , COUNT(DECODE(SUBSTR(HIRE_DATE, 1,2), '99', 1)) "1999��"
    , COUNT(DECODE(SUBSTR(HIRE_DATE, 1,2), '00', 1)) "2000��"
    , COUNT(DECODE(SUBSTR(HIRE_DATE, 1,2), '01', 1)) "2001��"
    , COUNT(DECODE(SUBSTR(HIRE_DATE, 1,2), '04', 1)) "2004��"
FROM EMPLOYEE;

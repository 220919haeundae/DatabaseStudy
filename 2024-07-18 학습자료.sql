-- ��� ���� �� �����ȣ, �̸�, ������ ��ȸ
select EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE;

-- �μ��ڵ尡 'D9'�� ����� �̸�, �μ��ڵ� ��ȸ
SELECT EMP_NAME, DEPT_CODE "�μ��ڵ�" -- (3)
FROM EMPLOYEE            -- (1)
WHERE DEPT_CODE = 'D9';  -- (2)

-- ����ó�� 4��°�ڸ��� 7�� ������ �̸�, ����ó ��ȸ
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE LIKE '___7%';

-- �����ڵ尡 'J7'�� ���� �� �޿��� 200���� �̻��� ������ �̸�, �޿�, �����ڵ� ��ȸ
SELECT EMP_NAME, SALARY, JOB_CODE
FROM EMPLOYEE
WHERE JOB_CODE IN 'J7' AND SALARY >= 2000000;

-- ��ü ��� ������ �ֱ� �Ի��� �������� �����Ͽ� ��ȸ
SELECT *
FROM EMPLOYEE
ORDER BY HIRE_DATE DESC;
-- "�⺻��" ASC NULLS LAST -- NULL ���� ���ʿ� ��ġ�Ͽ� ��ȸ
-- "����" DESC NULLFIRST -- NULL ���� ���� ��ġ�Ͽ� ��ȸ


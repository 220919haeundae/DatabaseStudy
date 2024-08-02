-- ��������???�������� ������ ���� ���� �� �Ʒ� SQL���� �ۼ����ּ��� ��������???��������
--============================================================================--
-- [1] '240724' ���ڿ��� '2024�� 7�� 24��'�� ǥ���غ���
SELECT TO_CHAR(TO_DATE('240724'), 'YYYY"��" MM"��" DD"��"') FROM DUAL;

-- [2] ������ �¾ �� ��ĥ°���� Ȯ���غ��� (���糯¥ - �������)
SELECT FLOOR(SYSDATE - TO_DATE(SUBSTR(EMP_NO, 1, 6)) + 1) "��" FROM EMPLOYEE;


-- [3] ���� ������ �ٲ㺸��
-- bElIVe iN YoURseLF.      -->  Belive in yourself.
SELECT UPPER(SUBSTR(LOWER('bElIVe iN YoURseLF'), 1, 1)) ||SUBSTR(LOWER('bElIVe iN YoURseLF'), 2) FROM DUAL;

-- [4] ������ 7�������� ������� �Ի���� ��� �� ��ȸ (�Ʒ��� ���� ���)
/*
------------------------------------------------------------
    ����     |   �Ի��   |   �Ի� �����|
         7�� |       4�� |          2��|
         7�� |       9�� |          1��|
         ...
         9�� |       6�� |          1��|
------------------------------------------------------------
*/
SELECT SUBSTR(EMP_NO, 3, 2) "����", EXTRACT(MONTH FROM HIRE_DATE) "�Ի��", COUNT(*) "�Ի� �����"
FROM EMPLOYEE
WHERE TO_NUMBER(SUBSTR(EMP_NO, 3, 2)) >= 7
GROUP BY SUBSTR(EMP_NO, 3, 2), EXTRACT(MONTH FROM HIRE_DATE);

-- [5] �����μ� ����� ���, �����, �μ���, ���޸� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
    JOIN JOB USING(JOB_CODE)
WHERE DEPT_TITLE LIKE '%����%';




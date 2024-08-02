-- ��� ����� ���� ��ȸ
SELECT * FROM CUSTOMER;

-- �����ÿ� ���� ���� ������� ���� ��ȸ
SELECT * 
FROM CUSTOMER 
WHERE ADDRESS LIKE '%������%';

-- �̸��� 2���� ������� ���� ��ȸ
SELECT * 
FROM CUSTOMER
WHERE LENGTH(NAME) = 2;

-- �̸�, �������, ���� ���� ��ȸ
-- EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM BIRTHDATE) + 1
SELECT NAME, BIRTHDATE, CEIL(MONTHS_BETWEEN(SYSDATE, BIRTHDATE)/12) + 1||'��' "����"
FROM CUSTOMER
ORDER BY "����";

-- ���̰� 30���� ������� ���� ��ȸ
SELECT * 
FROM CUSTOMER 
WHERE CEIL(MONTHS_BETWEEN(SYSDATE, BIRTHDATE)/12)+1 BETWEEN 30 AND 39;


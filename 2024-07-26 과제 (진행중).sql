-- 1. �� ������б��� �а� �̸��� �迭�� ǥ���Ͻÿ�. ��, ��� ����� "�а� ��", "�迭" ���� ǥ���ϵ��� �Ѵ�.
SELECT DEPARTMENT_NAME, CATEGORY FROM TB_DEPARTMENT;

-- 2. �а��� �а� ������ ������ ���� ���·� ȭ�鿡 �������.
SELECT DEPARTMENT_NAME||'�� ������' || CAPACITY||'���Դϴ�.'
FROM TB_DEPARTMENT;

--  3. "������а�" �� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƴ޶�� ��û�� 
-- ���Դ�. �����ΰ�? (�����а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� 
-- ã�� ������ ����)
SELECT STUDENT_NAME 
FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE SUBSTR(STUDENT_SSN, 8, 1) IN ('2', '4') AND ABSENCE_YN = 'Y';

-- 4. ���������� ���� ���� ��� ��ü�� ���� ã�� �̸��� �Խ��ϰ��� �Ѵ�. �� ����ڵ��� 
-- �й��� ������ ���� �� ����ڵ��� ã�� ������ SQL ������ �ۼ��Ͻÿ�.
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN ( 'A513079', 'A513090', 'A513091', 'A513110', 'A513119');

-- 5. ���������� 20�� �̻� 30�� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�.
SELECT DEPARTMENT_NAME, CATEGORY 
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 20 AND 30;

--  6. �� ������б��� ������ �����ϰ� ��� �������� �Ҽ� �а��� ������ �ִ�.  �׷� �� 
-- ������б� ������ �̸��� �˾Ƴ� �� �ִ� SQL ������ �ۼ��Ͻÿ�.
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

-- 7. Ȥ�� ������� ������ �а��� �����Ǿ� ���� ���� �л��� �ִ��� Ȯ���ϰ��� ����. 
-- ��� SQL ������ ����ϸ� �� ������ �ۼ��Ͻÿ�. 
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NAME NOT IN (SELECT STUDENT_NAME
                            FROM TB_STUDENT
                                LEFT JOIN TB_DEPARTMENT USING(DEPARTMENT_NO));


-- 8. ������û�� �Ϸ��� ����. �������� ���θ� Ȯ���ؾ� �ϴµ�, ���������� �����ϴ� 
-- ������� � �������� �����ȣ�� ��ȸ�غ��ÿ�. 
SELECT CLASS_NO
FROM TB_CLASS
WHERE NOT PREATTENDING_CLASS_NO IS NULL;

-- 9. �� ���п��� � �迭(CATEGORY)���� �ִ��� ��ȸ�غ��ÿ�.
SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT
ORDER BY CATEGORY;

-- 10. 02 �й� ���� �����ڵ��� ������ ������� ����. ������ ������� ������ �������� 
-- �л����� �й�, �̸�, �ֹι�ȣ�� ����ϴ� ������ �ۼ��Ͻÿ�. 

SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'N' 
    AND STUDENT_ADDRESS LIKE '%����%' 
    AND EXTRACT(YEAR FROM ENTRANCE_DATE) = '2002';
    
    
    
-- 1. ������а�(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵�� ���� �⵵�� ���� 
-- ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.( ��, ����� "�й�", "�̸�", "���г⵵" �� 
-- ǥ�õǵ��� �Ѵ�.) 
SELECT STUDENT_NO "�й�", STUDENT_NAME "�̸�", ENTRANCE_DATE "���г⵵"
FROM TB_STUDENT
WHERE department_no = 002
ORDER BY 3;

-- 2. �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� ����. �� ������ 
-- �̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL ������ �ۼ��� ����. (* �̶� �ùٸ��� �ۼ��� SQL 
-- ������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� �����غ� ��)
SELECT PROFESSOR_NAME, professor_ssn
FROM TB_PROFESSOR
WHERE LENGTH(professor_name) != 3;

-- 3. �� ������б��� ���� �������� �̸��� ���̸� ����ϴ� SQL ������ �ۼ��Ͻÿ�. �� 
-- �̶� ���̰� ���� ������� ���� ��� ������ ȭ�鿡 ��µǵ��� ����ÿ�. (��, ���� �� 
-- 2000 �� ���� ����ڴ� ������ ��� ����� "�����̸�", "����"�� ����. ���̴� ���������� 
-- ����Ѵ�.)



-- 4. �������� �̸� �� ���� ������ �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�. ��� ����� 
-- ?�̸�? �� �������� ����. (���� 2���� ���� ������ ���ٰ� �����Ͻÿ�)
SELECT SUBSTR(PROFESSOR_NAME, 2) "�̸�"
FROM tb_professor;

-- 5. �� ������б��� ����� �����ڸ� ���Ϸ��� ����. ��� ã�Ƴ� ���ΰ�?  �̶�, 
-- 19�쿡 �����ϸ� ����� ���� ���� ������ �A������.
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE ADD_MONTHS(TO_DATE(SUBSTR(STUDENT_SSN, 1, 6)), 228) <= ENTRANCE_DATE
ORDER BY 2; --> �� �𸣰ڴ�.

-- 6. 2020�� ũ���������� ���� �����ΰ�? 
SELECT TO_CHAR(TO_DATE('2020/12/25'), 'DAY') "����" FROM DUAL;

-- 7. TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD')  �� ���� �� �� �� 
-- �� �� ���� �ǹ�����? --> 1999�� 10�� 11�ϰ� 2049�� 10�� 11��
-- �� TO_DATE('99/10/11','RR/MM/DD'), 
-- TO_DATE('49/10/11','RR/MM/DD') �� ���� �� �� �� �� �� ���� �ǹ�����? --> 1999�� 10�� 11�ϰ� 1949�� 10�� 11��

-- 8. �� ������б��� 2000�⵵ ���� �����ڵ��� �й��� A�� �����ϰ� �Ǿ��ִ�. 2000�⵵ 
-- ���� �й��� ���� �л����� �й��� �̸��� �����ִ� SQL ������ �ۼ��Ͻÿ�. 
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO NOT LIKE 'A%'
ORDER BY STUDENT_NAME;

-- 9. �й��� A517178 �� ���Ƹ� �л��� ���� �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��, 
-- �̶� ��� ȭ���� ����� "����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� �� 
-- �ڸ������� ǥ���Ѵ�.
SELECT ROUND(AVG(POINT), 1)
FROM TB_GRADE
WHERE student_no = 'A517178';

-- 10. �а��� �л����� ���Ͽ� "�а���ȣ", "�л���(��)" �� ���·� ����� ����� ������� 
-- ��µǵ��� �Ͻÿ�.

SELECT DEPARTMENT_NO "�а���ȣ", COUNT(*) "�л���"
FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO;

-- 11. ���� ������ �������� ���� �л��� ���� �� �� ���� �Ǵ� �˾Ƴ��� SQL ���� 
-- �ۼ��Ͻÿ�.
SELECT COUNT(*)
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;

-- 12. �й��� A112113�� ���� �л��� �⵵ �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��, 
-- �̶� ��� ȭ���� ����� "�⵵", "�⵵ �� ����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� 
-- �Ҽ��� ���� �� �ڸ������� ǥ���Ѵ�. 
SELECT SUBSTR(TERM_NO, 1, 4) "�⵵", ROUND(AVG(POINT), 1) "�⵵ �� ����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO, 1, 4);

-- 13. �а� �� ���л� ���� �ľ��ϰ��� ����. �а� ��ȣ�� ���л� ���� ǥ���ϴ� SQL ������ 
-- �ۼ��Ͻÿ�. 


-- 14. �� ���б��� �ٴϴ� ��������(��٣���) �л����� �̸��� ã���� ����. � SQL 
-- ������ ����ϸ� �����ϰڴ°�?
SELECT STUDENT_NAME
FROM 
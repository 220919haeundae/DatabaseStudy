/*
    �������� (SUBQUERY)
    : �ϳ��� ������ ���� ���Ե� �� �ٸ� ������
    : ���� ������ �ϴ� �������� ���� ���� ������ �ϴ� ������
*/

-- ���ö ����� ���� �μ��� ���� ��� ������ ��ȸ

-- 1) ���ö ����� �μ��ڵ� ��ȸ --> 'D9'
SELECT DEPT_CODE 
FROM EMPLOYEE 
WHERE EMP_NAME = '���ö';

-- 2) �μ��ڵ尡 'D9'�� ��� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

-- �� 2���� �������� �ϳ��� ���ĺ��ٸ�
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_CODE 
                   FROM EMPLOYEE 
                   WHERE EMP_NAME = '���ö');
                   
-- ��ü ����� ��ձ޿����� �� ���� �޿��� �޴� ����� ���� ��ȸ (��������)
SELECT EMP_NAME, SALARY, JOB_CODE 
FROM EMPLOYEE
WHERE SALARY >= (SELECT ROUND(AVG(SALARY)) 
                FROM EMPLOYEE);

--------------------------------------------------------------------------------

/*
    * ���������� ���� *
    ���������� ������ ������� ���� ��� �����Ŀ� ���� �з�
    
    - ������ �������� : �������� ���� ����� ������ �� ���� ��(1�� 1��)
    - ������ �������� : ���������� ���� ����� ���� ���� ��(N�� 1��)
    - ���߿� �������� : ���������� �������� �� ���̰� ���� ���� �÷��� ��(1�� N��)
    - ������ ���߿� �������� : ���������� �������� ���� ��, ���� �÷��� ��(N�� N��)
    
    >> ������ ���� �������� �տ� �ٴ� �����ڰ� �޶���
*/

-- ������ �������� : �������� ����� ������ �� ���� ��
/*
    �Ϲ����� �񱳿����� ��� ���� :  = != > < ���...
*/
-- �� ������ ��� �޿����� �� ���� �޿��� �޴� ������� �����, �����ڵ�, �޿� ��ȸ
SELECT EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY < (SELECT ROUND(AVG(SALARY)) FROM EMPLOYEE);

-- �����޿��� �޴� ����� �����, �޿�, �Ի��� ��ȸ
SELECT EMP_NAME, SALARY, HIRE_DATE 
FROM EMPLOYEE 
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE);

-- ���ö ����� �޿����� ���� �޴� ����� �����, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_NAME, DEPT_TITLE, SALARY
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID 
        AND SALARY > (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME = '���ö');

SELECT EMP_NAME, DEPT_TITLE, SALARY
FROM EMPLOYEE 
    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE SALARY > (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME = '���ö');

-- �μ��� �޿����� ���� ū �μ��� �μ��ڵ�, �޿����� ��ȸ

SELECT MAX(SUM(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE;

�μ��� �޿����� 17700000�� �μ��� �μ��ڵ�, �޿��� ��ȸ

SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY))
                    FROM EMPLOYEE
                    GROUP BY DEPT_CODE);
                    
-- ������ ����� ���� �μ��� ������� ���, �����, ����ó, �Ի���, �μ��� ��ȸ
-- ��, ������ ����� �����ϰ� ��ȸ

SELECT EMP_ID, EMP_NAME, PHONE, HIRE_DATE, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID 
        AND EMP_NAME != '������' 
        AND DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '������');

SELECT EMP_ID, EMP_NAME, PHONE, HIRE_DATE, DEPT_TITLE
FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
WHERE EMP_NAME != '������' 
        AND DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '������');
        
--------------------------------------------------------------------------------

/*
    ������ �������� : �������� ���� ����� ���� ���̰�, 1���� ���
    
    IN (��������) : ���� ���� ����� �߿��� �ϳ��� ��ġ�ϴ� ���� �ִٸ� ��ȸ
    > ANY (��������) : �������� ����� �߿��� �ϳ��� ū ��찡 �ִٸ� ��ȸ
    < ANY (��������) ; �������� ����� �߿��� �ϳ��� ���� ��찡 �ִٸ� ��ȸ
        * �񱳴�� > ��1 OR �񱳴�� > ��2 OR �񱳴�� > ��3 ....
    
    > ALL (��������) : ���� ���� ��������� Ŭ ��� ��ȸ
    < ALL (��������) : ���� ���� ��� ��������� ���� ��� ��ȸ
        * �񱳴�� > �����1 AND �񱳴�� > �����2 AND �񱳴�� > �����3 ...
*/
-- ����� ��� �Ǵ� ������ ����� ���� ������ ������� ���� ��ȸ(���/�����/�����ڵ�/�޿�)

SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN ( SELECT JOB_CODE 
                    FROM EMPLOYEE 
                    WHERE EMP_NAME IN ('�����', '������'));

-- �븮 ������ ����� �� ���� ������ ����� �ּұ޿����� ���� �޴� ��� ���� ��ȸ
SELECT * 
FROM EMPLOYEE
WHERE JOB_CODE = 'J6' 
    AND SALARY > ANY (SELECT SALARY 
                        FROM EMPLOYEE 
                            JOIN JOB USING (JOB_CODE) 
                        WHERE JOB_NAME = '����');

SELECT * FROM EMPLOYEE
WHERE HIRE_DATE > ANY(SELECT HIRE_DATE FROM EMPLOYEE WHERE EXTRACT(YEAR FROM HIRE_DATE)>2010);

SELECT * 
FROM EMPLOYEE 
WHERE DEPT_CODE > 'D5';

-- -----------------------------------------------------------------------------
/*
    ���߿� �������� : �������� ���� ����� ���� �ϳ��̰�, �÷� ���� ���� ���� ���
*/

-- ������ ��� ���� �μ��ڵ�, ���� �����ڵ忡 �ش��ϴ� ��� ������ ��ȸ




-- * ������ ���������� ����� ��� 
SELECT EMP_NAME, DEPT_CODE, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE (DEPT_CODE, JOB_CODE) = ( SELECT DEPT_CODE, JOB_CODE 
                                FROM EMPLOYEE 
                                WHERE EMP_NAME = '������' );
                                
-- �ڳ��� ����� ���� �����ڵ�, ���� ����� ������ �ִ� ��� ���� ��ȸ
SELECT * 
FROM EMPLOYEE 
WHERE EMP_NAME != '�ڳ���' AND (JOB_CODE, MANAGER_ID) = (SELECT JOB_CODE, MANAGER_ID 
                                FROM EMPLOYEE 
                                WHERE EMP_NAME = '�ڳ���');
                                
/*
    ������ ���߿� ��������
*/

-- �� ���޺� �ּұ޿��� �޴� ��� ������ ��ȸ

SELECT JOB_CODE, MIN(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE;


SELECT *
FROM EMPLOYEE
WHERE (JOB_CODE, SALARY) IN (SELECT JOB_CODE, MIN(SALARY)
                            FROM EMPLOYEE
                            GROUP BY JOB_CODE);
                            
                            
-- �� �μ����� �ְ�޿��� �޴� ��� ���� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE (DEPT_CODE, SALARY) IN ( SELECT DEPT_CODE, MAX(SALARY)
                               FROM EMPLOYEE
                               GROUP BY DEPT_CODE);
                               
--------------------------------------------------------------------------------
/*
    �ζ��� �� : ���������� FROM���� ����ϴ� ��
                => ���������� �������� ��ġ ���̺�ó�� ����ϴ� ��
*/
-- ������� ���, �̸�, ���ʽ� ���� ����, �μ��ڵ带 ��ȸ
-- * ���ʽ� ���� ������ NULL�� �ƴϾ�� �ϰ�, ���ʽ� ���� ������ 3000���� �̻��� ����鸸 ��ȸ
SELECT EMP_ID, EMP_NAME, (SALARY + SALARY*NVL(BONUS, 0))*12, DEPT_CODE
FROM EMPLOYEE
WHERE (SALARY + SALARY*NVL(BONUS, 0))*12 >= 30000000
ORDER BY 3 DESC;



SELECT ROWNUM, ���, �̸�, "���ʽ� ���� ����", �μ��ڵ�
FROM (  SELECT EMP_ID ���, EMP_NAME �̸�, (SALARY + SALARY*NVL(BONUS, 0))*12 "���ʽ� ���� ����", DEPT_CODE �μ��ڵ�
        FROM EMPLOYEE
        WHERE (SALARY + SALARY*NVL(BONUS, 0))*12 >= 30000000
        ORDER BY 3 DESC)
WHERE ROWNUM <= 5;


-- ���� �ֱٿ� �Ի��� ��� 5�� ��ȸ

SELECT ���, �̸�, �Ի���
FROM (  SELECT EMP_ID ���, EMP_NAME �̸�, HIRE_DATE �Ի��� 
        FROM EMPLOYEE
        ORDER BY HIRE_DATE DESC)
WHERE ROWNUM <= 5;

--------------------------------------------------------------------------------

/*
    ������ �ű�� �Լ� (WINDOW FUNCTION)
    
    - RANK() OVER(���ı���) : ������ ���� ������ ����� ������ �� ��ŭ �ǳʶٰ� ���� ���
    - DENSE_RANK() OVER(���ı���) : ������ ������ �ִ��� �� ���� ����� +1�ؼ� ���� ���
    
    - SELECT�������� ��� ����!
*/
-- �޿��� ���� ������� ������ �Ű� ��ȸ
SELECT EMP_NAME, SALARY, RANK() OVER(ORDER BY SALARY DESC) "����"
FROM EMPLOYEE;
--> ���� 19���� 2���� �ְ�, �� ���� ������ 21���� ǥ�õ�.

SELECT EMP_NAME, SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) "����"
FROM EMPLOYEE;
--> ���� 19���� 2���� �ְ�, �� �� ������ 20���� ǥ�õ�.

--> ���� 5�� ��ȸ
SELECT EMP_NAME, SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) "����"
FROM EMPLOYEE;

SELECT *
FROM (SELECT EMP_NAME, SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) "����"
    FROM EMPLOYEE)
WHERE ���� <= 5;

--------------------------------------------------------------------------------
-- 1) ROWNUM�� Ȱ���ؼ� �޿��� ���� ���� 5���� ��ȸ�Ϸ� ������, ����� ��ȸ�� ���� �ʾҴ�.
SELECT ROWNUM, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE  ROWNUM <= 5
ORDER BY SALARY DESC;

-- ������(����) : ��������� ���̺��� ROWNUM 1~5������ �̾ƿ��� �� ���� �������� �޿��� ���� ������ �����ϵ��� �Ǿ��ִ�.
-- �ذ���
SELECT ROWNUM, �����, �޿�, �޿�����
FROM (SELECT EMP_NAME �����, SALARY �޿�, RANK() OVER(ORDER BY SALARY DESC) �޿�����
        FROM EMPLOYEE)
WHERE �޿����� <= 5;

-- 2) �μ��� ��ձ޿��� 270������ �ʰ��ϴ� �μ��� �ش��ϴ� �μ��ڵ�, �μ��� �� �޿���, �μ��� ��ձ޿�, �μ��� ��� ���� ��ȸ
SELECT DEPT_CODE, SUM(SALARY) "����", FLOOR(AVG(SALARY)) ���, COUNT(*) �ο���
FROM EMPLOYEE
WHERE SALARY > 2700000
GROUP BY DEPT_CODE
ORDER BY DEPT_CDOE ASC;


-- ������(����) : �μ��� ��� �޿��� Ȯ���ؾ� �ϴµ�, ��� �������� �޿��� Ȯ���ߴ�.
-- �ذ���
SELECT DEPT_CODE �μ��ڵ�, SUM(SALARY) �޿���, ROUND(AVG(SALARY)) ��ձ޿�, COUNT(*) �����
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY) > 2700000;

SELECT �μ��ڵ�, �޿���, ��ձ޿�, �����
FROM (SELECT DEPT_CODE �μ��ڵ�, SUM(SALARY) �޿���, ROUND(AVG(SALARY)) ��ձ޿�, COUNT(*) �����
      FROM EMPLOYEE
      GROUP BY DEPT_CODE
      HAVING AVG(SALARY) > 2700000);






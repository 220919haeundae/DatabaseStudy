-- �� �� �ּ�
/*
    ���� �� �ּ�
*/
SELECT * FROM DBA_USERS; -- ��� �����鿡 ���� ��ȸ�ϴ� ��ɹ�
-- ��ɹ� ���� : �ʷϻ� �����ư Ŭ�� �Ǵ� ctrl + Enter

-- �Ϲ� ����� ���� ���� ���� (������ �������θ� ����!)
-- [ǥ����] CREATE USER ������ IDENTIFIED BY ��й�ȣ;
CREATE USER "C##TESTUSER" IDENTIFIED BY 1234;

-- ������ ����� ������ �ּ����� ����(������ ����, ����) �ο�
--[ǥ����] GRANT ����1, ����2, ... TO ������;
GRANT CONNECT, RESOURCE TO "C##TESTUSER";

-- ���̺� �����̽� ���� ����
ALTER USER "C##TESTUSER" DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
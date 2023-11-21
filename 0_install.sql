


-- utPLSQL owner
CREATE USER POUG_2023_UT3 IDENTIFIED BY P#OU#G_20#23_u#T3 
      DEFAULT TABLESPACE DATA
      TEMPORARY TABLESPACE TEMP;

   GRANT CONNECT TO POUG_2023_UT3;

   ALTER USER POUG_2023_UT3 DEFAULT ROLE CONNECT;

  GRANT CREATE SESSION TO POUG_2023_UT3;
  GRANT CREATE TABLE TO POUG_2023_UT3;
  GRANT CREATE SYNONYM TO POUG_2023_UT3;
  GRANT CREATE PUBLIC SYNONYM TO POUG_2023_UT3;
  GRANT CREATE VIEW TO POUG_2023_UT3;
  GRANT CREATE SEQUENCE TO POUG_2023_UT3;
  GRANT CREATE ROLE TO POUG_2023_UT3;
  GRANT CREATE PROCEDURE TO POUG_2023_UT3;
  GRANT CREATE ANY PROCEDURE TO POUG_2023_UT3;
  GRANT EXECUTE ANY PROCEDURE TO POUG_2023_UT3;
  GRANT CREATE TRIGGER TO POUG_2023_UT3;
  GRANT CREATE MATERIALIZED VIEW TO POUG_2023_UT3;
  GRANT CREATE TYPE TO POUG_2023_UT3;
  GRANT DEBUG CONNECT SESSION TO POUG_2023_UT3;
  GRANT DEBUG ANY PROCEDURE TO POUG_2023_UT3;

  GRANT EXECUTE ON SYS.DBMS_CRYPTO TO POUG_2023_UT3;

  DECLARE 
  TEMP_COUNT NUMBER; 
  SQLSTR VARCHAR2(200); 
BEGIN 
  SQLSTR := 'ALTER USER POUG_2023_UT3 QUOTA UNLIMITED ON DATA';
  EXECUTE IMMEDIATE SQLSTR;
EXCEPTION 
  WHEN OTHERS THEN
    IF SQLCODE = -30041 THEN 
      SQLSTR := 'SELECT COUNT(*) FROM USER_TABLESPACES 
              WHERE TABLESPACE_NAME = ''DATA'' AND CONTENTS = ''TEMPORARY''';
      EXECUTE IMMEDIATE SQLSTR INTO TEMP_COUNT;
      IF TEMP_COUNT = 1 THEN RETURN; 
      ELSE RAISE; 
      END IF;
    ELSE
      RAISE;
    END IF;
END;
/



--- application owner
CREATE USER POUG_2023_APP IDENTIFIED BY P#OUG_20#23_a#PP
      DEFAULT TABLESPACE DATA
      TEMPORARY TABLESPACE TEMP;

   GRANT CONNECT TO POUG_2023_APP;

   ALTER USER POUG_2023_APP DEFAULT ROLE CONNECT;

  GRANT CREATE SESSION TO POUG_2023_APP;
  GRANT CREATE TABLE TO POUG_2023_APP;
  GRANT CREATE SYNONYM TO POUG_2023_APP;
  GRANT CREATE PUBLIC SYNONYM TO POUG_2023_APP;
  GRANT CREATE VIEW TO POUG_2023_APP;
  GRANT CREATE SEQUENCE TO POUG_2023_APP;
  GRANT CREATE ROLE TO POUG_2023_APP;
  GRANT CREATE PROCEDURE TO POUG_2023_APP;
  GRANT CREATE TRIGGER TO POUG_2023_APP;
  GRANT CREATE MATERIALIZED VIEW TO POUG_2023_APP;
  GRANT CREATE TYPE TO POUG_2023_APP;



--- schema used for test packages, tables, ...
CREATE USER POUG_2023_TEST IDENTIFIED BY VALUES POUG_2023_TEST
      DEFAULT TABLESPACE DATA
      TEMPORARY TABLESPACE TEMP;

   GRANT CONNECT TO POUG_2023_TEST;

   ALTER USER POUG_2023_TEST DEFAULT ROLE CONNECT;

  GRANT CREATE SESSION TO POUG_2023_TEST;
  GRANT CREATE TABLE TO POUG_2023_TEST;
  GRANT CREATE SYNONYM TO POUG_2023_TEST;
  GRANT CREATE PUBLIC SYNONYM TO POUG_2023_TEST;
  GRANT CREATE VIEW TO POUG_2023_TEST;
  GRANT CREATE SEQUENCE TO POUG_2023_TEST;
  GRANT CREATE ROLE TO POUG_2023_TEST;
  GRANT CREATE PROCEDURE TO POUG_2023_TEST;
  GRANT CREATE ANY INDEX TO "POUG_2023_TEST" ;
  GRANT CREATE ANY SEQUENCE TO "POUG_2023_TEST" ;
  GRANT CREATE ANY SYNONYM TO "POUG_2023_TEST" ;
  GRANT CREATE ANY VIEW TO "POUG_2023_TEST" ;
  GRANT CREATE ANY TABLE TO "POUG_2023_TEST" ;
  GRANT CREATE ANY PROCEDURE TO POUG_2023_TEST;
  GRANT EXECUTE ANY PROCEDURE TO POUG_2023_TEST;
  GRANT CREATE TRIGGER TO POUG_2023_TEST;
  GRANT CREATE MATERIALIZED VIEW TO POUG_2023_TEST;
  GRANT CREATE TYPE TO POUG_2023_TEST;
  GRANT DEBUG CONNECT SESSION TO POUG_2023_TEST;
  GRANT DEBUG ANY PROCEDURE TO POUG_2023_TEST;

  GRANT EXECUTE ON POUG_2023_APP.ADVANCED_MATH TO POUG_2023_TEST;
  GRANT DEBUG ON POUG_2023_APP.ADVANCED_MATH TO POUG_2023_TEST;

  DECLARE 
  TEMP_COUNT NUMBER; 
  SQLSTR VARCHAR2(200); 
BEGIN 
  SQLSTR := 'ALTER USER POUG_2023_TEST QUOTA UNLIMITED ON DATA';
  EXECUTE IMMEDIATE SQLSTR;
EXCEPTION 
  WHEN OTHERS THEN
    IF SQLCODE = -30041 THEN 
      SQLSTR := 'SELECT COUNT(*) FROM USER_TABLESPACES 
              WHERE TABLESPACE_NAME = ''DATA'' AND CONTENTS = ''TEMPORARY''';
      EXECUTE IMMEDIATE SQLSTR INTO TEMP_COUNT;
      IF TEMP_COUNT = 1 THEN RETURN; 
      ELSE RAISE; 
      END IF;
    ELSE
      RAISE;
    END IF;
END;
/


  DECLARE 
  TEMP_COUNT NUMBER; 
  SQLSTR VARCHAR2(200); 
BEGIN 
  SQLSTR := 'ALTER USER POUG_2023_APP QUOTA UNLIMITED ON DATA';
  EXECUTE IMMEDIATE SQLSTR;
EXCEPTION 
  WHEN OTHERS THEN
    IF SQLCODE = -30041 THEN 
      SQLSTR := 'SELECT COUNT(*) FROM USER_TABLESPACES 
              WHERE TABLESPACE_NAME = ''DATA'' AND CONTENTS = ''TEMPORARY''';
      EXECUTE IMMEDIATE SQLSTR INTO TEMP_COUNT;
      IF TEMP_COUNT = 1 THEN RETURN; 
      ELSE RAISE; 
      END IF;
    ELSE
      RAISE;
    END IF;
END;
/


@utPLSQL\source\install.sql
@utPLSQL\source\create_synonyms_and_grants_for_public.sql

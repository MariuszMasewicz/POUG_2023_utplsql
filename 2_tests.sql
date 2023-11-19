select  POUG_2023_APP.ADVANCED_MATH.plus( 1,  1) as plus from dual;


set serveroutput on

CREATE OR REPLACE PACKAGE POUG_2023_TEST.POUG_ORDER_OF_EXECUTION_tests
IS
--%suite(Order of execution)
--%suitepath(poug.devtests)

--%beforeall
  procedure before_all_1;

  --%beforeall
  procedure before_all_2;

  --%afterall
  procedure after_all;

  --%beforeeach
  procedure before_each;

procedure before_test1;
procedure before_test2;

--%test(test1)  
--%beforetest(before_test1)
   PROCEDURE test1;

--%test(test2)  
--%beforetest(before_test2)
   PROCEDURE test2;

END poug_ORDER_OF_EXECUTION_tests;
/

CREATE OR REPLACE PACKAGE BODY POUG_2023_TEST.POUG_ORDER_OF_EXECUTION_tests
IS
  procedure before_all_1
  is
  begin
    dbms_output.put_line('before_all_1');
  end;

  procedure before_all_2
  is
  begin
    dbms_output.put_line('before_all_2');
  end;

  procedure after_all
  is
  begin
    dbms_output.put_line('after_all');
  end;

  procedure before_each
  is
  begin
    dbms_output.put_line('before_each');
  end;

procedure before_test1
is
  begin
    dbms_output.put_line('before_test1');
  end;

procedure before_test2
is
  begin
    dbms_output.put_line('before_test2');
  end;


   PROCEDURE test1
   is
  begin
    dbms_output.put_line('test1');
  end;

PROCEDURE test2
is
  begin
    dbms_output.put_line('test2');
  end;

end poug_ORDER_OF_EXECUTION_tests;
/

exec ut.run('poug_ORDER_OF_EXECUTION_tests');

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------




DROP TABLE ADVANCED_MATH_SELECT_TEST_TABLE ;
CREATE TABLE ADVANCED_MATH_SELECT_TEST_TABLE 
(
  NUMBER1 NUMBER NOT NULL 
, NUMBER2 NUMBER NOT NULL 
, CONSTRAINT ADVANCED_MATH_SELECT_TEST_TABLE_UK1 UNIQUE (NUMBER1, NUMBER2)
);

Insert into POUG_2023_TEST.ADVANCED_MATH_SELECT_TEST_TABLE (NUMBER1,NUMBER2) values ('1','1');
Insert into POUG_2023_TEST.ADVANCED_MATH_SELECT_TEST_TABLE (NUMBER1,NUMBER2) values ('2','2');
Insert into POUG_2023_TEST.ADVANCED_MATH_SELECT_TEST_TABLE (NUMBER1,NUMBER2) values ('3','3');
commit;

select * from ADVANCED_MATH_SELECT_TEST_TABLE;

CREATE OR REPLACE PACKAGE POUG_2023_TEST.POUG_ADVANCED_MATH_select_tests
IS
--%suite(Select tests)
--%suitepath(poug.devtests)
--%rollback(manual)

   PROCEDURE ut_setup;
   PROCEDURE ut_teardown;

--https://www.utplsql.org/utPLSQL/v3.0.0/userguide/annotations.html

--%test(Plus select)  
--%beforetest(ut_setup)
   PROCEDURE ut_plus;
END poug_ADVANCED_MATH_select_tests;
/

CREATE OR REPLACE PACKAGE BODY POUG_2023_TEST.POUG_ADVANCED_MATH_select_tests
IS
   PROCEDURE ut_setup IS
   BEGIN
      execute immediate 'truncate table ADVANCED_MATH_SELECT_TEST_TABLE';
      Insert into POUG_2023_TEST.ADVANCED_MATH_SELECT_TEST_TABLE (NUMBER1,NUMBER2) values ('1','1');
      Insert into POUG_2023_TEST.ADVANCED_MATH_SELECT_TEST_TABLE (NUMBER1,NUMBER2) values ('2','2');
      Insert into POUG_2023_TEST.ADVANCED_MATH_SELECT_TEST_TABLE (NUMBER1,NUMBER2) values ('3','3');
      commit;
   END;
   
   PROCEDURE ut_teardown
   IS
   BEGIN
      NULL;
   END;
  
  PROCEDURE ut_plus
   IS
    l_actual   sys_refcursor;
    l_expected sys_refcursor;
   BEGIN
      open l_expected for select 1 as number1,1 as number2,2 as result from dual
                            union all
                          select 2,2,4 from dual
                            union all 
                          select 3,3,6 from dual
                          --  union all 
                          --select 4,4,8 from dual
                          ;
      open l_actual   for select number1, number2,  POUG_2023_APP.ADVANCED_MATH.plus(  number1, number2) as result from ADVANCED_MATH_SELECT_TEST_TABLE;
      ut.expect( l_actual ).to_equal( l_expected );
   END;
end poug_ADVANCED_MATH_select_tests;
/

set serveroutput on
exec ut.run('poug_ADVANCED_MATH_select_tests');
exec ut.run();

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE POUG_2023_TEST.POUG_ADVANCED_MATH_select_tests
IS
--%suite(Select tests)
--%suitepath(poug.devtests)
--%rollback(manual)

   PROCEDURE ut_setup;
   PROCEDURE ut_teardown;

--https://www.utplsql.org/utPLSQL/v3.0.0/userguide/annotations.html

--%test(Plus select)  
--%beforetest(ut_setup)
   PROCEDURE ut_plus;
   
--%test(Divide select)  
--%beforetest(ut_setup)
   PROCEDURE ut_divide;

--%test(Multiply select)  
--%beforetest(ut_setup)
   PROCEDURE ut_multiply;

--%test(Subtract select)  
--%beforetest(ut_setup)
   PROCEDURE ut_subtract;
   
END poug_ADVANCED_MATH_select_tests;
/

CREATE OR REPLACE PACKAGE BODY POUG_2023_TEST.POUG_ADVANCED_MATH_select_tests
IS
   PROCEDURE ut_setup IS
   BEGIN
      execute immediate 'truncate table ADVANCED_MATH_SELECT_TEST_TABLE';
      Insert into POUG_2023_TEST.ADVANCED_MATH_SELECT_TEST_TABLE (NUMBER1,NUMBER2) values ('1','1');
      Insert into POUG_2023_TEST.ADVANCED_MATH_SELECT_TEST_TABLE (NUMBER1,NUMBER2) values ('2','2');
      Insert into POUG_2023_TEST.ADVANCED_MATH_SELECT_TEST_TABLE (NUMBER1,NUMBER2) values ('3','3');
      commit;
   END;
   
   PROCEDURE ut_teardown
   IS
   BEGIN
      NULL;
   END;
  
  PROCEDURE ut_plus
   IS
    l_actual   sys_refcursor;
    l_expected sys_refcursor;
   BEGIN
      open l_expected for select 1 as number1,1 as number2,2 as result from dual
                            union all
                          select 2,2,4 from dual
                            union all 
                          select 3,3,6 from dual
                          --  union all 
                          --select 4,4,8 from dual
                          ;
      open l_actual   for select number1, number2,  POUG_2023_APP.ADVANCED_MATH.plus(  number1, number2) as result from ADVANCED_MATH_SELECT_TEST_TABLE;
      ut.expect( l_actual ).to_equal( l_expected );
   END;

  PROCEDURE ut_divide
   IS
    l_actual   sys_refcursor;
    l_expected sys_refcursor;
   BEGIN
      open l_expected for select 1 as number1,1 as number2,1 as result from dual
                            union all
                          select 2,2,1 from dual
                            union all 
                          select 3,3,1 from dual
                          --  union all 
                          --select 4,4,1 from dual
                          ;
      open l_actual   for select number1, number2,  POUG_2023_APP.ADVANCED_MATH.divide(  number1, number2) as result from ADVANCED_MATH_SELECT_TEST_TABLE;
      ut.expect( l_actual ).to_equal( l_expected );
   END;
 
   PROCEDURE ut_multiply
   IS
    l_actual   sys_refcursor;
    l_expected sys_refcursor;
   BEGIN
      open l_expected for select 1 as number1,1 as number2,1 as result from dual
                            union all
                          select 2,2,4 from dual
                            union all 
                          select 3,3,9 from dual
                          --  union all 
                          --select 4,4,16 from dual
                          ;
      open l_actual   for select number1, number2,  POUG_2023_APP.ADVANCED_MATH.multiply(  number1, number2) as result from ADVANCED_MATH_SELECT_TEST_TABLE;
      ut.expect( l_actual ).to_equal( l_expected );
   END;  
 
   PROCEDURE ut_subtract
   IS
    l_actual   sys_refcursor;
    l_expected sys_refcursor;
   BEGIN
      open l_expected for select 1 as number1,1 as number2,0 as result from dual
                            union all
                          select 2,2,0 from dual
                            union all 
                          select 3,3,0 from dual
                          --  union all 
                          --select 4,4,8 from dual
                          ;
      open l_actual   for select number1, number2,  POUG_2023_APP.ADVANCED_MATH.subtract(  number1, number2) as result from ADVANCED_MATH_SELECT_TEST_TABLE;
      ut.expect( l_actual ).to_equal( l_expected );
   END;
   
end poug_ADVANCED_MATH_select_tests;
/



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE POUG_2023_TEST.POUG_ADVANCED_MATH_select_tests
IS
--%suite(Select tests)
--%suitepath(poug.devtests)
--%rollback(manual)

   PROCEDURE ut_setup;
   PROCEDURE ut_teardown;

--https://www.utplsql.org/utPLSQL/v3.0.0/userguide/annotations.html

--%test(Plus select)  
--%beforetest(ut_setup)
   PROCEDURE ut_plus;
   
--%test(Divide select)  
--%beforetest(ut_setup)
   PROCEDURE ut_divide;

--%test(Multiply select)  
--%beforetest(ut_setup)
   PROCEDURE ut_multiply;

--%test(Subtract select)  
--%beforetest(ut_setup)
   PROCEDURE ut_subtract;

--%test(All operations select)  
--%beforetest(ut_setup)
   PROCEDURE ut_all_operations;   
   
END poug_ADVANCED_MATH_select_tests;
/

CREATE OR REPLACE PACKAGE BODY POUG_2023_TEST.POUG_ADVANCED_MATH_select_tests
IS
   PROCEDURE ut_setup IS
   BEGIN
      execute immediate 'truncate table ADVANCED_MATH_SELECT_TEST_TABLE';
      Insert into POUG_2023_TEST.ADVANCED_MATH_SELECT_TEST_TABLE (NUMBER1,NUMBER2) values ('1','1');
      Insert into POUG_2023_TEST.ADVANCED_MATH_SELECT_TEST_TABLE (NUMBER1,NUMBER2) values ('2','2');
      Insert into POUG_2023_TEST.ADVANCED_MATH_SELECT_TEST_TABLE (NUMBER1,NUMBER2) values ('3','3');
      commit;
   END;
   
   PROCEDURE ut_teardown
   IS
   BEGIN
      NULL;
   END;
  
  PROCEDURE ut_plus
   IS
    l_actual   sys_refcursor;
    l_expected sys_refcursor;
   BEGIN
      open l_expected for select 1 as number1,1 as number2,2 as result from dual
                            union all
                          select 2,2,4 from dual
                            union all 
                          select 3,3,6 from dual
                          --  union all 
                          --select 4,4,8 from dual
                          ;
      open l_actual   for select number1, number2,  POUG_2023_APP.ADVANCED_MATH.plus(  number1, number2) as result from ADVANCED_MATH_SELECT_TEST_TABLE;
      ut.expect( l_actual ).to_equal( l_expected );
   END;

  PROCEDURE ut_divide
   IS
    l_actual   sys_refcursor;
    l_expected sys_refcursor;
   BEGIN
      open l_expected for select 1 as number1,1 as number2,1 as result from dual
                            union all
                          select 2,2,1 from dual
                            union all 
                          select 3,3,1 from dual
                          --  union all 
                          --select 4,4,1 from dual
                          ;
      open l_actual   for select number1, number2,  POUG_2023_APP.ADVANCED_MATH.divide(  number1, number2) as result from ADVANCED_MATH_SELECT_TEST_TABLE;
      ut.expect( l_actual ).to_equal( l_expected );
   END;
 
   PROCEDURE ut_multiply
   IS
    l_actual   sys_refcursor;
    l_expected sys_refcursor;
   BEGIN
      open l_expected for select 1 as number1,1 as number2,1 as result from dual
                            union all
                          select 2,2,4 from dual
                            union all 
                          select 3,3,9 from dual
                          --  union all 
                          --select 4,4,16 from dual
                          ;
      open l_actual   for select number1, number2,  POUG_2023_APP.ADVANCED_MATH.multiply(  number1, number2) as result from ADVANCED_MATH_SELECT_TEST_TABLE;
      ut.expect( l_actual ).to_equal( l_expected );
   END;  
 
   PROCEDURE ut_subtract
   IS
    l_actual   sys_refcursor;
    l_expected sys_refcursor;
   BEGIN
      open l_expected for select 1 as number1,1 as number2,0 as result from dual
                            union all
                          select 2,2,0 from dual
                            union all 
                          select 3,3,0 from dual
                          --  union all 
                          --select 4,4,8 from dual
                          ;
      open l_actual   for select number1, number2,  POUG_2023_APP.ADVANCED_MATH.subtract(  number1, number2) as result from ADVANCED_MATH_SELECT_TEST_TABLE;
      ut.expect( l_actual ).to_equal( l_expected );
   END;

   PROCEDURE ut_all_operations
   IS
    l_actual   sys_refcursor;
    l_expected sys_refcursor;
   BEGIN
      open l_expected for select 1 as number1,1 as number2,2 as plus, 1 as divide, 1 as multiply, 0 as subtract from dual
                            union all
                          select 2,2,4,1,4,0 from dual
                            union all 
                          select 3,3,6,1,9,0 from dual
                          --  union all 
                          --select 4,4,8 from dual
                          ;
      open l_actual   for select number1, number2,  POUG_2023_APP.ADVANCED_MATH.plus(  number1, number2) as plus
                                                 ,  POUG_2023_APP.ADVANCED_MATH.divide(  number1, number2) as divide
                                                 ,  POUG_2023_APP.ADVANCED_MATH.multiply(  number1, number2) as multiply
                                                 ,  POUG_2023_APP.ADVANCED_MATH.subtract(  number1, number2) as subtract from ADVANCED_MATH_SELECT_TEST_TABLE;
      ut.expect( l_actual ).to_equal( l_expected );
   END;

   
end poug_ADVANCED_MATH_select_tests;
/


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


ALTER TABLE ADVANCED_MATH_SELECT_TEST_TABLE 
ADD (plus NUMBER )
ADD (divide NUMBER )
ADD (multiply NUMBER )
ADD (subtract NUMBER );


CREATE OR REPLACE PACKAGE POUG_2023_TEST.POUG_ADVANCED_MATH_select_tests
IS
--%suite(Select tests)
--%suitepath(poug.devtests)
--%rollback(manual)

   PROCEDURE ut_setup;
   PROCEDURE ut_teardown;

--https://www.utplsql.org/utPLSQL/v3.0.0/userguide/annotations.html

--%test(Plus select)  
--%beforetest(ut_setup)
   PROCEDURE ut_plus;
   
--%test(Divide select)  
--%beforetest(ut_setup)
   PROCEDURE ut_divide;

--%test(Multiply select)  
--%beforetest(ut_setup)
   PROCEDURE ut_multiply;

--%test(Subtract select)  
--%beforetest(ut_setup)
   PROCEDURE ut_subtract;

--%test(All operations select)  
--%beforetest(ut_setup)
   PROCEDURE ut_all_operations;   

--%test(All operations update)  
--%beforetest(ut_setup)
   PROCEDURE ut_all_operations_update;   
   
   
END poug_ADVANCED_MATH_select_tests;
/

CREATE OR REPLACE PACKAGE BODY POUG_2023_TEST.POUG_ADVANCED_MATH_select_tests
IS
   PROCEDURE ut_setup IS
   BEGIN
      execute immediate 'truncate table ADVANCED_MATH_SELECT_TEST_TABLE';
      Insert into POUG_2023_TEST.ADVANCED_MATH_SELECT_TEST_TABLE (NUMBER1,NUMBER2) values ('1','1');
      Insert into POUG_2023_TEST.ADVANCED_MATH_SELECT_TEST_TABLE (NUMBER1,NUMBER2) values ('2','2');
      Insert into POUG_2023_TEST.ADVANCED_MATH_SELECT_TEST_TABLE (NUMBER1,NUMBER2) values ('3','3');
      commit;
   END;
   
   PROCEDURE ut_teardown
   IS
   BEGIN
      NULL;
   END;
  
  PROCEDURE ut_plus
   IS
    l_actual   sys_refcursor;
    l_expected sys_refcursor;
   BEGIN
      open l_expected for select 1 as number1,1 as number2,2 as result from dual
                            union all
                          select 2,2,4 from dual
                            union all 
                          select 3,3,6 from dual
                          --  union all 
                          --select 4,4,8 from dual
                          ;
      open l_actual   for select number1, number2,  POUG_2023_APP.ADVANCED_MATH.plus(  number1, number2) as result from ADVANCED_MATH_SELECT_TEST_TABLE;
      ut.expect( l_actual ).to_equal( l_expected );
   END;

  PROCEDURE ut_divide
   IS
    l_actual   sys_refcursor;
    l_expected sys_refcursor;
   BEGIN
      open l_expected for select 1 as number1,1 as number2,1 as result from dual
                            union all
                          select 2,2,1 from dual
                            union all 
                          select 3,3,1 from dual
                          --  union all 
                          --select 4,4,1 from dual
                          ;
      open l_actual   for select number1, number2,  POUG_2023_APP.ADVANCED_MATH.divide(  number1, number2) as result from ADVANCED_MATH_SELECT_TEST_TABLE;
      ut.expect( l_actual ).to_equal( l_expected );
   END;
 
   PROCEDURE ut_multiply
   IS
    l_actual   sys_refcursor;
    l_expected sys_refcursor;
   BEGIN
      open l_expected for select 1 as number1,1 as number2,1 as result from dual
                            union all
                          select 2,2,4 from dual
                            union all 
                          select 3,3,9 from dual
                          --  union all 
                          --select 4,4,16 from dual
                          ;
      open l_actual   for select number1, number2,  POUG_2023_APP.ADVANCED_MATH.multiply(  number1, number2) as result from ADVANCED_MATH_SELECT_TEST_TABLE;
      ut.expect( l_actual ).to_equal( l_expected );
   END;  
 
   PROCEDURE ut_subtract
   IS
    l_actual   sys_refcursor;
    l_expected sys_refcursor;
   BEGIN
      open l_expected for select 1 as number1,1 as number2,0 as result from dual
                            union all
                          select 2,2,0 from dual
                            union all 
                          select 3,3,0 from dual
                          --  union all 
                          --select 4,4,8 from dual
                          ;
      open l_actual   for select number1, number2,  POUG_2023_APP.ADVANCED_MATH.subtract(  number1, number2) as result from ADVANCED_MATH_SELECT_TEST_TABLE;
      ut.expect( l_actual ).to_equal( l_expected );
   END;

   PROCEDURE ut_all_operations
   IS
    l_actual   sys_refcursor;
    l_expected sys_refcursor;
   BEGIN
      open l_expected for select 1 as number1,1 as number2,2 as plus, 1 as divide, 1 as multiply, 0 as subtract from dual
                            union all
                          select 2,2,4,1,4,0 from dual
                            union all 
                          select 3,3,6,1,9,0 from dual
                          --  union all 
                          --select 4,4,8 from dual
                          ;
      open l_actual   for select number1, number2,  POUG_2023_APP.ADVANCED_MATH.plus(  number1, number2) as plus
                                                 ,  POUG_2023_APP.ADVANCED_MATH.divide(  number1, number2) as divide
                                                 ,  POUG_2023_APP.ADVANCED_MATH.multiply(  number1, number2) as multiply
                                                 ,  POUG_2023_APP.ADVANCED_MATH.subtract(  number1, number2) as subtract from ADVANCED_MATH_SELECT_TEST_TABLE;
      ut.expect( l_actual ).to_equal( l_expected );
   END;

   PROCEDURE ut_all_operations_update
   IS
    l_actual   sys_refcursor;
    l_expected sys_refcursor;
   BEGIN
      open l_expected for select 1 as number1,1 as number2,2 as plus, 1 as divide, 1 as multiply, 0 as subtract from dual
                            union all
                          select 2,2,4,1,4,0 from dual
                            union all 
                          select 3,3,6,1,9,0 from dual
                          --  union all 
                          --select 4,4,8 from dual
                          ;
      
      update ADVANCED_MATH_SELECT_TEST_TABLE
      set 
      plus = POUG_2023_APP.ADVANCED_MATH.plus(  number1, number2),
      divide = POUG_2023_APP.ADVANCED_MATH.divide(  number1, number2), 
      multiply = POUG_2023_APP.ADVANCED_MATH.multiply(  number1, number2),
      subtract = POUG_2023_APP.ADVANCED_MATH.subtract(  number1, number2);
      
      open l_actual   for select * from ADVANCED_MATH_SELECT_TEST_TABLE;
      ut.expect( l_actual ).to_equal( l_expected );
   END;


   
end poug_ADVANCED_MATH_select_tests;
/

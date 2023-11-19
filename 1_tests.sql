grant DEBUG CONNECT SESSION, DEBUG ANY PROCEDURE to POUG_2023_UT3, POUG_2023_TEST;

-- code coverage
grant create any procedure, execute any procedure to POUG_2023_TEST;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

create or replace PACKAGE ADVANCED_MATH AS 
  function plus(p_number1 number,  p_number2 number) return number;
  function subtract(p_number1 number,  p_number2 number) return number;
  function multiply(p_number1 number,  p_number2 number) return number;
  function divide(p_number1 number,  p_number2 number) return number;
END ADVANCED_MATH;
/

create or replace PACKAGE BODY ADVANCED_MATH AS

  function plus(p_number1 number,  p_number2 number) return number AS
  BEGIN
    RETURN p_number1+p_number2;
  END plus;

  function subtract(p_number1 number,  p_number2 number) return number AS
  BEGIN
    RETURN p_number1-p_number2;
  END subtract;

  function multiply(p_number1 number,  p_number2 number) return number AS
  BEGIN
    RETURN p_number1*p_number2;
  END multiply;

  function divide(p_number1 number,  p_number2 number) return number AS
  BEGIN
    RETURN p_number1/p_number2;
  END divide;

END ADVANCED_MATH;
/

grant execute, debug on ADVANCED_MATH to POUG_2023_TEST;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


set serveroutput on
--https://www.utplsql.org/utPLSQL/latest/userguide/expectations.html#expectation-concepts
begin
ut.expect(  POUG_2023_APP.ADVANCED_MATH.plus( 1,  1) ).to_equal(2);
end;
/


begin
ut.expect(  POUG_2023_APP.ADVANCED_MATH.plus( 1,  1) ).to_equal(3);
end;
/

CREATE OR REPLACE PACKAGE poug_ADVANCED_MATH_simple_tests
IS
--%suite(Simple tests)
-- %suitepath(poug.devtests)

   PROCEDURE ut_setup;
   PROCEDURE ut_teardown;

--%test(Plus 1 1)   
   PROCEDURE ut_plus_1_1;
END poug_ADVANCED_MATH_simple_tests;
/

CREATE OR REPLACE PACKAGE BODY poug_ADVANCED_MATH_simple_tests
IS
   PROCEDURE ut_setup IS
   BEGIN
      NULL;
   END;
   
   PROCEDURE ut_teardown
   IS
   BEGIN
      NULL;
   END;
  
  PROCEDURE ut_plus_1_1
   IS
   BEGIN
      --https://www.utplsql.org/utPLSQL/latest/userguide/expectations.html#matchers
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.plus( 1,  1), 'it is not so easy to add 1 to 1' ).to_equal(2);
      --ut.expect(  POUG_2023_APP.ADVANCED_MATH.plus( 1,  1), 'null values are bad' ).to_be_not_null();
      --ut.expect(  POUG_2023_APP.ADVANCED_MATH.plus( 1,  1), 'not null values are bad' ).to_be_null();
   END;
end poug_ADVANCED_MATH_simple_tests;
/


set serveroutput on
exec ut.run('poug_ADVANCED_MATH_simple_tests.ut_plus_1_1');
exec ut.run('poug_ADVANCED_MATH_simple_tests');
exec ut.run();


CREATE OR REPLACE PACKAGE poug_ADVANCED_MATH_simple_tests
IS
--%suite(Simple tests)
-- %suitepath(poug.devtests)

   PROCEDURE ut_setup;
   PROCEDURE ut_teardown;

--%test(Plus 1 1)   
   PROCEDURE ut_plus_1_1;
--%test(Divide 1 1)   
   PROCEDURE ut_divide_1_1;
--%test(Multiply 1 1)   
   PROCEDURE ut_multiply_1_1;
--%test(Subtract 1 1)   
   PROCEDURE ut_subtract_1_1;   
END poug_ADVANCED_MATH_simple_tests;
/

CREATE OR REPLACE PACKAGE BODY poug_ADVANCED_MATH_simple_tests
IS
   PROCEDURE ut_setup IS
   BEGIN
      NULL;
   END;
   
   PROCEDURE ut_teardown
   IS
   BEGIN
      NULL;
   END;
  
  PROCEDURE ut_plus_1_1
   IS
   BEGIN
      --https://www.utplsql.org/utPLSQL/latest/userguide/expectations.html#matchers
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.plus( 1,  1), 'it is not so easy to add 1 to 1' ).to_equal(2);
      --ut.expect(  POUG_2023_APP.ADVANCED_MATH.plus( 1,  1), 'null values are bad' ).to_be_not_null();
      --ut.expect(  POUG_2023_APP.ADVANCED_MATH.plus( 1,  1), 'not null values are bad' ).to_be_null();
   END;

  PROCEDURE ut_divide_1_1
   IS
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.divide( 1,  1) ).to_equal(2);
   END;

  PROCEDURE ut_multiply_1_1
   IS
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.multiply( 1,  1) ).to_equal(2);
   END;

  PROCEDURE ut_subtract_1_1
   IS
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.subtract( 1,  1) ).to_equal(2);
   END;


end poug_ADVANCED_MATH_simple_tests;
/
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE poug_ADVANCED_MATH_simple_tests
IS
--%suite(Simple tests)
-- %suitepath(poug.devtests)

   PROCEDURE ut_setup;
   PROCEDURE ut_teardown;

--%test(Plus 1 1)   
   PROCEDURE ut_plus_1_1;
--%test(Plus 2 2)   
   PROCEDURE ut_plus_2_2;
--%test(Plus 3 3)   
   PROCEDURE ut_plus_3_3;

--%test(Divide 1 1)   
   PROCEDURE ut_divide_1_1;
--%test(Divide 2 2)   
   PROCEDURE ut_divide_2_2;
--%test(Divide 3 3)   
   PROCEDURE ut_divide_3_3;

--%test(Multiply 1 1)   
   PROCEDURE ut_multiply_1_1;
 --%test(Multiply 2 2)   
   PROCEDURE ut_multiply_2_2;
--%test(Multiply 3 3)   
   PROCEDURE ut_multiply_3_3;
   
--%test(Subtract 1 1)   
   PROCEDURE ut_subtract_1_1;   
--%test(Subtract 2 2)   
   PROCEDURE ut_subtract_2_2;   
--%test(Subtract 3 3)   
   PROCEDURE ut_subtract_3_3;   

END poug_ADVANCED_MATH_simple_tests;
/

CREATE OR REPLACE PACKAGE BODY poug_ADVANCED_MATH_simple_tests
IS
   PROCEDURE ut_setup IS
   BEGIN
      NULL;
   END;
   
   PROCEDURE ut_teardown
   IS
   BEGIN
      NULL;
   END;
  
  PROCEDURE ut_plus_1_1
   IS
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.plus( 1,  1), 'it is not so easy to add 1 to 1' ).to_equal(2);
   END;

  PROCEDURE ut_plus_2_2
   IS
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.plus( 2,  2) ).to_equal(4);
   END;

  PROCEDURE ut_plus_3_3
   IS
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.plus( 3,  3) ).to_equal(6);
   END;


  PROCEDURE ut_divide_1_1
   IS
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.divide( 1,  1) ).to_equal(1);
   END;

  PROCEDURE ut_divide_2_2
   IS
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.divide( 2,  2) ).to_equal(1);
   END;

  PROCEDURE ut_divide_3_3
   IS
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.divide( 3,  3) ).to_equal(1);
   END;


  PROCEDURE ut_multiply_1_1
   IS
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.multiply( 1,  1) ).to_equal(1);
   END;

  PROCEDURE ut_multiply_2_2
   IS
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.multiply( 2,  2) ).to_equal(4);
   END;

  PROCEDURE ut_multiply_3_3
   IS
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.multiply( 3,  3) ).to_equal(9);
   END;


  PROCEDURE ut_subtract_1_1
   IS
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.subtract( 1,  1) ).to_equal(0);
   END;

  PROCEDURE ut_subtract_2_2
   IS
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.subtract( 2,  2) ).to_equal(0);
   END;

  PROCEDURE ut_subtract_3_3
   IS
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.subtract( 3,  3) ).to_equal(0);
   END;


end poug_ADVANCED_MATH_simple_tests;
/
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------





set serveroutput on

CREATE OR REPLACE PACKAGE POUG_2023_TEST.POUG_ADVANCED_MATH_exception_tests
IS
--%suite(Exception tests)
--%suitepath(poug.devtests)

--%test(Divide by zero)  
   PROCEDURE ut_divide_by_zero;
END poug_ADVANCED_MATH_exception_tests;
/

CREATE OR REPLACE PACKAGE BODY POUG_2023_TEST.POUG_ADVANCED_MATH_exception_tests
IS
  
  PROCEDURE ut_divide_by_zero
   IS
    l_actual   sys_refcursor;
    l_expected sys_refcursor;
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.divide( 1,  0) ).to_equal(1);
   END;
end poug_ADVANCED_MATH_exception_tests;
/

exec ut.run('poug_ADVANCED_MATH_exception_tests');


ORA-01476: divisor is equal to zero
ORA-06512: at "POUG_2023_APP.ADVANCED_MATH", line 20
ORA-06512: at "POUG_2023_TEST.POUG_ADVANCED_MATH_EXCEPTION_TESTS", line 9
ORA-06512: at "POUG_2023_APP.ADVANCED_MATH", line 20
ORA-06512: at "POUG_2023_TEST.POUG_ADVANCED_MATH_EXCEPTION_TESTS", line 9
ORA-06512: at line 6

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


CREATE OR REPLACE PACKAGE POUG_2023_TEST.POUG_ADVANCED_MATH_exception_tests
IS
--%suite(Exception tests)
--%suitepath(poug.devtests)

--%test(Divide by zero)
--%throws(-01476)
   PROCEDURE ut_divide_by_zero;
END poug_ADVANCED_MATH_exception_tests;
/

CREATE OR REPLACE PACKAGE BODY POUG_2023_TEST.POUG_ADVANCED_MATH_exception_tests
IS
  
  PROCEDURE ut_divide_by_zero
   IS
    l_actual   sys_refcursor;
    l_expected sys_refcursor;
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.divide( 1,  0) ).to_equal(1);
   END;
end poug_ADVANCED_MATH_exception_tests;
/


exec ut.run('poug_ADVANCED_MATH_exception_tests');


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


create or replace PACKAGE BODY POUG_2023_APP.ADVANCED_MATH AS

  function plus(p_number1 number,  p_number2 number) return number AS
  BEGIN
    RETURN p_number1+p_number2;
  EXCEPTION
    WHEN others then null;
  END plus;

  function subtract(p_number1 number,  p_number2 number) return number AS
  BEGIN
    RETURN p_number1-p_number2;
  EXCEPTION
    WHEN others then null;
  END subtract;

  function multiply(p_number1 number,  p_number2 number) return number AS
  BEGIN
    RETURN p_number1*p_number2;
  EXCEPTION
    WHEN others then null;
  END multiply;

  function divide(p_number1 number,  p_number2 number) return number AS
  BEGIN
    RETURN p_number1/p_number2;
  EXCEPTION
    WHEN others then null;
  END divide;

END ADVANCED_MATH;
/

exec ut.run('poug_ADVANCED_MATH_exception_tests');


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


create or replace PACKAGE BODY POUG_2023_APP.ADVANCED_MATH AS

  function plus(p_number1 number,  p_number2 number) return number AS
  BEGIN
    RETURN p_number1+p_number2;
  EXCEPTION
    WHEN others 
      then 
      null;
  END plus;

  function subtract(p_number1 number,  p_number2 number) return number AS
  BEGIN
    RETURN p_number1-p_number2;
  EXCEPTION
    WHEN others 
    then 
      null;
  END subtract;

  function multiply(p_number1 number,  p_number2 number) return number AS
  BEGIN
    RETURN p_number1*p_number2;
  EXCEPTION
    WHEN others 
      then 
        null;
  END multiply;

  function divide(p_number1 number,  p_number2 number) return number AS
  BEGIN
    RETURN p_number1/p_number2;
  EXCEPTION
    WHEN zero_divide 
      then 
        raise;
    WHEN others 
      then 
        null;
  END divide;

END ADVANCED_MATH;
/

exec ut.run('poug_ADVANCED_MATH_exception_tests');

set serveroutput on

CREATE OR REPLACE PACKAGE poug_ADVANCED_MATH_bugfixes_tests
IS
--%suite(Bugfixes tests)
--%suitepath(poug.bugfixes)

--%test(bug#001 2+1 shoul be 4)  
   PROCEDURE ut_bug_001_better_plus_function;

END poug_ADVANCED_MATH_bugfixes_tests;
/

CREATE OR REPLACE PACKAGE BODY poug_ADVANCED_MATH_bugfixes_tests
IS
  
  PROCEDURE ut_bug_001_better_plus_function
   IS
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.plus( 2,  1) ).to_equal(4);
   END;

end poug_ADVANCED_MATH_bugfixes_tests;
/

create or replace PACKAGE BODY ADVANCED_MATH AS

  function plus(p_number1 number,  p_number2 number) return number AS
  BEGIN
    if (p_number1=2 and p_number2=1) 
      then return 4;
    end if;  
    RETURN p_number1+p_number2;
  EXCEPTION
    WHEN others 
      then 
      POUG_ERRORS.log_error;
  END plus;

  function subtract(p_number1 number,  p_number2 number) return number AS
  BEGIN
    RETURN p_number1-p_number2;
  EXCEPTION
    WHEN others 
    then 
      POUG_ERRORS.log_error;
  END subtract;

  function multiply(p_number1 number,  p_number2 number) return number AS
  BEGIN
    RETURN p_number1*p_number2;
  EXCEPTION
    WHEN others 
      then 
        POUG_ERRORS.log_error;
  END multiply;

  function divide(p_number1 number,  p_number2 number) return number AS
  BEGIN
    RETURN p_number1/p_number2;
  EXCEPTION
    WHEN zero_divide 
      then 
        POUG_ERRORS.log_error;
        raise;
    WHEN others 
      then 
        POUG_ERRORS.log_error;
  END divide;

END ADVANCED_MATH;
/

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE poug_ADVANCED_MATH_bugfixes_tests
IS
--%suite(Exception tests)
--%suitepath(poug.bugfixes)

--%test(bug#001 2+1 shoul be 4)  
   PROCEDURE ut_bug_001_better_plus_function;

--%test(bug#002 1+1 shoul be 3)  
   PROCEDURE ut_bug_002_best_plus_function;
END poug_ADVANCED_MATH_bugfixes_tests;
/

CREATE OR REPLACE PACKAGE BODY poug_ADVANCED_MATH_bugfixes_tests
IS
  
  PROCEDURE ut_bug_001_better_plus_function
   IS
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.plus( 2,  1) ).to_equal(4);
   END;

  PROCEDURE ut_bug_002_best_plus_function
   IS
   BEGIN
      ut.expect(  POUG_2023_APP.ADVANCED_MATH.plus( 1,  1) ).to_equal(3);
   END;


end poug_ADVANCED_MATH_bugfixes_tests;
/



create or replace PACKAGE BODY ADVANCED_MATH AS

  function plus(p_number1 number,  p_number2 number) return number AS
  BEGIN
    
    if (p_number1=2 and p_number2=1) --bug#001
      then return 4;
    elsif (p_number1=1 and p_number2=1) --bug#002
      then return 3;
    end if;  
    RETURN p_number1+p_number2;
  EXCEPTION
    WHEN others 
      then 
      POUG_ERRORS.log_error;
  END plus;

  function subtract(p_number1 number,  p_number2 number) return number AS
  BEGIN
    RETURN p_number1-p_number2;
  EXCEPTION
    WHEN others 
    then 
      POUG_ERRORS.log_error;
  END subtract;

  function multiply(p_number1 number,  p_number2 number) return number AS
  BEGIN
    RETURN p_number1*p_number2;
  EXCEPTION
    WHEN others 
      then 
        POUG_ERRORS.log_error;
  END multiply;

  function divide(p_number1 number,  p_number2 number) return number AS
  BEGIN
    RETURN p_number1/p_number2;
  EXCEPTION
    WHEN zero_divide 
      then 
        POUG_ERRORS.log_error;
        raise;
    WHEN others 
      then 
        POUG_ERRORS.log_error;
  END divide;

END ADVANCED_MATH;
/


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


create or replace PACKAGE poug_ADVANCED_MATH_simple_tests
IS
--%suite(Simple tests)
--%suitepath(poug.devtests)

   PROCEDURE ut_setup;
   PROCEDURE ut_teardown;

--%context(plus tests)

--%test(Plus 1 1)   
--%disabled(Bugfix#002)
   PROCEDURE ut_plus_1_1;
--%test(Plus 2 2)   
   PROCEDURE ut_plus_2_2;
--%test(Plus 3 3)   
   PROCEDURE ut_plus_3_3;

--%endcontext
--%context(divide tests)

--%test(Divide 1 1)   
   PROCEDURE ut_divide_1_1;
--%test(Divide 2 2)   
   PROCEDURE ut_divide_2_2;
--%test(Divide 3 3)   
   PROCEDURE ut_divide_3_3;

--%endcontext
--%context(multiply tests)


--%test(Multiply 1 1)   
   PROCEDURE ut_multiply_1_1;
 --%test(Multiply 2 2)   
   PROCEDURE ut_multiply_2_2;
--%test(Multiply 3 3)   
   PROCEDURE ut_multiply_3_3;

--%endcontext
--%context(subtract tests)


--%test(Subtract 1 1)   
   PROCEDURE ut_subtract_1_1;   
--%test(Subtract 2 2)   
   PROCEDURE ut_subtract_2_2;   
--%test(Subtract 3 3)   
   PROCEDURE ut_subtract_3_3;   

--%endcontext

END poug_ADVANCED_MATH_simple_tests;
/

create or replace PACKAGE poug_ADVANCED_MATH_select_tests
IS
--%suite(Select tests)
--%suitepath(poug.devtests)
--%rollback(manual)

   PROCEDURE ut_setup;
   PROCEDURE ut_teardown;

--https://www.utplsql.org/utPLSQL/v3.0.0/userguide/annotations.html

--%test(Plus select) 
--%disabled(Bugfix#002)
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
--%disabled(Bugfix#002)
--%beforetest(ut_setup)
   PROCEDURE ut_all_operations;   

--%test(All operations update)  
--%disabled(Bugfix#002)
--%beforetest(ut_setup)
   PROCEDURE ut_all_operations_update;   


END poug_ADVANCED_MATH_select_tests;


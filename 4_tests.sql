--https://www.utplsql.org/utPLSQL/latest/userguide/coverage.html
set serveroutput on
spool c:\Users\Mariusz.Masewicz\Desktop\utplsql-reports\poug_coverage.html
exec ut.run('POUG_2023_TEST', ut_coverage_html_reporter(),              a_include_objects=>ut_varchar2_list('POUG_2023_APP.ADVANCED_MATH'),             a_coverage_schemes=>ut_varchar2_list('POUG_2023_APP'));
spool off

CREATE OR REPLACE PACKAGE POUG_ERRORS AS 
  procedure log_error; 
  procedure write_error;
  procedure write_error_to_table;
END POUG_ERRORS;
/

CREATE OR REPLACE PACKAGE BODY POUG_ERRORS AS 
  procedure log_error is
  BEGIN
    write_error();
  END; 
  procedure write_error is
  BEGIN
    write_error_to_table;
  END;
  procedure write_error_to_table is
  BEGIN
    null;
  END;
END POUG_ERRORS;
/

create or replace PACKAGE BODY ADVANCED_MATH AS

  function plus(p_number1 number,  p_number2 number) return number AS
  BEGIN
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

spool c:\Users\Mariusz.Masewicz\Desktop\utplsql-reports\poug_coverage.html
exec ut.run('POUG_2023_TEST', ut_coverage_html_reporter(),              a_include_objects=>ut_varchar2_list('POUG_2023_APP.ADVANCED_MATH','POUG_2023_APP.POUG_ERRORS'),             a_coverage_schemes=>ut_varchar2_list('POUG_2023_APP'));
spool off

--https://www.utplsql.org/utPLSQL/latest/userguide/coverage.html#coverage-reporting-options

spool c:\Users\Mariusz.Masewicz\Desktop\utplsql-reports\poug_coverage.html
exec ut.run('POUG_2023_TEST', ut_coverage_html_reporter(),              a_include_schema_expr=>'POUG_2023_APP',             a_coverage_schemes=>ut_varchar2_list('POUG_2023_APP'));
spool off


exec ut.run(ut_coverage_html_reporter ());
exec ut.run(ut_coveralls_reporter ());
exec ut.run(ut_coverage_sonar_reporter ());
exec ut.run(ut_coverage_cobertura_reporter ());

exec ut.run(ut_documentation_reporter());
exec ut.run(ut_documentation_reporter(), a_color_console=>true);
exec ut.run(ut_junit_reporter());
exec ut.run(ut_tfs_junit_reporter());
exec ut.run(ut_teamcity_reporter());
exec ut.run(ut_sonar_test_reporter());
exec ut.run(ut_debug_reporter());



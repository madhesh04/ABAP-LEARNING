CLASS zcl_basics_data_obj DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    " Makes the class executable from Eclipse (ADT)
    INTERFACES if_oo_adt_classrun.

ENDCLASS.



CLASS zcl_basics_data_obj IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*--------------------------------------------------------------*
* 1. CONSTANTS
*--------------------------------------------------------------*
* Constants are fixed values. Once assigned, they cannot change.
*--------------------------------------------------------------*

    CONSTANTS:
      lc_company TYPE string VALUE 'Q-Labs',
      lc_country TYPE string VALUE 'India',
      lc_tax     TYPE i      VALUE 18.



*--------------------------------------------------------------*
* 2. CUSTOM TYPES
*--------------------------------------------------------------*
* TYPES create your own reusable data type.
*--------------------------------------------------------------*

    TYPES:
      BEGIN OF ty_employee,
        emp_id       TYPE i,
        emp_name     TYPE string,
        emp_age      TYPE i,
        emp_salary   TYPE p LENGTH 8 DECIMALS 2,
        joining_date TYPE d,
      END OF ty_employee.

*--------------------------------------------------------------*
* 3. DATA OBJECTS (VARIABLES)
*--------------------------------------------------------------*

    DATA:
      lv_name      TYPE string,
      lv_age       TYPE i,
      lv_join_date TYPE d,
      lv_salary    TYPE p LENGTH 8 DECIMALS 2,
      lv_grade     TYPE c LENGTH 1,
      lv_result    TYPE i,
      ls_employee  TYPE ty_employee.

*--------------------------------------------------------------*
* 4. VARIABLE ASSIGNMENT
*--------------------------------------------------------------*

    lv_name      = 'Madhesh'.
    lv_age       = 22.
    lv_join_date = '20260708'.
    lv_salary    = '25000.50'.
    lv_grade     = 'A'.

*--------------------------------------------------------------*
* 5. STRUCTURE ASSIGNMENT
*--------------------------------------------------------------*

    ls_employee-emp_id       = 101.
    ls_employee-emp_name     = lv_name.
    ls_employee-emp_age      = lv_age.
    ls_employee-emp_salary   = lv_salary.
    ls_employee-joining_date = lv_join_date.


*--------------------------------------------------------------*
* 6. DISPLAY CONSTANTS
*--------------------------------------------------------------*

    out->write( '=============================' ).
    out->write( '      COMPANY DETAILS' ).
    out->write( '=============================' ).

    out->write( |Company : { lc_company }| ).
    out->write( |Country : { lc_country }| ).
    out->write( |GST (%) : { lc_tax }| ).

*--------------------------------------------------------------*
* 7. DISPLAY VARIABLES
*--------------------------------------------------------------*

    out->write( ' ' ).

    out->write( '=============================' ).
    out->write( '     VARIABLE DETAILS' ).
    out->write( '=============================' ).

    out->write( |Name         : { lv_name }| ).
    out->write( |Age          : { lv_age }| ).
    out->write( |Joining Date : { lv_join_date }| ).
    out->write( |Salary       : { lv_salary }| ).
    out->write( |Grade        : { lv_grade }| ).

*--------------------------------------------------------------*
* 8. DISPLAY STRUCTURE
*--------------------------------------------------------------*

    out->write( ' ' ).

    out->write( '=============================' ).
    out->write( '    EMPLOYEE STRUCTURE' ).
    out->write( '=============================' ).

    out->write( |Employee ID : { ls_employee-emp_id }| ).
    out->write( |Employee    : { ls_employee-emp_name }| ).
    out->write( |Age         : { ls_employee-emp_age }| ).
    out->write( |Salary      : { ls_employee-emp_salary }| ).
    out->write( |Joining     : { ls_employee-joining_date }| ).

*--------------------------------------------------------------*
* 9. ARITHMETIC OPERATORS
*--------------------------------------------------------------*

    out->write( ' ' ).

    out->write( '=============================' ).
    out->write( ' ARITHMETIC OPERATORS' ).
    out->write( '=============================' ).

* Addition
    lv_result = 20 + 10.
    out->write( |20 + 10 = { lv_result }| ).

* Subtraction
    lv_result = 20 - 10.
    out->write( |20 - 10 = { lv_result }| ).

* Multiplication
    lv_result = 20 * 10.
    out->write( |20 * 10 = { lv_result }| ).

* Division
    lv_result = 20 / 10.
    out->write( |20 / 10 = { lv_result }| ).

* MOD (Remainder)
    lv_result = 20 MOD 3.
    out->write( |20 MOD 3 = { lv_result }| ).

* Power
    lv_result = 2 ** 5.
    out->write( |2 ** 5 = { lv_result }| ).

*--------------------------------------------------------------*
* 10. STRING TEMPLATE EXAMPLES
*--------------------------------------------------------------*

    out->write( ' ' ).

    out->write( '=============================' ).
    out->write( ' STRING TEMPLATES' ).
    out->write( '=============================' ).

    out->write(
      |Hello { lv_name }, Welcome to ABAP Programming!|
    ).

    out->write(
      |Next year your age will be { lv_age + 1 }.|
    ).

    out->write(
      |Your monthly salary is { lv_salary }.|
    ).

    out->write( ' ' ).

    out->write( '=============================' ).
    out->write( '    EMPLOYEE STRUCTURE' ).
    out->write( '=============================' ).



    out->write( ls_employee ).



  ENDMETHOD.

ENDCLASS.

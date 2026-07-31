CLASS zcl_internal_table_learn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .


    " Blue print of the employee defined..
    TYPES :
      BEGIN OF ty_employee,
        empid   TYPE i,
        empname TYPE string,
        empdept TYPE string,
        salary  TYPE p LENGTH 8 DECIMALS 2,

      END OF ty_employee.


    " Structure and Internal Table Defined.

    DATA ls_employee TYPE ty_employee.

    "standard Internal Table
    "DATA lt_employee TYPE TABLE OF ty_employee.

    "sorted table -> must need to define the key
    DATA lt_employee type SORTED TABLE OF ty_employee WITH UNIQUE KEY empid.





  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_internal_table_learn IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " Employee1
    ls_employee-empid = 101.
    ls_employee-empname = 'Harsh'.
    ls_employee-empdept = 'ABAP'.
    ls_employee-salary = 15000.

    APPEND ls_employee TO lt_employee.

    " Employee2
    ls_employee-empid = 102.
    ls_employee-empname = 'PRATHAM'.
    ls_employee-empdept = 'FIORD'.
    ls_employee-salary = 17000.

    APPEND ls_employee TO lt_employee.

    " Employee3
    ls_employee-empid = 103.
    ls_employee-empname = 'Jinal'.
    ls_employee-empdept = 'Computer Network'.
    ls_employee-salary = 30000.

    APPEND ls_employee TO lt_employee.

    " Employee4
    ls_employee-empid = 104.
    ls_employee-empname = 'Karan'.
    ls_employee-empdept = 'AI'.
    ls_employee-salary = 19000.

    APPEND ls_employee TO lt_employee.

    " Employee5
    ls_employee-empid = 105.
    ls_employee-empname = 'Om More'.
    ls_employee-empdept = 'CSE'.
    ls_employee-salary = 50000.

    APPEND ls_employee TO lt_employee.

    INSERT ls_employee INTO lt_employee INDEX 1.



    out->write( 'Internal Tables Learning' ).
    out->write( '--------------------------------------------' ).
    out->write( '--------------------------------------------' ).
    out->write( 'Table Before' ).
    out->write( lt_employee ).




    DELETE lt_employee WHERE empid = 103.





    "  out->write( lt_employee )."

    " Read Method of Internal Table -> search employee
    "READ TABLE lt_employee INTO ls_employee WITH KEY empid = 101.
    READ TABLE lt_employee INTO ls_employee INDEX 1.



    " 0 -> success
    " 4 -> statement ran successfully, no data is there.
    " 8 -> entire operation failed..

    IF sy-subrc = 0.

      " Update the salary by Modify

      ls_employee-salary = '40000'.

      MODIFY lt_employee FROM ls_employee INDEX 1.

      out->write( '--------------------------------------------' ).
      out->write( '--------------------------------------------' ).

      out->write( 'Salary has been modified - find the updated data below..' ).

      out->write( |Id: { ls_employee-empid }| ).
      out->write( |Name: { ls_employee-empname }| ).
      out->write( |Dept: { ls_employee-empdept }| ).
      out->write( |Salary: { ls_employee-salary }| ).


    ELSE.

      out->write( 'Employee Not Found' ).

    ENDIF.

    out->write( '--------------------------------------------' ).
    out->write( '--------------------------------------------' ).
    out->write( 'Table After' ).
    out->write( lt_employee ).



  ENDMETHOD.
ENDCLASS.

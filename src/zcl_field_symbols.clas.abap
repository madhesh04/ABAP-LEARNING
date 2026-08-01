CLASS zcl_field_symbols DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    TYPES:
      BEGIN OF ty_employee,
        empid   TYPE i,
        empname TYPE string,
        empdept TYPE string,
        salary  TYPE p LENGTH 8 DECIMALS 2,
      END OF ty_employee.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_field_symbols IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA ls_employee TYPE ty_employee.

    FIELD-SYMBOLS <fs_employee> TYPE ty_employee.

    ls_employee-empid = 101.
    ls_employee-empname = 'Aditya'.
    ls_employee-empdept = 'Microsoft'.
    ls_employee-salary = 20000.

    ASSIGN ls_employee TO <fs_employee>.

    <fs_employee>-salary = 1000.

    out->write( 'Employee Details' ).
    out->write( |ID : { ls_employee-empid }| ).
    out->write( |Name : { ls_employee-empname }| ).
    out->write( |Dept : { ls_employee-empdept }| ).
    out->write( |Salary : { ls_employee-salary }| ).

  ENDMETHOD.
ENDCLASS.

CLASS zcl_internal_tables1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

*-----------------------------------------------------------------------
* Structure Definition
*-----------------------------------------------------------------------
    TYPES:
      BEGIN OF ty_employee,
        empid   TYPE i,
        empname TYPE string,
        empdept TYPE string,
        salary  TYPE p LENGTH 8 DECIMALS 2,
      END OF ty_employee.

*-----------------------------------------------------------------------
* Work Area & Internal Table
*-----------------------------------------------------------------------
    DATA ls_employee TYPE ty_employee.
    DATA lt_employee TYPE SORTED TABLE OF ty_employee WITH UNIQUE KEY empid.

    "Hash Table
    DATA lt_employee1 TYPE HASHED TABLE OF ty_employee WITH UNIQUE KEY empid.

    "with empty key. -> NO KEY DEFINED AT ALL
    "with unique key empid. -> ENFOIRCES THE TABLE TO USE THE GIVEN COLUMN AS A KEY
    "with default key.USIGING THE NON-NUMERIC ELEMENTARY FILEDS AS KEY
    "with non-unique key empid. -> ALLOW DUPLICATE KEYS, INDEXED LOOKUP.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_internal_tables1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*-----------------------------------------------------------------------
* Employee 1
*-----------------------------------------------------------------------
    ls_employee-empid   = 1002.
    ls_employee-empname = 'Rahul'.
    ls_employee-empdept = 'SAP'.
    ls_employee-salary  = '15000'.

    "APPEND ls_employee TO lt_employee.
    INSERT ls_employee INTO TABLE lt_employee.
    INSERT ls_employee INTO TABLE lt_employee1.


*-----------------------------------------------------------------------
* Employee 2
*-----------------------------------------------------------------------
    ls_employee-empid   = 1003.
    ls_employee-empname = 'Priya'.
    ls_employee-empdept = 'HR'.
    ls_employee-salary  = '12000'.

    "APPEND ls_employee TO lt_employee.
    INSERT ls_employee INTO TABLE lt_employee.
    INSERT ls_employee INTO TABLE lt_employee1.

    " Duplicate values

*-----------------------------------------------------------------------
* Employee 3
*-----------------------------------------------------------------------
    ls_employee-empid   = 1001.
    ls_employee-empname = 'David'.
    ls_employee-empdept = 'Finance'.
    ls_employee-salary  = '18000'.

    "APPEND ls_employee TO lt_employee.
    INSERT ls_employee INTO TABLE lt_employee.
    INSERT ls_employee INTO TABLE lt_employee1.


**********************************************************************
*Displaying the Table
**********************************************************************

    out->write( '=================== Initial Sorted Table===========================' ).

    LOOP AT lt_employee INTO ls_employee.

      out->write( |{ ls_employee-empid } { ls_employee-empname } { ls_employee-empdept } { ls_employee-salary } | ).

    ENDLOOP.

**********************************************************************
    "Operations on the Sorted Table..


**********************************************************************
    " Read Operation
**********************************************************************

    out->write( '' ).

    out->write( '============Read Employee=========' ).

    READ TABLE lt_employee INTO ls_employee WITH KEY empid = 1001.

    IF sy-subrc = 0.

      out->write( |Employee Name: { ls_employee-empname }| ).

    ELSE.

      out->write( 'Employee Not Found' ).


    ENDIF.



**********************************************************************
* Modify Operation
**********************************************************************

    out->write( '============Modify Employee=========' ).

    READ TABLE lt_employee INTO ls_employee WITH KEY empid = 1003.

    IF sy-subrc = 0.

      ls_employee-salary = '30000'.

      MODIFY TABLE lt_employee FROM ls_employee.

      out->write( '' ).
      out->write( 'The employee data has been modified successfully' ).


    ENDIF.

**********************************************************************
    " Delete Operation
**********************************************************************

    out->write( '' ).

    DELETE TABLE lt_employee FROM VALUE #( empid = 1003 ).

    out->write( '' ).
    out->write( 'The employee data has been deleted successfully.' ).


**********************************************************************
    " Display Final Table
**********************************************************************

   " LOOP AT lt_employee INTO ls_employee.

    "  out->write( | { ls_employee-empid } { ls_employee-empname } { ls_employee-empdept } { ls_employee-salary } | ).

   " ENDLOOP.


   out->write( lt_employee ).


  ENDMETHOD.
ENDCLASS.

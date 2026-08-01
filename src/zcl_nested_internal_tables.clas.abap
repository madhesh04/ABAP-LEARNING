CLASS zcl_nested_internal_tables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .


**********************************************************************
* Employee Structure
**********************************************************************

    TYPES:
      BEGIN OF ty_employee,
        empid   TYPE i,
        empname TYPE string,
        empdpt  TYPE string,
        salary  TYPE string,
      END OF ty_employee.


**********************************************************************
* Employee Internal Table
**********************************************************************

    TYPES tt_employee TYPE STANDARD TABLE OF ty_employee WITH EMPTY KEY.



**********************************************************************
* Company Structure
**********************************************************************

    TYPES:
      BEGIN OF ty_company,
        company_id   TYPE i,
        company_name TYPE string,
        employees    TYPE tt_employee,
      END OF ty_company.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_nested_internal_tables IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


**********************************************************************
* Work Area
**********************************************************************

    DATA ls_company TYPE ty_company.
    DATA ls_employee TYPE ty_employee.


**********************************************************************
* Company Details
**********************************************************************

    ls_company-company_id = 1001.
    ls_company-company_name = 'ABC TECHNOLOGIES'.

**********************************************************************
* Employee 1
**********************************************************************

    ls_employee-empid = 101.
    ls_employee-empname = 'Mayank'.
    ls_employee-empdpt = 'AI'.
    ls_employee-salary = 50000.

    APPEND ls_employee TO ls_company-employees.

**********************************************************************
* Employee 2
**********************************************************************

    ls_employee-empid = 102.
    ls_employee-empname = 'Karan'.
    ls_employee-empdpt = 'FIORI'.
    ls_employee-salary = 60000.

    APPEND ls_employee TO ls_company-employees.


**********************************************************************
* Employee 3
**********************************************************************

    ls_employee-empid = 103.
    ls_employee-empname = 'Pratham'.
    ls_employee-empdpt = 'ABAP'.
    ls_employee-salary = 40000.

    APPEND ls_employee TO ls_company-employees.

**********************************************************************
* Employee 4
**********************************************************************

    ls_employee-empid = 104.
    ls_employee-empname = 'Patel Darshkumar Bhaii'.
    ls_employee-empdpt = 'Networking'.
    ls_employee-salary = 90000.

    APPEND ls_employee TO ls_company-employees.

**********************************************************************
* Display Company
**********************************************************************

    out->write( '====================== Company Details ======================' ).

    out->write( |Company ID: { ls_company-company_id }| ).
    out->write( |Company Name: { ls_company-company_name }| ).

    out->write( '' ).

    out->write( '====================== Employees ======================' ).

**********************************************************************
* Loop on the Nested Internal Table
**********************************************************************

    LOOP AT ls_company-employees INTO ls_employee.

      out->write( |{ ls_employee-empid } { ls_employee-empname } { ls_employee-empdpt } { ls_employee-salary }| ).

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.

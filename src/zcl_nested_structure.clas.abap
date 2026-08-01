CLASS zcl_nested_structure DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    " Nested Structure Declaration.

    TYPES:
      BEGIN OF ty_address,
        house_no TYPE string,
        street   TYPE string,
        city     TYPE string,
        state    TYPE string,
        pincode  TYPE string,
      END OF ty_address.



    TYPES:
      BEGIN OF ty_employee,
        empid   TYPE i,
        empname TYPE string,
        empdept TYPE string,
        salary  TYPE p LENGTH 8 DECIMALS 2,
        address TYPE ty_address,
      END OF ty_employee.


    "work area
    DATA ls_employee TYPE ty_employee.
    "DATA ls_address type ty_address.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_nested_structure IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


**********************************************************************
* Employee Details
**********************************************************************

    ls_employee-empid = 101.
    ls_employee-empname = 'Harsh'.
    ls_employee-empdept = 'ABAP'.
    ls_employee-salary = 45000.

**********************************************************************
* Address Details
**********************************************************************

    ls_employee-address-house_no = '121A'.
    ls_employee-address-street = 'WAHOGIDA ROAD'.
    ls_employee-address-city = 'VADODARA'.
    ls_employee-address-state = 'GUJARAT'.
    ls_employee-address-pincode = '391760'.


**********************************************************************
* Display Employees
**********************************************************************

    out->write( '====================== Employee Details ======================' ).

    out->write( |Employee Id: { ls_employee-empid }| ).
    out->write( |Employee Name: { ls_employee-empname }| ).
    out->write( |Employee Dept: { ls_employee-empdept }| ).
    out->write( |Employee Salary: { ls_employee-salary }| ).


**********************************************************************
* Address of the Employee
**********************************************************************

    out->write( '====================== Employee Address ======================' ).

    out->write( |House No: { ls_employee-address-house_no } | ).
    out->write( |Street: { ls_employee-address-street } | ).
    out->write( |City: { ls_employee-address-city } | ).
    out->write( |State: { ls_employee-address-state } | ).
    out->write( |Pincode: { ls_employee-address-pincode } | ).

  ENDMETHOD.
ENDCLASS.

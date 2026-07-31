CLASS zcl_basics DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

    TYPES:
      BEGIN OF ty_employee,
        empid TYPE i,
        name  TYPE string,
        age   TYPE i,
        city  TYPE string,
      END OF ty_employee.

    CONSTANTS lc_line TYPE string VALUE '==============================='.

    METHODS display_message
      IMPORTING
        out TYPE REF TO if_oo_adt_classrun_out.

ENDCLASS.



CLASS zcl_basics IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " Local Variables
    DATA(lv_name) = 'Madhesh'.
    DATA(lv_dept) = 'SAP ABAP'.
    DATA(lv_age)  = 29.
    DATA(lv_pi)   = CONV decfloat34( '3.14' ).

    " Structure Initialization (Modern ABAP)
    DATA(ls_employee) = VALUE ty_employee(
      empid = 101
      name  = 'Madhesh'
      age   = 26
      city  = 'Vadodara'
    ).



    DATA(lv_inlinedec) = 20.

    TYPES:
        BEGIN OF ty_student,
        stdid TYPE i,
        stdname TYPE string,
        stdage TYPE i,

        END OF ty_student.

      DATA(ls_student) = VALUE ty_student(
        stdid = 101
        stdname = 'Madhesh'
        stdage = 25
      ).



      out->write( ls_student ).


    out->write( 'My Information' ).
    out->write( lc_line ).

    out->write( |Name       : { lv_name }| ).
    out->write( |Department : { lv_dept }| ).
    out->write( |Age        : { lv_age }| ).
    out->write( |PI Value   : { lv_pi }| ).

    out->write( lc_line ).



    out->write( 'Employee Structure' ).
    out->write( lc_line ).

    out->write( |Employee ID : { ls_employee-empid }| ).
    out->write( |Name        : { ls_employee-name }| ).
    out->write( |Age         : { ls_employee-age }| ).
    out->write( |City        : { ls_employee-city }| ).

    out->write( lc_line ).

    display_message(
      out = out
    ).

  ENDMETHOD.



  METHOD display_message.

    out->write( 'This is a method.' ).




  ENDMETHOD.

ENDCLASS.

CLASS zcl_variables_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_variables_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data lv_name TYPE string.
  lv_name = 'Madhesh'. " This is the variable assignment.


* This is the type of inline assignment

  data name1 TYPE string VALUE 'Madhesh'.

  out->write( 'This is my Name:' ).
  out->write( lv_name ).
  out->write( name1 ).



  ENDMETHOD.
ENDCLASS.

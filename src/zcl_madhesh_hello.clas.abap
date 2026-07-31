CLASS zcl_madhesh_hello DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_madhesh_hello IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    out->write( 'Modern ABAP Program' ).

    out->write( |User: { sy-uname }| ).

    out->write( |System: { sy-sysid }| ).

    out->write( |Client: { sy-mandt }| ).




    data(lv_days) = 9.

    case lv_days.

    when 1.
        out->write( 'Monday' ).

    when 2.
        out->write( 'Tuesday' ).

    when 3.
        out->write( 'Wednesday' ).

    when 4.
        out->write( 'Thursday' ).

    when 5.
        out->write( 'Friday' ).

    when 6.
        out->write( 'Saturday' ).

    when 7.
        out->write( 'Sunday' ).

    when others.
        out->write( 'Not a day in the week' ).

   ENDCASE.


    TYPES: BEGIN OF ty_student,
             student_id   TYPE i,
             student_name TYPE string,
             course       TYPE string,
             marks        TYPE i,
           END OF ty_student.


     data ls_student type ty_student.
     data lt_student TYPE TABLE of ty_student.

    ls_student-student_id   = 1001.
    ls_student-student_name = 'Rahul'.
    ls_student-course       = 'ABAP'.
    ls_student-marks        = 90.

    APPEND ls_student to lt_student.

    ls_student-student_id   = 1002.
    ls_student-student_name = 'Jagath'.
    ls_student-course       = 'CDS'.
    ls_student-marks        = 85.

    APPEND ls_student to lt_student.


    out->write( lt_student ).

    LOOP AT lt_student INTO ls_student.
    out->write(
      |{ ls_student-student_name }|
  ).

ENDLOOP.




  ENDMETHOD.

ENDCLASS.

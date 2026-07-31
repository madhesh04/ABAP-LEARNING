CLASS zcl_debug_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.



CLASS zcl_debug_demo IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*-----------------------------------------------------------------------
* Structure Definition
*-----------------------------------------------------------------------
    TYPES: BEGIN OF ty_student,
             student_id   TYPE i,
             student_name TYPE string,
             course       TYPE string,
             marks        TYPE i,
             result       TYPE string,
           END OF ty_student.

*-----------------------------------------------------------------------
* Work Area & Internal Table
*-----------------------------------------------------------------------
    DATA ls_student  TYPE ty_student.
    DATA lt_students TYPE TABLE OF ty_student.

*-----------------------------------------------------------------------
* Student 1
*-----------------------------------------------------------------------
    ls_student-student_id   = 1001.
    ls_student-student_name = 'Rahul'.
    ls_student-course       = 'ABAP'.
    ls_student-marks        = 95.

    APPEND ls_student TO lt_students.

*-----------------------------------------------------------------------
* Student 2
*-----------------------------------------------------------------------
    ls_student-student_id   = 1002.
    ls_student-student_name = 'Priya'.
    ls_student-course       = 'ABAP'.
    ls_student-marks        = 82.

    APPEND ls_student TO lt_students.

*-----------------------------------------------------------------------
* Student 3
*-----------------------------------------------------------------------
    ls_student-student_id   = 1003.
    ls_student-student_name = 'David'.
    ls_student-course       = 'ABAP'.
    ls_student-marks        = 67.

    APPEND ls_student TO lt_students.

*-----------------------------------------------------------------------
* Student 4
*-----------------------------------------------------------------------
    ls_student-student_id   = 1004.
    ls_student-student_name = 'John'.
    ls_student-course       = 'ABAP'.
    ls_student-marks        = 45.

    APPEND ls_student TO lt_students.

*-----------------------------------------------------------------------
* Display Header
*-----------------------------------------------------------------------
    out->write( '========== STUDENT RESULT REPORT ==========' ).

*-----------------------------------------------------------------------
* Process Internal Table
*-----------------------------------------------------------------------
    LOOP AT lt_students INTO ls_student.

      IF ls_student-marks >= 90.

        ls_student-result = 'Distinction'.

      ELSEIF ls_student-marks >= 75.

        ls_student-result = 'First Class'.

      ELSEIF ls_student-marks >= 60.

        ls_student-result = 'Second Class'.

      ELSE.

        ls_student-result = 'Fail'.

      ENDIF.

      out->write(
      |ID:{ ls_student-student_id } Name:{ ls_student-student_name } Marks:{ ls_student-marks } Result:{ ls_student-result }|
      ).

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

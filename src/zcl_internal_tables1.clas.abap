CLASS zcl_internal_tables1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    " Type Definition
    TYPES:
       BEGIN OF ty_student,
          studentid type i,
          studentname TYPE string,
          course TYPE string,
          marks TYPE i,

        END OF ty_student.


    DATA ls_student TYPE ty_student.
    DATA lt_student TYPE TABLE of ty_student.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_internal_tables1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

      "Student 1
      ls_student-studentid = 101.
      ls_student-studentname = 'Karan'.
      ls_student-course = 'ABAP'.
      ls_student-marks = 98.

      APPEND ls_student to lt_student.

      "Student 2
      ls_student-studentid = 102.
      ls_student-studentname = 'Harsh'.
      ls_student-course = 'UI5'.
      ls_student-marks = 90.

      APPEND ls_student to lt_student.


      "Student 3
      ls_student-studentid = 103.
      ls_student-studentname = 'PRATHAM'.
      ls_student-course = 'CDS'.
      ls_student-marks = 95.

      APPEND ls_student to lt_student.

      LOOP AT lt_student into ls_student.


      out->write( 'Student Information using the loop At..' ).
      out->write( | { ls_student-studentid }  { ls_student-studentname } { ls_student-course } { ls_student-marks } | ).

      endloop.


      READ TABLE lt_student into DATA(ls_student) INDEX 1.



  ENDMETHOD.
ENDCLASS.

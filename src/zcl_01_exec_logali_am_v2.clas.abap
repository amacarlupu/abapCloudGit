CLASS zcl_01_exec_logali_am_v2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES: if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_exec_logali_am_v2 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*  Version antigua
*    DATA lo_contract TYPE REF TO zcl_01_exec_logali_am_v2.
*    CREATE OBJECT lo_contract.

*    Version alternativa
*     lo_contract = new #(  ).

*   Version actual
    DATA(lo_contract) = NEW zcl_02_contract_logali_am_v2(  ).
    DATA lv_process TYPE string.

    IF lo_contract IS BOUND.
      lo_contract->set_client(
        EXPORTING
          iv_client   = 'Anderson'
          iv_location = 'Huaral'
        IMPORTING
          ev_status   = DATA(lv_status)
        CHANGING
          cv_process  = lv_process
      ).

      lo_contract->get_client(
        IMPORTING
          ev_client = DATA(lv_client)
      ).

      lo_contract->region = 'América'.

    ENDIF.

    out->write( 'Hola Minina' ).
    out->write( |{ lv_client }-{ lv_status }-{ lv_process }-{ lo_contract->region }| ).

  ENDMETHOD.

ENDCLASS.

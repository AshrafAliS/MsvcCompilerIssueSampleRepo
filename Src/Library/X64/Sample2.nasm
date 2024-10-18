;------------------------------------------------------------------------------
;
;
; Module Name:
;
;   Sample2.nasm
;
; Abstract:
;
;   SampleUnUsedFunctionThree function
;
; Notes:
;
;------------------------------------------------------------------------------

    DEFAULT REL
    SECTION .text

;------------------------------------------------------------------------------
; UINTN
; SampleUnUsedFunctionThree (
;   VOID
;   );
;------------------------------------------------------------------------------
global SampleUnUsedFunctionThree
SampleUnUsedFunctionThree:
    mov     rax, 0xdeadbeef
    ret


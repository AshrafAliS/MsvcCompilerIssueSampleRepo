;------------------------------------------------------------------------------
;
; Copyright (c) 2006, Intel Corporation. All rights reserved.<BR>
; SPDX-License-Identifier: BSD-2-Clause-Patent
;
; Module Name:
;
;   WriteDr0.Asm
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


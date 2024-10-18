;------------------------------------------------------------------------------
;
; Copyright (c) 2006, Intel Corporation. All rights reserved.<BR>
; SPDX-License-Identifier: BSD-2-Clause-Patent
;
; Module Name:
;
;   ReadTsc.Asm
;
; Abstract:
;
;   SampleUsedFunctionOne function
;
; Notes:
;
;------------------------------------------------------------------------------

    DEFAULT REL
    SECTION .text

;------------------------------------------------------------------------------
; UINT64
; SampleUsedFunctionOne (
;   VOID
;   );
;------------------------------------------------------------------------------
global SampleUsedFunctionOne
SampleUsedFunctionOne:
    mov  rax, 0xdead1234dead1234
    ret

;------------------------------------------------------------------------------
; UINT64
; SampleUnUsedFunctionTwo (
;   VOID
;   );
;------------------------------------------------------------------------------
global SampleUnUsedFunctionTwo
SampleUnUsedFunctionTwo:
    mov  rax, 0xdead
    ret


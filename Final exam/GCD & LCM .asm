DATA SEGMENT
    NUM1 DW 05H
    NUM2 DW 04H
    GCD  DW ?
    LCM  DW ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA

START:
    MOV AX,DATA
    MOV DS,AX

    ;-------------------------
    ; Find GCD using Euclid's Algorithm
    ;-------------------------

    MOV AX,NUM1
    MOV BX,NUM2

GCD_LOOP:
    CMP BX,0
    JE GCD_FOUND

    MOV DX,0
    DIV BX          ; AX = AX/BX, DX = remainder

    MOV AX,BX       ; AX = old divisor
    MOV BX,DX       ; BX = remainder

    JMP GCD_LOOP

GCD_FOUND:
    MOV GCD,AX

    ;-------------------------
    ; LCM = (NUM1 * NUM2) / GCD
    ;-------------------------

    MOV AX,NUM1
    MUL NUM2        ; DX:AX = NUM1 × NUM2

    DIV GCD         ; AX = LCM

    MOV LCM,AX

    MOV AH,4CH
    INT 21H

CODE ENDS
END START

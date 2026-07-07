DATA SEGMENT
    NUM DW 1234H
    COUNT DW ?
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA

START:
    MOV AX,DATA
    MOV DS,AX

    MOV BX,NUM
    MOV DX,BX          ; Save original BX

    XOR AX,AX          ; AX = count
    MOV CX,16          ; 16 bits

UP:
    ROL BX,1
    JNC NEXT
    INC AX

NEXT:
    LOOP UP

    MOV COUNT,AX
    MOV BX,DX          ; Restore original BX

    MOV AH,4CH
    INT 21H

CODE ENDS
END START

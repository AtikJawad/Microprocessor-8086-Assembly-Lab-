DATA SEGMENT
    ARR DB 50 DUP(10)
    AVG DW ?
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA

START:
    MOV AX,DATA
    MOV DS,AX

    LEA SI,ARR

    XOR AX,AX
    MOV CX,50

UP:
    XOR DX,DX
    MOV DL,[SI]      ; Load byte into DL
    ADD AX,DX        ; Add 16-bit value to AX

    INC SI
    LOOP UP

    MOV BL,50
    DIV BL           ; AX ÷ BL

    MOV AVG,AX

    MOV AH,4CH
    INT 21H

CODE ENDS
END START

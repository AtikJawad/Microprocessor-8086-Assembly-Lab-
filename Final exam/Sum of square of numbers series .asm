DATA SEGMENT
    N   DW 5            ; Limit of the series (n = 5)
    SUM DW ?            ; Variable to store the final sum of squares
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    ; Initialize the Data Segment
    MOV AX, DATA
    MOV DS, AX

    ; Set up the loop counter and sum accumulator
    MOV CX, N           ; Set loop counter 'n' to 5
    MOV BX, 0           ; Clear BX (BX will store the final sum)

SUM_LOOP:
    MOV AX, CX          ; Copy current number (CX) to AX
    MUL CX              ; DX:AX = AX * CX (this squares CX. Result is in AX)
    ADD BX, AX          ; Add the square to our total in BX
LOOP SUM_LOOP           ; Decrement CX by 1, repeat until CX = 0

    ; Store the final sum of the series (55 decimal / 37H hex) in memory
    MOV SUM, BX

    ; Terminate program and return to DOS
    MOV AH, 4CH
    INT 21H
CODE ENDS
END START

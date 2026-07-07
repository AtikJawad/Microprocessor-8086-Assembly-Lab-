DATA SEGMENT
    NUM1 DW 25          ; First number
    NUM2 DW 12          ; Second number
    NUM3 DW 45          ; Third number
    NUM4 DW 7           ; Fourth number (minimum)
    MIN  DW ?           ; Variable to store the final minimum value
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    ; Initialize the Data Segment
    MOV AX, DATA
    MOV DS, AX

    ; Load the values from memory into the registers
    MOV AX, NUM1
    MOV BX, NUM2
    MOV CX, NUM3
    MOV DX, NUM4

    ; --- Logic: Find the Minimum of 4 Registers ---
    
    ; Step 1: Compare AX and BX
    CMP AX, BX
    JLE SKIP1       ; If AX is already Less than or Equal to BX, keep AX
    MOV AX, BX      ; Otherwise, BX is smaller, so move BX to AX

SKIP1:
    ; Step 2: Compare the current AX (min) with CX
    CMP AX, CX
    JLE SKIP2       ; If AX <= CX, keep AX
    MOV AX, CX      ; Otherwise, CX is the new minimum

SKIP2:
    ; Step 3: Compare the current AX (min) with DX
    CMP AX, DX
    JLE DONE        ; If AX <= DX, we are finished
    MOV AX, DX      ; Otherwise, DX is the smallest

DONE:
    ; Store the final minimum value from AX into the MIN variable
    MOV MIN, AX

    ; Terminate program and return to DOS
    MOV AH, 4CH
    INT 21H
CODE ENDS
END START

DATA SEGMENT
    VAL DB 0A5H         ; Input value: 10100101 binary
    REV DB 1 DUP(0)     ; Variable to store the final reversed byte
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    MOV AL, VAL         ; Load input value into AL
    MOV CX, 8           ; Set counter to 8 bits
    MOV BL, 0           ; Clear BL to 00h      

REVERSE_BIT:
    SHR AL, 1           
    ; Shift AL Right. The LSB falls into the Carry Flag (CF).
    RCL BL, 1           
    ; Rotate BL Left through Carry. BL picks up the bit from CF.
LOOP REVERSE_BIT

    MOV REV, BL         ; Store the final reversed result from BL into memory

    MOV AH, 4CH         ; Terminate program
    INT 21H
CODE ENDS
END START

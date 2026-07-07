DATA SEGMENT
    INPUT_VAL DB -5         ; Input is in BL (e.g., -5, which is FBh in 2's complement)
    RESULT     DB ?         
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    MOV BL, INPUT_VAL

    MOV AH, BL          ; Move the byte to AH first

    CMP AH, 0           ; Compare AH with 0 to check the sign
    JGE DONE            ; If AH is Greater than or Equal to 0, it is already positive, so skip
    NEG AH              ; If it's negative, negate it (makes it positive)

DONE:
    MOV RESULT, AH

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START

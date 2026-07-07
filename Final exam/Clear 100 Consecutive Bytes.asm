DATA SEGMENT
    ARRAY DB 100 DUP(55H) 
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    MOV CX, 100             ; Set our loop counter to 100
    MOV SI, OFFSET ARRAY    ; Load the starting address of our array into SI
    MOV AL, 0               ; Load 0 into AL to specify a byte-sized write

CLEAR_LOOP:
    MOV [SI], AL            ; Write the 0 byte in AL to the location SI is pointing to
    INC SI                  ; Move the pointer to the next memory block
LOOP CLEAR_LOOP             ; Decrement CX, repeat until CX = 0

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START

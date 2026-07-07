DATA SEGMENT
    STR1 DB 'HELLO$'    ; Define the input string ending with '$'
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    MOV SI, OFFSET STR1
    MOV CX, 0

PUSH_LOOP:
    MOV AL, [SI]
    CMP AL, '$'        
    JE DONE_PUSH
    
    ; Note: In 16-bit 8086 assembly, we must push a 16-bit register (AX), 
    ; even though we only need the 8-bit character in AL.        
    
    MOV AH, 0           ; Clear AH to avoid garbage data on the stack
    PUSH AX             ; Push character (via AX) onto stack
    
    INC SI
    INC CX              ; Keep track of the character count
    JMP PUSH_LOOP

DONE_PUSH:
    MOV SI, OFFSET STR1 ; Point SI back to the start of the string
    
POP_LOOP:
    POP AX              ; Retrieve the last character pushed (LIFO order)
    MOV [SI], AL        ; Overwrite string with the popped character
    INC SI
    LOOP POP_LOOP      

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START

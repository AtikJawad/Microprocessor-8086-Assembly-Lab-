DATA SEGMENT
    ARR DW 0005H,0090H,0025H,0070H,0035H
    LEN EQU ($-ARR)/2
    LAR DW ?
    DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    
START: MOV AX,DATA
       MOV DS,AX 
       
       LEA SI,ARR
       MOV AX,[SI] ; Assume first element is largest
       MOV CX,LEN-1  
       
COMPARE:        
        CMP AX,[SI+2]
        JGE GREATER
        MOV AX,[SI+2]
GREATER:
        ADD SI,2
        LOOP COMPARE
        
                       
        MOV LAR,AX
        
        MOV AH,4CH
        INT 21H
        CODE ENDS
END START

        
           

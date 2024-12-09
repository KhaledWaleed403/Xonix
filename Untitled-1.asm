.MODEL SMALL
.STACK 64
.DATA
SNAKE_X            DW 40
SNAKE_Y            DW 25
.CODE
MAIN PROC FAR
    MOV AX,@DATA
    MOV DS,AX

    MOV AH,00H
    MOV AL,13H
    INT 10H

        MOV CX,SNAKE_X ;initial value (x)
        MOV DX,SNAKE_Y ;initial value (y)
        DRAW_SNAKE_HORIZONTAL:
 
            MOV AH,0CH    ;write pixels        ;COLOR
            MOV AL,7
            MOV BH,0      ;page number
            INT 10H

            INC CX
            MOV AX,CX     ;cx - snake_x > snake size 
            SUB AX,SNAKE_X
            CMP AX,40
            JNG DRAW_SNAKE_HORIZONTAL
            MOV CX,SNAKE_X ;cx register goes back to initial column
            INC DX         ;advance one line

            MOV AX,DX      ;dx - snake_y > snake size
            SUB AX,SNAKE_Y
            CMP AX,25
            JNG DRAW_SNAKE_HORIZONTAL

MAIN ENDP
END MAIN
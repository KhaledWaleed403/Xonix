.MODEL SMALL
.STACK 64
.DATA
TIME_AUX         DB 0 ;variable used when checking if time changed
ENEMY_X          DW 50H
ENEMY_Y          DW 50H  
ENEMY_SIZE       DW 01H
ENEMY_VELOCITY_X DW 05H
ENEMY_VELOCITY_Y DW 02H
WINDOW_HEIGHT    DW 0C8H
WINDOW_WIDTH     DW 140H
ENEMY2_X          DW 30H
ENEMY2_Y          DW 30H  
ENEMY2_VELOCITY_X DW 01H
ENEMY2_VELOCITY_Y DW 01H
BORDER_X          DW 00H
BORDER_Y          DW 00H
BORDER_SIZE       DW 06H
.CODE

MAIN PROC FAR
    MOV AX,@DATA
    MOV DS,AX

    CALL CLEAR_SCREEN

    CALL DRAW_FULL_BORDER


    CHECK_TIME:
        MOV AH,2CH ;returns: CH=hour, CL=minutes, DH=seconds,DL=1/100 seconds
        INT 21H

        CMP DL,TIME_AUX ;is the current time equal to the previous one?
        JE CHECK_TIME   ;if not then check again                  
        MOV TIME_AUX,DL ;if its different then draw again
        CALL MOVE_ENEMY
        CALL DRAW_ENEMY
        CALL MOVE_ENEMY2
        CALL DRAW_ENEMY2
    JMP CHECK_TIME


RET
MAIN ENDP  

DRAW_ENEMY PROC NEAR
    MOV CX,ENEMY_X ;initial value (x)
    MOV DX,ENEMY_Y ;initial value (y)

    DRAW_ENEMY_HORIZONTAL: 
        MOV AH,0CH    ;write pixels
        MOV AL,3      ;color
        MOV BH,0      ;page number
        INT 10H

        INC CX
        MOV AX,CX     ;cx - snake_x > snake size 
        SUB AX,ENEMY_X
        CMP AX,ENEMY_SIZE
        JNG DRAW_ENEMY_HORIZONTAL
        MOV CX,ENEMY_X ;cx register goes back to initial column
        INC DX         ;advance one line

        MOV AX,DX      ;dx - snake_y > snake size
        SUB AX,ENEMY_Y
        CMP AX,ENEMY_SIZE
    JNG DRAW_ENEMY_HORIZONTAL

    MOV CX,ENEMY_X
    MOV DX,ENEMY_Y
    DEC CX
    MOV AH,0CH
    MOV AL,7
    MOV BH,0
    INT 10H

    INC DX
    MOV AH,0CH
    MOV AL,7
    MOV BH,0
    INT 10H

    INC CX
    INC DX
    MOV AH,0CH
    MOV AL,7
    MOV BH,0
    INT 10H

    INC CX
    MOV AH,0CH
    MOV AL,7
    MOV BH,0
    INT 10H

    INC CX
    DEC DX
    MOV AH,0CH
    MOV AL,7
    MOV BH,0
    INT 10H

    DEC DX
    MOV AH,0CH
    MOV AL,7
    MOV BH,0
    INT 10H

    DEC CX
    DEC DX
    MOV AH,0CH
    MOV AL,7
    MOV BH,0
    INT 10H

    DEC CX
    MOV AH,0CH
    MOV AL,7
    MOV BH,0
    INT 10H



RET            
DRAW_ENEMY ENDP

DELETE_ENEMY PROC NEAR
    MOV CX,ENEMY_X ;initial value (x)
    MOV DX,ENEMY_Y ;initial value (y)

    DELETE_ENEMY_HORIZONTAL: 
        MOV AH,0CH    ;write pixels
        MOV AL,0      ;color
        MOV BH,0      ;page number
        INT 10H

        INC CX
        MOV AX,CX     ;cx - snake_x > snake size 
        SUB AX,ENEMY_X
        CMP AX,ENEMY_SIZE
        JNG DELETE_ENEMY_HORIZONTAL
        MOV CX,ENEMY_X ;cx register goes back to initial column
        INC DX         ;advance one line

        MOV AX,DX      ;dx - snake_y > snake size
        SUB AX,ENEMY_Y
        CMP AX,ENEMY_SIZE
    JNG DELETE_ENEMY_HORIZONTAL

    MOV CX,ENEMY_X
    MOV DX,ENEMY_Y
    DEC CX
    MOV AH,0CH
    MOV AL,0
    MOV BH,0
    INT 10H

    INC DX
    MOV AH,0CH
    MOV AL,0
    MOV BH,0
    INT 10H

    INC CX
    INC DX
    MOV AH,0CH
    MOV AL,0
    MOV BH,0
    INT 10H

    INC CX
    MOV AH,0CH
    MOV AL,0
    MOV BH,0
    INT 10H

    INC CX
    DEC DX
    MOV AH,0CH
    MOV AL,0
    MOV BH,0
    INT 10H

    DEC DX
    MOV AH,0CH
    MOV AL,0
    MOV BH,0
    INT 10H

    DEC CX
    DEC DX
    MOV AH,0CH
    MOV AL,0
    MOV BH,0
    INT 10H

    DEC CX
    MOV AH,0CH
    MOV AL,0
    MOV BH,0
    INT 10H



RET            
DELETE_ENEMY ENDP

CLEAR_SCREEN PROC NEAR

    MOV AH,00H ;video mode
    MOV AL,13H ;type of video mode
    INT 10H

RET
CLEAR_SCREEN ENDP

MOVE_ENEMY PROC NEAR

        CALL DELETE_ENEMY
        MOV AX,ENEMY_VELOCITY_X        ;enemy_x < 8 (collision)
        ADD ENEMY_X,AX                 ;enemy_x > 316 (collision)
    
        CMP ENEMY_X,00H
        JL NEG_VELOCITY_X


        CMP ENEMY_X,320
        JG NEG_VELOCITY_X


        MOV AX,ENEMY_VELOCITY_Y        ;enemy_y < 8 (collision)
        ADD ENEMY_Y,AX                 ;enemy_x > 180 (collision)
        CMP ENEMY_Y,0H
        JL NEG_VELOCITY_Y

        CMP ENEMY_Y,180
        JG NEG_VELOCITY_Y

        MOV CX,ENEMY_X
        MOV DX,ENEMY_Y
        MOV AH,0DH
        MOV BH,0
        INT 10H

        CMP AL,0
        JNE NEG_VELOCITY

    RET

        NEG_VELOCITY:

        NEG_VELOCITY_Y:
            NEG ENEMY_VELOCITY_Y
        RET
        

        NEG_VELOCITY_X:
            NEG ENEMY_VELOCITY_X       ;enemy_velocity_x = - enemy_velocity_x 
        RET

MOVE_ENEMY ENDP

MOVE_ENEMY2 PROC NEAR

        CALL DELETE_ENEMY2
        MOV AX,ENEMY2_VELOCITY_X        ;enemy_x < 8 (collision)
        ADD ENEMY2_X,AX                 ;enemy_x > 316 (collision)
        CMP ENEMY2_X,00H
        JL NEG_VELOCITY_X2


        CMP ENEMY2_X,320
        JG NEG_VELOCITY_X2


        MOV AX,ENEMY2_VELOCITY_Y        ;enemy_y < 8 (collision)
        ADD ENEMY2_Y,AX                 ;enemy_x > 180 (collision)
        CMP ENEMY2_Y,0H
        JL NEG_VELOCITY_Y2


        CMP ENEMY2_Y,180 
        JG NEG_VELOCITY_Y2

    RET

        NEG_VELOCITY_Y2:
            NEG ENEMY2_VELOCITY_Y
        RET
        

        NEG_VELOCITY_X2:
            NEG ENEMY2_VELOCITY_X       ;enemy_velocity_x = - enemy_velocity_x 
        RET

MOVE_ENEMY2 ENDP

DELETE_ENEMY2 PROC NEAR
    MOV CX,ENEMY2_X ;initial value (x)
    MOV DX,ENEMY2_Y ;initial value (y)

    DELETE_ENEMY2_HORIZONTAL: 
        MOV AH,0CH    ;write pixels
        MOV AL,0      ;color
        MOV BH,0      ;page number
        INT 10H

        INC CX
        MOV AX,CX     ;cx - snake_x > snake size 
        SUB AX,ENEMY2_X
        CMP AX,ENEMY_SIZE
        JNG DELETE_ENEMY2_HORIZONTAL
        MOV CX,ENEMY2_X ;cx register goes back to initial column
        INC DX         ;advance one line

        MOV AX,DX      ;dx - snake_y > snake size
        SUB AX,ENEMY2_Y
        CMP AX,ENEMY_SIZE
    JNG DELETE_ENEMY2_HORIZONTAL

    MOV CX,ENEMY2_X
    MOV DX,ENEMY2_Y
    DEC CX
    MOV AH,0CH
    MOV AL,0
    MOV BH,0
    INT 10H

    INC DX
    MOV AH,0CH
    MOV AL,0
    MOV BH,0
    INT 10H

    INC CX
    INC DX
    MOV AH,0CH
    MOV AL,0
    MOV BH,0
    INT 10H

    INC CX
    MOV AH,0CH
    MOV AL,0
    MOV BH,0
    INT 10H

    INC CX
    DEC DX
    MOV AH,0CH
    MOV AL,0
    MOV BH,0
    INT 10H

    DEC DX
    MOV AH,0CH
    MOV AL,0
    MOV BH,0
    INT 10H

    DEC CX
    DEC DX
    MOV AH,0CH
    MOV AL,0
    MOV BH,0
    INT 10H

    DEC CX
    MOV AH,0CH
    MOV AL,0
    MOV BH,0
    INT 10H



RET            
DELETE_ENEMY2 ENDP

DRAW_ENEMY2 PROC NEAR
    MOV CX,ENEMY2_X ;initial value (x)
    MOV DX,ENEMY2_Y ;initial value (y)

    DRAW_ENEMY2_HORIZONTAL: 
        MOV AH,0CH    ;write pixels
        MOV AL,3      ;color
        MOV BH,0      ;page number
        INT 10H

        INC CX
        MOV AX,CX     ;cx - snake_x > snake size 
        SUB AX,ENEMY2_X
        CMP AX,ENEMY_SIZE
        JNG DRAW_ENEMY2_HORIZONTAL
        MOV CX,ENEMY2_X ;cx register goes back to initial column
        INC DX         ;advance one line

        MOV AX,DX      ;dx - snake_y > snake size
        SUB AX,ENEMY2_Y
        CMP AX,ENEMY_SIZE
    JNG DRAW_ENEMY2_HORIZONTAL

    MOV CX,ENEMY2_X
    MOV DX,ENEMY2_Y
    DEC CX
    MOV AH,0CH
    MOV AL,7
    MOV BH,0
    INT 10H

    INC DX
    MOV AH,0CH
    MOV AL,7
    MOV BH,0
    INT 10H

    INC CX
    INC DX
    MOV AH,0CH
    MOV AL,7
    MOV BH,0
    INT 10H

    INC CX
    MOV AH,0CH
    MOV AL,7
    MOV BH,0
    INT 10H

    INC CX
    DEC DX
    MOV AH,0CH
    MOV AL,7
    MOV BH,0
    INT 10H

    DEC DX
    MOV AH,0CH
    MOV AL,7
    MOV BH,0
    INT 10H

    DEC CX
    DEC DX
    MOV AH,0CH
    MOV AL,7
    MOV BH,0
    INT 10H

    DEC CX
    MOV AH,0CH
    MOV AL,7
    MOV BH,0
    INT 10H



RET            
DRAW_ENEMY2 ENDP

DRAW_BORDER PROC NEAR


  DRAW_BORDER_HORIZONTAL: 
    MOV AH,0CH    ;write pixels
    MOV AL,7      ;color
    MOV BH,0      ;page number
    INT 10H

    INC CX
    MOV AX,CX     ;cx - border_x > border size 
    SUB AX,BORDER_X
    CMP AX,BORDER_SIZE
    JNG DRAW_BORDER_HORIZONTAL
    MOV CX,BORDER_X ;cx register goes back to initial column
    INC DX         ;advance one line

    MOV AX,DX      ;dx - border_y > border size
    SUB AX,BORDER_Y
    CMP AX,BORDER_SIZE
    JNG DRAW_BORDER_HORIZONTAL

 RET
DRAW_BORDER ENDP

DRAW_FULL_BORDER PROC NEAR
   TOP_BORDER: 
        MOV CX,BORDER_X ;initial value (x)
        MOV DX,BORDER_Y ;initial value (y)    
        CALL DRAW_BORDER
        INC BORDER_X
        CMP BORDER_X,320
   JB TOP_BORDER

   LEFT_BORDER:
        MOV CX,BORDER_X ;initial value (x)
        MOV DX,BORDER_Y ;initial value (y)
        CALL DRAW_BORDER
        INC BORDER_Y
        CMP BORDER_Y,180
   JB LEFT_BORDER

   MOV BORDER_Y,0
   MOV BORDER_X,313
   RIGHT_BORDER:
        MOV CX,BORDER_X ;initial value (x)
        MOV DX,BORDER_Y ;initial value (y)
        CALL DRAW_BORDER
        INC BORDER_Y
        CMP BORDER_Y,180
   JB RIGHT_BORDER

   MOV BORDER_X,0
   MOV BORDER_Y,180
   BOT_BORDER:
        MOV CX,BORDER_X
        MOV DX,BORDER_Y
        CALL DRAW_BORDER
        INC BORDER_X
        CMP BORDER_X,320
   JB BOT_BORDER

RET
DRAW_FULL_BORDER ENDP

END MAIN
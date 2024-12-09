.MODEL SMALL
.STACK 64
.DATA
TIME_AUX                    DB 0 ;variable used when checking if time changed
TERRITORY_ENEMY_X           DW 2
TERRITORY_ENEMY_Y           DW 30
TERRITORY_ENEMY_VELOCITY_X  DW 01H
TERRITORY_ENEMY_VELOCITY_Y  DW 01H
TERRITORY_ENEMY_SIZE        DW 2H
ENEMY_INSIDE                DW 2H
BORDER_X                    DW 00H
BORDER_Y                    DW 00H
BORDER_SIZE                 DW 06H
ENEMY_TAIL_COLOR            DW 0EH
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
        ;CALL MOVE_TERRITORY_ENEMY
        CALL DRAW_TERRITORY_ENEMY
    JMP CHECK_TIME


RET
MAIN ENDP

CLEAR_SCREEN PROC NEAR

    MOV AH,00H ;video mode
    MOV AL,13H ;type of video mode
    INT 10H

RET
CLEAR_SCREEN ENDP

CHECK_TENEMY_POSITION_COLOR PROC NEAR

    ADD CX,1
    ADD DX,1
    MOV AH,0DH
    INT 10H
    SUB CX,1
    SUB DX,1
    CMP AL,7
    JE INSIDE_BORDER
    CMP AL,3
    JE INSIDE_TERRITORY1
    CMP AL,5
    JE INSIDE_TERRITORY2

    INSIDE_BORDER:
        MOV ENEMY_TAIL_COLOR,7
    JMP COLOR_ENEMY_TAIL

    INSIDE_TERRITORY1:
        MOV ENEMY_TAIL_COLOR,3
    JMP COLOR_ENEMY_TAIL

    INSIDE_TERRITORY2:
        MOV ENEMY_TAIL_COLOR,5
    JMP COLOR_ENEMY_TAIL

    COLOR_ENEMY_TAIL:
    CALL CHECK_ENEMY_TERRITORY
RET
CHECK_TENEMY_POSITION_COLOR ENDP

CHECK_ENEMY_TERRITORY PROC NEAR

    CMP CX,7
    JB BORDER_LIMITS
    CMP DX,180
    JAE BORDER_LIMITS
    CMP CX,313
    JAE BORDER_LIMITS
    CMP DX,7
    JB BORDER_LIMITS

    CMP ENEMY_TAIL_COLOR,3
    JE TERRITORY1_COLOR
    CMP ENEMY_TAIL_COLOR,5
    JE TERRITORY2_COLOR

    BORDER_LIMITS:
        MOV AL,7
    JMP START_COLORING

    TERRITORY1_COLOR:
        MOV AL,3
    JMP START_COLORING

    TERRITORY2_COLOR:
        MOV AL,5
    JMP START_COLORING

    START_COLORING:
RET
CHECK_ENEMY_TERRITORY ENDP

DRAW_TERRITORY_ENEMY PROC NEAR
    MOV CX,TERRITORY_ENEMY_X ;initial value (x)
    MOV DX,TERRITORY_ENEMY_Y ;initial value (y)
    CALL CHECK_TENEMY_POSITION_COLOR
    DRAW_TENEMY_HORIZONTAL: 
            MOV AH,0CH    ;write pixels
            MOV AL,0EH
            MOV BH,0      ;page number
            INT 10H

            INC CX
            MOV AX,CX     ;cx - snake_x > snake size 
            SUB AX,TERRITORY_ENEMY_X
            CMP AX,2
            JNG DRAW_TENEMY_HORIZONTAL
            MOV CX,TERRITORY_ENEMY_X ;cx register goes back to initial column
            INC DX         ;advance one line

            MOV AX,DX      ;dx - snake_y > snake size
            SUB AX,TERRITORY_ENEMY_Y
            CMP AX,2
            JNG DRAW_TENEMY_HORIZONTAL

            MOV CX,TERRITORY_ENEMY_X
            ADD CX,1
            MOV DX,TERRITORY_ENEMY_Y
            ADD DX,1

        DRAW_TENEMY_LIMITS: 
            MOV AH,0CH    ;write pixels
            MOV AL,3      ;color
            MOV BH,0      ;page number
            INT 10H

            INC CX
            MOV AX,CX     ;cx - snake_x > snake size 
            SUB AX,TERRITORY_ENEMY_X
            CMP AX,1
            JNG DRAW_TENEMY_LIMITS
            MOV CX,TERRITORY_ENEMY_X ;cx register goes back to initial column
            ADD CX,1
            INC DX         ;advance one line

            MOV AX,DX      ;dx - snake_y > snake size
            SUB AX,TERRITORY_ENEMY_Y
            CMP AX,1
        JNG DRAW_TENEMY_LIMITS



RET            
DRAW_TERRITORY_ENEMY ENDP

MOVE_TERRITORY_ENEMY PROC NEAR
     CALL DELETE_TERRITORY_ENEMY
     MOV AX,TERRITORY_ENEMY_VELOCITY_X         
     ADD TERRITORY_ENEMY_X,AX
     MOV CX,TERRITORY_ENEMY_X
     MOV DX,TERRITORY_ENEMY_Y
     SUB CX,1
     MOV AH,0DH
     INT 10H
     CMP AL,0
     JE NEGATIVE_VELOCITY
     CMP CX,314
     JG NEGATIVE_VELOCITY
     
     MOV DX,TERRITORY_ENEMY_Y
     MOV CX,TERRITORY_ENEMY_X
     ADD CX,4
     MOV AH,0DH
     INT 10H
     CMP AL,0
     JE NEGATIVE_VELOCITY

     CMP CX,4
     JL NEGATIVE_VELOCITY

     MOV AX,TERRITORY_ENEMY_VELOCITY_Y
     ADD TERRITORY_ENEMY_Y,AX
     MOV DX,TERRITORY_ENEMY_Y
     MOV CX,TERRITORY_ENEMY_X
     SUB DX,1
     MOV AH,0DH
     INT 10H
     CMP AL,0
     JE NEGATIVE_VELOCITY_Y
     CMP DX,181
     JG NEGATIVE_VELOCITY_Y

     MOV DX,TERRITORY_ENEMY_Y
     MOV CX,TERRITORY_ENEMY_X
     ADD DX,4
     MOV AH,0DH
     INT 10H
     CMP AL,0
     JE NEGATIVE_VELOCITY_Y


     CMP DX,2
     JL NEGATIVE_VELOCITY_Y

    RET

     NEGATIVE_VELOCITY:
       NEG TERRITORY_ENEMY_VELOCITY_X
       RET

     NEGATIVE_VELOCITY_Y:
        NEG TERRITORY_ENEMY_VELOCITY_Y
        RET  
MOVE_TERRITORY_ENEMY ENDP

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

DELETE_TERRITORY_ENEMY PROC NEAR
    MOV CX,TERRITORY_ENEMY_X ;initial value (x)
    ADD CX,3
    MOV DX,TERRITORY_ENEMY_Y ;initial value (y)
    ADD DX,3



     DELETE_ENEMY_HORIZONTAL:                
        MOV AH,0CH    ;write pixels
        MOV AL,7
        MOV BH,0      ;page number
        INT 10H

        INC CX
        MOV AX,CX     ;cx - snake_x > snake size 
        SUB AX,TERRITORY_ENEMY_X
        CMP AX,TERRITORY_ENEMY_SIZE
        JNG DELETE_ENEMY_HORIZONTAL
        MOV CX,TERRITORY_ENEMY_X ;cx register goes back to initial column
        INC DX         ;advance one line

        MOV AX,DX      ;dx - snake_y > snake size
        SUB AX,TERRITORY_ENEMY_Y
        CMP AX,TERRITORY_ENEMY_SIZE
    JNG DELETE_ENEMY_HORIZONTAL

     
RET            
DELETE_TERRITORY_ENEMY ENDP

END MAIN
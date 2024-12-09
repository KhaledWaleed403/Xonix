.MODEL SMALL
.STACK 64
.DATA
CHAT                        DB 'To start chatting press 1'
GAME                        DB 'To start game press 2'
EXIT                        DB 'To end the program press ESC'
TIME_AUX                    DB 0 ;variable used when checking if time changed
SNAKE_X                     DW 7
SNAKE_Y                     DW 7
SNAKE2_X                    DW 40
SNAKE2_Y                    DW 40
SNAKE_SIZE                  DW 03H
SNAKE2_SIZE                 DW 02H
BORDER_X                    DW 00H
BORDER_Y                    DW 00H
BORDER_SIZE                 DW 06H
ENEMY_X                     DW 15H
ENEMY2_X                    DW 250  
ENEMY_Y                     DW 15H
ENEMY2_Y                    DW 78H 
ENEMY_SIZE                  DW 01H 
ENEMY_VELOCITY_X            DW 2H
ENEMY_VELOCITY_Y            DW 2H
ENEMY2_VELOCITY_X           DW -2H
ENEMY2_VELOCITY_Y           DW -2H
SNAKE_VELOCITY_X            DW 01H
SNAKE_VELOCITY_Y            DW 01H
SNAKE2_VELOCITY_X           DW 02H
SNAKE2_VELOCITY_Y           DW 02H
TERRITORY_ENEMY_X           DW 2
TERRITORY_ENEMY_Y           DW 30
TERRITORY_ENEMY_VELOCITY_X  DW 01H
TERRITORY_ENEMY_VELOCITY_Y  DW 01H
TERRITORY_ENEMY_SIZE        DW 3H
ENEMY_INSIDE                DW 2H
CURRENT_SNAKE_DIRECTION     DW 0 ; This Variable allows the snake to move on the set direction until the set direction changes, 0 left 1 right, 2 up, 4 down :MJ
CURRENT_SNAKE2_DIRECTION    DW 0 ; This Variable allows the snake to move on the set direction until the set direction changes, 0 left 1 right, 2 up, 4 down :MJ
AREA_X                      DW 7
AREA_Y                      DW 7
START_OR_END                DW 0
START_OR_END2               DW 0
HEAD_CENTER                 DW 0
TAIL_COLOR                  DW 0DH
SHOOTER_ENEMY_X             DW 25
SHOOTER_ENEMY_Y             DW 183
BULLET_X                    DW 25
BULLET_Y                    DW 182
BULLET_VELOCITY             DW -2
BULLET_TAIL_COLOR           DW 7
SHOOTER_ENEMY_VELOCITY      DW 2    
.CODE

MAIN PROC FAR
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    
    MOV AH,0
    MOV AL,03H
    INT 10h
    
    CALL SCREEN_ONE
    START:
    MOV AH,0H
    INT 16H
 
   
    CMP AL,1BH
    JE EXITGAME
    
    CMP AL,32H
    JE GAMEMODE
    JMP START
    
    GAMEMODE:
    CALL CLEAR_SCREEN


    CALL DRAW_FULL_BORDER
    
    CHECK_TIME:
        MOV AH,2CH ;returns: CH=hour, CL=minutes, DH=seconds,DL=1/100 seconds
        INT 21H

        CMP DL,TIME_AUX ;is the current time equal to the previous one?
        JE CHECK_TIME   ;if not then check again                  
        MOV TIME_AUX,DL ;if its different then draw again
        CALL MOVE_SHOOTER_ENEMY
        CALL DRAW_SHOOTER_ENEMY
        CALL MOVE_BULLET
        CALL DRAW_BULLET
        CALL MOVE_HEAD2
        CALL DRAW_HEAD2
    JMP CHECK_TIME

     
    EXITGAME:
        MOV AH,4CH
        MOV AL,1
        INT 21H
    MAIN ENDP

SCREEN_ONE PROC NEAR

    MOV BP,OFFSET CHAT
    MOV AH,13H
    MOV AL,0
    MOV BL,15
    MOV BH,0
    MOV DL,20
    MOV DH,8
    MOV CX,25
    INT 10H
    
    MOV BP,OFFSET GAME
    MOV AH,13H
    MOV AL,0
    MOV BL,15
    MOV BH,0
    MOV DL,20
    MOV DH,11
    MOV CX,21
    INT 10H
    
    MOV BP,OFFSET EXIT
    MOV AH,13H
    MOV AL,0
    MOV BL,15
    MOV BH,0
    MOV DL,20
    MOV DH,14
    MOV CX,28
    INT 10H
RET    
SCREEN_ONE ENDP

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

CHECK_BORDER PROC NEAR
        CMP DX,9
        JAE CHECK_RIGHT
        CMP DX,9
        JBE GREY

        CHECK_RIGHT:
            CMP CX,313
            JAE GREY
            CMP CX,313
        JBE CHECK_LEFT

        CHECK_LEFT:
            CMP CX,6
            JBE GREY
            CMP CX,6
        JAE CHECK_BOT

        CHECK_BOT:
             CMP DX,176
             JAE GREY
             CMP DX,17
        JBE BLUE  

        BLUE:
                MOV AL,9
        JMP DRAW        

        GREY:
                MOV AL,7
        JMP DRAW

        DRAW:  

RET
CHECK_BORDER ENDP

CHECK_BORDER2 PROC NEAR
        CMP DX,7
        JAE CHECK_RIGHT2
        CMP DX,7
        JBE GREY

        CHECK_RIGHT2:
            CMP CX,313
            JAE GREY
            CMP CX,313
        JBE CHECK_LEFT2

        CHECK_LEFT2:
            CMP CX,6
            JBE GREY
            CMP CX,6
        JAE CHECK_BOT2

        CHECK_BOT2:
             CMP DX,180
             JAE GREY2
             CMP DX,180
        JBE BLUE2 

        BLUE2:
                MOV AL,0DH
        JMP DRAW2        

        GREY2:
                MOV AL,7
        JMP DRAW2

        DRAW2:  

RET
CHECK_BORDER2 ENDP

CLEAR_SCREEN PROC NEAR

    MOV AH,00H ;video mode
    MOV AL,13H ;type of video mode
    INT 10H

RET
CLEAR_SCREEN ENDP

CHECK_TERRITORY PROC NEAR
    CMP CX,6
    JB BORDER_COLOR
    CMP DX,180
    JAE BORDER_COLOR
    CMP CX,313
    JAE BORDER_COLOR
    CMP DX,7
    JB BORDER_COLOR
    
    CMP TAIL_COLOR,5
    JE  TERRITORY_COLOR
    CMP TAIL_COLOR,0DH
    JE SPACE_COLOR

    SPACE_COLOR:
        MOV AL,0DH
    JMP CONVERT_COLOR

    TERRITORY_COLOR:
        MOV AL,5
    JMP CONVERT_COLOR

    BORDER_COLOR:
        MOV AL,7
    JMP CONVERT_COLOR


    CONVERT_COLOR:

RET
CHECK_TERRITORY ENDP

CHECK_ENEMY_TERRITORY PROC NEAR
    ADD CX,4
    MOV AH,0DH
    INT 10H
    SUB CX,4
    CMP AL,0
    JNE KEEP_MOVING
    NEG TERRITORY_ENEMY_VELOCITY_X
    NEG TERRITORY_ENEMY_VELOCITY_X

    KEEP_MOVING:
RET
CHECK_ENEMY_TERRITORY ENDP

DRAW_SNAKE PROC NEAR
    MOV CX,SNAKE2_X ;initial value (x)
    MOV DX,SNAKE2_Y ;initial value (y)
        

        DRAW_SNAKE2_HORIZONTAL:
            CALL CHECK_TERRITORY
            MOV AH,0CH    ;write pixels     
            MOV BH,0      ;page number
            INT 10H

            INC CX
            MOV AX,CX     ;cx - snake_x > snake size 
            SUB AX,SNAKE2_X
            CMP AX,SNAKE_SIZE
            JNG DRAW_SNAKE2_HORIZONTAL
            MOV CX,SNAKE2_X ;cx register goes back to initial column
            INC DX         ;advance one line

            MOV AX,DX      ;dx - snake_y > snake size
            SUB AX,SNAKE2_Y
            CMP AX,SNAKE_SIZE
            JNG DRAW_SNAKE2_HORIZONTAL
   
RET
DRAW_SNAKE ENDP

CHECK_HEAD_POSITION_COLOR PROC NEAR

    SUB CX,1
    SUB DX,1
    MOV AH,0DH
    INT 10H
    ADD CX,1
    ADD DX,1
    CMP AL,7
    JE BORDER_DETECTED
    CMP AL,5
    JE TERRITORY_DETECTED
    CMP AL,0
    JE SPACE_DETECTED
    JMP CHANGE_TAIL_COLOR

    BORDER_DETECTED:
        MOV TAIL_COLOR,7
    JMP CHANGE_TAIL_COLOR

    TERRITORY_DETECTED:
        MOV TAIL_COLOR,5
    JMP CHANGE_TAIL_COLOR

    SPACE_DETECTED:
        MOV TAIL_COLOR,0DH
    JMP CHANGE_TAIL_COLOR

    CHANGE_TAIL_COLOR:
    CALL CHECK_TERRITORY
RET
CHECK_HEAD_POSITION_COLOR ENDP

DRAW_SHOOTER_ENEMY PROC NEAR
    MOV CX,SHOOTER_ENEMY_X ;initial value (x)
    MOV DX,SHOOTER_ENEMY_Y ;initial value (y)

    DRAW_SHOOTER_ENEMY_LOOP: 
            MOV AH,0CH    ;write pixels
            MOV AL,8
            MOV BH,0      ;page number
            INT 10H

            INC CX
            MOV AX,CX     ;cx - snake_x > snake size 
            SUB AX,SHOOTER_ENEMY_X
            CMP AX,2
            JNG DRAW_SHOOTER_ENEMY_LOOP
            MOV CX,SHOOTER_ENEMY_X ;cx register goes back to initial column
            INC DX         ;advance one line

            MOV AX,DX      ;dx - snake_y > snake size
            SUB AX,SHOOTER_ENEMY_Y
            CMP AX,2
            JNG DRAW_SHOOTER_ENEMY_LOOP

            MOV CX,SHOOTER_ENEMY_X
            ADD CX,1
            MOV DX,SHOOTER_ENEMY_Y
            ADD DX,1

        DRAW_SHOOTER_LIMITS: 
            MOV AH,0CH    ;write pixels
            MOV AL,0EH      ;color
            MOV BH,0      ;page number
            INT 10H

            INC CX
            MOV AX,CX     ;cx - snake_x > snake size 
            SUB AX,SHOOTER_ENEMY_X
            CMP AX,1
            JNG DRAW_SHOOTER_LIMITS
            MOV CX,SHOOTER_ENEMY_X ;cx register goes back to initial column
            ADD CX,1
            INC DX         ;advance one line

            MOV AX,DX      ;dx - snake_y > snake size
            SUB AX,SHOOTER_ENEMY_Y
            CMP AX,1
        JNG DRAW_SHOOTER_LIMITS

RET
DRAW_SHOOTER_ENEMY ENDP

DELETE_SHOOTER_ENEMY PROC NEAR

        MOV CX,SHOOTER_ENEMY_X ;initial value (x)
        MOV DX,SHOOTER_ENEMY_Y ;initial value (y)
     DELETE_SENEMY_HORIZONTAL:    
        MOV AH,0CH    ;write pixels
        MOV AL,7      ;COLOR
        MOV BH,0      ;page number
        INT 10H

        INC CX
        MOV AX,CX     ;cx - snake_x > snake size 
        SUB AX,SHOOTER_ENEMY_X
        CMP AX,TERRITORY_ENEMY_SIZE
        JNG DELETE_SENEMY_HORIZONTAL
        MOV CX,SHOOTER_ENEMY_X ;cx register goes back to initial column
        INC DX         ;advance one line

        MOV AX,DX      ;dx - snake_y > snake size
        SUB AX,SHOOTER_ENEMY_Y
        CMP AX,TERRITORY_ENEMY_SIZE
    JNG DELETE_SENEMY_HORIZONTAL

RET
DELETE_SHOOTER_ENEMY ENDP

MOVE_SHOOTER_ENEMY PROC NEAR
    CALL DELETE_SHOOTER_ENEMY
    MOV AX,SHOOTER_ENEMY_VELOCITY       
    ADD SHOOTER_ENEMY_X,AX
    MOV CX,SHOOTER_ENEMY_X
    SUB CX,2
    CMP CX,0
    JE REVERSE_DIRECTION
    MOV AX,SHOOTER_ENEMY_VELOCITY       
    ADD SHOOTER_ENEMY_X,AX
    MOV CX,SHOOTER_ENEMY_X
    ADD CX,2
    CMP CX,315
    JA REVERSE_DIRECTION
RET



    REVERSE_DIRECTION:
        NEG SHOOTER_ENEMY_VELOCITY
    RET
MOVE_SHOOTER_ENEMY ENDP

CHECK_BULLET_POSITION PROC NEAR

    MOV CX,BULLET_X
    MOV DX,BULLET_Y
    ADD DX,1
    SUB CX,1
    MOV AH,0DH
    INT 10H
    SUB DX,1
    ADD CX,1
    
    CMP AL,7
    JE IN_BORDER
    CMP AL,5
    JE P2_TERRITORY
    CMP AL,3
    JE P1_TERRITORY
    CMP AL,0
    JE SPACE

    SPACE:
        MOV BULLET_TAIL_COLOR,0
    JMP CONVERT_BULLET_TAIL

    IN_BORDER:
        MOV BULLET_TAIL_COLOR,7
    JMP CONVERT_BULLET_TAIL

    P1_TERRITORY:
        MOV BULLET_TAIL_COLOR,3
    JMP CONVERT_BULLET_TAIL

    P2_TERRITORY:
        MOV BULLET_TAIL_COLOR,5
    JMP CONVERT_BULLET_TAIL


    CONVERT_BULLET_TAIL:
        CALL CHECK_BULLET_TERRITORY
RET
CHECK_BULLET_POSITION ENDP

CHECK_BULLET_TERRITORY PROC NEAR
    CMP BULLET_TAIL_COLOR,7
    JE BORDER
    CMP BULLET_TAIL_COLOR,3
    JE P1_TERR
    CMP BULLET_TAIL_COLOR,5
    JE P2_TERR
    CMP BULLET_TAIL_COLOR,0
    JE STILL_SPACE

    STILL_SPACE:
        MOV AL,0
    JMP HIDE_TAIL

    BORDER:
        MOV AL,7
    JMP HIDE_TAIL

    P1_TERR:
        MOV AL,3
    JMP HIDE_TAIL

    P2_TERR:
        MOV AL,5
    JMP HIDE_TAIL

    HIDE_TAIL:
RET
CHECK_BULLET_TERRITORY ENDP

DELETE_BULLET PROC NEAR

    MOV CX,BULLET_X ;initial value (x)
    MOV DX,BULLET_Y ;initial value (y)
    DELETE_ENEMY_BULLET: 
            CALL CHECK_BULLET_TERRITORY
            MOV AH,0CH    ;write pixels
            MOV BH,0      ;page number
            INT 10H

            INC CX
            MOV AX,CX     ;cx - snake_x > snake size 
            SUB AX,BULLET_X
            CMP AX,1
            JNG DELETE_ENEMY_BULLET
            MOV CX,BULLET_X ;cx register goes back to initial column
            INC DX         ;advance one line

            MOV AX,DX      ;dx - snake_y > snake size
            SUB AX,BULLET_Y
            CMP AX,2
            JNG DELETE_ENEMY_BULLET

RET
DELETE_BULLET ENDP

DRAW_BULLET PROC NEAR
    MOV CX,BULLET_X ;initial value (x)
    MOV DX,BULLET_Y ;initial value (y)
    CALL CHECK_BULLET_POSITION
    DRAW_ENEMY_BULLET: 
            MOV AH,0CH    ;write pixels
            MOV AL,7
            MOV BH,0      ;page number
            INT 10H

            INC CX
            MOV AX,CX     ;cx - snake_x > snake size 
            SUB AX,BULLET_X
            CMP AX,1
            JNG DRAW_ENEMY_BULLET
            MOV CX,BULLET_X ;cx register goes back to initial column
            INC DX         ;advance one line

            MOV AX,DX      ;dx - snake_y > snake size
            SUB AX,BULLET_Y
            CMP AX,2
            JNG DRAW_ENEMY_BULLET

RET
DRAW_BULLET ENDP

MOVE_BULLET PROC NEAR
    CALL DELETE_BULLET
    MOV AX,BULLET_VELOCITY
    ADD BULLET_Y,AX
    MOV DX,BULLET_Y
    CMP DX,2
    JB OUT_OF_BOUNDS

RET
    OUT_OF_BOUNDS:
        MOV BULLET_VELOCITY,0
    RET
MOVE_BULLET ENDP

DRAW_HEAD2 PROC NEAR

        MOV CX,SNAKE2_X ;initial value (x)
        MOV DX,SNAKE2_Y ;initial value (y)
        CALL CHECK_HEAD_POSITION_COLOR
        DRAW_HEAD2_HORIZONTAL: 
            MOV AH,0CH    ;write pixels
            MOV AL,8
            MOV BH,0      ;page number
            INT 10H

            INC CX
            MOV AX,CX     ;cx - snake_x > snake size 
            SUB AX,SNAKE2_X
            CMP AX,3
            JNG DRAW_HEAD2_HORIZONTAL
            MOV CX,SNAKE2_X ;cx register goes back to initial column
            INC DX         ;advance one line

            MOV AX,DX      ;dx - snake_y > snake size
            SUB AX,SNAKE2_Y
            CMP AX,3
            JNG DRAW_HEAD2_HORIZONTAL

            MOV CX,SNAKE2_X
            ADD CX,1
            MOV DX,SNAKE2_Y
            ADD DX,1

        DRAW_HEAD2_LIMITS: 
            MOV AH,0CH    ;write pixels
            MOV AL,0FH     ;color
            MOV BH,0      ;page number
            INT 10H

            INC CX
            MOV AX,CX     ;cx - snake_x > snake size 
            SUB AX,SNAKE2_X
            CMP AX,2
            JNG DRAW_HEAD2_LIMITS
            MOV CX,SNAKE2_X ;cx register goes back to initial column
            ADD CX,1
            INC DX         ;advance one line

            MOV AX,DX      ;dx - snake_y > snake size
            SUB AX,SNAKE2_Y
            CMP AX,2
        JNG DRAW_HEAD2_LIMITS



RET
DRAW_HEAD2 ENDP

MOVE_HEAD2 PROC NEAR
       
        CALL DRAW_SNAKE       
        MOV AH,01H
        INT 16H
        JZ DONEKEYPRESS2

        MOV AH,00H
        INT 16H


        DONEKEYPRESS2:
        CMP AL,4CH
        JE MOVE_RIGHT22
        CMP AL,6CH
        JE MOVE_RIGHT22

        CMP AL,69H
        JE MOVE_UP22
        CMP AL,49H
        JE MOVE_UP22

        CMP AL,6BH
        JE MOVE_DOWN22
        CMP AL,4BH
        JE MOVE_DOWN22

        CMP AL,6AH
        JE MOVE_LEFT22     
        CMP AL,4AH
        JE MOVE_LEFT22 

        jmp GotNothing2

        MOVE_RIGHT22:
                MOV DX,SNAKE2_VELOCITY_X
                CMP SNAKE2_X,316
                JAE MOVE_DOWN22
                ADD SNAKE2_X,DX
                CMP SNAKE2_X,316             ;If the next pixel is outside of the border change direction clockwise
                JE MOVE_DOWN22
                CMP SNAKE2_X,314
                JNE NEXT_LINE23
                CMP SNAKE2_Y,7
                JB  NEXT_LINE23
                CALL FILL_BOUNDED_AREA2
                CALL COLOR_TAIL2
                CALL FILL_VERTICAL_AREA2
                NEXT_LINE23:
                MOV CURRENT_SNAKE2_DIRECTION,0
        JMP CHECK_HEAD2_MOVEMENT

        MOVE_UP22:
                MOV DX,SNAKE2_VELOCITY_Y
                CMP SNAKE2_Y,1
                JBE MOVE_RIGHT22 
                SUB SNAKE2_Y,DX  
                CMP SNAKE2_Y,1              ;If the next pixel is outside of the border change direction clockwise
                JE MOVE_RIGHT22   
                CMP SNAKE2_Y,4
                JNE NEXT_LINE22
                CMP SNAKE2_X,7
                JB NEXT_LINE22
                CALL FILL_BOUNDED_AREA2
                CALL COLOR_TAIL2
                CALL FILL_VERTICAL_AREA2
                NEXT_LINE22:        
                MOV CURRENT_SNAKE2_DIRECTION,2
        JMP CHECK_HEAD2_MOVEMENT

        MOVE_DOWN22:
                MOV DX,SNAKE2_VELOCITY_Y
                CMP SNAKE2_Y,182
                JAE MOVE_LEFT22
                ADD SNAKE2_Y,DX
                CMP SNAKE2_Y,182             ;If the next pixel is outside of the border change direction clockwise
                JE MOVE_LEFT22
                CMP SNAKE2_Y,179
                JNE NEXT_LINE32
                CMP SNAKE2_X,6
                JB NEXT_LINE32
                CMP SNAKE2_X,312
                JA NEXT_LINE32
                CALL FILL_BOUNDED_AREA2            
                CALL COLOR_TAIL2
                CALL FILL_VERTICAL_AREA2
                NEXT_LINE32: 
                MOV CURRENT_SNAKE2_DIRECTION,3
        JMP CHECK_HEAD2_MOVEMENT

        MOVE_LEFT22:
                MOV DX,SNAKE2_VELOCITY_X
                CMP SNAKE2_X,1
                JBE MOVE_UP22  
                SUB SNAKE2_X,DX
                CMP SNAKE2_X,1               ;If the next pixel is outside of the border change direction clockwise
                JE MOVE_UP22 
                CMP SNAKE2_X,5
                JNE NEXT_LINE42
                CMP SNAKE2_Y,180
                JA NEXT_LINE42
                CALL FILL_BOUNDED_AREA2
                CALL COLOR_TAIL2
                CALL FILL_VERTICAL_AREA2
                NEXT_LINE42: 
                MOV CURRENT_SNAKE2_DIRECTION,1
        JMP CHECK_HEAD2_MOVEMENT

        GotNothing2:                 ;if we got no key stroke we move here and work on the old key stroke, otherwise it is skipped
        MOV AX,CURRENT_SNAKE2_DIRECTION

        CMP AX,0
        JE MOVE_RIGHT22

        CMP AX,1
        JE MOVE_LEFT22

        CMP AX,2
        JE MOVE_UP22

        CMP AX,3
        JE MOVE_DOWN22

        CHECK_HEAD2_MOVEMENT:

RET
MOVE_HEAD2 ENDP

COLOR_TAIL2 PROC NEAR

    MOV CX,0
    MOV DX,0
    FILL_CHECK1:
        MOV AH,0DH
        INT 10H
        CMP AL,0DH
        JE FILL_X2
        NEXT_PIXEL1:
        INC CX
        CMP CX,320
        JBE FILL_CHECK1
        INC DX
        MOV CX,0
        MOV AH,0DH
        INT 10H
        CMP AL,0DH
        JE FILL_X2
        CMP DX,200
        JB FILL_CHECK1
        JMP BREAK1

        FILL_X2:
            MOV AL,5
            MOV AH,0CH
            INT 10H
        JMP NEXT_PIXEL1

        BREAK1:

RET
COLOR_TAIL2 ENDP

FILL_VERTICAL_AREA2 PROC NEAR
    MOV CX,AREA_X
    MOV DX,AREA_Y
    MOV BL,0
    MOV BH,4
    CHECK_GRID2:
        CHECK_COLUMN2:
        MOV AH,0DH
        INT 10H
        CMP AL,0
        JNE DEBUG2
        INC BL
        KEEP_GOING2:
        INC DX
        CMP DX,179
        JA NEXT_ROW2
        JB CHECK_COLUMN2


        DEBUG2: 
            CMP BL,4
            JE CHECK_NEXT_PIXEL2
            MOV BL,0
        JMP KEEP_GOING2

        CHECK_NEXT_PIXEL2:
            INC DX
            MOV AH,0DH
            INT 10H
            DEC DX
            CMP AL,5
        JNE NEXT_ROW2
        JE FILL_SPACE2

        FILL_SPACE2:
            DEC DX
            MOV AH,0CH
            MOV AL,5
            INT 10H
            DEC BH
            CMP BH,0
            MOV BL,0
        JE RESET_LOOP_COUNTER2
        JA FILL_SPACE2

        RESET_LOOP_COUNTER2:
        MOV BH,4
        JMP CHECK_COLUMN2

        NEXT_ROW2:
            MOV BH,4
            MOV BL,0
            INC CX
            CMP CX,314
            JE BREAK52
            MOV DX,AREA_Y
            JMP CHECK_COLUMN2
    BREAK52:
RET
FILL_VERTICAL_AREA2 ENDP

FILL_BOUNDED_AREA2 PROC NEAR
    MOV CX,AREA_X
    MOV DX,AREA_Y
    MOV BL,0
    FILL_AREA_IN2:
        MOV AH,0DH               ;check the color of this pixel
        INT 10H    
        CMP AL,0DH                 ;if its blue trigger the snake trail counter (checks the number of pixels to determine when the boundary ends)
    JNE DONT_INC2             ;if its not blue then check if its a black pixel thats beyond the boundary  
        INC BL
        DONT_INC2:
        CMP BL,3                 ;if the blue pixel count is above the boundary size then the black pixels needs to be filled  
    JNE NEXT_PIXEL22
    MOV START_OR_END2,CX      ;efred delwa2ty ana el shakl bad2o men el shemal w maloosh snake border 3la el shemal
    CHECK_IF_END2:            ;m7tag a3raf el shakl da bade2 mneen, fa lw awl point soda b3d el snake body mafeesh waraha pixel zar2a yeb2a el body da kan el end
    BORDER_END2:             
    INC CX
    MOV AH,0DH              
    INT 10H
    CMP AL,0DH                ;ha3mel check 3la kol el pixels el gya ashoof fe azra2 wla la
    JE COLOR2                ;lw fe azra2 yeb2a harga3 lel point el bada2t el check men 3ando b3d keda alawn l7ad mawsal lel azra2 3ady w da haye7sal 3and label color
    CMP CX,310
    JB BORDER_END2         
    MOV CX,START_OR_END2     ;tab lw mafeesh azra2 fa keda ana 3ref en el point el zar2a el fatet kanet a5er point fel fill fa m7tag a3mel fill lel ablaha
    CMP CX,160
    JA COLOR_AFTER2
    SUB CX,2                ;harga3 lel point bta3t nhayet el snake body w arga3 le awl pixel soda alawenha 
    LOOK_FOR_BLACK2:
    DEC CX
    MOV AH,0DH  
    INT 10H
    CMP AL,0DH
    JE LOOK_FOR_BLACK2
    COLOR_BEFORE2:           ;b3d keda halawen kol el pixels el ableha l7ad mawsal lnhayet el border
    MOV AH,0CH
    MOV AL,5
    INT 10H
    DEC CX
    CMP CX,6
    JA COLOR_BEFORE2
    JMP NEXT_Y2

    COLOR_AFTER2:           ;b3d keda halawen kol el pixels el ableha l7ad mawsal lnhayet el border
    MOV AH,0CH
    MOV AL,5
    INT 10H
    INC CX
    CMP CX,313
    JB COLOR_AFTER2
    JMP NEXT_Y2

    COLOR2:
    MOV CX,START_OR_END2
    INC CX           ;this checks the pixel thats after the last pixel in the snake boundary  
    MOV AH,0DH
    INT 10H
    CMP AL,0         ;if its black then we need to change its color  
    JNE NEXT_PIXEL22  ;if not then we need to loop over the next pixel to check its color
    MOV AL,5         ;change the color of the black pixel 
    MOV AH,0CH
    INT 10H
    DEC CX           ;we need to decrement the value of the cx because we already did increment it earlier if we dont decrement then it will skip a pixel every 2 pixels (through trial and error)                       
    MOV AH,0CH       ;Lw m3mltesh de hayeb2a fe awl pixel fadya fel fill
    INT 10H
    JMP NEXT_PIXEL22
    NEXT_PIXEL22:         ;check the color of the next pixel
    CMP BL,6       ;check the blue counter, if its 12 that means that we hit the other side of the snake so we need to stop coloring
    JE RESET2            
    SET2:
    INC CX           ;we increment to find the next pixel  
    CMP CX,311       ;the limit in which we need to loop over
    JBE FILL_AREA_IN2  
    NEXT_Y2: 
    MOV BL,0 
    INC DX           ;if the value of cx exceeds the limit then we need to reset it  
    MOV CX,AREA_X    ;and start looping over the next "y"
    CMP DX,180
    JBE FILL_AREA_IN2
    JMP BREAK22       ;if the fill area search reaches its end boundary we terminate the program


    RESET2:
    INC CX           ;hena ana 3ayz a3mel check en el azra2 akbar men el 2 frames lw akbar yeb2a keda da 5at betool w mesh halaweno
    MOV AH,0DH      
    INT 10H
    CMP AL,0DH         ;tab efred el 5at el bel 3ard da mesh nhayet el shakl w lessa fe ta7teh bounded area m7tag alawenha 
    JE CHECK_MORE2   ;fa haroo7 a3mel check eza kan a5er satr f3lan wla m7tag alawen zyada
    MOV BL,0         ;here we reset the blue pixel counter in so we can check for boundaries in the next line
    JMP SET2

    CHECK_MORE2:
    CHECK_IF_BORDER2:
    INC CX             ;delwa2ty ana ha3od a3mel check 3la kol el pixels el gya lw zar2a yeb2a ana lessa fel 5at el bel 3ard
    CMP CX,311         ;lw soda yeb2a ana keda 5aragt bara el 5at da
    JE NEXT_Y2           
    MOV AH,0DH          
    INT 10H             
    CMP AL,0DH            
    JNE NEW_SHAPE2        
    JE CHECK_IF_BORDER2

    NEW_SHAPE2:              ;keda ana 3andy e7tmaleen ya2ema ana 5aragt bara el 5at w f3lan el shakl 5ls
    INC CX              ;ya2ema el black pixel el ana shoftaha de m7tag alawenha l7ad mala2y el border el ba3deh    
    CMP CX,311          ;lw fdlt mashy wra el eswed w el border bta3 el shasha 5ls fana keda f3lan el shakl 5ls w mesh m7tag arsem 7aga
    JE NEXT_Y2           ;lw 3mlt check lel black pixels el gya kolaha w abelt wa7da zar2a fana keda gowa shakl w m7tag alawen el gy
    MOV AH,0DH
    INT 10H
    CMP AL,0DH
    JNE NEW_SHAPE2        ;tab ana delwa2ty abelt pixel zar2a w 3reft eny gowa el shakl lessa halawen el 5at el ana 3mlt 3aleeh check asln ezzay?
    FIND_STARTING_PIXEL2:    ;harga3 lwara wna ba3mel check lel pixels l7ad mala2y pixel zar2a w ha2of 3andaha 
    DEC CX
    MOV AH,0DH
    INT 10H
    CMP AL,0
    JE FIND_STARTING_PIXEL2  ;awl mala2y el pixel el zar2a de fana keda 3reft eny lazem abda2 alawn
    FILL_NEW_SHAPE2:         ;habda2 alawen el shakl el zyada da el ba3d el 5at el beltool el 3areed l7ad ma5bat f pixel zar2a 
    INC CX            
    MOV AH,0DH          
    INT 10H
    CMP AL,0DH            ;lw 5abat f pixel zar2a fana keda 100% mota2aked en el shakl by5las hena   
    JE NEXT_Y2           ;sa3etha ha7tag arga3 a3mel el check bta3y el 3ady bas fel satr(y) el ta7teeh
    MOV AH,0CH          
    MOV AL,5
    INT 10H
    JMP FILL_NEW_SHAPE2



    BREAK22:
        
RET
FILL_BOUNDED_AREA2 ENDP
END MAIN
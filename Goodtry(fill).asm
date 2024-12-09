.MODEL SMALL
.STACK 64
.DATA
CHAT                        DB 'To start chatting press 1'
GAME                        DB 'To start game press 2'
EXIT                        DB 'To end the program press ESC'
GAME_END                    DB 'GAME OVER'
P1_WINNER                   DB 'PLAYER 1 IS THE WINNER'
P2_WINNER                   DB 'PLAYER 2 IS THE WINNER'
TIMEGAME                    DB 20
TIMER                       DB 99
PLAYER1                     DB "P1"
PLAYER2                     DB "P2"
PLAYER1_LIVES               DB 3
PLAYER2_LIVES               DB 3
PLAYER1_SCORE               DW 0
PLAYER1_DSCORE              DW 0
PLAYER2_SCORE               DW 0
PLAYER2_DSCORE              DW 0
LIVES                       DB 3,":"
SCORE                       DB "SCORE:"
TIME_AUX                    DB 0 ;variable used when checking if time changed
SHIELD_X                    DW 280
SHIELD_Y                    DW 150
SPEED_X                     DW 250
SPEED_Y                     DW 160
LIFE_X                      DW 130 
LIFE_Y                      DW 110
SNAKE_X                     DW 7
SNAKE_Y                     DW 7
SNAKE2_X                    DW 320
SNAKE2_Y                    DW 176
SNAKE_SIZE                  DW 03H
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
SNAKE2_VELOCITY_X           DW 01H
SNAKE2_VELOCITY_Y           DW 01H
TERRITORY_ENEMY_X           DW 2
TERRITORY_ENEMY_Y           DW 30
TERRITORY_ENEMY_VELOCITY_X  DW 02H
TERRITORY_ENEMY_VELOCITY_Y  DW 02H
TERRITORY_ENEMY_SIZE        DW 2H
ENEMY_INSIDE                DW 2H
SHOOTER_ENEMY_X             DW 25
SHOOTER_ENEMY_Y             DW 180
BULLET_X                    DW 25
BULLET_Y                    DW 180
BULLET_VELOCITY             DW 0
BULLET_TAIL_COLOR           DW 7
SHOOTER_ENEMY_VELOCITY      DW 2
CURRENT_SNAKE_DIRECTION     DW 0 ; This Variable allows the snake to move on the set direction until the set direction changes, 0 left 1 right, 2 up, 4 down :MJ
CURRENT_SNAKE2_DIRECTION    DW 1 ; This Variable allows the snake to move on the set direction until the set direction changes, 0 left 1 right, 2 up, 4 down :MJ
AREA_X                      DW 7
AREA_Y                      DW 7
START_OR_END                DW 0
START_OR_END2               DW 0
CURRENT_ROW                 DW 0
CURRENT_ROW2                DW 0
TAIL_COLOR                  DW 9
TAIL2_COLOR                 DW 0DH
ENEMY_TAIL_COLOR            DW 7
PLAYER1_SHIELD              DW 0
PLAYER2_SHIELD              DW 0
SHIELD_TIMER                DW 10
SHIELD_TIME                 DW 20
PLAYER1_SPEED               DW 0
PLAYER2_SPEED               DW 0
LIFE                        DW 0
SPEED_TIMER                 DW 15
SPEED_TIME                  DW 20
BULLET                      DW 0
BULLET_TIMER                DW 4
BULLET_TIME                 DW 20
CURRENT_ENEMY_POS           DW 0
P1_MOVING_IN_SPACE          DW 0
P2_MOVING_IN_SPACE          DW 0
P1_DEPTH                    DW 0
P2_DEPTH                    DW 0
T1_DEPTH                    DW 0
S1_DEPTH                    DW 0
ET1_DEPTH                   DW 0
T2_DEPTH                    DW 0
S2_DEPTH                    DW 0
ET2_DEPTH                   DW 0
P1_BORDER_DEPTH             DW 0
P2_BORDER_DEPTH             DW 0
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
        ;CALL DELETE_ENEMY
        ;CALL MOVE_ENEMY
        ;CALL DRAW_ENEMY
        ;CALL MOVE_ENEMY2
        ;CALL DRAW_ENEMY2
        ;CALL MOVE_TERRITORY_ENEMY
        ;CALL DRAW_TERRITORY_ENEMY
        CALL MOVE_HEAD
        CALL DRAW_HEAD
        CALL MOVE_HEAD2
        CALL DRAW_HEAD2
        ;CALL MOVE_SHOOTER_ENEMY
        ;CALL DRAW_SHOOTER_ENEMY
        ;CALL MOVE_BULLET
        ;CALL BULLET_TIMER_CHECK
        CALL CHECK_P1_TERRITORY
        CALL CHECK_P2_TERRITORY
        CALL CHECK_HEAD_COLLISION
        CALL NOTIFICATION_BAR
        ;CALL GAME_OVER_SCREEN
        CALL CHECK_P1_POWERUP
        CALL CHECK_P2_POWERUP
        CALL SHIELD
        CALL SPEED
        CALL EXTRA_LIFE
    JMP CHECK_TIME

     
    EXITGAME:
        MOV AH,4CH
        MOV AL,1
        INT 21H
    MAIN ENDP

        ;                                          GLOBAL PROCEDURES

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

CALCULATE_PLAYERS_SCORE PROC NEAR
MOV CX,AREA_X
MOV DX,AREA_Y
MOV BX,20
MOV PLAYER1_DSCORE,0
MOV PLAYER2_DSCORE,0
MOV PLAYER1_SCORE,0
MOV PLAYER2_SCORE,0

AGAIN:
MOV AH,0DH
INT 10h

CMP AL,3
JE PLAYER1_POINT

MOV AH,0DH
INT 10h

CMP AL,5
JE PLAYER2_POINT
JMP NEXT_PIXEL7

PLAYER1_POINT:
INC PLAYER1_SCORE
CMP PLAYER1_SCORE,BX
JAE INC_PLAYER1_SCORE
JMP NEXT_PIXEL7
INC_PLAYER1_SCORE:
MOV PLAYER1_SCORE,0
INC PLAYER1_DSCORE
JMP NEXT_PIXEL7

PLAYER2_POINT:
INC PLAYER2_SCORE
CMP PLAYER2_SCORE,BX
JAE INC_PLAYER2_SCORE
JMP NEXT_PIXEL7
INC_PLAYER2_SCORE:
MOV PLAYER2_SCORE,0
INC PLAYER2_DSCORE
JMP NEXT_PIXEL7

NEXT_PIXEL7:
INC CX
CMP CX,320
JBE AGAIN
INC DX
MOV CX,0
CMP DX,200
JB AGAIN
JMP ENDING

ENDING:
RET
CALCULATE_PLAYERS_SCORE ENDP

CHECK_BORDER PROC NEAR
        CMP DX,6
        JAE CHECK_RIGHT
        CMP DX,7
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
             CMP DX,180
             JAE GREY
             CMP DX,180
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

CHECK_TENEMY_POSITION_COLOR PROC NEAR

    ADD CX,1
    ADD DX,1
    MOV AH,0DH
    INT 10H
    SUB CX,1
    SUB DX,1

    CMP AL,0AH
    JE ENEMY_KILLED_P2
    CMP AL,1
    JE ENEMY_KILLED_P1
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

    ENEMY_KILLED_P1:
        CALL PLAYER1_RESPAWN
    JMP COLOR_ENEMY_TAIL

    ENEMY_KILLED_P2:
        CALL PLAYER2_RESPAWN

    COLOR_ENEMY_TAIL:
    CALL CHECK_ENEMY_TERRITORY
RET
CHECK_TENEMY_POSITION_COLOR ENDP

CHECK_ENEMY_TERRITORY PROC NEAR

    CMP CX,7
    JB BORDER_LIMITS
    CMP DX,180
    JAE BORDER_LIMITS
    CMP CX,312
    JE BORDER_LIMITS
    CMP DX,7
    JB BORDER_LIMITS

    CMP ENEMY_TAIL_COLOR,3
    JE TERRITORY1_COLOR
    CMP ENEMY_TAIL_COLOR,5
    JE TERRITORY2_COLOR
    CMP ENEMY_TAIL_COLOR,7
    JE BORDER_LIMITS

    TERRITORY1_COLOR:
        MOV AL,3
    JMP START_COLORING
    
    BORDER_LIMITS:
        MOV AL,7
    JMP START_COLORING

    TERRITORY2_COLOR:
        MOV AL,5
    JMP START_COLORING

    START_COLORING:
RET
CHECK_ENEMY_TERRITORY ENDP

RESET_PLAYER1_TAIL PROC NEAR

    MOV CX,0
    MOV DX,0
    FILL_CHECK:
        MOV AH,0DH
        INT 10H
        CMP AL,9
        JE FILL_X
        NEXT_PIXEL:
        INC CX
        CMP CX,320
        JBE FILL_CHECK
        INC DX
        MOV CX,0
        MOV AH,0DH
        INT 10H
        CMP AL,9
        JE FILL_X
        CMP DX,200
        JB FILL_CHECK
        JMP BREAK

        FILL_X:
            MOV AL,0
            MOV AH,0CH
            INT 10H
        JMP NEXT_PIXEL

        BREAK:

RET
RESET_PLAYER1_TAIL ENDP

PLAYER1_RESPAWN PROC NEAR

        CMP PLAYER1_SHIELD,1
        JE PLAYER1_PROTECTED

        SUB PLAYER1_LIVES,1
        MOV CX,SNAKE_X
        SUB CX,1
        MOV DX,SNAKE_Y
        ADD DX,1
        MOV AH,0DH
        INT 10H
        ADD CX,1
        SUB DX,1
        MOV BL,AL
        DRAW_HEAD_DEAD: 
            MOV AH,0CH    ;write pixels
            MOV AL,BL
            MOV BH,0      ;page number
            INT 10H

            INC CX
            MOV AX,CX     ;cx - snake_x > snake size 
            SUB AX,SNAKE_X
            CMP AX,3
            JNG DRAW_HEAD_DEAD
            MOV CX,SNAKE_X ;cx register goes back to initial column
            INC DX         ;advance one line

            MOV AX,DX      ;dx - snake_y > snake size
            SUB AX,SNAKE_Y
            CMP AX,3
            JNG DRAW_HEAD_DEAD
    CALL RESET_PLAYER1_TAIL
    MOV SNAKE_X,0
    MOV SNAKE_Y,7
    MOV CURRENT_SNAKE_DIRECTION,0    

    PLAYER1_PROTECTED:
RET
PLAYER1_RESPAWN ENDP

RESET_PLAYER2_TAIL PROC NEAR

    MOV CX,0
    MOV DX,0
    FILL_CHECK6:
        MOV AH,0DH
        INT 10H
        CMP AL,0DH
        JE FILL_X6
        NEXT_PIXEL6:
        INC CX
        CMP CX,320
        JBE FILL_CHECK6
        INC DX
        MOV CX,0
        MOV AH,0DH
        INT 10H
        CMP AL,0DH
        JE FILL_X6
        CMP DX,200
        JB FILL_CHECK6
        JMP BREAK6

        FILL_X6:
            MOV AL,0
            MOV AH,0CH
            INT 10H
        JMP NEXT_PIXEL6

        BREAK6:

RET
RESET_PLAYER2_TAIL ENDP

PLAYER2_RESPAWN PROC NEAR

            CMP PLAYER2_SHIELD,1
            JE PLAYER2_PROTECTED
            SUB PLAYER2_LIVES,1
            MOV CX,SNAKE2_X
            MOV DX,SNAKE2_Y
            MOV CX,SNAKE2_X
            SUB CX,1
            MOV DX,SNAKE2_Y
            ADD DX,1
            MOV AH,0DH
            INT 10H
            ADD CX,1
            SUB DX,1
            MOV BL,AL
            DRAW_HEAD2_HORIZONTAL2: 
            MOV AH,0CH    ;write pixels
            MOV AL,BL
            MOV BH,0      ;page number
            INT 10H

            INC CX
            MOV AX,CX     ;cx - snake_x > snake size 
            SUB AX,SNAKE2_X
            CMP AX,3
            JNG DRAW_HEAD2_HORIZONTAL2
            MOV CX,SNAKE2_X ;cx register goes back to initial column
            INC DX         ;advance one line

            MOV AX,DX      ;dx - snake_y > snake size
            SUB AX,SNAKE2_Y
            CMP AX,3
            JNG DRAW_HEAD2_HORIZONTAL2
    CALL RESET_PLAYER2_TAIL
    MOV SNAKE2_X,317
    MOV SNAKE2_Y,176
    MOV CURRENT_SNAKE2_DIRECTION,1
    
    PLAYER2_PROTECTED:
RET
PLAYER2_RESPAWN ENDP

NOTIFICATION_BAR PROC NEAR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;DISPLAY FOR PLAYER (1);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    MOV BP,OFFSET PLAYER1       ;display the player 
    MOV AH,13H
    MOV AL,0
    MOV BL,1
    MOV BH,0
    MOV DL,96
    MOV DH,100
    MOV CX,2
    INT 10H

    MOV BP,OFFSET LIVES     ;Display the word lives
    MOV AH,13H
    MOV AL,0
    MOV BL,1
    MOV BH,0
    MOV DL,99
    MOV DH,100
    MOV CX,2
    INT 10H

    MOV AH,2            ; MOVE CRUSOR
    MOV DH,100
    MOV DL,101
    MOV BH,0
    INT 10H
    
    MOV DL,PLAYER1_LIVES    ;display the player lives
    ADD DL,"0"
    MOV AH,02h
    INT 21h

    MOV BP,OFFSET SCORE ;Display the word score
    MOV AH,13H
    MOV AL,0
    MOV BL,1
    MOV BH,0
    MOV DL,103
    MOV DH,100
    MOV CX,6
    INT 10H

    MOV AH,2        ; MOVE CRUSOR
    MOV DH,100      
    MOV DL,109      
    MOV BH,0
    INT 10H

        ;Display Player1 score, Can display up to 999
    mov ah,0
    mov dl,100d
    MOV AX,PLAYER1_DSCORE
    div dl
    add ax, "00"
    mov dx, ax
    xchg al,ah 
    mov ah,02h
    int 21h
    mov al,dh 
    sub ax,"00"

    aam               ; divide by 10: quotient in ah, remainder in al (opposite of DIV)
    add  ax, "00"
    xchg al, ah
    mov  dx, ax
    mov  ah, 02h
    int  21h
    mov  dl, dh
    int  21h

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;DISPLAY FOR PLAYER (2);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    MOV BP,OFFSET PLAYER2       ;display the player 
    MOV AH,13H
    MOV AL,0
    MOV BL,0DH
    MOV BH,0
    MOV DL,120
    MOV DH,100
    MOV CX,2
    INT 10H

    MOV BP,OFFSET LIVES     ;Display the word lives
    MOV AH,13H
    MOV AL,0
    MOV BL,0DH
    MOV BH,0
    MOV DL,123
    MOV DH,100
    MOV CX,2
    INT 10H

    MOV AH,2            ; MOVE CRUSOR
    MOV DH,100
    MOV DL,125
    MOV BH,0
    INT 10H
    
    MOV DL,PLAYER2_LIVES    ;display the player lives
    ADD DL,"0"
    MOV AH,02h
    INT 21h

    MOV BP,OFFSET SCORE ;Display the word score
    MOV AH,13H
    MOV AL,0
    MOV BL,0DH
    MOV BH,0
    MOV DL,127
    MOV DH,100
    MOV CX,6
    INT 10H

    MOV AH,2        ; MOVE CRUSOR
    MOV DH,100      
    MOV DL,133  
    MOV BH,0
    INT 10H

        ;Display Player1 score, Can display up to 999
    mov ah,0
    mov dl,100d
    MOV AX,PLAYER2_DSCORE
    div dl
    add ax, "00"
    mov dx, ax
    xchg al,ah 
    mov ah,02h
    int 21h
    mov al,dh 
    sub ax,"00"

    aam               ; divide by 10: quotient in ah, remainder in al (opposite of DIV)
    add  ax, "00"
    xchg al, ah
    mov  dx, ax
    mov  ah, 02h
    int  21h
    mov  dl, dh
    int  21h

;;;;;;;;;;;;;;;;;;TIMER DISPLAY;;;;;;;;;;;;;;;;;;;
 
MOV AH,2        ; MOVE CRUSOR
MOV DH,100      
MOV DL,116  
MOV BH,0
INT 10H


MOV AL,TIMER
aam               ; divide by 10: quotient in ah, remainder in al (opposite of DIV)
add  ax, "00"
xchg al, ah
mov  dx, ax
mov  ah, 02h
int  21h
mov  dl, dh
int  21h

DEC TIMEGAME
CMP TIMEGAME,0
JNE NOTASECOND
DEC TIMER
MOV TIMEGAME,20
NOTASECOND:
RET
NOTIFICATION_BAR ENDP

GAME_OVER_SCREEN PROC NEAR

    CMP PLAYER1_LIVES,0
    JE PLAYER2_WON
    CMP PLAYER2_LIVES,0
    JE PLAYER1_WON
    JNE WAIT_FOR_ACTION

    PLAYER1_WON:
    MOV AH,0
    MOV AL,03H
    INT 10h
    MOV BP,OFFSET GAME_END
    MOV AH,13H
    MOV AL,4H
    MOV BL,4
    MOV BH,0
    MOV DL,115
    MOV DH,5
    MOV CX,9
    INT 10H
    MOV BP,OFFSET P1_WINNER
    MOV AH,13H
    MOV AL,0
    MOV BL,1
    MOV BH,0
    MOV DL,110
    MOV DH,8
    MOV CX,22
    INT 10H
    JMP WAIT_FOR_ACTION


    PLAYER2_WON:
    MOV AH,0
    MOV AL,03H
    INT 10h
    MOV BP,OFFSET GAME_END
    MOV AH,13H
    MOV AL,4H
    MOV BL,4
    MOV BH,0
    MOV DL,115
    MOV DH,5
    MOV CX,9
    INT 10H
    MOV BP,OFFSET P2_WINNER
    MOV AH,13H
    MOV AL,0
    MOV BL,0DH
    MOV BH,0
    MOV DL,110
    MOV DH,8
    MOV CX,22
    INT 10H
    WAIT_FOR_ACTION:
RET
GAME_OVER_SCREEN ENDP 

CHECK_HEAD_COLLISION PROC NEAR
    MOV CX,SNAKE_X
    MOV DX,SNAKE_Y
    CMP CURRENT_SNAKE_DIRECTION,0
    JE RIGHT_DIRECTION
    CMP CURRENT_SNAKE_DIRECTION,1
    JE LEFT_DIRECTION
    CMP CURRENT_SNAKE_DIRECTION,2
    JE UP_DIRECTION
    CMP CURRENT_SNAKE_DIRECTION,3
    JE DOWN_DIRECTION

    RIGHT_DIRECTION:
        ADD DX,1
        ADD CX,5
        MOV AH,0DH
        INT 10H
        CMP AL,0AH
    JE BOTH_PLAYERS_ARE_DEAD

    LEFT_DIRECTION:
        ADD DX,1
        SUB CX,1
        MOV AH,0DH
        INT 10H
        CMP AL,0AH
    JE BOTH_PLAYERS_ARE_DEAD

    UP_DIRECTION:
        ADD CX,1
        SUB DX,1
        MOV AH,0DH
        INT 10H
        CMP AL,0AH
    JE BOTH_PLAYERS_ARE_DEAD

    DOWN_DIRECTION:
        ADD DX,5
        ADD CX,1
        MOV AH,0DH
        INT 10H
        CMP AL,0AH
    JE BOTH_PLAYERS_ARE_DEAD
    JNE NO_COLLISION

    BOTH_PLAYERS_ARE_DEAD: 
        CALL PLAYER2_RESPAWN
        CALL PLAYER1_RESPAWN   
    RET

    NO_COLLISION:
RET
CHECK_HEAD_COLLISION ENDP

CHECK_P1_POWERUP PROC NEAR
    MOV CX,SNAKE_X
    MOV DX,SNAKE_Y
    CMP CURRENT_SNAKE_DIRECTION,0
    JE RIGHT_DIRECTION_SCAN
    CMP CURRENT_SNAKE_DIRECTION,1
    JE LEFT_DIRECTION_SCAN
    CMP CURRENT_SNAKE_DIRECTION,2
    JE UP_DIRECTION_SCAN
    CMP CURRENT_SNAKE_DIRECTION,3
    JE DOWN_DIRECTION_SCAN

    RIGHT_DIRECTION_SCAN:
        ADD DX,1
        ADD CX,5
        MOV AH,0DH
        INT 10H
        CMP AL,15
        JE SHIELD_POWER
        CMP AL,2
        JE SPEED_POWER
        CMP AL,4
        JE LIFE_POWER
    JNE NO_POWER

    LEFT_DIRECTION_SCAN:
        ADD DX,1
        SUB CX,1
        MOV AH,0DH
        INT 10H
        CMP AL,15
        JE SHIELD_POWER
        CMP AL,2
        JE SPEED_POWER
        CMP AL,4
        JE LIFE_POWER
    JNE NO_POWER

    UP_DIRECTION_SCAN:
        ADD CX,1
        SUB DX,1
        MOV AH,0DH
        INT 10H
        CMP AL,15
        JE SHIELD_POWER
        CMP AL,2
        JE SPEED_POWER
        CMP AL,4
        JE LIFE_POWER
    JNE NO_POWER

    DOWN_DIRECTION_SCAN:
        ADD DX,5
        ADD CX,1
        MOV AH,0DH
        INT 10H
        CMP AL,15
        JE SHIELD_POWER
        CMP AL,2
        JE SPEED_POWER
        CMP AL,4
        JE LIFE_POWER
    JNE NO_POWER

    SHIELD_POWER:
        MOV PLAYER1_SHIELD,1
    RET

    SPEED_POWER:
        MOV PLAYER1_SPEED,1
        MOV SNAKE_VELOCITY_X,2H
        MOV SNAKE_VELOCITY_Y,2H
    RET

    LIFE_POWER:
        ADD PLAYER1_LIVES,1
    RET

    NO_POWER:
RET
CHECK_P1_POWERUP ENDP

CHECK_P2_POWERUP PROC NEAR
    MOV CX,SNAKE2_X
    MOV DX,SNAKE2_Y
    CMP CURRENT_SNAKE2_DIRECTION,0
    JE RIGHT_DIRECTION_SCAN2
    CMP CURRENT_SNAKE2_DIRECTION,1
    JE LEFT_DIRECTION_SCAN2
    CMP CURRENT_SNAKE2_DIRECTION,2
    JE UP_DIRECTION_SCAN2
    CMP CURRENT_SNAKE2_DIRECTION,3
    JE DOWN_DIRECTION_SCAN2

    RIGHT_DIRECTION_SCAN2:
        ADD DX,1
        ADD CX,5
        MOV AH,0DH
        INT 10H
        CMP AL,15
        JE SHIELD_POWER2
        CMP AL,2
        JE SPEED_POWER2
        CMP AL,4
        JE LIFE_POWER2
    JNE NO_POWER2

    LEFT_DIRECTION_SCAN2:
        ADD DX,1
        SUB CX,1
        MOV AH,0DH
        INT 10H
        CMP AL,15
        JE SHIELD_POWER2
        CMP AL,2
        JE SPEED_POWER2
        CMP AL,4
        JE LIFE_POWER2
    JNE NO_POWER2

    UP_DIRECTION_SCAN2:
        ADD CX,1
        SUB DX,1
        MOV AH,0DH
        INT 10H
        CMP AL,15
        JE SHIELD_POWER2
        CMP AL,2
        JE SPEED_POWER2
        CMP AL,4
        JE LIFE_POWER2
    JNE NO_POWER2

    DOWN_DIRECTION_SCAN2:
        ADD DX,5
        ADD CX,1
        MOV AH,0DH
        INT 10H
        CMP AL,15
        JE SHIELD_POWER2
        CMP AL,2
        JE SPEED_POWER2
        CMP AL,4
        JE LIFE_POWER2
    JNE NO_POWER2

    SHIELD_POWER2:
        MOV PLAYER2_SHIELD,1
    RET

    SPEED_POWER2:
        MOV PLAYER2_SPEED,1
        MOV SNAKE2_VELOCITY_X,2H
        MOV SNAKE2_VELOCITY_Y,2H 
    RET

    LIFE_POWER2:
        CMP LIFE,1
        JE NO_POWER
        MOV LIFE,1
        ADD PLAYER2_LIVES,1
    RET

    NO_POWER2:
RET
CHECK_P2_POWERUP ENDP

CHECK_P1_TERRITORY PROC NEAR
    CMP  P1_MOVING_IN_SPACE,1
    JNE NO_TERRITORY
    MOV CX,SNAKE_X
    MOV DX,SNAKE_Y
    CMP CURRENT_SNAKE_DIRECTION,0
    JE RIGHT_DIRECTION_TERRITORY
    CMP CURRENT_SNAKE_DIRECTION,1
    JE LEFT_DIRECTION_TERRITORY
    CMP CURRENT_SNAKE_DIRECTION,2
    JE UP_DIRECTION_TERRITORY
    CMP CURRENT_SNAKE_DIRECTION,3
    JE DOWN_DIRECTION_TERRITORY

    RIGHT_DIRECTION_TERRITORY:
        ADD DX,1
        ADD CX,5
        MOV AH,0DH
        INT 10H
        CMP AL,3
        JE P1_DEPTH_CHECK
        CMP AL,7
        JE CHECK_BDEPTH
        CMP AL,5
        JE CHECK_ENEMYT_DEPTH
    JNE NO_TERRITORY

    LEFT_DIRECTION_TERRITORY:
        ADD DX,1
        SUB CX,1
        MOV AH,0DH
        INT 10H
        CMP AL,3
        JE P1_DEPTH_CHECK
        CMP AL,7
        JE CHECK_BDEPTH
        CMP AL,5
        JE CHECK_ENEMYT_DEPTH
    JNE NO_TERRITORY

    UP_DIRECTION_TERRITORY:
        ADD CX,1
        SUB DX,1
        MOV AH,0DH
        INT 10H
        CMP AL,3
        JE P1_DEPTH_CHECK
        CMP AL,7
        JE CHECK_BDEPTH
        CMP AL,5
        JE CHECK_ENEMYT_DEPTH
    JNE NO_TERRITORY

    DOWN_DIRECTION_TERRITORY:
        ADD DX,5
        ADD CX,1
        MOV AH,0DH
        INT 10H
        CMP AL,3
        JE P1_DEPTH_CHECK
        CMP AL,7
        JE CHECK_BDEPTH
        CMP AL,5
        JE CHECK_ENEMYT_DEPTH
    JNE NO_TERRITORY

    CHECK_BDEPTH:
        INC P1_BORDER_DEPTH
        CMP PLAYER1_SPEED,0
        JE NOTSPEED
        CMP P1_BORDER_DEPTH,3
        JMP KEEPIT
        NOTSPEED:
        CMP P1_BORDER_DEPTH,5
        KEEPIT:
    JE DONT_COLOR
    JNE NO_TERRITORY

    CHECK_ENEMYT_DEPTH:
        INC P1_DEPTH
        CMP PLAYER1_SPEED,0
        JE NOTSPEED1
        CMP P1_DEPTH,3
        JMP KEEPIT1
        NOTSPEED1:
        CMP P1_DEPTH,5
        KEEPIT1:
    JE CLOSED_AREA
    JNE NO_TERRITORY

    P1_DEPTH_CHECK:
        INC P1_DEPTH
        CMP PLAYER1_SPEED,0
        JE NOTSPEED2
        CMP P1_DEPTH,3
        JMP KEEPIT2
        NOTSPEED2:
        CMP P1_DEPTH,5
        KEEPIT2:
    JE CLOSED_AREA
    JNE NO_TERRITORY

    DONT_COLOR:
        MOV P1_BORDER_DEPTH,0
        MOV P1_DEPTH,0
        MOV P1_MOVING_IN_SPACE,0
        CALL FILL_BOUNDED_AREA
        CALL FILL_VERTICAL_AREA
        CALL HORIZONTAL_LINE_FILL
        CALL COLOR_TAIL
    JMP NO_TERRITORY

    CLOSED_AREA:
        CALL FILL_BOUNDED_AREA
        CALL FILL_VERTICAL_AREA
        CALL HORIZONTAL_LINE_FILL
        CALL COLOR_TAIL
        MOV P1_MOVING_IN_SPACE,0
        MOV P1_DEPTH,0
        MOV P1_BORDER_DEPTH,0
    NO_TERRITORY:
RET
CHECK_P1_TERRITORY ENDP

CHECK_P2_TERRITORY PROC NEAR
    CMP  P2_MOVING_IN_SPACE,1
    JNE NO_TERRITORY2
    MOV CX,SNAKE2_X
    MOV DX,SNAKE2_Y
    CMP CURRENT_SNAKE2_DIRECTION,0
    JE RIGHT_DIRECTION_TERRITORY2
    CMP CURRENT_SNAKE2_DIRECTION,1
    JE LEFT_DIRECTION_TERRITORY2
    CMP CURRENT_SNAKE2_DIRECTION,2
    JE UP_DIRECTION_TERRITORY2
    CMP CURRENT_SNAKE2_DIRECTION,3
    JE DOWN_DIRECTION_TERRITORY2

    RIGHT_DIRECTION_TERRITORY2:
        ADD DX,1
        ADD CX,5
        MOV AH,0DH
        INT 10H
        CMP AL,3
        JE P2_DEPTH_CHECK
        CMP AL,7
        JE CHECK_BDEPTH2
        CMP AL,5
        JE CHECK_ENEMYT_DEPTH2
    JNE NO_TERRITORY2

    LEFT_DIRECTION_TERRITORY2:
        ADD DX,1
        SUB CX,1
        MOV AH,0DH
        INT 10H
        CMP AL,3
        JE P2_DEPTH_CHECK
        CMP AL,7
        JE CHECK_BDEPTH2
        CMP AL,5
        JE CHECK_ENEMYT_DEPTH2
    JNE NO_TERRITORY2

    UP_DIRECTION_TERRITORY2:
        ADD CX,1
        SUB DX,1
        MOV AH,0DH
        INT 10H
        CMP AL,3
        JE P2_DEPTH_CHECK
        CMP AL,7
        JE CHECK_BDEPTH2
        CMP AL,5
        JE CHECK_ENEMYT_DEPTH2
    JNE NO_TERRITORY2

    DOWN_DIRECTION_TERRITORY2:
        ADD DX,5
        ADD CX,1
        MOV AH,0DH
        INT 10H
        CMP AL,3
        JE P2_DEPTH_CHECK
        CMP AL,7
        JE CHECK_BDEPTH2
        CMP AL,5
        JE CHECK_ENEMYT_DEPTH2
    JNE NO_TERRITORY2

    CHECK_BDEPTH2:
        INC P2_BORDER_DEPTH
        CMP PLAYER2_SPEED,0
        JE NOTSPEED22
        CMP P2_BORDER_DEPTH,4
        JMP KEEPIT22
        NOTSPEED22:
        CMP P2_BORDER_DEPTH,7
        KEEPIT22:
    JE DONT_COLOR2
    JNE NO_TERRITORY2

    CHECK_ENEMYT_DEPTH2:
        INC P2_DEPTH
        CMP PLAYER2_SPEED,0
        JE NOTSPEED12
        CMP P2_DEPTH,4
        JMP KEEPIT12
        NOTSPEED12:
        CMP P2_DEPTH,7
        KEEPIT12:
    JE CLOSED_AREA2
    JNE NO_TERRITORY2

    P2_DEPTH_CHECK:
        INC P2_DEPTH
        CMP PLAYER2_SPEED,0
        JE NOTSPEED222
        CMP P1_DEPTH,4
        JMP KEEPIT222
        NOTSPEED222:
        CMP P2_DEPTH,7
        KEEPIT222:
    JE CLOSED_AREA2
    JNE NO_TERRITORY2

    DONT_COLOR2:
        MOV P2_BORDER_DEPTH,0
        MOV P2_DEPTH,0
        MOV P2_MOVING_IN_SPACE,0
        CALL FILL_BOUNDED_AREA2
        CALL FILL_VERTICAL_AREA2
        CALL HORIZONTAL_LINE_FILL2
        CALL COLOR_TAIL2
    JMP NO_TERRITORY2

    CLOSED_AREA2:
        CALL FILL_BOUNDED_AREA2
        CALL FILL_VERTICAL_AREA2
        CALL HORIZONTAL_LINE_FILL2
        CALL COLOR_TAIL2
        MOV P2_MOVING_IN_SPACE,0
        MOV P2_DEPTH,0
        MOV P2_BORDER_DEPTH,0
    NO_TERRITORY2:
RET
CHECK_P2_TERRITORY ENDP

        ;                                        POWER UP PROCEDURES

SHIELD PROC NEAR

    CMP TIMER,99
    JE SHIELD_ICON_APPEARS
    JNE NO_SHIELD

    SHIELD_ICON_APPEARS:
        MOV CX,SHIELD_X
        MOV DX,SHIELD_Y

    DRAW_SHIELD: 
        MOV AH,0CH    ;write pixels
        MOV AL,15      ;color
        MOV BH,0      ;page number
        INT 10H

        INC CX
        MOV AX,CX     
        SUB AX,SHIELD_X
        CMP AX,2
    JNG DRAW_SHIELD
        MOV CX,SHIELD_X ;cx register goes back to initial column
        INC DX         ;advance one line

        MOV AX,DX      
        SUB AX,SHIELD_Y
        CMP AX,2
    JNG DRAW_SHIELD
    

    NO_SHIELD:
    CMP PLAYER1_SHIELD,1
    JE CHECK_SHIELD_TIME
    CMP PLAYER2_SHIELD,1
    JE CHECK_SHIELD_TIME

    CMP TIMER,84
    JE SHIELD_ICON_DISAPPEARS
    JNE NOT_YET

    SHIELD_ICON_DISAPPEARS:
        MOV CX,SHIELD_X
        MOV DX,SHIELD_Y
        SUB CX,1
        SUB DX,1
        MOV AH,0DH
        INT 10H
        MOV BL,AL
        ADD CX,1
        ADD DX,1
    DELETE_SHIELD: 
        MOV AH,0CH    ;write pixels
        MOV AL,BL     ;color
        MOV BH,0      ;page number
        INT 10H

        INC CX
        MOV AX,CX     
        SUB AX,SHIELD_X
        CMP AX,2
    JNG DELETE_SHIELD
        MOV CX,SHIELD_X ;cx register goes back to initial column
        INC DX         ;advance one line

        MOV AX,DX      
        SUB AX,SHIELD_Y
        CMP AX,2
    JNG DELETE_SHIELD
    JMP NOT_YET

    CHECK_SHIELD_TIME:
        DEC SHIELD_TIME
        CMP SHIELD_TIME,0
        JNE NOT_YET
        DEC SHIELD_TIMER
        MOV SHIELD_TIME,20
        CMP SHIELD_TIMER,50
    JNE NOT_YET

    REMOVE_SHIELD:
        MOV PLAYER1_SHIELD,0
        MOV PLAYER2_SHIELD,0

    NOT_YET:
RET
SHIELD ENDP

SPEED PROC NEAR

    CMP TIMER,97
    JE SPEED_ICON_APPEARS
    JNE NO_SPEED_ICON
    
    SPEED_ICON_APPEARS:
        MOV CX,SPEED_X
        MOV DX,SPEED_Y

    DRAW_SPEED: 
        MOV AH,0CH    ;write pixels
        MOV AL,2      ;color
        MOV BH,0      ;page number
        INT 10H

        INC CX
        MOV AX,CX     
        SUB AX,SPEED_X
        CMP AX,2
    JNG DRAW_SPEED
        MOV CX,SPEED_X ;cx register goes back to initial column
        INC DX         ;advance one line

        MOV AX,DX      
        SUB AX,SPEED_Y
        CMP AX,2
    JNG DRAW_SPEED

    NO_SPEED_ICON:
    CMP PLAYER1_SPEED,1
    JE CHECK_SPEED_TIME
    CMP PLAYER2_SPEED,1
    JE CHECK_SPEED_TIME

    CMP TIMER,0
    JE SPEED_ICON_DISAPPEARS
    JNE NO_SPEED

    SPEED_ICON_DISAPPEARS:
        MOV CX,SPEED_X
        MOV DX,SPEED_Y
        SUB CX,1
        SUB DX,1
        MOV AH,0DH
        INT 10H
        MOV BL,AL
        ADD CX,1
        ADD DX,1
    DELETE_SPEED: 
        MOV AH,0CH    ;write pixels
        MOV AL,BL      ;color
        MOV BH,0      ;page number
        INT 10H

        INC CX
        MOV AX,CX     
        SUB AX,SPEED_X
        CMP AX,2
    JNG DELETE_SPEED
        MOV CX,SPEED_X ;cx register goes back to initial column
        INC DX         ;advance one line

        MOV AX,DX      
        SUB AX,SPEED_Y
        CMP AX,2
    JNG DELETE_SPEED   

    CHECK_SPEED_TIME:
        DEC SPEED_TIME
        CMP SPEED_TIME,0
        JNE NO_SPEED
        DEC SPEED_TIMER
        MOV SPEED_TIME,20
        CMP SPEED_TIMER,50
        JE REMOVE_SPEED
    JNE NO_SPEED

    REMOVE_SPEED:
        CMP PLAYER1_SPEED,1
        JE SLOW_PLAYER1
        CMP PLAYER2_SPEED,1
        JE SLOW_PLAYER2

        SLOW_PLAYER1:
            MOV PLAYER1_SPEED,0
            MOV SNAKE_VELOCITY_X,1
            MOV SNAKE_VELOCITY_Y,1
        JMP NO_SPEED

        SLOW_PLAYER2:
            MOV PLAYER2_SPEED,0
            MOV SNAKE2_VELOCITY_X,1
            MOV SNAKE2_VELOCITY_Y,1
        JMP NO_SPEED

    NO_SPEED:
RET
SPEED ENDP

EXTRA_LIFE PROC NEAR

    CMP TIMER,97
    JE EXTRA_LIFE_ICON_APPEARS
    JNE DELETE_LIFE_ICON
    
    EXTRA_LIFE_ICON_APPEARS:
        MOV CX,LIFE_X
        MOV DX,LIFE_Y

    DRAW_LIFE: 
        MOV AH,0CH    ;write pixels
        MOV AL,4      ;color
        MOV BH,0      ;page number
        INT 10H

        INC CX
        MOV AX,CX     
        SUB AX,LIFE_X
        CMP AX,2
    JNG DRAW_LIFE
        MOV CX,LIFE_X ;cx register goes back to initial column
        INC DX         ;advance one line

        MOV AX,DX      
        SUB AX,LIFE_Y
        CMP AX,2
    JNG DRAW_LIFE

    DELETE_LIFE_ICON:
    CMP TIMER,0
    JE EXTRA_LIFE_ICON_DISAPPEARS
    JNE NO_LIFE_ICON

    EXTRA_LIFE_ICON_DISAPPEARS:
        MOV CX,LIFE_X
        MOV DX,LIFE_Y
        SUB CX,1
        SUB DX,1
        MOV AH,0DH
        INT 10H
        MOV BL,AL
        ADD CX,1
        ADD DX,1
    DELETE_LIFE: 
        MOV AH,0CH    ;write pixels
        MOV AL,BL      ;color
        MOV BH,0      ;page number
        INT 10H

        INC CX
        MOV AX,CX     
        SUB AX,LIFE_X
        CMP AX,2
    JNG DELETE_LIFE
        MOV CX,LIFE_X ;cx register goes back to initial column
        INC DX         ;advance one line

        MOV AX,DX      
        SUB AX,LIFE_Y
        CMP AX,2
    JNG DELETE_LIFE   

    NO_LIFE_ICON:
RET
EXTRA_LIFE ENDP

        ;                                         PLAYER 1 PROCEDURES

DRAW_SNAKE PROC NEAR

        MOV CX,SNAKE_X ;initial value (x)
        MOV DX,SNAKE_Y ;initial value (y)


        DRAW_SNAKE_HORIZONTAL:
            CALL CHECK_TERRITORY
            MOV AH,0CH    ;write pixels     
            MOV BH,0      ;page number
            INT 10H

            INC CX
            MOV AX,CX     ;cx - snake_x > snake size 
            SUB AX,SNAKE_X
            CMP AX,SNAKE_SIZE
            JNG DRAW_SNAKE_HORIZONTAL
            MOV CX,SNAKE_X ;cx register goes back to initial column
            INC DX         ;advance one line

            MOV AX,DX      ;dx - snake_y > snake size
            SUB AX,SNAKE_Y
            CMP AX,SNAKE_SIZE
            JNG DRAW_SNAKE_HORIZONTAL
   
RET
DRAW_SNAKE ENDP

DRAW_HEAD PROC NEAR

        MOV CX,SNAKE_X ;initial value (x)
        MOV DX,SNAKE_Y ;initial value (y)
        CALL CHECK_HEAD_POSITION_COLOR
        DRAW_HEAD_HORIZONTAL: 
            MOV AH,0CH    ;write pixels
            MOV AL,7      ;color
            MOV BH,0      ;page number
            INT 10H

            INC CX
            MOV AX,CX     ;cx - snake_x > snake size 
            SUB AX,SNAKE_X
            CMP AX,3
            JNG DRAW_HEAD_HORIZONTAL
            MOV CX,SNAKE_X ;cx register goes back to initial column
            INC DX         ;advance one line

            MOV AX,DX      ;dx - snake_y > snake size
            SUB AX,SNAKE_Y
            CMP AX,3
            JNG DRAW_HEAD_HORIZONTAL

            MOV CX,SNAKE_X
            ADD CX,1
            MOV DX,SNAKE_Y
            ADD DX,1

        DRAW_HEAD_LIMITS: 
            MOV AH,0CH    ;write pixels
            MOV AL,1      ;color
            MOV BH,0      ;page number
            INT 10H

            INC CX
            MOV AX,CX     ;cx - snake_x > snake size 
            SUB AX,SNAKE_X
            CMP AX,2
            JNG DRAW_HEAD_LIMITS
            MOV CX,SNAKE_X ;cx register goes back to initial column
            ADD CX,1
            INC DX         ;advance one line

            MOV AX,DX      ;dx - snake_y > snake size
            SUB AX,SNAKE_Y
            CMP AX,2
        JNG DRAW_HEAD_LIMITS


RET
DRAW_HEAD ENDP

CHECK_HEAD_POSITION_COLOR PROC NEAR

    CMP CURRENT_SNAKE_DIRECTION,3
    JNE RIGHT_ERROR
    ADD DX,4
    MOV AH,0DH
    INT 10H
    SUB DX,4
    JMP CHECK_COLORZ

    RIGHT_ERROR:
    CMP CURRENT_SNAKE_DIRECTION,0
    JNE MAIN_TEST
    ADD CX,4
    SUB DX,1
    MOV AH,0DH
    INT 10H
    SUB CX,4
    ADD DX,1
    JMP CHECK_COLORZ

    MAIN_TEST:
    SUB CX,1
    SUB DX,1
    MOV AH,0DH
    INT 10H
    ADD CX,1
    ADD DX,1    

    CHECK_COLORZ:
    CMP AL,0AH
    JE BOTH_PLAYERS_DIED
    CMP AL,0DH
    JE KILLED_PLAYER2
    CMP AL,9
    JE PLAYER1_IS_DEAD
    CMP AL,0AH
    JE BOTH_PLAYERS_DIED
    CMP AL,7
    JE BORDER_DETECTED
    CMP AL,3
    JE CHECK_FOR_DEPTH
    CMP AL,5
    JE CHECK_FOR_ET_DEPTH
    CMP AL,0
    JE CHECK_FOR_SPACE   

    SPACE_DETECTED:
        MOV TAIL_COLOR,9
        MOV P1_MOVING_IN_SPACE,1
        MOV T1_DEPTH,0
        MOV P1_BORDER_DEPTH,0
    JMP CHANGE_TAIL_COLOR


    ENEMY_TERRITORY:
        MOV TAIL_COLOR,5
        MOV S1_DEPTH,0
        MOV T1_DEPTH,0
        MOV P1_BORDER_DEPTH,0
    JMP CHANGE_TAIL_COLOR

    BORDER_DETECTED:
        MOV TAIL_COLOR,7
        MOV S1_DEPTH,0
        MOV T1_DEPTH,0
        MOV ET1_DEPTH,0
    JMP CHANGE_TAIL_COLOR

    TERRITORY_DETECTED:
        MOV TAIL_COLOR,3
        MOV S1_DEPTH,0
        MOV ET1_DEPTH,0
        MOV P1_BORDER_DEPTH,0
    JMP CHANGE_TAIL_COLOR

    PLAYER1_IS_DEAD:
        CALL PLAYER1_RESPAWN
    JMP CHANGE_TAIL_COLOR

    CHECK_FOR_SPACE:
        INC S1_DEPTH
        CMP PLAYER1_SPEED,0
        JE NOSPEED
        CMP S1_DEPTH,3
        JMP KEEPGOING
        NOSPEED:
        CMP S1_DEPTH,5
        KEEPGOING:
        MOV P1_BORDER_DEPTH,0
    JE SPACE_DETECTED
    JNE CHANGE_TAIL_COLOR

    CHECK_FOR_ET_DEPTH:
        INC ET1_DEPTH
        CMP PLAYER1_SPEED,0
        JE NOSPEED1
        CMP ET1_DEPTH,3
        JMP KEEPGOING
        NOSPEED1:
        CMP ET1_DEPTH,5
        KEEPGOING1:
        MOV P1_BORDER_DEPTH,0
    JE ENEMY_TERRITORY
    JNE CHANGE_TAIL_COLOR  

    CHECK_FOR_DEPTH:
        INC T1_DEPTH
        CMP PLAYER1_SPEED,0
        JE NOSPEED2
        CMP T1_DEPTH,3
        JMP KEEPGOING2
        NOSPEED2:
        CMP T1_DEPTH,5
        KEEPGOING2:
        MOV P1_BORDER_DEPTH,0
    JE TERRITORY_DETECTED
    JNE CHANGE_TAIL_COLOR

    KILLED_PLAYER2:
        CALL PLAYER2_RESPAWN
    JMP CHANGE_TAIL_COLOR

    BOTH_PLAYERS_DIED:
        CALL PLAYER1_RESPAWN
        CALL PLAYER2_RESPAWN

    CHANGE_TAIL_COLOR:
    CALL CHECK_TERRITORY
RET
CHECK_HEAD_POSITION_COLOR ENDP

CHECK_TERRITORY PROC NEAR
    CMP CX,6
    JBE BORDER_COLOR
    CMP DX,180
    JAE BORDER_COLOR
    CMP CX,313
    JAE BORDER_COLOR
    CMP DX,7
    JB BORDER_COLOR
    
    CMP TAIL_COLOR,3
    JE  TERRITORY_COLOR
    CMP TAIL_COLOR,9
    JE SPACE_COLOR
    CMP TAIL_COLOR,5
    JE ENEMY_TERRITORY_COLOR

    SPACE_COLOR:
        MOV AL,9
    JMP CONVERT_COLOR

    TERRITORY_COLOR:
        MOV AL,3
    JMP CONVERT_COLOR

    ENEMY_TERRITORY_COLOR:
        MOV AL,5
    JMP CONVERT_COLOR

    BORDER_COLOR:
        MOV AL,7
    JMP CONVERT_COLOR


    CONVERT_COLOR:

RET
CHECK_TERRITORY ENDP

MOVE_HEAD PROC NEAR
       
        CALL DRAW_SNAKE       
        MOV AH,01H
        INT 16H
        JZ DONEKEYPRESS

        MOV AH,00H
        INT 16H


        DONEKEYPRESS:
        CMP AL,64H
        JE MOVE_RIGHT2
        CMP AL,44H
        JE MOVE_RIGHT2

        CMP AL,77H
        JE MOVE_UP2
        CMP AL,57H
        JE MOVE_UP2

        CMP AL,73H
        JE MOVE_DOWN2
        CMP AL,53H
        JE MOVE_DOWN2

        CMP AL,61H
        JE MOVE_LEFT2     
        CMP AL,41H
        JE MOVE_LEFT2 

        jmp GotNothing

        MOVE_RIGHT2:
                MOV CX,SNAKE_VELOCITY_X
                CMP SNAKE_X,315
                JAE MOVE_DOWN2
                ADD SNAKE_X,CX
                CMP SNAKE_X,315             ;If the next pixel is outside of the border change direction clockwise
                JE MOVE_DOWN2
                CMP SNAKE_X,313
                JNE NEXT_LINE
                CMP SNAKE_Y,7
                JB  NEXT_LINE
                NEXT_LINE:
                MOV CURRENT_SNAKE_DIRECTION,0
        JMP CHECK_HEAD_MOVEMENT

        MOVE_UP2:
                MOV DX,SNAKE_VELOCITY_Y
                CMP SNAKE_Y,1
                JBE MOVE_RIGHT2 
                SUB SNAKE_Y,DX  
                CMP SNAKE_Y,0              ;If the next pixel is outside of the border change direction clockwise
                JE MOVE_RIGHT2   
                CMP SNAKE_Y,3
                JNE NEXT_LINE2
                CMP SNAKE_X,6
                JB NEXT_LINE2
                NEXT_LINE2:        
                MOV CURRENT_SNAKE_DIRECTION,2
        JMP CHECK_HEAD_MOVEMENT

        MOVE_DOWN2:
                MOV DX,SNAKE_VELOCITY_Y
                CMP SNAKE_Y,182
                JAE MOVE_LEFT2
                ADD SNAKE_Y,DX
                CMP SNAKE_Y,182             ;If the next pixel is outside of the border change direction clockwise
                JE MOVE_LEFT2
                CMP SNAKE_Y,180
                JNE NEXT_LINE3
                CMP SNAKE_X,6
                JB NEXT_LINE3
                CMP SNAKE_X,312
                JA NEXT_LINE3
                NEXT_LINE3: 
                MOV CURRENT_SNAKE_DIRECTION,3
        JMP CHECK_HEAD_MOVEMENT

        MOVE_LEFT2:
                MOV DX,SNAKE_VELOCITY_X
                CMP SNAKE_X,1
                JBE MOVE_UP2 
                SUB SNAKE_X,DX
                CMP SNAKE_X,0               ;If the next pixel is outside of the border change direction clockwise
                JE MOVE_UP2 
                CMP SNAKE_X,3
                JNE NEXT_LINE4
                CMP SNAKE_Y,180
                JA NEXT_LINE4
                NEXT_LINE4: 
                MOV CURRENT_SNAKE_DIRECTION,1
        JMP CHECK_HEAD_MOVEMENT

        GotNothing:                 ;if we got no key stroke we move here and work on the old key stroke, otherwise it is skipped
        MOV AX,CURRENT_SNAKE_DIRECTION

        CMP AX,0
        JE MOVE_RIGHT2

        CMP AX,1
        JE MOVE_LEFT2

        CMP AX,2
        JE MOVE_UP2

        CMP AX,3
        JE MOVE_DOWN2

        CHECK_HEAD_MOVEMENT:

RET
MOVE_HEAD ENDP

COLOR_TAIL PROC NEAR

    MOV CX,0
    MOV DX,0
    FILL_CHECK3:
        MOV AH,0DH
        INT 10H
        CMP AL,9
        JE FILL_X3
        NEXT_PIXEL3:
        INC CX
        CMP CX,320
        JBE FILL_CHECK3
        INC DX
        MOV CX,0
        MOV AH,0DH
        INT 10H
        CMP AL,9
        JE FILL_X3
        CMP DX,200
        JB FILL_CHECK3
        JMP BREAK3

        FILL_X3:
            MOV AL,3
            MOV AH,0CH
            INT 10H
        JMP NEXT_PIXEL3

        BREAK3:

RET
COLOR_TAIL ENDP

FILL_VERTICAL_AREA PROC NEAR
    MOV CX,AREA_X
    MOV DX,AREA_Y
    MOV BL,0
    MOV BH,4
    CHECK_GRID:
        CHECK_COLUMN:
        MOV AH,0DH
        INT 10H
        CMP AL,0
        JNE DEBUG
        INC BL
        KEEP_GOING:
        INC DX
        CMP DX,179
        JA NEXT_ROW
        JB CHECK_COLUMN


        DEBUG: 
            CMP BL,4
            JE CHECK_NEXT_PIXEL
            MOV BL,0
        JMP KEEP_GOING

        CHECK_NEXT_PIXEL:
            INC DX
            MOV AH,0DH
            INT 10H
            DEC DX
            CMP AL,3
        JNE NEXT_ROW
        JE FILL_SPACE

        FILL_SPACE:
            DEC DX
            MOV AH,0CH
            MOV AL,3
            INT 10H
            DEC BH
            CMP BH,0
            MOV BL,0
        JE RESET_LOOP_COUNTER
        JA FILL_SPACE

        RESET_LOOP_COUNTER:
        MOV BH,4
        JMP CHECK_COLUMN

        NEXT_ROW:
            MOV BH,4
            MOV BL,0
            INC CX
            CMP CX,314
            JE BREAK5
            MOV DX,AREA_Y
            JMP CHECK_COLUMN
    BREAK5:
RET
FILL_VERTICAL_AREA ENDP

HORIZONTAL_LINE_FILL PROC NEAR
    MOV CX,6
    MOV DX,6
    FIND_LINE:
        MOV AH,0DH
        INT 10H
        CMP AL,9
        JE CHECK_ABOVE_OR_BELOW
        INC CX
        CMP CX,310
    JB FIND_LINE
        MOV CX,6
        INC DX
        CMP DX,180
    JB FIND_LINE

    CHECK_ABOVE_OR_BELOW:
        DEC DX
        MOV START_OR_END,CX
        FIND_ABOVE:
            MOV AH,0DH
            INT 10H
            CMP AL,9
            JE NOPE
            INC CX
            CMP CX,310
        JB FIND_ABOVE

        ADD DX,5
        MOV CURRENT_ROW,DX
        MOV CX,START_OR_END
        FIND_BELOW:
            MOV AH,0DH
            INT 10H
            CMP AL,9
            JE NOPE
            INC CX
            CMP CX,310
        JB FIND_BELOW

        COLOR_EMPTY:
            MOV CX,START_OR_END
            MOV DX,CURRENT_ROW
            CMP DX,90
            JA COLOR_BELOW

            COLOR_ABOVE:
                DEC DX
                MOV AH,0DH
                INT 10H
                CMP AL,9
                JNE NOPE
            COLORING_LOOP:
                MOV AH,0CH
                MOV AL,3
                INT 10H
                DEC DX
                CMP DX,6
            JA COLORING_LOOP
                MOV DX,CURRENT_ROW
                INC CX
                CMP CX,310
            JB COLOR_ABOVE
            JMP NOPE

            COLOR_BELOW:
                DEC DX
                MOV AH,0DH
                INT 10H
                CMP AL,9
                JNE NOPE
            COLOR_LOOP:
                MOV AH,0CH
                MOV AL,3
                INT 10H
                INC DX
                CMP DX,180
            JB COLOR_LOOP
                MOV DX,CURRENT_ROW
                INC CX
                CMP CX,310
            JB COLOR_BELOW



        NOPE:
RET
HORIZONTAL_LINE_FILL ENDP

FILL_BOUNDED_AREA PROC NEAR
    MOV CX,AREA_X
    MOV DX,AREA_Y
    MOV BL,0
    FILL_AREA_IN:
        MOV AH,0DH               ;check the color of this pixel
        INT 10H    
        CMP AL,9                 ;if its blue trigger the snake trail counter (checks the number of pixels to determine when the boundary ends)
    JNE DONT_INC             ;if its not blue then check if its a black pixel thats beyond the boundary  
        INC BL
        DONT_INC:
        CMP BL,3                 ;if the blue pixel count is above the boundary size then the black pixels needs to be filled  
    JNE NEXT_PIXEL2
    MOV START_OR_END,CX      ;efred delwa2ty ana el shakl bad2o men el shemal w maloosh snake border 3la el shemal
    CHECK_IF_END:            ;m7tag a3raf el shakl da bade2 mneen, fa lw awl point soda b3d el snake body mafeesh waraha pixel zar2a yeb2a el body da kan el end
    BORDER_END:             
    INC CX
    MOV AH,0DH              
    INT 10H
    CMP AL,9                ;ha3mel check 3la kol el pixels el gya ashoof fe azra2 wla la
    JE COLOR                ;lw fe azra2 yeb2a harga3 lel point el bada2t el check men 3ando b3d keda alawn l7ad mawsal lel azra2 3ady w da haye7sal 3and label color
    CMP CX,310
    JB BORDER_END         
    MOV CX,START_OR_END     ;tab lw mafeesh azra2 fa keda ana 3ref en el point el zar2a el fatet kanet a5er point fel fill fa m7tag a3mel fill lel ablaha
    CMP CURRENT_SNAKE_DIRECTION,0
    JE COLOR_AFTER
    CMP CURRENT_SNAKE_DIRECTION,1
    JE JUMP_HERE
    CMP CX,160
    JA COLOR_AFTER

    JUMP_HERE:
    SUB CX,2                ;harga3 lel point bta3t nhayet el snake body w arga3 le awl pixel soda alawenha 
    LOOK_FOR_BLACK:
    DEC CX
    MOV AH,0DH  
    INT 10H
    CMP AL,9
    JE LOOK_FOR_BLACK
    COLOR_BEFORE:           ;b3d keda halawen kol el pixels el ableha l7ad mawsal lnhayet el border
    MOV AH,0DH
    INT 10H
    CMP AL,0
    JNE NEXT_Y
    MOV AH,0CH
    MOV AL,3
    INT 10H
    DEC CX
    CMP CX,6
    JA COLOR_BEFORE
    JMP NEXT_Y

    COLOR_AFTER:           ;b3d keda halawen kol el pixels el ableha l7ad mawsal lnhayet el border
    MOV AH,0DH
    INT 10H
    CMP AL,0
    JNE NEXT_Y
    MOV AH,0CH
    MOV AL,3
    INT 10H
    INC CX
    CMP CX,313
    JB COLOR_AFTER
    JMP NEXT_Y

    COLOR:
    MOV CX,START_OR_END
    INC CX           ;this checks the pixel thats after the last pixel in the snake boundary  
    MOV AH,0DH
    INT 10H
    CMP AL,0         ;if its black then we need to change its color  
    JNE NEXT_PIXEL2  ;if not then we need to loop over the next pixel to check its color
    MOV AL,3         ;change the color of the black pixel 
    MOV AH,0CH
    INT 10H
    DEC CX           ;we need to decrement the value of the cx because we already did increment it earlier if we dont decrement then it will skip a pixel every 2 pixels (through trial and error)                       
    MOV AH,0CH       ;Lw m3mltesh de hayeb2a fe awl pixel fadya fel fill
    INT 10H
    JMP NEXT_PIXEL2
    NEXT_PIXEL2:         ;check the color of the next pixel
    CMP BL,6       ;check the blue counter, if its 12 that means that we hit the other side of the snake so we need to stop coloring
    JE RESET            
    SET:
    INC CX           ;we increment to find the next pixel  
    CMP CX,311       ;the limit in which we need to loop over
    JBE FILL_AREA_IN  
    NEXT_Y: 
    MOV BL,0 
    INC DX           ;if the value of cx exceeds the limit then we need to reset it  
    MOV CX,AREA_X    ;and start looping over the next "y"
    CMP DX,180
    JBE FILL_AREA_IN
    JMP BREAK2       ;if the fill area search reaches its end boundary we terminate the program


    RESET:
    INC CX           ;hena ana 3ayz a3mel check en el azra2 akbar men el 2 frames lw akbar yeb2a keda da 5at betool w mesh halaweno
    MOV AH,0DH      
    INT 10H
    CMP AL,9         ;tab efred el 5at el bel 3ard da mesh nhayet el shakl w lessa fe ta7teh bounded area m7tag alawenha 
    JE CHECK_MORE   ;fa haroo7 a3mel check eza kan a5er satr f3lan wla m7tag alawen zyada
    MOV BL,0         ;here we reset the blue pixel counter in so we can check for boundaries in the next line
    JMP SET

    CHECK_MORE:
    CHECK_IF_BORDER:
    INC CX             ;delwa2ty ana ha3od a3mel check 3la kol el pixels el gya lw zar2a yeb2a ana lessa fel 5at el bel 3ard
    CMP CX,311         ;lw soda yeb2a ana keda 5aragt bara el 5at da
    JE NEXT_Y           
    MOV AH,0DH          
    INT 10H             
    CMP AL,9            
    JNE NEW_SHAPE        
    JE CHECK_IF_BORDER

    NEW_SHAPE:              ;keda ana 3andy e7tmaleen ya2ema ana 5aragt bara el 5at w f3lan el shakl 5ls
    INC CX              ;ya2ema el black pixel el ana shoftaha de m7tag alawenha l7ad mala2y el border el ba3deh    
    CMP CX,311          ;lw fdlt mashy wra el eswed w el border bta3 el shasha 5ls fana keda f3lan el shakl 5ls w mesh m7tag arsem 7aga
    JE NEXT_Y           ;lw 3mlt check lel black pixels el gya kolaha w abelt wa7da zar2a fana keda gowa shakl w m7tag alawen el gy
    MOV AH,0DH
    INT 10H
    CMP AL,9
    JNE NEW_SHAPE        ;tab ana delwa2ty abelt pixel zar2a w 3reft eny gowa el shakl lessa halawen el 5at el ana 3mlt 3aleeh check asln ezzay?
    FIND_STARTING_PIXEL:    ;harga3 lwara wna ba3mel check lel pixels l7ad mala2y pixel zar2a w ha2of 3andaha 
    DEC CX
    MOV AH,0DH
    INT 10H
    CMP AL,0
    JE FIND_STARTING_PIXEL  ;awl mala2y el pixel el zar2a de fana keda 3reft eny lazem abda2 alawn
    FILL_NEW_SHAPE:         ;habda2 alawen el shakl el zyada da el ba3d el 5at el beltool el 3areed l7ad ma5bat f pixel zar2a 
    INC CX            
    MOV AH,0DH          
    INT 10H
    CMP AL,9            ;lw 5abat f pixel zar2a fana keda 100% mota2aked en el shakl by5las hena   
    JE NEXT_Y           ;sa3etha ha7tag arga3 a3mel el check bta3y el 3ady bas fel satr(y) el ta7teeh
    MOV AH,0CH          
    MOV AL,3
    INT 10H
    JMP FILL_NEW_SHAPE



    BREAK2:
    CALL CALCULATE_PLAYERS_SCORE
RET
FILL_BOUNDED_AREA ENDP

        ;                                         ENEMY PROCEDURES

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

DELETE_TERRITORY_ENEMY PROC NEAR
    MOV CX,TERRITORY_ENEMY_X ;initial value (x)
    MOV DX,TERRITORY_ENEMY_Y ;initial value (y)
    DELETE_TENEMY_HORIZONTAL:    
        CALL CHECK_ENEMY_TERRITORY
        MOV AH,0CH    ;write pixels
        MOV BH,0      ;page number
        INT 10H

        INC CX
        MOV AX,CX     ;cx - snake_x > snake size 
        SUB AX,TERRITORY_ENEMY_X
        CMP AX,TERRITORY_ENEMY_SIZE
        JNG DELETE_TENEMY_HORIZONTAL
        MOV CX,TERRITORY_ENEMY_X ;cx register goes back to initial column
        INC DX         ;advance one line

        MOV AX,DX      ;dx - snake_y > snake size
        SUB AX,TERRITORY_ENEMY_Y
        CMP AX,TERRITORY_ENEMY_SIZE
    JNG DELETE_TENEMY_HORIZONTAL

     
RET            
DELETE_TERRITORY_ENEMY ENDP

MOVE_TERRITORY_ENEMY PROC NEAR
     CALL DELETE_TERRITORY_ENEMY
     MOV AX,TERRITORY_ENEMY_VELOCITY_X         
     ADD TERRITORY_ENEMY_X,AX
     MOV CX,TERRITORY_ENEMY_X
     MOV DX,TERRITORY_ENEMY_Y
     SUB CX,2
     MOV AH,0DH
     INT 10H
     CMP AL,0
     JE NEGATIVE_VELOCITY
     CMP AL,9
     JE NEGATIVE_VELOCITY
     CMP AL,0AH
     JE PLAYER2_KILLED
     CMP AL,1
     JE PLAYER1_KILLED
     CMP AL,0DH
     JE NEGATIVE_VELOCITY
     CMP CX,315
     JG NEGATIVE_VELOCITY
     
     MOV DX,TERRITORY_ENEMY_Y
     MOV CX,TERRITORY_ENEMY_X
     ADD CX,4
     MOV AH,0DH
     INT 10H
     CMP AL,0
     JE NEGATIVE_VELOCITY
     CMP AL,9
     JE NEGATIVE_VELOCITY
     CMP AL,1
     JE PLAYER1_KILLED
     CMP AL,0AH
     JE PLAYER2_KILLED
     CMP AL,0DH
     JE NEGATIVE_VELOCITY
     CMP CX,5
     JL NEGATIVE_VELOCITY
     

     MOV AX,TERRITORY_ENEMY_VELOCITY_Y
     ADD TERRITORY_ENEMY_Y,AX
     MOV DX,TERRITORY_ENEMY_Y
     MOV CX,TERRITORY_ENEMY_X
     SUB DX,2
     MOV AH,0DH
     INT 10H
     CMP AL,0
     JE NEGATIVE_VELOCITY_Y
     CMP AL,1
     JE PLAYER1_KILLED
     CMP AL,0AH
     JE PLAYER2_KILLED
     CMP AL,9
     JE NEGATIVE_VELOCITY_Y
     CMP AL,0DH
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
     CMP AL,9
     JE NEGATIVE_VELOCITY_Y
     CMP AL,0AH
     JE PLAYER2_KILLED
     CMP AL,0DH
     JE NEGATIVE_VELOCITY_Y
     CMP AL,1
     JE PLAYER1_KILLED
     CMP DX,-1
     JL NEGATIVE_VELOCITY_Y

     MOV DX,TERRITORY_ENEMY_Y
     MOV CX,TERRITORY_ENEMY_X
     ADD DX,4
     ADD CX,4
     MOV AH,0DH
     INT 10H
     CMP AL,0
     JE NEGATIVE_VELOCITY_Y
     CMP AL,9
     JE NEGATIVE_VELOCITY_Y
     CMP AL,0AH
     JE PLAYER2_KILLED
     CMP AL,0DH
     JE NEGATIVE_VELOCITY_Y
     CMP AL,1
     JE PLAYER1_KILLED
     CMP DX,0
     JL NEGATIVE_VELOCITY_Y

    RET

     PLAYER1_KILLED:
        CALL PLAYER1_RESPAWN
     RET   
     
     PLAYER2_KILLED:
        CALL PLAYER2_RESPAWN
     RET 

     NEGATIVE_VELOCITY:
       NEG TERRITORY_ENEMY_VELOCITY_X
       RET

     NEGATIVE_VELOCITY_Y:
        NEG TERRITORY_ENEMY_VELOCITY_Y
        RET  
MOVE_TERRITORY_ENEMY ENDP

DRAW_ENEMY PROC NEAR
    MOV CX,ENEMY_X ;initial value (x)
    MOV DX,ENEMY_Y ;initial value (y)

    DRAW_ENEMY_HORIZONTAL: 
        MOV AH,0CH    ;write pixels
        MOV AL,3      ;color
        MOV BH,1      ;page number
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

    NEXT:

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

    DONT:

RET            
DELETE_ENEMY ENDP

MOVE_ENEMY PROC NEAR

        CALL DELETE_ENEMY
        MOV AX,ENEMY_VELOCITY_X        ;enemy_x < 8 (collision)
        ADD ENEMY_X,AX  
        MOV CX,ENEMY_X               ;enemy_x > 316 (collision)
        MOV DX,ENEMY_Y
        SUB CX,3
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,9
        JE PLAYER1_DIED
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0DH
        JE PLAYER2_DIED
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_X
        MOV CX,ENEMY_X
        MOV DX,ENEMY_Y
        ADD CX,4
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,9
        JE PLAYER1_DIED
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0DH
        JE PLAYER2_DIED
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_X
        CMP ENEMY_X,9
        JL NEG_VELOCITY_X
        CMP ENEMY_X,309
        JG NEG_VELOCITY_X
        MOV CX,ENEMY_X
        MOV DX,ENEMY_Y
        SUB CX,1
        SUB DX,1
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,9
        JE PLAYER1_DIED
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0DH
        JE PLAYER2_DIED
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_X
        MOV CX,ENEMY_X
        MOV DX,ENEMY_Y
        ADD CX,3
        SUB DX,1
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,9
        JE PLAYER1_DIED
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0DH
        JE PLAYER2_DIED
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_X
        


        MOV AX,ENEMY_VELOCITY_Y        ;enemy_y < 8 (collision)
        ADD ENEMY_Y,AX                 ;enemy_x > 180 (collision)
        MOV CX,ENEMY_X
        MOV DX,ENEMY_Y
        SUB DX,3
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,9
        JE PLAYER1_DIED
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0DH
        JE PLAYER2_DIED
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_Y
        MOV CX,ENEMY_X
        MOV DX,ENEMY_Y
        ADD DX,4
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,9
        JE PLAYER1_DIED
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0DH
        JE PLAYER2_DIED
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_Y
        CMP ENEMY_Y,9
        JL NEG_VELOCITY_Y
        MOV CX,ENEMY_X
        MOV DX,ENEMY_Y
        ADD DX,3
        SUB CX,1
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,9
        JE PLAYER1_DIED
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0DH
        JE PLAYER2_DIED
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_Y
        MOV CX,ENEMY_X
        MOV DX,ENEMY_Y
        ADD DX,3
        ADD CX,3
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,9
        JE PLAYER1_DIED
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0DH
        JE PLAYER2_DIED
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_Y
        

        CMP ENEMY_Y,176
        JG NEG_VELOCITY_Y



    RET

        PLAYER1_DIED:
            CMP PLAYER1_SHIELD,1
            JE NEGATIVE
            CALL PLAYER1_RESPAWN
        RET


        PLAYER2_DIED:
            CMP PLAYER2_SHIELD,1
            JE NEGATIVE
            CALL PLAYER2_RESPAWN
        RET

        NEGATIVE:
            NEG ENEMY_VELOCITY_X
            NEG ENEMY_VELOCITY_Y
        RET


        NEG_VELOCITY_Y:
            NEG ENEMY_VELOCITY_Y
        RET
        

        NEG_VELOCITY_X:
            NEG ENEMY_VELOCITY_X       ;enemy_velocity_x = - enemy_velocity_x 
        RET

MOVE_ENEMY ENDP

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

MOVE_ENEMY2 PROC NEAR

        CALL DELETE_ENEMY2
        MOV AX,ENEMY2_VELOCITY_X        ;enemy_x < 8 (collision)
        ADD ENEMY2_X,AX  
        MOV CX,ENEMY2_X               ;enemy_x > 316 (collision)
        MOV DX,ENEMY2_Y
        SUB CX,3
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,9
        JE PLAYER1_DIED2
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0DH
        JE PLAYER2_DIED2
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_X2
        MOV CX,ENEMY2_X
        MOV DX,ENEMY2_Y
        ADD CX,3
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,9
        JE PLAYER1_DIED2
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0DH
        JE PLAYER2_DIED2
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_X2
        CMP ENEMY2_X,9
        JL NEG_VELOCITY_X2
        CMP ENEMY2_X,309
        JG NEG_VELOCITY_X2
        MOV CX,ENEMY2_X
        MOV DX,ENEMY2_Y
        ADD CX,3
        SUB DX,1
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,9
        JE PLAYER1_DIED2
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0DH
        JE PLAYER2_DIED2
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_X2
        MOV CX,ENEMY2_X
        MOV DX,ENEMY2_Y
        SUB CX,1
        SUB DX,1
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,9
        JE PLAYER1_DIED2
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0DH
        JE PLAYER2_DIED2
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_X2


        MOV AX,ENEMY2_VELOCITY_Y        ;enemy_y < 8 (collision)
        ADD ENEMY2_Y,AX                 ;enemy_x > 180 (collision)
        MOV CX,ENEMY2_X
        MOV DX,ENEMY2_Y
        SUB DX,3
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,9
        JE PLAYER1_DIED2
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0DH
        JE PLAYER1_DIED2
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_Y2
        MOV CX,ENEMY2_X
        MOV DX,ENEMY2_Y
        ADD DX,4
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,9
        JE PLAYER1_DIED2
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0DH
        JE PLAYER2_DIED2
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_Y2
        CMP ENEMY2_Y,9
        JL NEG_VELOCITY_Y2
        MOV CX,ENEMY2_X
        MOV DX,ENEMY2_Y
        ADD DX,3
        SUB CX,1
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,9
        JE PLAYER1_DIED2
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0DH
        JE PLAYER2_DIED2
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_Y2
        MOV CX,ENEMY2_X
        MOV DX,ENEMY2_Y
        ADD DX,3
        ADD CX,3
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,9
        JE PLAYER1_DIED2
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0DH
        JE PLAYER2_DIED2
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_Y2


        CMP ENEMY2_Y,176
        JG NEG_VELOCITY_Y2

    RET
        PLAYER1_DIED2:
            CMP PLAYER1_SHIELD,1
            JE NEGATIVE2
            CALL PLAYER1_RESPAWN
        RET

        PLAYER2_DIED2:
            CMP PLAYER2_SHIELD,1
            JE NEGATIVE2
            CALL PLAYER2_RESPAWN
        RET

        NEGATIVE2:
            NEG ENEMY2_VELOCITY_X
            NEG ENEMY2_VELOCITY_Y
        RET

        NEG_VELOCITY_Y2:
            NEG ENEMY2_VELOCITY_Y
        RET
        

        NEG_VELOCITY_X2:
            NEG ENEMY2_VELOCITY_X       ;enemy_velocity_x = - enemy_velocity_x 
        RET

MOVE_ENEMY2 ENDP

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
    MOV AH,0DH
    INT 10H

    CMP DX,4
    JB REMOVE_BULLET

    CMP AL,7
    JE IN_BORDER
    CMP AL,5
    JE P2_TERRITORY
    CMP AL,3
    JE P1_TERRITORY
    CMP AL,0
    JE SPACE
    CMP AL,9
    JE P1_WILL_DIE
    CMP AL,1
    JE P1_WILL_DIE
    CMP AL,0DH
    JE P2_WILL_DIE
    CMP AL,0AH
    JE P2_WILL_DIE


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

    P1_WILL_DIE:
        CMP PLAYER1_SHIELD,1
        JE WONT_DIE
        CALL PLAYER1_RESPAWN
        JMP CONVERT_BULLET_TAIL
        WONT_DIE:
        MOV BULLET_TAIL_COLOR,9
    JMP CONVERT_BULLET_TAIL

    P2_WILL_DIE:
        CMP PLAYER2_SHIELD,1
        JE P1_WONT_DIE
        CALL PLAYER2_RESPAWN
        JMP CONVERT_BULLET_TAIL
        P1_WONT_DIE:
        MOV BULLET_TAIL_COLOR,0DH
    JMP CONVERT_BULLET_TAIL

    REMOVE_BULLET:
        MOV BULLET,0
        MOV BULLET_TAIL_COLOR,7

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
    CMP BULLET_TAIL_COLOR,9
    JE P1_TAIL

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

    P1_TAIL:
        MOV AL,9
    JMP HIDE_TAIL

    HIDE_TAIL:
RET
CHECK_BULLET_TERRITORY ENDP

BULLET_TIMER_CHECK PROC NEAR
    CMP BULLET,1
    JE FIRE_BULLET
    CMP TIMER,95
    JE SET_BULLET
    CMP TIMER,85
    JE SET_BULLET
    CMP TIMER,75
    JE SET_BULLET
    CMP TIMER,65
    JE SET_BULLET
    CMP TIMER,55
    JE SET_BULLET
    CMP TIMER,45
    JE SET_BULLET
    CMP TIMER,35
    JE SET_BULLET
    CMP TIMER,25
    JE SET_BULLET
    CMP TIMER,15
    JE SET_BULLET
    CMP TIMER,5
    JE SET_BULLET
    JNE DONT_FIRE

    FIRE_BULLET:
    CALL DRAW_BULLET
    JMP DONT_FIRE

    SET_BULLET:
    MOV AX,SHOOTER_ENEMY_X
    MOV BULLET_X,AX
    MOV BULLET_Y,175
    MOV BULLET,1
    JMP FIRE_BULLET

    DONT_FIRE:
RET
BULLET_TIMER_CHECK ENDP

DELETE_BULLET PROC NEAR
    MOV CX,BULLET_X ;initial value (x)
    MOV DX,BULLET_Y ;initial value (y)
    DELETE_ENEMY_BULLET: 
            CALL CHECK_BULLET_TERRITORY
            MOV AH,0CH    ;write pixels
            MOV BH,0      ;page number
            INT 10H

RET
DELETE_BULLET ENDP

DRAW_BULLET PROC NEAR
    MOV BULLET_VELOCITY,-2
    MOV CX,BULLET_X ;initial value (x)
    MOV DX,BULLET_Y ;initial value (y)
    CALL CHECK_BULLET_POSITION
            MOV AH,0CH    ;write pixels
            MOV AL,15
            MOV BH,0      ;page number
            INT 10H
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

    ;                                                   PLAYER 2 PROCEDURES

DRAW_SNAKE2 PROC NEAR

        MOV CX,SNAKE2_X ;initial value (x)
        MOV DX,SNAKE2_Y ;initial value (y)
        

        DRAW_SNAKE2_HORIZONTAL:
            CALL CHECK_TERRITORY2
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
DRAW_SNAKE2 ENDP

CHECK_HEAD2_POSITION_COLOR PROC NEAR

    CMP CURRENT_SNAKE2_DIRECTION,3
    JNE RIGHT_ERROR2
    ADD DX,4
    MOV AH,0DH
    INT 10H
    SUB DX,4
    JMP CHECK_COLORZ2

    RIGHT_ERROR2:
    CMP CURRENT_SNAKE2_DIRECTION,0
    JNE MAIN_TEST2
    ADD CX,4
    SUB DX,1
    MOV AH,0DH
    INT 10H
    SUB CX,4
    ADD DX,1
    JMP CHECK_COLORZ2

    MAIN_TEST2:
    SUB CX,1
    SUB DX,1
    MOV AH,0DH
    INT 10H
    ADD CX,1
    ADD DX,1

    CHECK_COLORZ2:
    CMP AL,1
    JE BOTH_PLAYERS_DEAD
    CMP AL,9
    JE KILLED_PLAYER1
    CMP AL,0DH
    JE PLAYER2_IS_DEAD
    CMP AL,7
    JE BORDER2_DETECTED
    CMP AL,5
    JE CHECK_FOR_DEPTH2
    CMP AL,3
    JE CHECK_FOR_ET_DEPTH2
    CMP AL,0
    JE CHECK_FOR_SPACE2
    JMP CHANGE_TAIL2_COLOR

    CHECK_FOR_SPACE2:
        INC S2_DEPTH
        CMP PLAYER2_SPEED,0
        JE NOSPEEDO
        CMP S2_DEPTH,4
        JMP CONTO
        NOSPEEDO:
        CMP S2_DEPTH,5
        CONTO:
    JE SPACE2_DETECTED
    JNE CHANGE_TAIL2_COLOR

    CHECK_FOR_ET_DEPTH2:
        INC ET2_DEPTH
        CMP PLAYER2_SPEED,0
        JE NOSPEEDO2
        CMP ET2_DEPTH,4
        JMP CONTO2
        NOSPEEDO2:
        CMP ET2_DEPTH,6
        CONTO2:
    JE ENEMY_TERRITORY2
    JNE CHANGE_TAIL2_COLOR    

    CHECK_FOR_DEPTH2:
        INC T2_DEPTH
        CMP PLAYER2_SPEED,0
        JE NOSPEEDO3
        CMP T2_DEPTH,4
        JMP CONTO3
        NOSPEEDO3:
        CMP T2_DEPTH,6
        CONTO3:
    JE TERRITORY2_DETECTED
    JNE CHANGE_TAIL2_COLOR

    BORDER2_DETECTED:
        MOV TAIL2_COLOR,7
        MOV S2_DEPTH,0
        MOV T2_DEPTH,0
    JMP CHANGE_TAIL2_COLOR

    ENEMY_TERRITORY2:
        MOV TAIL2_COLOR,3
        MOV S2_DEPTH,0
        MOV T2_DEPTH,0
    JMP CHANGE_TAIL2_COLOR

    TERRITORY2_DETECTED:
        MOV TAIL2_COLOR,5
        MOV S2_DEPTH,0
        MOV ET2_DEPTH,0
    JMP CHANGE_TAIL2_COLOR

    SPACE2_DETECTED:
        MOV TAIL2_COLOR,0DH
        MOV P2_MOVING_IN_SPACE,1
        MOV T2_DEPTH,0
    JMP CHANGE_TAIL2_COLOR

    PLAYER2_IS_DEAD:
        CALL PLAYER2_RESPAWN
    JMP CHANGE_TAIL2_COLOR

    KILLED_PLAYER1:
        CALL PLAYER1_RESPAWN
    JMP CHANGE_TAIL2_COLOR

    BOTH_PLAYERS_DEAD:
        CALL PLAYER1_RESPAWN
        CALL PLAYER2_RESPAWN

    CHANGE_TAIL2_COLOR:
    CALL CHECK_TERRITORY2
RET
CHECK_HEAD2_POSITION_COLOR ENDP

DRAW_HEAD2 PROC NEAR

        MOV CX,SNAKE2_X ;initial value (x)
        MOV DX,SNAKE2_Y ;initial value (y)
        CALL CHECK_HEAD2_POSITION_COLOR
        DRAW_HEAD2_HORIZONTAL: 
            MOV AH,0CH    ;write pixels
            MOV AL,7
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
            MOV AL,0AH     ;color
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

CHECK_TERRITORY2 PROC NEAR
    CMP CX,7
    JB BORDER_COLOR2
    CMP DX,180
    JAE BORDER_COLOR2
    CMP CX,313
    JAE BORDER_COLOR2
    CMP DX,7
    JB BORDER_COLOR2
    
    CMP TAIL2_COLOR,5
    JE  TERRITORY_COLOR2
    CMP TAIL2_COLOR,0DH
    JE SPACE_COLOR2
    CMP TAIL2_COLOR,3
    JE ENEMY_TERRITORY_COLOR2

    SPACE_COLOR2:
        MOV AL,0DH
    JMP CONVERT_COLOR2

    ENEMY_TERRITORY_COLOR2:
        MOV AL,3
    JMP CONVERT_COLOR2

    TERRITORY_COLOR2:
        MOV AL,5
    JMP CONVERT_COLOR2

    BORDER_COLOR2:
        MOV AL,7
    JMP CONVERT_COLOR2


    CONVERT_COLOR2:

RET
CHECK_TERRITORY2 ENDP

MOVE_HEAD2 PROC NEAR
       
        CALL DRAW_SNAKE2       
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
                CMP SNAKE2_X,313
                JNE NEXT_LINE23
                CMP SNAKE2_Y,7
                JB  NEXT_LINE23
                NEXT_LINE23:
                MOV CURRENT_SNAKE2_DIRECTION,0
        JMP CHECK_HEAD2_MOVEMENT

        MOVE_UP22:
                MOV DX,SNAKE2_VELOCITY_Y
                CMP SNAKE2_Y,1
                JBE MOVE_RIGHT22 
                SUB SNAKE2_Y,DX  
                CMP SNAKE2_Y,0              ;If the next pixel is outside of the border change direction clockwise
                JE MOVE_RIGHT22   
                CMP SNAKE2_Y,3
                JNE NEXT_LINE22
                CMP SNAKE2_X,7
                JB NEXT_LINE22
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
                CMP SNAKE2_Y,180
                JNE NEXT_LINE32
                CMP SNAKE2_X,6
                JB NEXT_LINE32
                CMP SNAKE2_X,312
                JA NEXT_LINE32
                NEXT_LINE32: 
                MOV CURRENT_SNAKE2_DIRECTION,3
        JMP CHECK_HEAD2_MOVEMENT

        MOVE_LEFT22:
                MOV DX,SNAKE2_VELOCITY_X
                CMP SNAKE2_X,1
                JBE MOVE_UP22  
                SUB SNAKE2_X,DX
                CMP SNAKE2_X,0               ;If the next pixel is outside of the border change direction clockwise
                JE MOVE_UP22 
                CMP SNAKE2_X,3
                JNE NEXT_LINE42
                CMP SNAKE2_Y,180
                JA NEXT_LINE42
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

HORIZONTAL_LINE_FILL2 PROC NEAR
    MOV CX,6
    MOV DX,6
    FIND_LINE2:
        MOV AH,0DH
        INT 10H
        CMP AL,0DH
        JE CHECK_ABOVE_OR_BELOW2
        INC CX
        CMP CX,310
    JB FIND_LINE2
        MOV CX,6
        INC DX
        CMP DX,180
    JB FIND_LINE2

    CHECK_ABOVE_OR_BELOW2:
        DEC DX
        MOV START_OR_END2,CX
        FIND_ABOVE2:
            MOV AH,0DH
            INT 10H
            CMP AL,0DH
            JE NOPE2
            INC CX
            CMP CX,310
        JB FIND_ABOVE2

        ADD DX,5
        MOV CURRENT_ROW2,DX
        MOV CX,START_OR_END2
        FIND_BELOW2:
            MOV AH,0DH
            INT 10H
            CMP AL,0DH
            JE NOPE2
            INC CX
            CMP CX,310
        JB FIND_BELOW2

        COLOR_EMPTY2:
            MOV CX,START_OR_END2
            MOV DX,CURRENT_ROW2
            CMP DX,90
            JA COLOR_BELOW2

            COLOR_ABOVE2:
                DEC DX
                MOV AH,0DH
                INT 10H
                CMP AL,0DH
                JNE NOPE2
            COLORING_LOOP2:
                MOV AH,0CH
                MOV AL,5
                INT 10H
                DEC DX
                CMP DX,6
            JA COLORING_LOOP2
                MOV DX,CURRENT_ROW2
                INC CX
                CMP CX,310
            JB COLOR_ABOVE2
            JMP NOPE2

            COLOR_BELOW2:
                DEC DX
                MOV AH,0DH
                INT 10H
                CMP AL,0DH
                JNE NOPE2
            COLOR_LOOP2:
                MOV AH,0CH
                MOV AL,5
                INT 10H
                INC DX
                CMP DX,180
            JB COLOR_LOOP2
                MOV DX,CURRENT_ROW2
                INC CX
                CMP CX,310
            JB COLOR_BELOW2



        NOPE2:
RET
HORIZONTAL_LINE_FILL2 ENDP

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
    CMP CURRENT_SNAKE2_DIRECTION,0
    JE COLOR_AFTER2
    CMP CURRENT_SNAKE2_DIRECTION,1
    JE DO_THIS
    CMP CX,160
    JA COLOR_AFTER2
    DO_THIS:
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
    CALL CALCULATE_PLAYERS_SCORE  
RET
FILL_BOUNDED_AREA2 ENDP


ret
END MAIN
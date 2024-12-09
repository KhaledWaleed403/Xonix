.MODEL SMALL
.STACK 64
.DATA
IN_NAME                     DB 16           ;MAX NUMBER OF CHARACTERS ALLOWED (25).
                            DB ?            ;NUMBER OF CHARACTERS ENTERED BY USER.
                            DB 16 DUP(0)    ;CHARACTERS ENTERED BY USER.
IN_SCORE                    DB 3
                            DB ?
                            DB 3 DUP(0)
IN_NAME2                    DB 16
                            DB ?
                            DB 16 DUP(0)
NAMAYEWA                    DB ':','$'
TEMP                        DB ?,"$"
SEND_OR_RECIEVE             DB 0
PLAYER_NAME                 DB 'Please Enter Your Name:',"$"
INITIAL_SCORE               DB 'Initial Points:',"$"
CONTINUE                    DB 'Press Enter Key To Continue',"$"
INVALID                     DB 'Special Characters Are Not Allowed',"$"
NUMBER                      DB 'First Character Cannot Be A Number',"$"
CHAT_INVITE_RECIEVED        DB 'You Were Invited To A Chatting Session, Press F1 To Accept',0AH,0DH,"$"
CHAT_INVITE_SENT            DB 'You Sent A Chat Inviation',0AH,0DH,"$"
GAME_INVITE_RECIEVED        DB 'You Were Invited To A Game, Press F2 To Accept',0AH,0DH,"$"
GAME_INVITE_SENT            DB 'You Sent A Game Invitation',0AH,0DH,"$"
WRONG_KEY                   DB 0
CHAT                        DB 'To start chatting press F1'
GAME                        DB 'To start game press F2'
EXIT                        DB 'To end the program press ESC'
GAME_END                    DB 'GAME OVER'
P1_WINNER                   DB 'PLAYER 1 IS THE WINNER'
P2_WINNER                   DB 'PLAYER 2 IS THE WINNER'
TIMEGAME                    DB 20
TIMER                       DB 99
PLAYER1                     DB "P1"
PLAYER1_CHAT                DB "CHAT:","$"
PLAYER2                     DB "P2"
VALUE                       DB ?,"$"
SENDING                     DB ?,"$"
NOTIFICATION                DB 'TO END CHATTING WITH OPPONENT PRESS F3',0AH,0DH,"$"
PLAYER_1                    DB 'ME:', 0AH, 0DH, "$"
PLAYER_2                    DB 'OPPONENT:',0AH,0DH,"$"
P1_CHAT_ROW                 DB 1
P1_SENTENCE_START           DB 1
P2_CHAT_ROW                 DB 12
P2_SENTENCE_START           DB 1
SEND_MOVEMENT               DB ?,"$"
REC_MOVEMENT                DB ?,"$"
PLAYER1_LIVES               DB 3
PLAYER2_LIVES               DB 3
PLAYER1_SCORE               DW 0
PLAYER1_DSCORE              DW 0
PLAYER2_SCORE               DW 0
PLAYER2_DSCORE              DW 0
PLAYER1_TSCORE              DW 0
PLAYER2_TSCORE              DW 0
DOUBLESCORE_POWER_P1        DB 0
DOUBLESCORE_POWER_P2        DB 0
LIVES                       DB 3,":"
SCORE                       DB "SCORE:"
TIME_AUX                    DB 0 ;variable used when checking if time changed
SHIELD_X                    DW 280
SHIELD_Y                    DW 150
SPEED_X                     DW 250
SPEED_Y                     DW 140
LIFE_X                      DW 130 
LIFE_Y                      DW 110
GRENADE_X                   DW 200
GRENADE_Y                   DW 100
GRENADE_P1                  DW 0
DEFEND_P1                   DW 0
DEFEND_P2                   DW 0
GRENADE_P2                  DW 0
PLAYER1_GRENADE             DW 0
PLAYER2_GRENADE             DW 0
GRENADE_TIMER               DW 10
GRENADE_TIME                DW 20
BOMB_X                      DW 25
BOMB_Y                      DW 160
BOMB_VELOCITY               DW 0
BOMB_TAIL_COLOR             DW 7
BOMB                        DW 0
BOMB_TIMER                  DW 4
BOMB_TIME                   DW 20
SCORE_X                     DW 169
SCORE_Y                     DW 69
FIRETAIL_X                  DW 25
FIRETAIL_Y                  DW 25
SNAKE_X                     DW 7
SNAKE_Y                     DW 7
SNAKE2_X                    DW 320
SNAKE2_Y                    DW 156
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
SHOOTER_ENEMY_Y             DW 160
BULLET_X                    DW 25
BULLET_Y                    DW 160
BULLET_VELOCITY             DW 0
BULLET_TAIL_COLOR           DW 7
SHOOTER_ENEMY_VELOCITY      DW 2
CURRENT_SNAKE_DIRECTION     DW 0 ; This Variable allows the snake to move on the set direction until the set direction changes, 0 left 1 right, 2 up, 4 down :MJ
CURRENT_SNAKE2_DIRECTION    DW 1 ; This Variable allows the snake to move on the set direction until the set direction changes, 0 left 1 right, 2 up, 4 down :MJ
CURRENT_ROW                 DW 0
AREA_X                      DW 7
AREA_Y                      DW 7
START_OR_END                DW 0
START_OR_END2               DW 0
CURRENT_ROW2                DW 0
TAIL_COLOR                  DW 9
TAIL2_COLOR                 DW 0DH
ENEMY_TAIL_COLOR            DW 7
PLAYER1_SHIELD              DW 0
PLAYER2_SHIELD              DW 0
PLAYER1_FIRETAIL            DW 0
PLAYER2_FIRETAIL            DW 0
FIRETAIL_TIMER              DW 20
FIRETAIL_TIME               DW 20
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
EXCHANGED                   DW 0
CHATTING                    DW 0
GAMING                      DW 0
INCHAT                      DW 0
INCHAT_START                DB 20
INCHAT_START2               DB 20
.CODE

MAIN PROC FAR
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX

    MOV AH,0
    MOV AL,03H
    INT 10H

        

    MOV AH,00H ;video mode
    MOV AL,13H ;type of video mode
    INT 10H


    CALL DRAW_FULL_BORDER
    
    CHECK_TIME:
        MOV AH,2CH ;returns: CH=hour, CL=minutes, DH=seconds,DL=1/100 seconds
        INT 21H

        CMP DL,TIME_AUX ;is the current time equal to the previous one?
        JE CHECK_TIME   ;if not then check again                  
        MOV TIME_AUX,DL ;if its different then draw again
        CALL IN_GAME_CHAT
        CALL NOTIFICATION_BAR
        CALL MOVE_HEAD
        CALL DRAW_HEAD
    JMP CHECK_TIME

     
EXITGAME:
    MOV AH,4CH
    MOV AL,1
    INT 21H
MAIN ENDP

IN_GAME_CHAT PROC NEAR
    CALL PORT_CONFIGURATION
    CMP INCHAT,1
    JNE NO_CHAT_2DAY

    MOV AH,01H
    INT 16H
    JZ REC_INCHAT
    MOV AH,00H
    INT 16H


    MOV SEND_MOVEMENT,AL

    MOV DX,3FDH		; Line Status Register
    IN AL,DX 			;Read Line Status
    AND AL,00100000B
    ;If empty put the VALUE in Transmit data register
    MOV DX , 3F8H		; Transmit data register
    ;mov al,"A"
    MOV AL,SEND_MOVEMENT
    OUT DX,AL

    CMP SEND_MOVEMENT,13
    JE GETOUT

    INC INCHAT_START
    CMP INCHAT_START,55
    JE CLEAR_CHAT_SLOT

    SHOW_MORE:
    MOV AH,02H
    MOV DH,100
    MOV DL,INCHAT_START
    INT 10H

    MOV AH,09
    MOV DX,OFFSET SEND_MOVEMENT
    INT 21H
    JMP NO_CHAT_2DAY

    REC_INCHAT:
    MOV DX , 3FDH		; Line Status Register
    IN AL,DX 
    AND AL,1
    CMP AL,1
    JNE NO_CHAT_2DAY
    ;If Ready read the VALUE in Receive data register
    MOV DX,03F8H
    IN AL,DX 
    MOV REC_MOVEMENT,AL

    CMP REC_MOVEMENT,13
    JE GETOUT

    INC INCHAT_START2
    CMP INCHAT_START2,55
    JE CLEAR_CHAT_SLOT2

    SHOW_MORE2:
    MOV AH,02H
    MOV DH,100
    MOV DL,INCHAT_START2
    INT 10H



    MOV AH,09
    MOV DX,OFFSET REC_MOVEMENT
    INT 21H
    JMP NO_CHAT_2DAY

    CLEAR_CHAT_SLOT:
        MOV AH,02H
        MOV DH,100
        MOV DL,20
        INT 10H
        
        MOV AH,9
        MOV BH,0
        MOV AL,0
        MOV CX,60
        MOV BL,0
        INT 10H

        MOV AH,02H
        MOV DH,100
        MOV DL,40
        INT 10H

        MOV AH,9
        MOV BH,0
        MOV AL,0
        MOV CX,15
        MOV BL,0
        INT 10H
        MOV INCHAT_START,22
    JMP SHOW_MORE

    CLEAR_CHAT_SLOT2:
        MOV AH,02H
        MOV DH,100
        MOV DL,20
        INT 10H
        
        MOV AH,9
        MOV BH,0
        MOV AL,0
        MOV CX,60
        MOV BL,0
        INT 10H

        MOV AH,02H
        MOV DH,100
        MOV DL,40
        INT 10H

        MOV AH,9
        MOV BH,0
        MOV AL,0
        MOV CX,15
        MOV BL,0
        INT 10H
        MOV INCHAT_START2,22
    JMP SHOW_MORE2

    GETOUT:
        MOV INCHAT,0

    NO_CHAT_2DAY:
RET
IN_GAME_CHAT ENDP

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
        CMP BORDER_Y,160
   JB LEFT_BORDER

   MOV BORDER_Y,0
   MOV BORDER_X,313
   RIGHT_BORDER:
        MOV CX,BORDER_X ;initial value (x)
        MOV DX,BORDER_Y ;initial value (y)
        CALL DRAW_BORDER
        INC BORDER_Y
        CMP BORDER_Y,160
   JB RIGHT_BORDER

   MOV BORDER_X,0
   MOV BORDER_Y,160
   BOT_BORDER:
        MOV CX,BORDER_X
        MOV DX,BORDER_Y
        CALL DRAW_BORDER
        INC BORDER_X
        CMP BORDER_X,320
   JB BOT_BORDER

RET
DRAW_FULL_BORDER ENDP

MOVE_HEAD PROC NEAR
       
        CALL DRAW_SNAKE    
        CALL PORT_CONFIGURATION


        MOV DX , 3FDH		; Line Status Register
        IN AL,DX 
        AND AL,1
        CMP AL,1
        JNE CHECK_FOR_KEY
        ;If Ready read the VALUE in Receive data register
        MOV DX,03F8H
        IN AL,DX 
        MOV REC_MOVEMENT,AL
        CMP REC_MOVEMENT,13
        JE WILL_CHAT
        
        CHECK_FOR_KEY:
        MOV AH,01H
        INT 16H
        JZ DONEKEYPRESS

        MOV AH,00H
        INT 16H

        MOV SEND_MOVEMENT,AL
        CMP SEND_MOVEMENT,13
        JE WILL_CHAT1

        CONT:
        MOV DX,3FDH		; Line Status Register
        IN AL,DX 			;Read Line Status
        AND AL,00100000B
        ;If empty put the VALUE in Transmit data register
        MOV DX , 3F8H		; Transmit data register
        ;mov al,"A"
        MOV AL,SEND_MOVEMENT
        OUT DX,AL


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
                CMP SNAKE_Y,162
                JAE MOVE_LEFT2
                ADD SNAKE_Y,DX
                CMP SNAKE_Y,162             ;If the next pixel is outside of the border change direction clockwise
                JE MOVE_LEFT2
                CMP SNAKE_Y,160
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
                CMP SNAKE_Y,160
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

        WILL_CHAT:  
            MOV INCHAT,1
        JMP CHECK_FOR_KEY

        WILL_CHAT1:
            MOV INCHAT,1
        JMP CONT

        CHECK_HEAD_MOVEMENT:

RET
MOVE_HEAD ENDP

NOTIFICATION_BAR PROC NEAR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;DISPLAY FOR PLAYER (1);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    MOV BP,OFFSET PLAYER1       ;display the player 
    MOV AH,13H
    MOV AL,0
    MOV BL,1
    MOV BH,0
    MOV DL,96
    MOV DH,98
    MOV CX,2
    INT 10H


    MOV BP,OFFSET LIVES     ;Display the word lives
    MOV AH,13H
    MOV AL,0
    CMP PLAYER1_FIRETAIL,1
    JNE GO_TO_NEXT
    SHOW_P1_FIRETAIL:
    MOV BL,0CH
    JMP GO_TO_NEXT
    MOV BL,1
    GO_TO_NEXT:
    MOV BH,0
    MOV DL,99
    MOV DH,98
    MOV CX,2
    INT 10H

    MOV AH,02H
    MOV DH,100
    MOV DL,96
    INT 10H

    MOV AH,9
    MOV DX,OFFSET PLAYER1_CHAT
    INT 21H

    MOV AH,2            ; MOVE CRUSOR
    MOV DH,98
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
    MOV DH,98
    MOV CX,6
    INT 10H

    MOV AH,2        ; MOVE CRUSOR
    MOV DH,98      
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
    MOV DH,98
    MOV CX,2
    INT 10H

    MOV BP,OFFSET LIVES     ;Display the word lives
    MOV AH,13H
    MOV AL,0
    CMP PLAYER2_FIRETAIL,1
    JNE WHATS_NEXT
    SHOW_FIRETAIL:
    MOV BL,0CH
    JMP WHATS_NEXT
    MOV BL,0DH
    WHATS_NEXT:
    MOV BH,0
    MOV DL,123
    MOV DH,98
    MOV CX,2
    INT 10H

    MOV AH,2            ; MOVE CRUSOR
    MOV DH,98
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
    MOV DH,98
    MOV CX,6
    INT 10H

    MOV AH,2        ; MOVE CRUSOR
    MOV DH,98      
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
MOV DH,98      
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

DRAW_SNAKE PROC NEAR

        MOV CX,SNAKE_X ;initial value (x)
        MOV DX,SNAKE_Y ;initial value (y)


        DRAW_SNAKE_HORIZONTAL:
            MOV AH,0CH    ;write pixels  
            MOV AL,9   
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

PORT_CONFIGURATION PROC NEAR
    ; initinalize COM
    ;Set Divisor Latch Access Bit
    MOV DX,3FBH 			; Line Control Register
    MOV AL,10000000B		;Set Divisor Latch Access Bit
    OUT DX,AL				;Out it
    ;Set LSB byte of the Baud Rate Divisor Latch register.
    MOV DX,3F8H			
    MOV AL,0CH			
    OUT DX,AL

    ;Set MSB byte of the Baud Rate Divisor Latch register.
    MOV DX,3F9H
    MOV AL,00H
    OUT DX,AL

    ;Set port configuration
    MOV DX,3FBH
    MOV AL,00011011B
    OUT DX,AL
RET
PORT_CONFIGURATION ENDP

END MAIN
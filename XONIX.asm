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
SEND_CHAT                   DB ?,"$"
REC_MOVEMENT                DB ?,"$"
REC_CHAT                    DB ?,"$"
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

    CALL MAIN_SCREEN

        
    REFRESH:
    MOV AH,0
    MOV AL,03H
    INT 10h
    
    CALL SCREEN_ONE


    CHATMODE:
    CALL CHAT_SCREEN
    JMP REFRESH
    
    GAMEMODE:
    CALL CLEAR_SCREEN


    CALL DRAW_FULL_BORDER
    
    CHECK_TIME:
        MOV AH,2CH ;returns: CH=hour, CL=minutes, DH=seconds,DL=1/100 seconds
        INT 21H

        CMP DL,TIME_AUX ;is the current time equal to the previous one?
        JE CHECK_TIME   ;if not then check again                  
        MOV TIME_AUX,DL ;if its different then draw again
        CALL IN_GAME_CHAT
        CALL DELETE_ENEMY
        CALL MOVE_ENEMY
        CALL DRAW_ENEMY
        CALL MOVE_ENEMY2
        CALL DRAW_ENEMY2
        CALL MOVE_TERRITORY_ENEMY
        CALL DRAW_TERRITORY_ENEMY
        CALL MOVE_HEAD
        CALL MOVE_HEAD2
        CALL DRAW_HEAD
        CALL DRAW_HEAD2
        CALL MOVE_SHOOTER_ENEMY
        CALL DRAW_SHOOTER_ENEMY
        CALL MOVE_BULLET
        CALL BULLET_TIMER_CHECK
        CALL CHECK_P1_TERRITORY
        CALL CHECK_P2_TERRITORY
        CALL CHECK_HEAD_COLLISION
        CALL NOTIFICATION_BAR
        ;CALL GAME_OVER_SCREEN
        CALL CHECK_P1_POWERUP
        CALL CHECK_P2_POWERUP
        CALL SHIELD
        CALL FIRETAIL
        CALL SPEED
        CALL EXTRA_LIFE
        CALL DOUBLE_SCORE
        CALL GRENADE
        CALL MOVE_BOMB
        CALL BOMB_TIMER_CHECK
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
    MOV CX,26
    INT 10H
    
    MOV BP,OFFSET GAME
    MOV AH,13H
    MOV AL,0
    MOV BL,15
    MOV BH,0
    MOV DL,20
    MOV DH,11
    MOV CX,22
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

    MOV AH,02H
    MOV DH,22
    MOV DL,0
    INT 10H

    MOV AH,9
    MOV BH,0
    MOV AL,2EH
    MOV CX,80
    MOV BL,15
    INT 10H

    MOV AH,02H
    MOV DH,23
    MOV DL,0
    INT 10H

    CALL PORT_CONFIGURATION

    PICK_MODE:
        CMP CHATTING,2
        JE CHATMODE
        CMP GAMING,2
        JE GAMEMODE
        MOV AH,01H
        INT 16H
        JZ RECIEVE_MODE
        MOV AH,00H
        INT 16H
        MOV SENDING,AH
        ;Check that Transmitter Holding Register is Empty
    SEND_MODE:
            MOV DX,3FDH		; Line Status Register
    AGAIN_MODE:  
            IN AL,DX 			;Read Line Status
            AND AL,00100000B
            JZ AGAIN_MODE

    ;If empty put the VALUE in Transmit data register
            MOV DX , 3F8H		; Transmit data register
            ;mov al,"A"
            MOV AL,SENDING
            OUT DX,AL

            CMP AL,3BH
            JE CHAT_FOUND

            CMP AL,3CH
            JE GAME_FOUND

            CMP AL,01H
            JE EXITGAME

        JMP PICK_MODE

        RECIEVE_MODE:
                MOV DX , 3FDH		; Line Status Register
         CHEK_MODE:	
            IN AL,DX 
            AND AL,1
            CMP AL,1
            JNE PICK_MODE  
            ;If Ready read the VALUE in Receive data register
            MOV DX,03F8H
            IN AL,DX 
            MOV VALUE,AL

            CMP AL,3BH
            JE CHAT_RECIEVED

            CMP AL,3CH
            JE GAME_RECIEVED

            CMP AL,01H
            JE EXITGAME


    JMP PICK_MODE
    
    GAME_FOUND:
        ADD GAMING,1
        MOV AH,09
        MOV DX,OFFSET GAME_INVITE_SENT
        INT 21H
    JMP PICK_MODE

    GAME_RECIEVED:
        ADD GAMING,1
        MOV AH,09
        MOV DX,OFFSET GAME_INVITE_RECIEVED
        INT 21H
    JMP PICK_MODE

    CHAT_FOUND:
        ADD CHATTING,1
        MOV AH,09
        MOV DX,OFFSET CHAT_INVITE_SENT
        INT 21H
    JMP PICK_MODE

    CHAT_RECIEVED:
        ADD CHATTING,1
        MOV AH,09
        MOV DX,OFFSET CHAT_INVITE_RECIEVED
        INT 21H
    JMP PICK_MODE
RET    
SCREEN_ONE ENDP

IN_GAME_CHAT PROC NEAR
    CALL PORT_CONFIGURATION
    CMP INCHAT,1
    JNE NO_CHAT_2DAY

    MOV AH,01H
    INT 16H
    JZ REC_INCHAT
    MOV AH,00H
    INT 16H


    MOV SEND_CHAT,AL

    MOV DX,3FDH		; Line Status Register
    IN AL,DX 			;Read Line Status
    AND AL,00100000B
    ;If empty put the VALUE in Transmit data register
    MOV DX , 3F8H		; Transmit data register
    ;mov al,"A"
    MOV AL,SEND_CHAT
    OUT DX,AL

    CMP SEND_CHAT,13
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
    MOV DX,OFFSET SEND_CHAT
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
    MOV REC_CHAT,AL

    CMP REC_CHAT,13
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
    MOV DX,OFFSET REC_CHAT
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

MAIN_SCREEN PROC NEAR

    MOV WRONG_KEY,0
 
    MOV AH,0
    MOV AL,3
    INT 10H

    MOV AH,2
    MOV DL,25
    MOV DH,5
    INT 10H

    MOV AH,09
    MOV DX,OFFSET PLAYER_NAME
    INT 21H


    ENTER_NAME:
    MOV SEND_OR_RECIEVE,1
    MOV AH,2
    MOV DL,27
    MOV DH,6
    INT 10H 
;CAPTURE STRING FROM KEYBOARD.

    MOV AH,0AH
    MOV DX,OFFSET IN_NAME
    INT 21H
    
    MOV SI,OFFSET IN_NAME+1         ;HENA BA7ADED EL SIZE BTA3 EL ARRAY
    MOV BH,[SI]                     ;BA7OT EL SIZE FEL BH 3ASHAN A3MEL 3ALEEHA LOOP
    MOV SI,OFFSET IN_NAME+2         ;BA5TAR AWL ELEMENT FEL NAME ARRAY MEN EL INDEX
    MOV BL,[SI]
    CMP BL,30H
    JAE NO_NUMBER
    CHECK:                          ;LOOP BA3MEL CHECK 3LA KOL ELEMENT FEL ARRAY 3ASHAN ASHOOF DA CHARACTER MAZBOT WLA LA
        MOV BL,[SI]
        CMP BL,41H
        JAE CHECK_IF_VALID
        JMP CHECK_NUMBER
        ITS_VALID:
        INC SI
        DEC BH
        CMP BH,0
    JA CHECK
    
;CHANGE CHR(13) BY ':'.
    MOV SI,OFFSET IN_NAME + 1       ;NUMBER OF CHARACTERS ENTERED.
    MOV CL,[SI]                     ;MOVE LENGTH TO CL.
    MOV CH,0                        ;CLEAR CH TO USE CX. 
    INC CX                          ;TO REACH CHR(13).
    ADD SI,CX                       ;NOW SI POINTS TO CHR(13).
    MOV AL,':'
    MOV [SI],AL                     ;REPLACE CHR(13) BY ':'. 

    
    MOV AH,2
    MOV DL,25
    MOV DH,10
    INT 10H

    MOV AH,09
    MOV DX,OFFSET CONTINUE
    INT 21H
    JMP ENTER_PRESS

    CHECK_NUMBER:
        CMP BL,39H
        JA INVALID_INPUT
        CMP BL,30H
        JB INVALID_INPUT
    JMP ITS_VALID

    CHECK_IF_VALID:
        CMP BL,5AH
        JA CHECK_LOWER_CASE
    JMP ITS_VALID

    CHECK_LOWER_CASE:
        CMP BL,61H
        JB INVALID_INPUT
        CMP BL,7AH
        JBE ITS_VALID

    INVALID_INPUT:
        MOV AH,2
        MOV DL,25
        MOV DH,5
        INT 10H

        MOV BP,OFFSET INVALID
        MOV AH,13H
        MOV AL,0
        MOV BL,15
        MOV BH,0
        MOV DL,22
        MOV DH,0
        MOV CX,34
        INT 10H

        MOV AH,2
        MOV DL,25
        MOV DH,16
        INT 10H

        MOV AH,09
        MOV DX,OFFSET CONTINUE
        INT 21H
    JMP EXITGAME

    NO_NUMBER:
        CMP BL,39H
        JA CHECK

        MOV BP,OFFSET NUMBER
        MOV AH,13H
        MOV AL,0
        MOV BL,15
        MOV BH,0
        MOV DL,20
        MOV DH,0
        MOV CX,34
        INT 10H

        MOV AH,2
        MOV DL,25
        MOV DH,16
        INT 10H

        MOV AH,09
        MOV DX,OFFSET CONTINUE
        INT 21H
    JMP ENTER_PRESS

    ENTER_PRESS:
    MOV AH,00
    INT 16H
    CMP AL,13
    JNE ENTER_PRESS

RET
MAIN_SCREEN ENDP

CHAT_SCREEN PROC NEAR
    MOV CHATTING,0
    MOV GAMING,0
    MOV AH,0
    MOV AL,3H
    INT 10H

    MOV BP,OFFSET IN_NAME+2
    MOV AH,13H
    MOV AL,0
    MOV BL,15
    MOV BH,0
    MOV DL,9
    MOV DH,0
    MOV CX,16
    INT 10H


    MOV SI,OFFSET IN_NAME2+2
    EXCHANGE_NAMES:
        CMP EXCHANGED,2
        JE EXCHANGE_DONE
        MOV AH,01H
        INT 16H
        JZ RECIEVE_NAME
        MOV AH,00H
        INT 16H
        MOV SENDING,AL
        ;Check that Transmitter Holding Register is Empty
    SEND_NAME:
            MOV DX,3FDH		; Line Status Register
    AGAIN_NAME:  
            IN AL,DX 			;Read Line Status
            AND AL,00100000B
            JZ AGAIN_NAME

    ;If empty put the VALUE in Transmit data register
            MOV DX , 3F8H		; Transmit data register
            ;mov al,"A"
            MOV AL,SENDING
            OUT DX,AL


            CMP AL,13
            JE ENTER_FOUND

        JMP EXCHANGE_NAMES

        RECIEVE_NAME:
                MOV DX , 3FDH		; Line Status Register
         CHEK:	
            IN AL,DX 
            AND AL,1
            CMP AL,1
            JNE EXCHANGE_NAMES  
            ;If Ready read the VALUE in Receive data register
            MOV DX,03F8H
            IN AL,DX 
            CMP AL,13
            JE CHANGE_TO_END
            WHATEVER_MAN:
            MOV VALUE,AL
            MOV [SI],AL
            INC SI

            CMP AL,3AH
            JE ENTER_FOUND

    JMP EXCHANGE_NAMES

    ENTER_FOUND:
        ADD EXCHANGED,1
    JMP EXCHANGE_NAMES

    CHANGE_TO_END:
        MOV AL,3AH
    JMP WHATEVER_MAN

    EXCHANGE_DONE:
    MOV BP,OFFSET IN_NAME2+1
    MOV AH,13H
    MOV AL,0
    MOV BL,15
    MOV BH,0
    MOV DL,9
    MOV DH,11
    MOV CX,16
    INT 10H

    MOV AH,02H
    MOV DH,10
    MOV DL,0
    INT 10H

    MOV AH,9
    MOV BH,0
    MOV AL,2EH
    MOV CX,80
    MOV BL,15
    INT 10H

    MOV AH,02H
    MOV DH,22
    MOV DL,0
    INT 10H

    MOV AH,9
    MOV BH,0
    MOV AL,2EH
    MOV CX,80
    MOV BL,15
    INT 10H

    MOV AH,02H
    MOV DH,23
    MOV DL,0
    INT 10H
    
    MOV AH,09
    MOV DX,OFFSET NOTIFICATION
    INT 21H

    MOV AH,02H
    MOV DH,1
    MOV DL,0
    INT 10H

    CALL PORT_CONFIGURATION

    CHAT_LOOP:
        MOV AH,01H
        INT 16H
        JZ RECIEVE_CHARACTER
        MOV AH,00H
        INT 16H
        MOV SENDING,AL
        CMP AH,3DH
        JNE SEND_CHARACTER
        MOV SENDING,AH

        ;Check that Transmitter Holding Register is Empty
    SEND_CHARACTER:
            MOV DX,3FDH		; Line Status Register
    AGAIN_CHECK:  
            IN AL,DX 			;Read Line Status
            AND AL,00100000B
            JZ AGAIN_CHECK

    ;If empty put the VALUE in Transmit data register
            MOV DX , 3F8H		; Transmit data register
            ;mov al,"A"
            MOV AL,SENDING
            OUT DX,AL

            CMP AL,3DH
            JE EXIT_SCREEN

            CMP AL,13
            JE SCROLL_NEXT_LINE

            CMP AL,08H
            JE BACK_SPACE1

            GO_ON:
            ADD P1_SENTENCE_START,1
            SKIP:
            CMP P1_SENTENCE_START,79
            JE SCROLL_NEXT_LINE
            MOV AH,2
            MOV DH,P1_CHAT_ROW
            MOV DL,P1_SENTENCE_START
            MOV BH,0
            INT 10H


            MOV AH, 09 
            MOV DX, OFFSET SENDING
            INT 21H
        JMP CHAT_LOOP

        RECIEVE_CHARACTER:
                MOV DX , 3FDH		; Line Status Register
         CH3K:	
            IN AL,DX 
            AND AL,1
            CMP AL,1
            JNE CHAT_LOOP  
            ;If Ready read the VALUE in Receive data register
            MOV DX,03F8H
            IN AL,DX 
            MOV VALUE,AL

            CMP AL,3DH
            JE EXIT_SCREEN

            CMP AL,13
            JE ENTER_PRESSED

            CMP AL,08H
            JE BACK_SPACE2

            GO_ON_NOW:
            ADD P2_SENTENCE_START,1   
            SKIP2:
            CMP P2_SENTENCE_START,79
            JE ENTER_PRESSED 
            MOV AH,2
            MOV DH,P2_CHAT_ROW
            MOV DL,P2_SENTENCE_START
            MOV BH,0
            INT 10H


            MOV AH, 09 
            MOV DX, OFFSET VALUE
            INT 21H   

    JMP CHAT_LOOP

        ENTER_PRESSED:
            MOV AH,03H
            MOV BH,0
            INT 10H

            ADD P2_CHAT_ROW,1
            CMP P2_CHAT_ROW,22
            JE SCROLL_IT_UP

            LETS_DO_THIS:
            MOV DH,P2_CHAT_ROW
            MOV P2_SENTENCE_START,0

            MOV AH,02H
            MOV BH,0
            INT 10H
        JMP GO_ON_NOW

        SCROLL_NEXT_LINE:
            MOV AH,03H
            MOV BH,0
            INT 10H

            ADD P1_CHAT_ROW,1

            CMP P1_CHAT_ROW,10
            JE SCROLL_UP

            COME_HERE_I_GUESS:
            MOV DH,P1_CHAT_ROW
            MOV P1_SENTENCE_START,0
            MOV AH,02H
            MOV BH,0
            INT 10H
        JMP GO_ON

        SCROLL_UP:
            MOV AH,6
            MOV AL,1
            MOV BH,7
            MOV CH,1
            MOV CL,0
            MOV DH,9
            MOV DL,79
            INT 10H
            SUB P1_CHAT_ROW,1
        JMP COME_HERE_I_GUESS

        SCROLL_IT_UP:
            MOV AH,6
            MOV AL,1
            MOV BH,7
            MOV CH,12
            MOV CL,0
            MOV DH,21
            MOV DL,79
            INT 10H
            SUB P2_CHAT_ROW,1
        JMP LETS_DO_THIS

        BACK_SPACE1:
            SUB P1_SENTENCE_START,1
        JMP SKIP

        BACK_SPACE2:
            SUB P2_SENTENCE_START,1
        JMP SKIP2

EXIT_SCREEN:
    MOV P1_CHAT_ROW,1
    MOV P2_CHAT_ROW,12

RET
CHAT_SCREEN ENDP

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
CALL DOUBLESCORE_CHECK
MOV AX,PLAYER1_DSCORE
MOV PLAYER1_TSCORE,AX
MOV AX,PLAYER2_DSCORE
MOV PLAYER2_TSCORE,AX
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
             CMP DX,160
             JAE GREY
             CMP DX,160
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
             CMP DX,160
             JAE GREY2
             CMP DX,160
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
    CMP DX,160
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
        CMP PLAYER1_FIRETAIL,1
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
            CMP PLAYER2_FIRETAIL,1
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
    MOV SNAKE2_Y,156
    MOV CURRENT_SNAKE2_DIRECTION,2
    
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

GAME_OVER_SCREEN PROC NEAR

    CMP TIMER,0
    JE THE_END
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
    JMP WAIT_FOR_ACTION

    THE_END:
    MOV AX,PLAYER1_DSCORE
    MOV BX,PLAYER2_DSCORE
    CMP AX,BX
    JA PLAYER1_WON
    CMP AX,BX
    JB PLAYER2_WON
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
        CMP AL,6
        JE DOUBLE_POWER
        CMP AL,0CH
        JE FIRETAIL_POWER
         CMP AL,8
        JE GRENADE_POWER
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
        CMP AL,6
        JE DOUBLE_POWER
        CMP AL,0CH
        JE FIRETAIL_POWER
         CMP AL,8
        JE GRENADE_POWER
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
        CMP AL,6
        JE DOUBLE_POWER
        CMP AL,0CH
        JE FIRETAIL_POWER
         CMP AL,8
        JE GRENADE_POWER
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
        CMP AL,6
        JE DOUBLE_POWER
        CMP AL,0CH
        JE FIRETAIL_POWER
         CMP AL,8
        JE GRENADE_POWER
    JNE NO_POWER

    GRENADE_POWER:
    mov GRENADE_P1,1
    MOV DEFEND_P1,1
    call GRENADE_ICON_DISAPPEARS
    call BOMB_PROCEDURES
    RET

    FIRETAIL_POWER:
        MOV PLAYER1_FIRETAIL,1
    RET

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

    DOUBLE_POWER:
    INC DOUBLESCORE_POWER_P1
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
        CMP AL,6
        JE DOUBLE_POWER2
        CMP AL,0CH
        JE FIRETAIL_POWER2
           CMP AL,8
        JE GRENADE_POWER2
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
        CMP AL,6
        JE DOUBLE_POWER2
        CMP AL,0CH
        JE FIRETAIL_POWER2
           CMP AL,8
        JE GRENADE_POWER2
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
        CMP AL,6
        JE DOUBLE_POWER2
        CMP AL,0CH
        JE FIRETAIL_POWER2
           CMP AL,8
        JE GRENADE_POWER2
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
        CMP AL,6
        JE DOUBLE_POWER2
        CMP AL,0CH
        JE FIRETAIL_POWER2
           CMP AL,8
        JE GRENADE_POWER2
    JNE NO_POWER2

    GRENADE_POWER2:
    mov GRENADE_P2,1
    MOV DEFEND_P2,1
    call GRENADE_ICON_DISAPPEARS
    call BOMB_PROCEDURES
     RET
    FIRETAIL_POWER2:
        MOV PLAYER2_FIRETAIL,1
    RET

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
    
    DOUBLE_POWER2:
    INC DOUBLESCORE_POWER_P1
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
        CALL VERTICAL_LINE_FILL
        CALL FILL_VERTICAL_AREA
        CALL VERTICAL_FILL
        CALL FILL_HORIZONTAL_AREA
        CALL HORIZONTAL_LINE_FILL
        CALL COLOR_TAIL
    JMP NO_TERRITORY

    CLOSED_AREA:
        CALL FILL_BOUNDED_AREA
        CALL VERTICAL_LINE_FILL
        CALL FILL_VERTICAL_AREA
        CALL VERTICAL_FILL
        CALL FILL_HORIZONTAL_AREA
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
        CALL VERTICAL_LINE_FILL2
        CALL VERTICAL_FILL2
        CALL FILL_VERTICAL_AREA2
        CALL FILL_HORIZONTAL_AREA2
        CALL HORIZONTAL_LINE_FILL2
        CALL COLOR_TAIL2
    JMP NO_TERRITORY2

    CLOSED_AREA2:
        CALL FILL_BOUNDED_AREA2
        CALL VERTICAL_LINE_FILL2
        CALL VERTICAL_FILL2
        CALL FILL_VERTICAL_AREA2
        CALL FILL_HORIZONTAL_AREA2
        CALL HORIZONTAL_LINE_FILL2
        CALL COLOR_TAIL2
        MOV P2_MOVING_IN_SPACE,0
        MOV P2_DEPTH,0
        MOV P2_BORDER_DEPTH,0
    NO_TERRITORY2:
RET
CHECK_P2_TERRITORY ENDP

 ;                                        POWER UP PROCEDURES



BOMB_PROCEDURES:
CHECK_BOMB_POSITION PROC NEAR

    MOV CX,BOMB_X
    MOV DX,BOMB_Y
    MOV AH,0DH
    INT 10H

    CMP DX,160
    JA REMOVE_BOMB

    CMP AL,7
    JE IN_BORDER1
    CMP AL,5
    JE P2_TERRITORY1
    CMP AL,3
    JE P1_TERRITORY1
    CMP AL,0
    JE SPACE1
    CMP AL,9
    JE P1_CHECK
    CMP AL,1
    JE P1_CHECK
    CMP AL,0DH
    JE P2_CHECK
    CMP AL,0AH
    JE P2_CHECK


    SPACE1:
        MOV BOMB_TAIL_COLOR,0
    JMP CONVERT_BOMB_TAIL

    IN_BORDER1:
        MOV BOMB_TAIL_COLOR,7
    JMP CONVERT_BOMB_TAIL

    P1_TERRITORY1:
        MOV BOMB_TAIL_COLOR,3
    JMP CONVERT_BOMB_TAIL

    P2_TERRITORY1:
        MOV BOMB_TAIL_COLOR,5
    JMP CONVERT_BOMB_TAIL

    P1_CHECK:
       cmp DEFEND_P1,1
       JNE P1_DIE
       JMP NONE

    NONE:
    RET
    P1_DIE:

        CMP PLAYER1_SHIELD,1
        JE WONT_DIE1
        CALL PLAYER1_RESPAWN
        JMP CONVERT_BOMB_TAIL
        WONT_DIE1:
        MOV BOMB_TAIL_COLOR,9
    JMP CONVERT_BOMB_TAIL

    P2_CHECK:

    CMP DEFEND_P2,1
    JNE P2_DIE
    JMP NONE

    P2_DIE:
        CMP PLAYER2_SHIELD,1
        JE P1_WONT_DIE1
        CALL PLAYER2_RESPAWN
        JMP CONVERT_BOMB_TAIL
        P1_WONT_DIE1:
        MOV BOMB_TAIL_COLOR,0DH
    JMP CONVERT_BOMB_TAIL

    REMOVE_BOMB:
        MOV BOMB,0
        MOV DEFEND_P1,0
        MOV DEFEND_P2,0
        MOV BOMB_VELOCITY,0
        MOV BOMB_TAIL_COLOR,7

    CONVERT_BOMB_TAIL:
        CALL CHECK_BOMB_TERRITORY
RET
CHECK_BOMB_POSITION ENDP

CHECK_BOMB_TERRITORY PROC NEAR

    CMP BOMB_TAIL_COLOR,7
    JE BORDER1
    CMP BOMB_TAIL_COLOR,3
    JE P1_TERR1
    CMP BOMB_TAIL_COLOR,5
    JE P2_TERR1
    CMP BOMB_TAIL_COLOR,0
    JE STILL_SPACE1
    CMP BOMB_TAIL_COLOR,9
    JE P1_TAIL1

    STILL_SPACE1:
        MOV AL,0
    JMP HIDE_TAIL1

    BORDER1:
        MOV AL,7
    JMP HIDE_TAIL1

    P1_TERR1:
        MOV AL,3
    JMP HIDE_TAIL1

    P2_TERR1:
        MOV AL,5
    JMP HIDE_TAIL1

    P1_TAIL1:
        MOV AL,9
    JMP HIDE_TAIL1

    HIDE_TAIL1:
RET
CHECK_BOMB_TERRITORY ENDP

BOMB_TIMER_CHECK PROC NEAR
    CMP BOMB,1
    JE FIRE_BOMB
      MOV AH,01H
      INT 16H
      CMP AL,09H
      JE LABEL2
     

    JMP DONT_FIRE1
      LABEL2:
      CMP GRENADE_P1,1
      JE SET_BOMB
      CMP GRENADE_P2,1
      JE SET_BOMB2
      JMP DONT_FIRE1


    FIRE_BOMB:
    CALL DRAW_BOMB
    JMP DONT_FIRE1

    SET_BOMB:
    MOV AX,SNAKE_X
    MOV BOMB_X,AX
    mov AX,SNAKE_Y
    MOV BOMB_Y,AX
    MOV BOMB,1
    MOV GRENADE_P1,0
    JMP FIRE_BOMB

    SET_BOMB2:
    MOV AX,SNAKE2_X
    MOV BOMB_X,AX
    mov AX,SNAKE2_Y
    MOV BOMB_Y,AX
    MOV BOMB,1
    MOV GRENADE_P2,0
    JMP FIRE_BOMB

    DONT_FIRE1:
RET
BOMB_TIMER_CHECK ENDP

DELETE_BOMB PROC NEAR
    MOV CX,BOMB_X ;initial value (x)
    MOV DX,BOMB_Y ;initial value (y)
    DELETE_ENEMY_BOMB: 
            CALL CHECK_BOMB_TERRITORY
            MOV AH,0CH    ;write pixels
            MOV BH,0      ;page number
            INT 10H

RET
DELETE_BOMB ENDP

DRAW_BOMB PROC NEAR
    MOV BOMB_VELOCITY,-2
    MOV CX,BOMB_X ;initial value (x)
    MOV DX,BOMB_Y ;initial value (y)
    CALL CHECK_BOMB_POSITION
            MOV AH,0CH    ;write pixels
            MOV AL,15
            MOV BH,0      ;page number
            INT 10H

RET
DRAW_BOMB ENDP

MOVE_BOMB PROC NEAR
    CALL DELETE_BOMB
    MOV AX,BOMB_VELOCITY
    CMP DEFEND_P2,1
    JE FLYING_UP
    SUB BOMB_Y,AX
    MOV DX,BOMB_Y
    CMP DX,2
    JB OUT_OF_BOUNDS1
    JMP WHATEVER
FLYING_UP:
ADD BOMB_Y,AX
    MOV DX,BOMB_Y
    CMP DX,2
    JB OUT_OF_BOUNDS1
WHATEVER:
RET

    OUT_OF_BOUNDS1:
        MOV BOMB_VELOCITY,0
    RET
MOVE_BOMB ENDP
  
RET

 GRENADE proc near
       CMP TIMER,98
       JE GRENADE_ICON_APPEARS
       JNE NO_GRENADE

       GRENADE_ICON_APPEARS:
       MOV CX,GRENADE_X
       MOV DX,GRENADE_Y

       DRAW_GRENADE:
        MOV AH,0CH    ;write pixels
        MOV AL,8   ;color
        MOV BH,0      ;page number
        INT 10H
        INC CX
        MOV AX,CX     
        SUB AX,GRENADE_X
        CMP AX,2
        JNG DRAW_GRENADE
        MOV CX,GRENADE_X ;cx register goes back to initial column
        INC DX         ;advance one line
        MOV AX,DX      
        SUB AX,GRENADE_Y
        CMP AX,2
    JNG DRAW_GRENADE

     NO_GRENADE:
    CMP PLAYER1_GRENADE,1
    JE CHECK_GRENADE_TIME
    CMP PLAYER2_GRENADE,1
    JE CHECK_GRENADE_TIME

    CMP TIMER,55
    JE GRENADE_ICON_DISAPPEARS
    JNE NOTHING1

    GRENADE_ICON_DISAPPEARS:
        MOV CX,GRENADE_X
        MOV DX,GRENADE_Y
        SUB CX,1
        SUB DX,1
        MOV AH,0DH
        INT 10H
        MOV BL,AL
        ADD CX,1
        ADD DX,1
        DELETE_GRENADE: 
        MOV AH,0CH    ;write pixels
        MOV AL,BL     ;color
        MOV BH,0      ;page number
        INT 10H
        INC CX
        MOV AX,CX     
        SUB AX,GRENADE_X
        CMP AX,2
        JNG DELETE_GRENADE
        MOV CX,GRENADE_X ;cx register goes back to initial column
        INC DX         ;advance one line
        MOV AX,DX      
        SUB AX,GRENADE_Y
        CMP AX,2
    JNG DELETE_GRENADE
    JMP NOTHING1
    CHECK_GRENADE_TIME:
        DEC GRENADE_TIME
        CMP GRENADE_TIME,0
        JNE NOTHING
        DEC GRENADE_TIMER
        MOV GRENADE_TIME,20
        CMP GRENADE_TIMER,0
    JNE NOTHING1

    REMOVE_GRENADE:
        MOV PLAYER1_GRENADE,0
        MOV PLAYER2_GRENADE,0

    NOTHING1:
RET
GRENADE ENDP
        

DOUBLESCORE_CHECK PROC NEAR
MOV AL,1
CMP DOUBLESCORE_POWER_P1,AL
JE DOUBLESCORE1
CMP DOUBLESCORE_POWER_P2,AL
JE DOUBLESCORE2
JMP ENDME
DOUBLESCORE1:
MOV PLAYER1_DSCORE,AX
SUB AX,PLAYER1_TSCORE
ADD PLAYER1_DSCORE,AX
JMP ENDME
DOUBLESCORE2:
MOV PLAYER2_DSCORE,AX
SUB AX,PLAYER2_TSCORE   
ADD PLAYER2_DSCORE,AX
JMP ENDME

ENDME:
RET
DOUBLESCORE_CHECK ENDP        

FIRETAIL PROC NEAR

    CMP TIMER,99
    JE FIRETAIL_ICON_APPEARS
    JNE NO_FIRETAIL

    FIRETAIL_ICON_APPEARS:
        MOV CX,FIRETAIL_X
        MOV DX,FIRETAIL_Y

    DRAW_FIRETAIL:
        MOV AH,0CH
        MOV AL,0CH
        MOV BH,0
        INT 10H

        INC CX
        MOV AX,CX
        SUB AX,FIRETAIL_X
        CMP AX,2
    JNG DRAW_FIRETAIL
        MOV CX,FIRETAIL_X
        INC DX

        MOV AX,DX
        SUB AX,FIRETAIL_Y
        CMP AX,3
    JNE DRAW_FIRETAIL

    NO_FIRETAIL:
    CMP PLAYER1_FIRETAIL,1
    JE CHECK_FIRETAIL_TIME
    CMP PLAYER2_FIRETAIL,1
    JE CHECK_FIRETAIL_TIME

    CMP TIMER,72
    JE FIRETAIL_ICON_DISAPPEARS
    JNE NO_WAY

    FIRETAIL_ICON_DISAPPEARS:
        MOV CX,FIRETAIL_X
        MOV DX,FIRETAIL_Y
        SUB CX,1
        SUB DX,1
        MOV AH,0DH
        INT 10H
        MOV BL,AL
        ADD CX,1
        ADD DX,1
    DELETE_FIRETAIL:
        MOV AH,0CH
        MOV AL,BL
        MOV BH,0
        INT 10H

        INC CX
        MOV AX,CX
        SUB AX,FIRETAIL_X
        CMP AX,2
    JNG DELETE_FIRETAIL
        MOV CX,FIRETAIL_X
        INC DX

        MOV AX,DX
        SUB AX,FIRETAIL_Y
        CMP AX,2
    JNE DELETE_FIRETAIL
    JMP NO_WAY

    CHECK_FIRETAIL_TIME:
        DEC FIRETAIL_TIME
        CMP FIRETAIL_TIME,0
        JNE NO_WAY
        DEC FIRETAIL_TIMER
        MOV FIRETAIL_TIME,20
        CMP FIRETAIL_TIMER,0
    JNE NO_WAY

    REMOVE_FIRETAIL:
        MOV PLAYER1_FIRETAIL,0
        MOV PLAYER2_FIRETAIL,0

    NO_WAY:
RET
FIRETAIL ENDP

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

DOUBLE_SCORE PROC NEAR

    CMP TIMER,90
    JE DOUBLE_SCORE_ICON_APPEARS
    JNE DELETE_LIFE_ICON
    
    DOUBLE_SCORE_ICON_APPEARS:
        MOV CX,SCORE_X
        MOV DX,SCORE_Y

    DRAW_SCORE: 
        MOV AH,0CH    ;write pixels
        MOV AL,6      ;color
        MOV BH,0      ;page number
        INT 10H

        INC CX
        MOV AX,CX     
        SUB AX,SCORE_X
        CMP AX,2
    JNG DRAW_SCORE
        MOV CX,SCORE_X ;cx register goes back to initial column
        INC DX         ;advance one line

        MOV AX,DX      
        SUB AX,SCORE_Y
        CMP AX,2
    JNG DRAW_SCORE

    DELETE_SCORE_ICON:
    CMP TIMER,0
    JE SCORE_ICON_DISAPPEARS
    JNE NO_SCORE_ICON

    SCORE_ICON_DISAPPEARS:
        MOV CX,SCORE_X
        MOV DX,SCORE_Y
        SUB CX,1
        SUB DX,1
        MOV AH,0DH
        INT 10H
        MOV BL,AL
        ADD CX,1
        ADD DX,1
    DELETE_SCORE: 
        MOV AH,0CH    ;write pixels
        MOV AL,BL      ;color
        MOV BH,0      ;page number
        INT 10H

        INC CX
        MOV AX,CX     
        SUB AX,SCORE_X
        CMP AX,2
    JNG DELETE_SCORE
        MOV CX,SCORE_X ;cx register goes back to initial column
        INC DX         ;advance one line

        MOV AX,DX      
        SUB AX,SCORE_Y
        CMP AX,2
    JNG DELETE_SCORE   

    NO_SCORE_ICON:
RET
DOUBLE_SCORE ENDP

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
        CMP PLAYER2_FIRETAIL,1
        JE KILL_PLAYER1_INSTEAD
        CALL PLAYER2_RESPAWN
        JMP CHANGE_TAIL_COLOR
        KILL_PLAYER1_INSTEAD:
        CALL PLAYER1_RESPAWN
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
    CMP DX,160
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
        JMP CHECK_FOR_KEY

        WILL_CHAT1:
            MOV INCHAT,1
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
        JMP CONT

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

FILL_HORIZONTAL_AREA PROC NEAR
    MOV CX,AREA_X
    MOV DX,AREA_Y
    MOV BL,0
    MOV BH,4
    CHECK_GRID6:
        CHECK_COLUMN6:
        MOV AH,0DH
        INT 10H
        CMP AL,0
        JNE DEBUG6
        INC BL
        KEEP_GOING6:
        INC CX
        CMP CX,313
        JA NEXT_ROW6
        JB CHECK_COLUMN6


        DEBUG6: 
            CMP BL,4
            JE CHECK_NEXT_PIXEL6
            MOV BL,0
        JMP KEEP_GOING6

        CHECK_NEXT_PIXEL6:
            INC CX
            MOV AH,0DH
            INT 10H
            DEC CX
            CMP AL,3
        JNE NEXT_ROW6
        JE FILL_SPACE6

        FILL_SPACE6:
            DEC CX
            MOV AH,0CH
            MOV AL,3
            INT 10H
            DEC BH
            CMP BH,0
            MOV BL,0
        JE RESET_LOOP_COUNTER6
        JA FILL_SPACE6

        RESET_LOOP_COUNTER6:
        MOV BH,4
        JMP CHECK_COLUMN6

        NEXT_ROW6:
            MOV BH,4
            MOV BL,0
            INC DX
            CMP DX,314
            JE BREAK60
            MOV CX,AREA_X
            JMP CHECK_COLUMN6
    BREAK60:
RET
FILL_HORIZONTAL_AREA ENDP

VERTICAL_FILL PROC NEAR
    MOV DX,6
    MOV CX,6
    MOV BL,0
    VERTICAL_FILL_CHECK2:
        MOV AH,0DH
        INT 10H
        CMP AL,9
        JE FIND_BLACK2
        NOT_YET_TIME2:
        INC DX
        CMP DX,160
        JB VERTICAL_FILL_CHECK2
        NEXT_COLUMN2:
        INC CX
        MOV DX,6
        CMP CX,313
    JB VERTICAL_FILL_CHECK2
    JMP END_FILL2

    FIND_BLACK2:
        INC BL
        CMP BL,4
        JB NOT_YET_TIME2
        JMP NEXT_PIXEL_COLOR2
        COME_HERE2:
        MOV AH,0DH
        INT 10H
        INC DX
        CMP AL,0
    JE FIND_TAIL2
        CMP DX,160
    JB FIND_BLACK2
    JMP NEXT_COLUMN2

    FIND_TAIL2:
    MOV CURRENT_ROW2,DX
        CHECK_TAIL2:
        INC DX
        MOV AH,0DH
        INT 10H
        CMP AL,9
        JE FIX_IT2
        CMP DX,160
    JB CHECK_TAIL2



    MOV DX,CURRENT_ROW2
    SUB DX,2
    MOV BL,0
    CMP CURRENT_SNAKE_DIRECTION,2
    JE COLOR_ABOVE2
    CMP CURRENT_SNAKE_DIRECTION,3
    JE COLOR_BELOW2

    JMP END_FILL2

    COLOR_BELOW2:
        MOV AH,0CH
        MOV AL,3
        INT 10H
        INC DX
        CMP DX,160
    JB COLOR_BELOW2
    JMP VERTICAL_FILL_CHECK2
    

    COLOR_ABOVE2:
        MOV AH,0CH
        MOV AL,3
        INT 10H
        DEC DX
        CMP DX,6
    JA COLOR_ABOVE2
    INC CX
    JMP VERTICAL_FILL_CHECK2

    NEXT_PIXEL_COLOR2:
        INC DX
        MOV AH,0DH
        INT 10H
        CMP AL,9
        JNE COME_HERE2
        MOV BL,0
    JMP NEXT_COLUMN2

    FIX_IT2:
        DEC DX
        MOV AH,0DH
        INT 10H
        CMP AL,9
        JE VERTICAL_FILL_CHECK2
        MOV AH,0CH
        MOV AL,3
        INT 10H
    JMP FIX_IT2

    END_FILL2:
RET
VERTICAL_FILL ENDP

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
        CMP DX,160
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
            CMP CX,313
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
            CMP CX,313
        JB FIND_BELOW

        COLOR_EMPTY:
            MOV CX,START_OR_END
            MOV DX,CURRENT_ROW
            CMP DX,90
            JA COLOR_BELOW

            COLOR_ABOVE222:
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
                CMP CX,313
            JB COLOR_ABOVE222
            JMP NOPE

            COLOR_BELOW222:
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
                CMP DX,160
            JB COLOR_LOOP
                MOV DX,CURRENT_ROW
                INC CX
                CMP CX,313
            JB COLOR_BELOW222



        NOPE:
RET
HORIZONTAL_LINE_FILL ENDP

VERTICAL_LINE_FILL PROC NEAR
    MOV CX,6
    MOV DX,6
    FIND_VERTICAL_LINE7:
    MOV AH,0DH
    INT 10H
    CMP AL,9
    JE CHECK_RIGHT_OR_LEFT7
    INC DX
    CMP DX,160
JB FIND_VERTICAL_LINE7
    MOV DX,6
    INC CX
    CMP CX,313
JB FIND_VERTICAL_LINE7

CHECK_RIGHT_OR_LEFT7:
    DEC CX
    MOV CURRENT_ROW,DX
    FIND_LEFT7:
        MOV AH,0DH
        INT 10H
        CMP AL,9
        JE NOTHING7
        INC DX
        CMP DX,160
    JB FIND_LEFT7

    ADD CX,5
    MOV START_OR_END,CX
    MOV DX,CURRENT_ROW
    FIND_RIGHT7:
        MOV AH,0DH
        INT 10H
        CMP AL,9
        JE NOTHING7
        INC DX
        CMP DX,160
    JB FIND_RIGHT7

    COLOR_WHATS_LEFT7:
        MOV CX,START_OR_END
        MOV DX,CURRENT_ROW
        CMP CX,160
    JA COLOR_RIGHT7

    COLOR_LEFT7:
        DEC CX
        MOV AH,0DH
        INT 10H
        CMP AL,9
        JNE NOTHING7
    START_COLOR_LOOP7:
        MOV AH,0CH
        MOV AL,3
        INT 10H
        DEC CX
        CMP CX,6
    JA START_COLOR_LOOP7
        MOV CX,START_OR_END
        INC DX
        CMP DX,160
    JB COLOR_LEFT7
    JMP NOTHING7

    COLOR_RIGHT7:
        DEC CX
        MOV AH,0DH
        INT 10H
        CMP AL,9
        JNE NOTHING7
    START_COLORING_LOOP7:
        MOV AH,0CH
        MOV AL,3
        INT 10H
        INC CX
        CMP CX,313
    JB START_COLORING_LOOP7
        MOV CX,START_OR_END
        INC DX
        CMP DX,160
    JB COLOR_RIGHT7

    NOTHING7: 
RET
VERTICAL_LINE_FILL ENDP

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

    JMP BREAK2

    JUMP_HERE:
    SUB CX,2                ;harga3 lel point bta3t nhayet el snake body w arga3 le awl pixel soda alawenha 
    LOOK_FOR_BLACK:
    DEC CX
    MOV AH,0DH  
    INT 10H
    CMP AL,9
    JE LOOK_FOR_BLACK
    COLOR_BEFORE:           ;b3d keda halawen kol el pixels el ableha l7ad mawsal lnhayet el border
    MOV AH,0CH
    MOV AL,3
    INT 10H
    DEC CX
    CMP CX,6
    JA COLOR_BEFORE
    JMP NEXT_Y

    COLOR_AFTER:           ;b3d keda halawen kol el pixels el ableha l7ad mawsal lnhayet el border
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
    CMP DX,160
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
    MOV BULLET_Y,157
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
        CMP PLAYER1_FIRETAIL,1
        JE KILL_PLAYER2_INSTEAD
        CALL PLAYER1_RESPAWN
        JMP CHANGE_TAIL2_COLOR
        KILL_PLAYER2_INSTEAD:
        CALL PLAYER2_RESPAWN
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
    CMP DX,160
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

        CMP REC_MOVEMENT,4CH
        JE MOVE_RIGHT22
        CMP REC_MOVEMENT,6CH
        JE MOVE_RIGHT22

        CMP REC_MOVEMENT,69H
        JE MOVE_UP22
        CMP REC_MOVEMENT,49H
        JE MOVE_UP22

        CMP REC_MOVEMENT,6BH
        JE MOVE_DOWN22
        CMP REC_MOVEMENT,4BH
        JE MOVE_DOWN22

        CMP REC_MOVEMENT,6AH
        JE MOVE_LEFT22     
        CMP REC_MOVEMENT,4AH
        JE MOVE_LEFT22 


        DONEKEYPRESS2:
        CMP SEND_MOVEMENT,4CH
        JE MOVE_RIGHT22
        CMP SEND_MOVEMENT,6CH
        JE MOVE_RIGHT22

        CMP SEND_MOVEMENT,69H
        JE MOVE_UP22
        CMP SEND_MOVEMENT,49H
        JE MOVE_UP22

        CMP SEND_MOVEMENT,6BH
        JE MOVE_DOWN22
        CMP SEND_MOVEMENT,4BH
        JE MOVE_DOWN22

        CMP SEND_MOVEMENT,6AH
        JE MOVE_LEFT22     
        CMP SEND_MOVEMENT,4AH
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
                CMP SNAKE2_Y,162
                JAE MOVE_LEFT22
                ADD SNAKE2_Y,DX
                CMP SNAKE2_Y,162             ;If the next pixel is outside of the border change direction clockwise
                JE MOVE_LEFT22
                CMP SNAKE2_Y,160
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
                CMP SNAKE2_Y,160
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

FILL_HORIZONTAL_AREA2 PROC NEAR
    MOV CX,AREA_X
    MOV DX,AREA_Y
    MOV BL,0
    MOV BH,4
    CHECK_GRID22:
        CHECK_COLUMN22:
        MOV AH,0DH
        INT 10H
        CMP AL,0
        JNE DEBUG22
        INC BL
        KEEP_GOING22:
        INC CX
        CMP CX,313
        JA NEXT_ROW22
        JB CHECK_COLUMN22


        DEBUG22: 
            CMP BL,4
            JE CHECK_NEXT_PIXEL22
            MOV BL,0
        JMP KEEP_GOING22

        CHECK_NEXT_PIXEL22:
            INC CX
            MOV AH,0DH
            INT 10H
            DEC CX
            CMP AL,5
        JNE NEXT_ROW22
        JE FILL_SPACE22

        FILL_SPACE22:
            DEC CX
            MOV AH,0CH
            MOV AL,5
            INT 10H
            DEC BH
            CMP BH,0
            MOV BL,0
        JE RESET_LOOP_COUNTER22
        JA FILL_SPACE22

        RESET_LOOP_COUNTER22:
        MOV BH,4
        JMP CHECK_COLUMN22

        NEXT_ROW22:
            MOV BH,4
            MOV BL,0
            INC DX
            CMP DX,314
            JE BREAK522
            MOV CX,AREA_X
            JMP CHECK_COLUMN22
    BREAK522:
RET
FILL_HORIZONTAL_AREA2 ENDP

HORIZONTAL_LINE_FILL2 PROC NEAR
    MOV CX,6
    MOV DX,6
    FIND_LINE7:
        MOV AH,0DH
        INT 10H
        CMP AL,0DH
        JE CHECK_ABOVE_OR_BELOW7
        INC CX
        CMP CX,313
    JB FIND_LINE7
        MOV CX,6
        INC DX
        CMP DX,160
    JB FIND_LINE7

    CHECK_ABOVE_OR_BELOW7:
        DEC DX
        MOV START_OR_END2,CX
        FIND_ABOVE7:
            MOV AH,0DH
            INT 10H
            CMP AL,0DH
            JE NOPE7
            INC CX
            CMP CX,313
        JB FIND_ABOVE7

        ADD DX,5
        MOV CURRENT_ROW2,DX
        MOV CX,START_OR_END2
        FIND_BELOW7:
            MOV AH,0DH
            INT 10H
            CMP AL,0DH
            JE NOPE7
            INC CX
            CMP CX,313
        JB FIND_BELOW7

        COLOR_EMPTY7:
            MOV CX,START_OR_END2
            MOV DX,CURRENT_ROW2
            CMP DX,90
            JA COLOR_BELOW7

            COLOR_ABOVE7:
                DEC DX
                MOV AH,0DH
                INT 10H
                CMP AL,0DH
                JNE NOPE7
            COLORING_LOOP7:
                MOV AH,0CH
                MOV AL,5
                INT 10H
                DEC DX
                CMP DX,6
            JA COLORING_LOOP7
                MOV DX,CURRENT_ROW2
                INC CX
                CMP CX,313
            JB COLOR_ABOVE7
            JMP NOPE7

            COLOR_BELOW7:
                DEC DX
                MOV AH,0DH
                INT 10H
                CMP AL,0DH
                JNE NOPE7
            COLOR_LOOP7:
                MOV AH,0CH
                MOV AL,5
                INT 10H
                INC DX
                CMP DX,160
            JB COLOR_LOOP7
                MOV DX,CURRENT_ROW2
                INC CX
                CMP CX,313
            JB COLOR_BELOW7



        NOPE7:
RET
HORIZONTAL_LINE_FILL2 ENDP

VERTICAL_LINE_FILL2 PROC NEAR
    MOV CX,6
    MOV DX,6
FIND_VERTICAL_LINE2:
    MOV AH,0DH
    INT 10H
    CMP AL,0DH
    JE CHECK_RIGHT_OR_LEFT
    INC DX
    CMP DX,160
JB FIND_VERTICAL_LINE2
    MOV DX,6
    INC CX
    CMP CX,313
JB FIND_VERTICAL_LINE2

CHECK_RIGHT_OR_LEFT:
    DEC CX
    MOV CURRENT_ROW2,DX
    FIND_LEFT2:
        MOV AH,0DH
        INT 10H
        CMP AL,0DH
        JE NOTHING
        INC DX
        CMP DX,160
    JB FIND_LEFT2

    ADD CX,5
    MOV START_OR_END2,CX
    MOV DX,CURRENT_ROW2
    FIND_RIGHT2:
        MOV AH,0DH
        INT 10H
        CMP AL,0DH
        JE NOTHING
        INC DX
        CMP DX,160
    JB FIND_RIGHT2

    COLOR_WHATS_LEFT:
        MOV CX,START_OR_END2
        MOV DX,CURRENT_ROW2
        CMP CX,160
        JA COLOR_RIGHT2
    

    COLOR_LEFT2:
        DEC CX
        MOV AH,0DH
        INT 10H
        CMP AL,0DH
        JNE NOTHING
    START_COLOR_LOOP:
        MOV AH,0CH
        MOV AL,5
        INT 10H
        DEC CX
        CMP CX,6
    JA START_COLOR_LOOP
        MOV CX,START_OR_END2
        INC DX
        CMP DX,160
    JB COLOR_LEFT2
    JMP NOTHING

    COLOR_RIGHT2:
        DEC CX
        MOV AH,0DH
        INT 10H
        CMP AL,0DH
        JNE NOTHING
    START_COLORING_LOOP:
        MOV AH,0CH
        MOV AL,5
        INT 10H
        INC CX
        CMP CX,313
    JB START_COLORING_LOOP
        MOV CX,START_OR_END2
        INC DX
        CMP DX,160
    JB COLOR_RIGHT2

    NOTHING: 
RET
VERTICAL_LINE_FILL2 ENDP

VERTICAL_FILL2 PROC NEAR
    MOV DX,6
    MOV CX,6
    MOV BL,0
    VERTICAL_FILL_CHECK:
        MOV AH,0DH
        INT 10H
        CMP AL,0DH
        JE FIND_BLACK
        NOT_YET_TIME:
        INC DX
        CMP DX,160
        JB VERTICAL_FILL_CHECK
        NEXT_COLUMN:
        INC CX
        MOV DX,6
        CMP CX,313
    JB VERTICAL_FILL_CHECK
    JMP END_FILL

    FIND_BLACK:
        INC BL
        CMP BL,4
        JB NOT_YET_TIME
        JMP NEXT_PIXEL_COLOR
        COME_HERE:
        MOV AH,0DH
        INT 10H
        INC DX
        CMP AL,0
    JE FIND_TAIL
        CMP DX,160
    JB FIND_BLACK
    JMP NEXT_COLUMN

    FIND_TAIL:
    MOV CURRENT_ROW,DX
        CHECK_TAIL:
        INC DX
        MOV AH,0DH
        INT 10H
        CMP AL,0DH
        JE FIX_IT
        CMP DX,160
    JB CHECK_TAIL



    MOV DX,CURRENT_ROW
    SUB DX,2
    MOV BL,0
    CMP CURRENT_SNAKE2_DIRECTION,2
    JE COLOR_ABOVE
    CMP CURRENT_SNAKE2_DIRECTION,3
    JE COLOR_BELOW

    JMP END_FILL

    COLOR_BELOW:
        MOV AH,0CH
        MOV AL,5
        INT 10H
        INC DX
        CMP DX,160
    JB COLOR_BELOW
    JMP VERTICAL_FILL_CHECK
    

    COLOR_ABOVE:
        MOV AH,0CH
        MOV AL,5
        INT 10H
        DEC DX
        CMP DX,6
    JA COLOR_ABOVE
    INC CX
    JMP VERTICAL_FILL_CHECK

    NEXT_PIXEL_COLOR:
        INC DX
        MOV AH,0DH
        INT 10H
        CMP AL,0DH
        JNE COME_HERE
        MOV BL,0
    JMP NEXT_COLUMN 

    FIX_IT:
        DEC DX
        MOV AH,0DH
        INT 10H
        CMP AL,0DH
        JE VERTICAL_FILL_CHECK
        MOV AH,0CH
        MOV AL,5
        INT 10H
    JMP FIX_IT

    END_FILL:
RET
VERTICAL_FILL2 ENDP

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
    
    JMP BREAK22

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
    CMP DX,160
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
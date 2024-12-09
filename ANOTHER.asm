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
SPEED_Y                     DW 160
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
    MOV DX,OFFSET INITIAL_SCORE
    INT 21H

    MOV AH,2
    MOV DL,27
    MOV DH,11
    INT 10H

;CAPTURE STRING FROM KEYBOARD. 
    MOV AH,0AH
    MOV DX,OFFSET IN_SCORE
    INT 21H

    MOV AH,2
    MOV DL,25
    MOV DH,16
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
END MAIN

.MODEL SMALL
.STACK 64
.DATA
VALUE DB ?,"$"
SENDING DB ?,"$"
NOTIFICATION DB 'TO END CHATTING WITH OPPONENT PRESS F3',0AH,0DH,"$"
PLAYER_1          DB 'ME:', 0AH, 0DH, "$"
PLAYER_2          DB 'OPPONENT:',0AH,0DH,"$"
P1_CHAT_ROW       DB 1
P1_SENTENCE_START DB 1
P2_CHAT_ROW       DB 12
P2_SENTENCE_START DB 1
.CODE
MAIN PROC FAR
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX

    MOV AH,0
    MOV AL,3H
    INT 10H

    MOV AH,09
    MOV DX,OFFSET PLAYER_1
    INT 21H

    MOV AH,02H
    MOV DH,11
    MOV DL,0
    INT 10H

    MOV AH,09
    MOV DX,OFFSET PLAYER_2
    INT 21H

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

    CHAT_LOOP:
        MOV AH,01H
        INT 16H
        JZ RECIEVE_CHARACTER
        MOV AH,00H
        INT 16H
        MOV SENDING,AL
        ;Check that Transmitter Holding Register is Empty
    SEND_CHARACTER:
            MOV DX,3FDH		; Line Status Register
    AGAIN:  
            IN AL,DX 			;Read Line Status
            AND AL,00100000B
            JZ AGAIN

    ;If empty put the VALUE in Transmit data register
            MOV DX , 3F8H		; Transmit data register
            ;mov al,"A"
            MOV AL,SENDING
            OUT DX,AL

            CMP AL,13
            JE NEXT_LINE

            GO_ON:
            ADD P1_SENTENCE_START,1
            MOV AH,2
            MOV DH,P1_CHAT_ROW
            MOV DL,P1_SENTENCE_START
            MOV BH,0
            INT 10H


            mov ah, 09 
            mov dx, offset SENDING
            int 21h
        JMP CHAT_LOOP

        RECIEVE_CHARACTER:
                MOV DX , 3FDH		; Line Status Register
         CHK:	
            IN AL,DX 
            AND AL,1
            CMP AL,1
            JNE CHAT_LOOP  
            ;If Ready read the VALUE in Receive data register
            MOV DX,03F8H
            IN AL,DX 
            MOV VALUE,AL

            CMP AL,13
            JE ENTER_PRESSED

            GO_ON_NOW:
            ADD P2_SENTENCE_START,1    
            MOV AH,2
            MOV DH,P2_CHAT_ROW
            MOV DL,P2_SENTENCE_START
            MOV BH,0
            INT 10H


            mov ah, 09 
            mov dx, offset value
            int 21h   

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

        NEXT_LINE:
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
            MOV CH,14
            MOV CL,0
            MOV DH,21
            MOV DL,79
            INT 10H
            SUB P2_CHAT_ROW,1
        JMP LETS_DO_THIS

EXIT:
    MOV AH, 4CH
    INT 21H 

MAIN ENDP
END MAIN


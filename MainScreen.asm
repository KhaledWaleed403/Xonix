.MODEL SMALL
.STACK 64
.DATA   
IN_NAME                     DB 16           ;MAX NUMBER OF CHARACTERS ALLOWED (25).
                            DB ?            ;NUMBER OF CHARACTERS ENTERED BY USER.
                            DB 16 DUP(0)    ;CHARACTERS ENTERED BY USER.
IN_SCORE                    DB 3
                            DB ?
                            DB 3 DUP(0)
TEMP                        DB 16
                            DB ?
                            DB 16 DUP(0)
PLAYER_NAME                 DB 'Please Enter Your Name:',"$"
INITIAL_SCORE               DB 'Initial Points:',"$"
CONTINUE                    DB 'Press Enter Key To Continue',"$"  
INVALID                     DB 'Special Characters Are Not Allowed',"$"
WRONG_KEY                   DB 0
.CODE
MAIN PROC FAR
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX


    

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
    CHECK:                          ;LOOP BA3MEL CHECK 3LA KOL ELEMENT FEL ARRAY 3ASHAN ASHOOF DA CHARACTER MAZBOT WLA LA
        MOV BL,[SI]
        CMP BL,41H
        JAE CHECK_IF_VALID
        JMP INVALID_INPUT
        ITS_VALID:
        INC SI
        DEC BH
        CMP BH,0
    JA CHECK

            ; initinalize COM
    ;Set Divisor Latch Access Bit
    mov dx,3fbh 			; Line Control Register
    mov al,10000000b		;Set Divisor Latch Access Bit
    out dx,al				;Out it
    ;Set LSB byte of the Baud Rate Divisor Latch register.
    mov dx,3f8h			
    mov al,0ch			
    out dx,al

    ;Set MSB byte of the Baud Rate Divisor Latch register.
    mov dx,3f9h
    mov al,00h
    out dx,al

    ;Set port configuration
    mov dx,3fbh
    mov al,00011011b
    out dx,al

        MOV SI,OFFSET IN_NAME+1
        MOV BH,[SI]
        ADD BH,1
        MOV SI,OFFSET IN_NAME+2
        SEND_FULL_NAME:
                mov dx , 3FDH		; Line Status Register
    AGAIN:  
            In al , dx 			;Read Line Status
            AND al , 00100000b
            JZ AGAIN
    ;If empty put the VALUE in Transmit data register
        mov dx , 3F8H		; Transmit data register
        ;mov al,"A"
        MOV AL,[SI]
        INC SI 
        out dx , al
        DEC BH
        CMP BH,0
        JA SEND_FULL_NAME

        MOV SI,OFFSET TEMP+2
    RECIEVING_LOOP:  
    ;Check that Data Ready
            mov dx , 3FDH		; Line Status Register
            CMP [SI],0DH
            JE OUTSIDE
            INC SI
    CHK:	in al , dx 
            AND al , 1
            JZ CHK  
    ;If Ready read the VALUE in Receive data register
            mov dx , 03F8H
            in al , dx 
            mov [SI] , al

    JMP RECIEVING_LOOP
    OUTSIDE:
    
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

    CHECK_IF_VALID:
        CMP BL,5AH
    JBE ITS_VALID
        JMP INVALID_INPUT

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
        JMP ENTER_PRESS
        MOV WRONG_KEY,1


    ENTER_PRESS:
    MOV AH,00
    INT 16H
    CMP AL,13
    JNE ENTER_PRESS

MAIN ENDP
END MAIN
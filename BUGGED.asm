.MODEL SMALL
.STACK 64
.DATA   
IN_NAME                     DB 16           ;MAX NUMBER OF CHARACTERS ALLOWED (25).
                            DB ?            ;NUMBER OF CHARACTERS ENTERED BY USER.
                            DB 16 DUP(0)    ;CHARACTERS ENTERED BY USER.
PLAYER_NAME                 DB 'Please Enter Your Name:',"$"
INITIAL_SCORE               DB 'Initial Points:',"$"
CONTINUE                    DB 'Press Enter Key To Continue',"$"
.CODE
MAIN PROC FAR
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    
    MOV AH,0
    MOV AL,3
    INT 10H

    MOV AH,09
    MOV DX,OFFSET PLAYER_NAME
    INT 21H

;CAPTURE STRING FROM KEYBOARD. 
    MOV AH,0AH
    MOV DX,OFFSET IN_NAME
    INT 21H

;CHANGE CHR(13) BY '$'.
    MOV SI,OFFSET IN_NAME + 1
    MOV CL,[SI]
    MOV CH,0
    INC CX
    ADD SI,CX
    MOV AL,'$'
    MOV [SI],AL
    
;DISPLAY STRING. 
    MOV BP,OFFSET IN_NAME
    MOV AH,13H
    MOV AL,0
    MOV BL,15
    MOV BH,0
    MOV DL,0
    MOV DH,10
    MOV CX,15
    INT 10H
MAIN ENDP
END MAIN
.MODEL small
.STACK 100h
.data
value db  16
      DB ?
      DB 16 DUP(0) ,"$" 
messsage DB 'serial communication Receive one byte', 0AH, 0DH, "$"

.code


Main proc FAR
    mov ax, @data
    mov ds, ax
    mov es,ax

    MOV AH,0
    MOV AL,03H
    INT 10h

    mov ah, 09 
    mov dx, offset messsage
    int 21h


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

    MOV SI,OFFSET value+2
    RECIEVING_LOOP:  
    ;Check that Data Ready
            mov dx , 3FDH		; Line Status Register
            CMP [SI],0DH
            JE PRINT
            INC SI
    CHK:	in al , dx 
            AND al , 1
            JZ CHK  
    ;If Ready read the VALUE in Receive data register
            mov dx , 03F8H
            in al , dx 
            mov [SI] , al

    JMP RECIEVING_LOOP

    PRINT:
        MOV BP,OFFSET value+2
        MOV AH,13H
        MOV AL,0
        MOV BL,15
        MOV BH,0
        MOV DL,22
        MOV DH,10
        MOV CX,16
        INT 10H

exit:
    mov ah, 4ch
    int 21h 

Main endp
end
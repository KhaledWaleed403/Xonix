.MODEL SMALL
.STACK 64
.DATA
CHAT                        DB 'To start chatting press 1'
GAME                        DB 'To start game press F2'
EXIT                        DB 'To end the program press ESC'
TIME_AUX                    DB 0 ;variable used when checking if time changed
BORDER_X                    DW 50
BORDER_Y                    DW 0
BORDER_SIZE                 DW 03H
SNAKE_SIZE                  DW 03H
SNAKE_X                     DW 0
SNAKE_Y                     DW 7
AREA_X                      DW 0
AREA_Y                      DW 0
AREA_IN                     DW 0
.CODE

MAIN PROC FAR
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    
    MOV AH,0H
    MOV AL,13H
    INT 10h


    CALL DRAW_FULL_BORDER
    CALL FILL_BOUNDED_AREA
    ;CALL COLOR_TAIL





    CHECK_TIME:
        MOV AH,2CH ;returns: CH=hour, CL=minutes, DH=seconds,DL=1/100 seconds
        INT 21H

        CMP DL,TIME_AUX ;is the current time equal to the previous one?
        JE CHECK_TIME   ;if not then check again                  
        MOV TIME_AUX,DL ;if its different then draw again
    JMP CHECK_TIME

MAIN ENDP

DRAW_SNAKE PROC NEAR

        MOV CX,SNAKE_X ;initial value (x)
        MOV DX,SNAKE_Y ;initial value (y)


        DRAW_SNAKE_HORIZONTAL:
            CALL CHECK_BORDER
 
            MOV AH,0CH    ;write pixels        ;COLOR
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

DRAW_BORDER PROC NEAR


  DRAW_BORDER_HORIZONTAL: 
    MOV AH,0CH    ;write pixels
    MOV AL,9      ;color
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
        CMP DX,7
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
RET    
SCREEN_ONE ENDP

DRAW_FULL_BORDER PROC NEAR

    MOV BORDER_X,150
    MOV BORDER_Y,75
   TOP_BORDER: 
        MOV CX,BORDER_X ;initial value (x)
        MOV DX,BORDER_Y ;initial value (y)    
        CALL DRAW_BORDER
        INC BORDER_X
        CMP BORDER_X,200
  JB TOP_BORDER

       RIGHT_BORDER4:
        MOV CX,BORDER_X ;initial value (x)
        MOV DX,BORDER_Y ;initial value (y)
        CALL DRAW_BORDER
        DEC BORDER_Y
        CMP BORDER_Y,25
  JA RIGHT_BORDER4

     TOP_BORDER4: 
        MOV CX,BORDER_X ;initial value (x)
        MOV DX,BORDER_Y ;initial value (y)    
        CALL DRAW_BORDER
        DEC BORDER_X
        CMP BORDER_X,125
  JA TOP_BORDER4

    MOV BORDER_X,125
    MOV BORDER_Y,0
   LEFT_BORDER4:
        MOV CX,BORDER_X ;initial value (x)
        MOV DX,BORDER_Y ;initial value (y)
        CALL DRAW_BORDER
        INC BORDER_Y
        CMP BORDER_Y,25
   JB LEFT_BORDER4
  
    MOV BORDER_Y,0
    MOV BORDER_X,100
   LEFT_BORDER:
        MOV CX,BORDER_X ;initial value (x)
        MOV DX,BORDER_Y ;initial value (y)
        CALL DRAW_BORDER
        INC BORDER_Y
        CMP BORDER_Y,50
   JB LEFT_BORDER
   
    MOV BORDER_Y,50
    MOV BORDER_X,150


    MOV BORDER_Y,50
    MOV BORDER_X,100
   BOT_BORDER:
        MOV CX,BORDER_X
        MOV DX,BORDER_Y
        CALL DRAW_BORDER
        INC BORDER_X
        CMP BORDER_X,150
   JB BOT_BORDER


    MOV DX,100
    MOV CX,200
     RIGHT_BORDER3:
        MOV CX,BORDER_X ;initial value (x)
        MOV DX,BORDER_Y ;initial value (y)
        CALL DRAW_BORDER
        INC BORDER_Y
        CMP BORDER_Y,75
  JB RIGHT_BORDER3



RET
DRAW_FULL_BORDER ENDP

COLOR_TAIL PROC NEAR

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
            MOV AL,4
            MOV AH,0CH
            INT 10H
        JMP NEXT_PIXEL

        BREAK:

RET
COLOR_TAIL ENDP

FILL_BOUNDED_AREA PROC NEAR

        MOV CX,AREA_X
        MOV DX,AREA_Y
        MOV BL,0
        FILL_AREA_IN:
        MOV AH,0DH       ;check the color of this pixel
        INT 10H    
        CMP AL,9         ;if its blue trigger the snake trail counter (checks the number of pixels to determine when the boundary ends)
        JNE DONT_INC     ;if its not blue then check if its a black pixel thats beyond the boundary  
        INC BL
        DONT_INC:
        CMP BL,3         ;if the blue pixel count is above the boundary size then the black pixels needs to be filled  
        JNE NEXT_PIXEL2
        COLOR:
        INC CX           ;this checks the pixel thats after the last pixel in the snake boundary  
        MOV AH,0DH
        INT 10H
        CMP AL,0         ;if its black then we need to change its color  
        JNE NEXT_PIXEL2  ;if not then we need to loop over the next pixel to check its color
        MOV AL,3         ;change the color of the black pixel 
        MOV AH,0CH
        INT 10H
        DEC CX           ;we need to decrement the value of the cx because we already did increment it earlier
                            ; if we dont decrement then it will skip a pixel every 2 pixels (through trial and error)
        MOV AH,0CH       ;Lw m3mltesh de hayeb2a fe awl pixel fadya fel fill
        INT 10H
        JMP NEXT_PIXEL2
        NEXT_PIXEL2:         ;check the color of the next pixel
        CMP BL,6       ;check the blue counter, if its 12 that means that we hit the other side of the snake so we need to stop coloring
        JE RESET            
        SET:
        INC CX           ;we increment to find the next pixel   
        CMP CX,310       ;the limit in which we need to loop over
        JBE FILL_AREA_IN  
        NEXT_Y:  
        INC DX           ;if the value of cx exceeds the limit then we need to reset it  
        MOV CX,AREA_X    ;and start looping over the next "y"
        CMP DX,180
        JBE FILL_AREA_IN
        JMP BREAK2       ;if the fill area search reaches its end boundary we terminate the program


        RESET:
        INC CX           ;hena ana 3ayz a3mel check en el azra2 akbar men el 2 frames lw akbar yeb2a keda da 5at betool w mesh halaweno
        MOV AH,0DH      
        INT 10H
        CMP AL,0         ;tab efred el 5at el bel 3ard da mesh nhayet el shakl w lessa fe ta7teh bounded area m7tag alawenha 
        JNE CHECK_MORE   ;fa haroo7 a3mel check eza kan a5er satr f3lan wla m7tag alawen zyada
        MOV BL,0         ;here we reset the blue pixel counter in so we can check for boundaries in the next line
        JMP SET

        CHECK_MORE:
        CHECK_IF_BORDER:
            INC CX             ;delwa2ty ana ha3od a3mel check 3la kol el pixels el gya lw zar2a yeb2a ana lessa fel 5at el bel 3ard
            CMP CX,310         ;lw soda yeb2a ana keda 5aragt bara el 5at da
            JE NEXT_Y           
            MOV AH,0DH          
            INT 10H             
            CMP AL,0            
            JE NEW_SHAPE        
            JNE CHECK_IF_BORDER

        NEW_SHAPE:              ;keda ana 3andy e7tmaleen ya2ema ana 5aragt bara el 5at w f3lan el shakl 5ls
            INC CX              ;ya2ema el black pixel el ana shoftaha de m7tag alawenha l7ad mala2y el border el ba3deh    
            CMP CX,310          ;lw fdlt mashy wra el eswed w el border bta3 el shasha 5ls fana keda f3lan el shakl 5ls w mesh m7tag arsem 7aga
            MOV BL,0
            JE NEXT_Y           ;lw 3mlt check lel black pixels el gya kolaha w abelt wa7da zar2a fana keda gowa shakl w m7tag alawen el gy
            MOV AH,0DH
            INT 10H
            CMP AL,0
            JE NEW_SHAPE        ;tab ana delwa2ty abelt pixel zar2a w 3reft eny gowa el shakl lessa halawen el 5at el ana 3mlt 3aleeh check asln ezzay?
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
            MOV BL,0
            JE NEXT_Y           ;sa3etha ha7tag arga3 a3mel el check bta3y el 3ady bas fel satr(y) el ta7teeh
            MOV AH,0CH          
            MOV AL,3
            INT 10H
            JMP FILL_NEW_SHAPE



        BREAK2:
        
RET
FILL_BOUNDED_AREA ENDP

END MAIN
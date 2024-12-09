.MODEL SMALL
.STACK 64
.DATA
CHAT                        DB 'To start chatting press 1'
GAME                        DB 'To start game press F2'
EXIT                        DB 'To end the program press ESC'
TIME_AUX                    DB 0 ;variable used when checking if time changed
BORDER_X                    DW 50
BORDER_Y                    DW 0
BORDER_SIZE                 DW 06H
SNAKE_SIZE                  DW 03H
SNAKE_X                     DW 0
SNAKE_Y                     DW 7
AREA_X                      DW 0
AREA_Y                      DW 0
AREA_IN                     DW 0
NEW_SHAPE_Y                 DW 00H
.CODE

MAIN PROC FAR
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    
    MOV AH,0H
    MOV AL,13H
    INT 10h


    CALL DRAW_FULL_BORDER
    CALL CHECK_BOUNDED_AREA
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
  RIGHT_BORDER:
        MOV CX,BORDER_X ;initial value (x)
        MOV DX,BORDER_Y ;initial value (y)
        CALL DRAW_BORDER
        INC BORDER_Y
        CMP BORDER_Y,75
  JB RIGHT_BORDER

    MOV BORDER_Y,50
    MOV BORDER_X,100
   BOT_BORDER:
        MOV CX,BORDER_X
        MOV DX,BORDER_Y
        CALL DRAW_BORDER
        INC BORDER_X
        CMP BORDER_X,150
   JB BOT_BORDER

    MOV BORDER_X,175
    MOV BORDER_Y,0
  RIGHT_BORDER2:
        MOV CX,BORDER_X ;initial value (x)
        MOV DX,BORDER_Y ;initial value (y)
        CALL DRAW_BORDER
        INC BORDER_Y
        CMP BORDER_Y,25
  JB RIGHT_BORDER2

    MOV CX,175
    MOV DX,25
     BOT_BORDER3:
        MOV CX,BORDER_X
        MOV DX,BORDER_Y
        CALL DRAW_BORDER
        INC BORDER_X
        CMP BORDER_X,200
   JB BOT_BORDER3

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

CHECK_BOUNDED_AREA PROC NEAR

    MOV CX,AREA_X
    MOV DX,AREA_Y
    MOV BL,0
    FILL_AREA_IN:
        MOV AH,0DH    ;check the color of this pixel
        INT 10H    
        CMP AL,9      ;if its blue trigger the snake trail counter (checks the number of pixels to determine when the boundary ends)
        JNE DONT_INC  ;if its not blue then check if its a black pixel thats beyond the boundary  
        INC BL
        DONT_INC:
        CMP BL,6      ;if the blue pixel count is above the boundary size then the black pixels needs to be filled  
        JNE NEXT_PIXEL2
        MOV AREA_IN,1
        COLOR:
           INC CX     ;this checks the pixel thats after the last pixel in the snake boundary  
           MOV AH,0DH
           INT 10H
           CMP AL,0   ;if its black then we need to change its color  
           JNE NEXT_PIXEL2 ;if not then we need to loop over the next pixel to check its color
           MOV AL,4         ;change the color of the black pixel 
           MOV AH,0CH
           INT 10H
           DEC CX           ;we need to decrement the value of the cx because we already did increment it earlier
                            ; if we dont decrement then it will skip a pixel every 2 pixels (through trial and error)
           MOV AH,0CH       ;Lw m3mltesh de hayeb2a fe awl pixel fadya fel fill
           INT 10H
           JMP NEXT_PIXEL2
    NEXT_PIXEL2:            ;check the color of the next pixel
        CMP BL,12           ;check the blue counter, if its 12 that means that we hit the other side of the snake so we need to stop coloring
        JE RESET            
        SET:
        INC CX              ;we increment to find the next pixel   
        CMP CX,320          ;the limit in which we need to loop over
        JBE FILL_AREA_IN  
        NEXT_Y:  
        INC DX              ;if the value of cx exceeds the limit then we need to reset it  
        MOV CX,AREA_X       ; and start looping over the next "y"
        CMP DX,200
        JBE FILL_AREA_IN
        JMP BREAK2          ;if the fill area search reaches its end boundary we terminate the program


           RESET:
            INC CX           ;hena ana 3ayz a3mel check en el azra2 akbar men el 2 frames lw akbar yeb2a keda da 5at betool w mesh halaweno
            MOV AH,0DH      
            INT 10H
            CMP AL,0
            JNE CHECK_MORE
            MOV BL,0        ;here we reset the blue pixel counter in so we can check for boundaries in the next line
            JMP SET

            CHECK_MORE:
                CHECK_IF_BORDER:
                INC CX
                CMP CX,320
                JE NEXT_Y
                MOV AH,0DH      
                INT 10H
                CMP AL,0
                JE NEW_SHAPE
            JNE CHECK_IF_BORDER

            NEW_SHAPE:
                INC CX 
                CMP CX,320
                JE NEXT_Y
                MOV AH,0DH
                INT 10H
                CMP AL,0
                JE NEW_SHAPE
                FIND_STARTING_PIXEL:
                    DEC CX
                    MOV AH,0DH
                    INT 10H
                    CMP AL,0
                JE FIND_STARTING_PIXEL
                FILL_NEW_SHAPE:
                    INC CX
                    MOV AH,0DH
                    INT 10H
                    CMP AL,9
                    JE NEXT_Y
                    MOV AH,0CH
                    MOV AL,4
                    INT 10H
                    JMP FILL_NEW_SHAPE



            BREAK2:
        
RET
CHECK_BOUNDED_AREA ENDP

END MAIN
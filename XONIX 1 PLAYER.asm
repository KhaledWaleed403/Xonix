.MODEL SMALL
.STACK 64
.DATA
CHAT                        DB 'To start chatting press 1'
GAME                        DB 'To start game press 2'
EXIT                        DB 'To end the program press ESC'
TIME_AUX                    DB 0 ;variable used when checking if time changed
SNAKE_X                     DW 7
SNAKE_Y                     DW 7
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
TERRITORY_ENEMY_X           DW 2
TERRITORY_ENEMY_Y           DW 30
TERRITORY_ENEMY_VELOCITY_X  DW 01H
TERRITORY_ENEMY_VELOCITY_Y  DW 01H
TERRITORY_ENEMY_SIZE        DW 3H
ENEMY_INSIDE                DW 2H
CURRENT_SNAKE_DIRECTION     DW 0 ; This Variable allows the snake to move on the set direction until the set direction changes, 0 left 1 right, 2 up, 4 down :MJ
AREA_X                      DW 7
AREA_Y                      DW 7
START_OR_END                DW 0
START_OR_END2               DW 0
SENDING                     DB ?,"$"
VALUE                       DB ?,"$"
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
    JMP CHECK_TIME

     
    EXITGAME:
        MOV AH,4CH
        MOV AL,1
        INT 21H
    MAIN ENDP

        ;                                          GLOBAL PROCEDURES

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

CLEAR_SCREEN PROC NEAR

    MOV AH,00H ;video mode
    MOV AL,13H ;type of video mode
    INT 10H

RET
CLEAR_SCREEN ENDP

CHECK_TERRITORY PROC NEAR
    ADD CX,4
    MOV AH,0DH
    INT 10H
    SUB CX,4
    CMP AL,0
    JNE DO_NOTHING

    SET_BLUE:
        MOV AL,9
    JMP DO_NOTHING


    DO_NOTHING:
RET
CHECK_TERRITORY ENDP

CHECK_ENEMY_TERRITORY PROC NEAR
    ADD CX,4
    MOV AH,0DH
    INT 10H
    SUB CX,4
    CMP AL,0
    JNE KEEP_MOVING
    NEG TERRITORY_ENEMY_VELOCITY_X
    NEG TERRITORY_ENEMY_VELOCITY_X

    KEEP_MOVING:
RET
CHECK_ENEMY_TERRITORY ENDP



        ;                                         PLAYER 1 PROCEDURES

DRAW_SNAKE PROC NEAR

        MOV CX,SNAKE_X ;initial value (x)
        MOV DX,SNAKE_Y ;initial value (y)


        DRAW_SNAKE_HORIZONTAL:
            CALL CHECK_BORDER
            ;CALL CHECK_TERRITORY
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
            MOV AL,9      ;color
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

MOVE_HEAD PROC NEAR
        CALL DRAW_SNAKE
        CALL PORT_CONFIGURATION


    RECIEVE_CHARACTER:
            MOV DX , 3FDH		; Line Status Register
            IN AL,DX 
            AND AL,1
            CMP AL,1
            JNE CHECK_FOR_KEY
            ;If Ready read the VALUE in Receive data register
            MOV DX,03F8H
            IN AL,DX 
            MOV VALUE,AL


        CHECK_FOR_KEY:
        MOV AH,01H
        INT 16H
        JZ DONEKEYPRESS

        MOV AH,00H
        INT 16H

        MOV SENDING,AL

        MOV DX,3FDH		; Line Status Register
        IN AL,DX 			;Read Line Status
        AND AL,00100000B
        ;If empty put the VALUE in Transmit data register
            MOV DX , 3F8H		; Transmit data register
            ;mov al,"A"
            MOV AL,SENDING
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
                MOV DX,SNAKE_VELOCITY_X
                ADD SNAKE_X,DX
                CMP SNAKE_X,316             ;If the next pixel is outside of the border change direction clockwise
                JE MOVE_DOWN2
                CMP SNAKE_X,313
                JNE NEXT_LINE
                CMP SNAKE_Y,7
                JB  NEXT_LINE
                CALL FILL_BOUNDED_AREA
                CALL COLOR_TAIL
                CALL FILL_VERTICAL_AREA
                NEXT_LINE:
                MOV CURRENT_SNAKE_DIRECTION,0
        JMP CHECK_HEAD_MOVEMENT

        MOVE_UP2:
                MOV DX,SNAKE_VELOCITY_Y
                SUB SNAKE_Y,DX  
                CMP SNAKE_Y,0              ;If the next pixel is outside of the border change direction clockwise
                JE MOVE_RIGHT2   
                CMP SNAKE_Y,2
                JNE NEXT_LINE2
                CMP SNAKE_X,6
                JB NEXT_LINE2
                CALL FILL_BOUNDED_AREA
                CALL COLOR_TAIL
                CALL FILL_VERTICAL_AREA
                NEXT_LINE2:        
                MOV CURRENT_SNAKE_DIRECTION,2
        JMP CHECK_HEAD_MOVEMENT

        MOVE_DOWN2:
                MOV DX,SNAKE_VELOCITY_Y
                ADD SNAKE_Y,DX
                CMP SNAKE_Y,183             ;If the next pixel is outside of the border change direction clockwise
                JE MOVE_LEFT2
                CMP SNAKE_Y,180
                JNE NEXT_LINE3
                CMP SNAKE_X,6
                JB NEXT_LINE3
                CMP SNAKE_X,312
                JA NEXT_LINE3
                CALL FILL_BOUNDED_AREA              
                CALL COLOR_TAIL
                CALL FILL_VERTICAL_AREA
                NEXT_LINE3: 
                MOV CURRENT_SNAKE_DIRECTION,3
        JMP CHECK_HEAD_MOVEMENT

        MOVE_LEFT2:
                MOV DX,SNAKE_VELOCITY_X
                SUB SNAKE_X,DX
                CMP SNAKE_X,0               ;If the next pixel is outside of the border change direction clockwise
                JE MOVE_UP2 
                CMP SNAKE_X,2
                JNE NEXT_LINE4
                CMP SNAKE_Y,180
                JA NEXT_LINE4
                CALL FILL_BOUNDED_AREA
                CALL COLOR_TAIL
                CALL FILL_VERTICAL_AREA
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
            MOV AL,3
            MOV AH,0CH
            INT 10H
        JMP NEXT_PIXEL

        BREAK:

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
            CMP AL,0
        JE NEXT_ROW
        JNE FILL_SPACE

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
    CMP CX,160
    JA COLOR_AFTER
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
        
RET
FILL_BOUNDED_AREA ENDP

        ;                                               ENEMY PROCEDURES


DRAW_TERRITORY_ENEMY PROC NEAR
    MOV CX,TERRITORY_ENEMY_X ;initial value (x)
    MOV DX,TERRITORY_ENEMY_Y ;initial value (y)

    DRAW_TENEMY_HORIZONTAL: 
        MOV AH,0CH    ;write pixels
        MOV AL,3      ;color
        MOV BH,0      ;page number
        INT 10H

        INC CX
        MOV AX,CX     ;cx - snake_x > snake size 
        SUB AX,TERRITORY_ENEMY_X
        CMP AX,ENEMY_INSIDE
        JNG DRAW_TENEMY_HORIZONTAL
        MOV CX,TERRITORY_ENEMY_X ;cx register goes back to initial column
        INC DX         ;advance one line

        MOV AX,DX      ;dx - snake_y > snake size
        SUB AX,TERRITORY_ENEMY_Y
        CMP AX,ENEMY_INSIDE
    JNG DRAW_TENEMY_HORIZONTAL

    MOV CX,TERRITORY_ENEMY_X
    MOV DX,TERRITORY_ENEMY_Y

    TOP:
     MOV AH,0CH
     MOV AL,0EH
     MOV BH,0
     INT 10H 
     INC CX
     MOV AX,CX
     SUB AX,TERRITORY_ENEMY_X
     CMP AX,TERRITORY_ENEMY_SIZE
     JNE TOP

     RIGHT:
     MOV AH,0CH
     MOV AL,0EH
     MOV BH,0
     INT 10H
     INC DX
     MOV AX,DX
     SUB AX,TERRITORY_ENEMY_Y
     CMP AX,TERRITORY_ENEMY_SIZE
     JNE RIGHT

     MOV CX,TERRITORY_ENEMY_X
     MOV DX,TERRITORY_ENEMY_Y
     LEFT:
     MOV AH,0CH
     MOV AL,0EH
     INT 10H
     INC DX
     MOV AX,DX
     SUB AX,TERRITORY_ENEMY_Y
     CMP AX,TERRITORY_ENEMY_SIZE
     JNE LEFT

     BOT:
     MOV AH,0CH
     MOV AL,0EH
     MOV BH,0
     INT 10H 
     INC CX
     MOV AX,CX
     SUB AX,TERRITORY_ENEMY_X
     CMP AX,TERRITORY_ENEMY_SIZE
     JNG BOT



RET            
DRAW_TERRITORY_ENEMY ENDP

DELETE_TERRITORY_ENEMY PROC NEAR
    MOV CX,TERRITORY_ENEMY_X ;initial value (x)
    MOV DX,TERRITORY_ENEMY_Y ;initial value (y)



     DELETE_TENEMY_HORIZONTAL:    
        MOV AH,0CH    ;write pixels
        MOV AL,7
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
     SUB CX,1
     MOV AH,0DH
     INT 10H
     CMP AL,0
     JE NEGATIVE_VELOCITY
     CMP AL,9
     JE NEGATIVE_VELOCITY
     CMP CX,314
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
     CMP AL,9
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


     CMP DX,2
     JL NEGATIVE_VELOCITY_Y

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
        SUB CX,4
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
        CMP AL,0
        JNZ NEG_VELOCITY_X
        MOV CX,ENEMY_X
        MOV DX,ENEMY_Y
        ADD CX,4
        SUB DX,1
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_X
        


        MOV AX,ENEMY_VELOCITY_Y        ;enemy_y < 8 (collision)
        ADD ENEMY_Y,AX                 ;enemy_x > 180 (collision)
        MOV CX,ENEMY_X
        MOV DX,ENEMY_Y
        SUB DX,4
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
        CMP AL,0
        JNZ NEG_VELOCITY_Y
        CMP ENEMY_Y,9
        JL NEG_VELOCITY_Y
        MOV CX,ENEMY_X
        MOV DX,ENEMY_Y
        ADD DX,4
        SUB CX,1
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_Y
        MOV CX,ENEMY_X
        MOV DX,ENEMY_Y
        ADD DX,4
        ADD CX,4
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_Y
        

        CMP ENEMY_Y,176
        JG NEG_VELOCITY_Y


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
        SUB CX,4
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_X2
        MOV CX,ENEMY2_X
        MOV DX,ENEMY2_Y
        ADD CX,4
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
        ADD CX,4
        SUB DX,1
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_X2
        MOV CX,ENEMY2_X
        MOV DX,ENEMY2_Y
        ADD CX,1
        SUB DX,1
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_X2


        MOV AX,ENEMY2_VELOCITY_Y        ;enemy_y < 8 (collision)
        ADD ENEMY2_Y,AX                 ;enemy_x > 180 (collision)
        MOV CX,ENEMY2_X
        MOV DX,ENEMY2_Y
        SUB DX,4
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
        CMP AL,0
        JNZ NEG_VELOCITY_Y2
        CMP ENEMY2_Y,9
        JL NEG_VELOCITY_Y2
        MOV CX,ENEMY2_X
        MOV DX,ENEMY2_Y
        ADD DX,4
        SUB CX,1
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_Y2
        MOV CX,ENEMY2_X
        MOV DX,ENEMY2_Y
        ADD DX,4
        ADD CX,4
        MOV AH,0DH
        MOV BH,1
        INT 10H
        CMP AL,0
        JNZ NEG_VELOCITY_Y2


        CMP ENEMY2_Y,176
        JG NEG_VELOCITY_Y2

    RET

        NEG_VELOCITY_Y2:
            NEG ENEMY2_VELOCITY_Y
        RET
        

        NEG_VELOCITY_X2:
            NEG ENEMY2_VELOCITY_X       ;enemy_velocity_x = - enemy_velocity_x 
        RET

MOVE_ENEMY2 ENDP

ret
END MAIN
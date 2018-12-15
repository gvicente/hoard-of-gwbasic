100 REM **********************************************************************
110 REM
120 REM FILENAME     ROUTDEMG.BAS
130 REM WRITTEN BY   GARY PEEK
140 REM LAST UPDATE  01/13/93
150 REM
160 REM DESCRIPTION  DEMONSTRATES THE FUNCTIONS OF THE SUBROUTINES
170 REM              THAT DISPLAY LARGE CHARACTERS AND DISPLAY BAR GRAPH.
180 REM **********************************************************************
190 KEY OFF:FOR A=1 TO 10:KEY A,"":NEXT A
200 COLOR 7,0:CLS
210 DIM BIGMSG$(5):DIM BIG$(20)
220 REM ----- FORM LARGE CHARACTER MESSAGES -----
230 IF BIGFLAG THEN 310
240 BIGMSG$(1)="  DISPLAY "
250 BIGMSG$(2)="  LARGE   "
260 BIGMSG$(3)=" MESSAGES "
270 INITMSG=1
280 GOSUB 60000
290 BIGFLAG=-1
300 REM ----- DISPLAY LARGE CHARACTER MESSAGES -----
310 CLS
320 ROW=6:COL=1:BIGMSG=1:GOSUB 61000
330 ROW=11:COL=1:BIGMSG=2:GOSUB 61000
340 ROW=16:COL=1:BIGMSG=3:GOSUB 61000
350 REM -----
360 LOCATE 24,22
370 PRINT "ESCape to exit, any other key to continue";
380 LOCATE ,,0
390 IN$=INKEY$:IF IN$="" THEN 390
400 IF IN$=CHR$(27) THEN COLOR 7,0:CLS:END
410 REM -------- BAR GRAPH --------
420 LOCATE ,,0
430 DIM BARVALUE(25):DIM BARID$(25)
440 BV=10:ID=1
450 FOR B=1 TO 25
460   A=INT(RND*(2)):REM GIVE BARVALUE A RANDOM VALUE FOR THIS DEMO
470   IF A=0 THEN BV=BV-1
480   IF A=1 THEN BV=BV+2
490   BARVALUE(B)=BV
500   BARID$=RIGHT$(STR$(ID),LEN(STR$(ID))-1)
510   IF LEN(BARID$)<2 THEN BARID$="0"+BARID$:GOTO 510
520   BARID$(B)=BARID$
530   ID=ID+1
540 NEXT B
550 NUMBARS=25:BARCOL=5:BARSPACE=2
560 BOX=1
570 VERTMSG$="VERTICAL SCALE MESSAGE"
580 HORIZMSG$="HORIZONTAL SCALE MESSAGE"
590 REFLINE=1
600 DIM REFLINE$(11)
610 REFLINE$(1)=" 0"
620 REFLINE$(2)=" 4"
630 REFLINE$(3)=" 8"
640 REFLINE$(4)="12"
650 REFLINE$(5)="16"
660 REFLINE$(6)="20"
670 REFLINE$(7)="24"
680 REFLINE$(8)="28"
690 REFLINE$(9)="32"
700 REFLINE$(10)="36"
710 REFLINE$(11)="40"
720 GOSUB 50000
730 REM -----
740 ERASE BARVALUE:ERASE BARID$:ERASE REFLINE$
750 REM -----
760 LOCATE 4,22
770 PRINT "ESCape to exit, any other key to continue";
780 LOCATE ,,0
790 IN$=INKEY$:IF IN$="" THEN 790
800 IF IN$=CHR$(27) THEN COLOR 7,0:CLS:END
810 GOTO 230
49795 REM ********************************************************************
49800 REM --------------------- DISPLAY A BAR GRAPH --------------------------
49805 REM
49810 REM This subroutine displays a bar graph of up to 78 bars representing
49815 REM values from 0 to 42. The position of the bar graph can be adjusted
49820 REM by selecting where the first bar begins and by the number of spaces
49825 REM (whose length depends on the spacing between bars). Horizontal
49830 REM reference lines can be added along with scale markings for the lines.
49835 REM A vertical scale message can be centered at the left of the graph 
49840 REM and a horizontal scale message can be centered at the bottom of the
49845 REM graph area (which also determines the message's maximum length).
49850 REM
49855 REM Bar graphs that have at least one space between bars are drawn with
49860 REM the standard "TEXT" colors and those that have adjacent bars alter-
49865 REM nate between "TEXT" and "DATA" colors for easy viewing of the bars.
49870 REM
49875 REM
49880 REM
49885 REM enter with - BARVALUE(1) through BARVALUE(x), array of bar values
49890 REM              value=0 to 42 (greater than 42 will be truncated)
49895 REM              (array must be DIMinsioned before using this routine)
49900 REM              NUMBARS=number of bars to display
49905 REM              BARCOL=1 to 78, leftmost column where bars begin
49910 REM              BARSPACE=number of spaces between bars
49915 REM optional -   BARID$(1) through BARID$(x), array of identifiers
49920 REM              (array must be DIMinsioned before using this routine)
49925 REM optional -   VERTMSG$="vertical scale message", up to 23 characters
49930 REM optional -   HORIZMSG$="horizontal scale message", length adjusted
49935 REM optional -   REFLINE=0,1  0=no grid, 1=horizontal grid
49940 REM optional -   REFLINE$(1) through REFLINE$(11),
49945 REM              array of vertical scale messages used if REFLINE=1
49950 REM              (array must be DIMinsioned before using this routine)
49955 REM optional-    BOX=0,1,2,3 - type of box to draw around whole screen
49960 REM              0 = no box, 1 = 1 line, 2 = 2 line, 3 = solid
49965 REM optional -   TEXTFORE,TEXTBACK,DATAFORE,DATABACK,FIELDFORE,FIELDBACK
49970 REM              colors optionally specified for COLOR statements
49975 REM exit with -  BOX=0, REFLINE=0 (to maintain as optional)
49980 REM
49985 REM
49990 REM
49995 REM
50000 IF TEXTFORE=0 AND TEXTBACK=0 THEN TEXTFORE=7                  :REM 50000
50005 IF DATAFORE=0 AND DATABACK=0 THEN DATAFORE=15
50010 IF FIELDFORE=0 AND FIELDBACK=0 THEN FIELDBACK=7
50015 COLOR TEXTFORE,TEXTBACK
50020 CLS:LOCATE ,,0
50025 IF BOX=0 THEN 50075
50030 IF BOX=1 THEN TP=196:BT=196:MS=179:UL=218:LL=192:UR=191:LR=217
50035 IF BOX=2 THEN TP=205:BT=205:MS=186:UL=201:LL=200:UR=187:LR=188
50040 IF BOX=3 THEN TP=223:BT=220:MS=219:UL=219:LL=219:UR=219:LR=219
50045 ROW=1:LOCATE ROW,2:PRINT STRING$(78,CHR$(TP));
50050 ROW=25:LOCATE ROW,2:PRINT STRING$(78,CHR$(BT));
50055 COL=1:FOR ROW=2 TO 24:LOCATE ROW,COL:PRINT CHR$(MS);:NEXT
50060 COL=80:FOR ROW=2 TO 24:LOCATE ROW,COL:PRINT CHR$(MS);:NEXT
50065 LOCATE 1,1:PRINT CHR$(UL);:LOCATE 1,80:PRINT CHR$(UR);
50070 LOCATE 25,1:PRINT CHR$(LL);:LOCATE 25,80:PRINT CHR$(LR);
50075 BOX=0
50080 IF BARCOL=0 THEN BARCOL=3
50085 IF NUMBARS=0 THEN NUMBARS=1
50090 FIRSTCOL=BARCOL
50095 REM ----- FIND LAST COLUMN IN WHICH A BAR WILL BE DRAWN -----
50100 LASTCOL=FIRSTCOL+(NUMBARS*(BARSPACE+1))-BARSPACE-1
50105 IF LASTCOL>78 THEN LASTCOL=LASTCOL-BARSPACE-1:GOTO 50105
50110 REM
50115 REM ----- D0 VERTICAL SCALE MESSAGES AND LINES IF SELECTED -----
50120 IF REFLINE=0 THEN 50235
50125 REM ---------- PRINT MESSAGES ----------
50130 FOR BARLOOP=1 TO 11
50135   LOCATE 23-(BARLOOP*2)+1,FIRSTCOL
50140   PRINT REFLINE$(BARLOOP);
50145 NEXT BARLOOP
50150 REM ----- FIND MAXIMUM LENGTH OF SCALE MESSAGES -----
50155 MAXLEN=0
50160 FOR BARLOOP=1 TO 11
50165 L=LEN(REFLINE$(BARLOOP))
50170 IF L>MAXLEN THEN MAXLEN=L
50175 NEXT BARLOOP
50180 REM ----- ADJUST COLUMNS FOR SCALE MESSAGES -----
50185 FIRSTCOL=FIRSTCOL+MAXLEN+1:IF FIRSTCOL>78 THEN FIRSTCOL=78
50190 LASTCOL=LASTCOL+MAXLEN+1
50195 IF LASTCOL>78 THEN LASTCOL=LASTCOL-BARSPACE-1:GOTO 50195
50200 REM ---------- DRAW REFERENCE LINES ----------
50205 COLOR DATAFORE,DATABACK
50210 FOR ROW=2 TO 22
50215   LOCATE ROW,FIRSTCOL
50220   PRINT STRING$(LASTCOL-FIRSTCOL+1,95):REM underscore
50225 NEXT ROW
50230 REM ---------- DRAW BARS ----------
50235 BARCOL=FIRSTCOL
50240 FOR BARLOOP=1 TO NUMBARS
50245   BARVALUE=BARVALUE(BARLOOP)
50250   BARID$=BARID$(BARLOOP)
50255   IF BARSPACE<>0 THEN 50270
50260   IF BARLOOP MOD 2=1 THEN 50270
50265   BARFORE=DATAFORE:BARBACK=DATABACK:GOTO 50275
50270   BARFORE=TEXTFORE:BARBACK=DATABACK
50275   GOSUB 51000                                 :REM SUBROUTINE USED HERE
50280   BARCOL=BARCOL+BARSPACE+1
50285   IF BARCOL>78 THEN 50300
50290 NEXT BARLOOP
50295 REM -----
50300 COLOR DATAFORE,DATABACK
50305 REM ----- PRINT VERTICAL SCALE MESSAGE -----
50310 IF LEN(VERTMSG$)>23 THEN VERTMSG$=LEFT$(VERTMSG$,23)
50315 ROW=13-INT(LEN(VERTMSG$)/2)
50320 FOR BARLOOP=1 TO LEN(VERTMSG$)
50325   LOCATE ROW,3
50330   PRINT MID$(VERTMSG$,BARLOOP,1);
50335   ROW=ROW+1
50340 NEXT BARLOOP
50345 REM ----- PRINT HORIZONTAL SCALE MESSAGE -----
50350 BARWIDTH=LASTCOL-FIRSTCOL+1
50355 IF LEN(HORIZMSG$)>BARWIDTH THEN HORIZMSG$=LEFT$(HORIZMSG$,BARWIDTH)
50360 COL=FIRSTCOL+INT(BARWIDTH/2)-INT(LEN(HORIZMSG$)/2)-1
50365 LOCATE 24,COL:PRINT HORIZMSG$;
50370 REM -----
50375 COLOR TEXTFORE,TEXTBACK
50380 BOX=0:REFLINE=0
50385 RETURN
50390 REM
50925 REM *********************************************************************
50930 REM ---------------- DRAW 1 BAR FOR USE IN A BAR GRAPH ------------------
50935 REM
50940 REM This subroutine allows you to draw a single bar representing a
50945 REM value from 0 to 42. The base of the bar will start at the column
50950 REM of your choice and be draw upward from row 22. Row 23 will be
50955 REM where the ID is displayed, centered on the column.
50960 REM
50965 REM enter with - BARVALUE=0 to 42 (greater than 42 will be truncated)
50970 REM              BARID$="bar ID", identification at bottom of bar
50975 REM              BARCOL=column in which to draw bar
50980 REM optional -   BARFORE,BARBACK
50985 REM              colors optionally specified for COLOR statements
50990 REM
50995 REM
51000 IF BARFORE=0 AND BARBACK=0 THEN BARFORE=7                    :REM 51000
51005 COLOR BARFORE,BARBACK
51010 COL=BARCOL-INT((LEN(BARID$)-.5)/2):IF COL<1 THEN COL=1
51015 LOCATE 23,COL:PRINT BARID$;
51020 ROW=22
51025 IF BARVALUE>42 THEN BARVALUE=42
51030 IF BARCOL>80 THEN 51060
51035 FOR A=1 TO (INT(BARVALUE/2))
51040   LOCATE ROW,BARCOL:PRINT CHR$(219);
51045   ROW=ROW-1
51050 NEXT A
51055 IF (BARVALUE MOD 2)=1 THEN LOCATE ROW,BARCOL:PRINT CHR$(220);
51060 RETURN
51065 REM
59850 REM ********************************************************************
59855 REM -------------------- CREATE LARGE CHARACTERS -----------------------
59860 REM
59865 REM This routine is the first part of a 2 routine process that allows
59870 REM you create and then display messages with characters that are 4
59875 REM times the regular size. The screen can display up to 5 lines of 10
59880 REM characters each of this size. The process is divided into 2 routines
59885 REM so that messages with the large characters can be formed with the
59890 REM first routine during initialization of a program, when time is less
59895 REM of a concern, and then the messages can be displayed multiple times
59900 REM throughout the program without having to take the time to re-form
59905 REM the characters. If more than 5 large messages are needed and it is
59910 REM necessary to call this routine again, only those messages ( MSG$(1)
59915 REM to MSG$(5) ) that contain something will be formed and the others
59920 REM will be left alone. Since the process of forming large characters is
59925 REM time consuming, optional initialization messages can be displayed
59930 REM in the middle of the screen during the formation process. The screen
59935 REM is then restored after the formation process.
59940 REM
59945 REM enter with - BIGMSG$(1),BIGMSG$(2),BIGMSG$(3),BIGMSG$(4),BIGMSG$(5),
59950 REM              array of messages to create, up to 10 characters each
59955 REM              (Array must be DIMinsioned before calling this routine)
59960 REM optional  -  INITMSG=0,1  0=no messages, 1=messages
59965 REM exit with -  BIG$(1) to BIG$(20) array filled with info needed to
59970 REM              display large characters with the following routine.
59975 REM              (Array must be DIMinsioned before calling this routine)
59980 REM              BIGMSG$(1) to BIGMSG$(5) all ="" (NUL) to keep these
59985 REM              messages optional if routine is used again.
59990 REM              INITMSG=0 (to retain as optional for next time)
59995 REM
60000 IF TEXTFORE=0 AND TEXTBACK=0 THEN TEXTFORE=7                 :REM 60000
60005 IF DATAFORE=0 AND DATABACK=0 THEN DATAFORE=15
60010 IF FIELDFORE=0 AND FIELDBACK=0 THEN FIELDBACK=7
60015 REM ----- SAVE SCREEN WHERE INIT MESSAGES ARE DISPLAYED -----
60020 IF INITMSG=0 THEN 60070
60025 DIM BIGSSCHR(23):DIM BIGSSCOLOR(23,2)
60030 C=1:FOR COL=29 TO 51
60035   BIGSSCHR(C)=SCREEN(10,COL)
60040   A=SCREEN(10,COL,1):BIGSSCOLOR(C,1)=(A AND 15)
60045   IF (A AND 128)=128 THEN BIGSSCOLOR(C,1)=BIGSSCOLOR(C,1)+16
60050   BIGSSCOLOR(C,2)=(A AND 112)/16
60055 C=C+1:NEXT COL
60060 LOCATE 10,29,0:COLOR FIELDFORE,FIELDBACK:PRINT "   INITIALIZING ...    ";
60065 REM -------------------------------------------------------------------
60070 RESTORE 60400                   :REM POINT TO CHARACTER FONTS
60075 DIM FONT(96,8)
60080 FOR A=0 TO 95
60085   FOR B=0 TO 7
60090     READ F:FONT(A,B)=F
60095   NEXT B
60100 NEXT A
60105 REM ----- FORM CHARACTERS AND MESSAGES -----
60110 FOR MSGLOOP=1 TO 5
60115   MSG$=BIGMSG$(MSGLOOP)
60120   IF MSG$="" THEN 60235
60125   REM ---------------------------------------------
60130   IF INITMSG=0 THEN 60150
60135   LOCATE 10,29,0:COLOR FIELDFORE,FIELDBACK
60140   PRINT " FORMING MESSAGE";STR$(MSGLOOP);" ...";
60145   REM ---------------------------------------------
60150   IF LEN(MSG$)>10 THEN MSG$=LEFT$(MSG$,10)
60155   FOR CHARLOOP=1 TO LEN(MSG$)
60160      CHAR$=MID$(MSG$,CHARLOOP,1):CHARNUM=ASC(CHAR$)-32
60165      FOR BIGROW=0 TO 6 STEP 2
60170         MASK=128                       :REM (for mask=128 to 1 step /2)
60175           F=FONT(CHARNUM,BIGROW)
60180           IF (F AND MASK)=MASK THEN UPPER=-1 ELSE UPPER=0
60185           F=FONT(CHARNUM,BIGROW+1)
60190           IF (F AND MASK)=MASK THEN LOWER=-1 ELSE LOWER=0
60195           IF UPPER AND LOWER THEN PIX=219:GOTO 60215
60200           IF UPPER AND NOT LOWER THEN PIX=223:GOTO 60215
60205           IF NOT UPPER AND LOWER THEN PIX=220:GOTO 60215
60210           IF NOT UPPER AND NOT LOWER THEN PIX=32
60215           B=(BIGROW/2)+1+((MSGLOOP-1)*4):BIG$(B)=BIG$(B)+CHR$(PIX)
60220         MASK=MASK/2:IF MASK<> .5 THEN 60175      :REM (next mask) (of 8)
60225      NEXT BIGROW                                 :REM (of 4)
60230   NEXT CHARLOOP                                  :REM (of up to 10)
60235 NEXT MSGLOOP                                     :REM (of up to 5)
60240 BIGMSG$(1)="":BIGMSG$(2)="":BIGMSG$(3)="":BIGMSG$(4)="":BIGMSG$(5)=""
60245 ERASE FONT
60250 REM ----- RESTORE SCREEN -----
60255 IF INITMSG=0 THEN 60285
60260 C=1:FOR COL=29 TO 51
60265   COLOR BIGSSCOLOR(C,1),BIGSSCOLOR(C,2)
60270   LOCATE 10,COL:PRINT CHR$(BIGSSCHR(C));
60275 C=C+1:NEXT COL
60280 ERASE BIGSSCHR:ERASE BIGSSCOLOR
60285 RETURN
60290 REM
60295 REM
60300 REM
60365 REM ------------------------- CHARACTER FONTS --------------------------
60370 REM
60375 REM These are the character fonts used by the large character routine.
60380 REM They start at 32 decimal or 20 hexidecimal which is a "space" and
60385 REM go to 127 decimal or 7F hexidecimal. They include the alphanumeric
60390 REM characters, punctuation, and some other characters.
60395 REM
60400 DATA &H00,&H00,&H00,&H00,&H00,&H00,&H00,&H0
60405 DATA &H30,&H78,&H78,&H30,&H30,&H00,&H30,&H0
60410 DATA &H6C,&H6C,&H6C,&H00,&H00,&H00,&H00,&H0
60415 DATA &H6C,&H6C,&HFE,&H6C,&HFE,&H6C,&H6C,&H0
60420 DATA &H30,&H7C,&HC0,&H78,&H0C,&HF8,&H30,&H0
60425 DATA &H00,&HC6,&HCC,&H18,&H30,&H66,&HC6,&H0
60430 DATA &H38,&H6C,&H38,&H76,&HDC,&HCC,&H76,&H0
60435 DATA &H60,&H60,&HC0,&H00,&H00,&H00,&H00,&H0
60440 DATA &H18,&H30,&H60,&H60,&H60,&H30,&H18,&H0
60445 DATA &H60,&H30,&H18,&H18,&H18,&H30,&H60,&H0
60450 DATA &H00,&H66,&H3C,&HFF,&H3C,&H66,&H00,&H0
60455 DATA &H00,&H30,&H30,&HFC,&H30,&H30,&H00,&H0
60460 DATA &H00,&H00,&H00,&H00,&H00,&H30,&H30,&H60
60465 DATA &H00,&H00,&H00,&HFC,&H00,&H00,&H00,&H0
60470 DATA &H00,&H00,&H00,&H00,&H00,&H30,&H30,&H0
60475 DATA &H06,&H0C,&H18,&H30,&H60,&HC0,&H80,&H0
60480 DATA &H7C,&HC6,&HCE,&HDE,&HF6,&HE6,&H7C,&H0
60485 DATA &H30,&H70,&H30,&H30,&H30,&H30,&HFC,&H0
60490 DATA &H78,&HCC,&H0C,&H38,&H60,&HCC,&HFC,&H0
60495 DATA &H78,&HCC,&H0C,&H38,&H0C,&HCC,&H78,&H0
60500 DATA &H1C,&H3C,&H6C,&HCC,&HFE,&H0C,&H1E,&H0
60505 DATA &HFC,&HC0,&HF8,&H0C,&H0C,&HCC,&H78,&H0
60510 DATA &H38,&H60,&HC0,&HF8,&HCC,&HCC,&H78,&H0
60515 DATA &HFC,&HCC,&H0C,&H18,&H30,&H30,&H30,&H0
60520 DATA &H78,&HCC,&HCC,&H78,&HCC,&HCC,&H78,&H0
60525 DATA &H78,&HCC,&HCC,&H7C,&H0C,&H18,&H70,&H0
60530 DATA &H00,&H30,&H30,&H00,&H00,&H30,&H30,&H0
60535 DATA &H00,&H30,&H30,&H00,&H00,&H30,&H30,&H60
60540 DATA &H18,&H30,&H60,&HC0,&H60,&H30,&H18,&H0
60545 DATA &H00,&H00,&HFC,&H00,&H00,&HFC,&H00,&H0
60550 DATA &H60,&H30,&H18,&H0C,&H18,&H30,&H60,&H0
60555 DATA &H78,&HCC,&H0C,&H18,&H30,&H00,&H30,&H0
60560 DATA &H7C,&HC6,&HDE,&HDE,&HDE,&HC0,&H78,&H0
60565 DATA &H30,&H78,&HCC,&HCC,&HFC,&HCC,&HCC,&H0
60570 DATA &HFC,&H66,&H66,&H7C,&H66,&H66,&HFC,&H0
60575 DATA &H3C,&H66,&HC0,&HC0,&HC0,&H66,&H3C,&H0
60580 DATA &HF8,&H6C,&H66,&H66,&H66,&H6C,&HF8,&H0
60585 DATA &HFE,&H62,&H68,&H78,&H68,&H62,&HFE,&H0
60590 DATA &HFE,&H62,&H68,&H78,&H68,&H60,&HF0,&H0
60595 DATA &H3C,&H66,&HC0,&HC0,&HCE,&H66,&H3E,&H0
60600 DATA &HCC,&HCC,&HCC,&HFC,&HCC,&HCC,&HCC,&H0
60605 DATA &H78,&H30,&H30,&H30,&H30,&H30,&H78,&H0
60610 DATA &H1E,&H0C,&H0C,&H0C,&HCC,&HCC,&H78,&H0
60615 DATA &HE6,&H66,&H6C,&H78,&H6C,&H66,&HE6,&H0
60620 DATA &HF0,&H60,&H60,&H60,&H62,&H66,&HFE,&H0
60625 DATA &HC6,&HEE,&HFE,&HFE,&HD6,&HC6,&HC6,&H0
60630 DATA &HC6,&HE6,&HF6,&HDE,&HCE,&HC6,&HC6,&H0
60635 DATA &H38,&H6C,&HC6,&HC6,&HC6,&H6C,&H38,&H0
60640 DATA &HFC,&H66,&H66,&H7C,&H60,&H60,&HF0,&H0
60645 DATA &H78,&HCC,&HCC,&HCC,&HDC,&H78,&H1C,&H0
60650 DATA &HFC,&H66,&H66,&H7C,&H6C,&H66,&HE6,&H0
60655 DATA &H78,&HCC,&HE0,&H70,&H1C,&HCC,&H78,&H0
60660 DATA &HFC,&HB4,&H30,&H30,&H30,&H30,&H78,&H0
60665 DATA &HCC,&HCC,&HCC,&HCC,&HCC,&HCC,&HFC,&H0
60670 DATA &HCC,&HCC,&HCC,&HCC,&HCC,&H78,&H48,&H0
60675 DATA &HC6,&HC6,&HC6,&HD6,&HFE,&HEE,&HC6,&H0
60680 DATA &HC6,&HC6,&H6C,&H38,&H38,&H6C,&HC6,&H0
60685 DATA &HCC,&HCC,&HCC,&H78,&H30,&H30,&H78,&H0
60690 DATA &HFE,&HC6,&H8C,&H18,&H32,&H66,&HFE,&H0
60695 DATA &H78,&H60,&H60,&H60,&H60,&H60,&H78,&H0
60700 DATA &HC0,&H60,&H30,&H18,&H0C,&H06,&H02,&H0
60705 DATA &H78,&H18,&H18,&H18,&H18,&H18,&H78,&H0
60710 DATA &H10,&H38,&H6C,&HC6,&H00,&H00,&H00,&H0
60715 DATA &H00,&H00,&H00,&H00,&H00,&H00,&H00,&HFF
60720 DATA &H30,&H30,&H18,&H00,&H00,&H00,&H00,&H0
60725 DATA &H00,&H00,&H78,&H0C,&H7C,&HCC,&H76,&H0
60730 DATA &HE0,&H60,&H60,&H7C,&H66,&H66,&HDC,&H0
60735 DATA &H00,&H00,&H78,&HCC,&HC0,&HCC,&H78,&H0
60740 DATA &H1C,&H0C,&H0C,&H7C,&HCC,&HCC,&H76,&H0
60745 DATA &H00,&H00,&H78,&HCC,&HFC,&HC0,&H78,&H0
60750 DATA &H38,&H6C,&H60,&HF0,&H60,&H60,&HF0,&H0
60755 DATA &H00,&H00,&H76,&HCC,&HCC,&H7C,&HC,&HF8
60760 DATA &HE0,&H60,&H6C,&H76,&H66,&H66,&HE6,&H0
60765 DATA &H30,&H00,&H70,&H30,&H30,&H30,&H78,&H0
60770 DATA &H0C,&H00,&H0C,&H0C,&H0C,&HCC,&HCC,&H78
60775 DATA &HE0,&H60,&H66,&H6C,&H78,&H6C,&HE6,&H0
60780 DATA &H70,&H30,&H30,&H30,&H30,&H30,&H78,&H0
60785 DATA &H00,&H00,&HCC,&HFE,&HFE,&HD6,&HC6,&H0
60790 DATA &H00,&H00,&HF8,&HCC,&HCC,&HCC,&HCC,&H0
60795 DATA &H00,&H00,&H78,&HCC,&HCC,&HCC,&H78,&H0
60800 DATA &H00,&H00,&HDC,&H66,&H66,&H7C,&H60,&HF0
60805 DATA &H00,&H00,&H76,&HCC,&HCC,&H7C,&H0C,&H1E
60810 DATA &H00,&H00,&HDC,&H76,&H66,&H60,&HF0,&H0
60815 DATA &H00,&H00,&H7C,&HC0,&H78,&H0C,&HF8,&H0
60820 DATA &H10,&H30,&H7C,&H30,&H30,&H34,&H18,&H0
60825 DATA &H00,&H00,&HCC,&HCC,&HCC,&HCC,&H76,&H0
60830 DATA &H00,&H00,&HCC,&HCC,&HCC,&H78,&H30,&H0
60835 DATA &H00,&H00,&HC6,&HD6,&HFE,&HFE,&H6C,&H0
60840 DATA &H00,&H00,&HC6,&H6C,&H38,&H6C,&HC6,&H0
60845 DATA &H00,&H00,&HCC,&HCC,&HCC,&H7C,&H0C,&HF8
60850 DATA &H00,&H00,&HFC,&H98,&H30,&H64,&HFC,&H0
60855 DATA &H1C,&H30,&H30,&HE0,&H30,&H30,&H1C,&H0
60860 DATA &H18,&H18,&H18,&H00,&H18,&H18,&H18,&H0
60865 DATA &HE0,&H30,&H30,&H1C,&H30,&H30,&HE0,&H0
60870 DATA &H76,&HDC,&H00,&H00,&H00,&H00,&H00,&H0
60875 DATA &H00,&H10,&H38,&H6C,&HC6,&HC6,&HFE,&H0
60880 REM
60890 REM
60930 REM ********************************************************************
60935 REM -------------- DISPLAY MESSAGES WITH LARGE CHARACTERS --------------
60940 REM
60945 REM This routine is the second part of the 2 routine process that
60950 REM allows you create and then display messages with large characters.
60955 REM
60960 REM
60965 REM enter with - BIGMSG=1 to 5, which message to display 
60970 REM              ROW and COL=row and column at which to start displaying
60975 REM              the upper left corner of the message
60980 REM optional -   TEXTFORE,TEXTBACK,DATAFORE,DATABACK,FIELDFORE,FIELDBACK
60985 REM              colors optionally specified for COLOR statements
60990 REM
60995 REM
61000 IF TEXTFORE=0 AND TEXTBACK=0 THEN TEXTFORE=7                 :REM 61000
61005 IF DATAFORE=0 AND DATABACK=0 THEN DATAFORE=15
61010 IF FIELDFORE=0 AND FIELDBACK=0 THEN FIELDBACK=7
61015 LOCATE ROW,COL:PRINT BIG$((BIGMSG-1)*4+1);
61020 LOCATE ROW+1,COL:PRINT BIG$((BIGMSG-1)*4+2);
61025 LOCATE ROW+2,COL:PRINT BIG$((BIGMSG-1)*4+3);
61030 LOCATE ROW+3,COL:PRINT BIG$((BIGMSG-1)*4+4);
61035 RETURN
61040 REM

1 CLEAR ,,,32768!:LV=4:DIM SCON(2800):SCREEN 2:SCREEN 5:KEY OFF:FOR P=0 TO 15:PALETTE P,0:NEXT:GOSUB 10
2 REM QUASAR - TANDY 1000
3 REM COPYRIGHT (C)1990 B.DEFOREST
4 TYP=10024:RANDOMIZE TIMER: DIM C$(12):DIM CMD9(300):DIM MMD9(300): SCREEN 5
5 SCREEN 2:SCREEN 0:KEY OFF:VIEW PRINT 1 TO 25
6 GOTO 1000
7 FOR N=1 TO 4:FOR B=1 TO 12:C$(B)="0":NEXT:FOR A=1 TO LV:B=1+FIX(RND*11):IF C$(B)<>"0" THEN A=A-1 ELSE C$(B)=RIGHT$(STR$(1+FIX(RND*4)),1)
8 NEXT:GOSUB 1040:N$(N)="":FOR B=1 TO 12:N$(N)=N$(N)+C$(B):NEXT:NEXT
9 G3=1:SP=RND*20:IT=0:SC=0:ZO=0:CM=0:UU=0:S=0:PUT(0,130),SCON,PSET:GOTO 19
10 S=1:FOR A=1 TO 4:LINE(154-S,140)-(154+S,190),15,B:S=S+S:NEXT
11 S=1:FOR A=1 TO 4:LINE(10-S,140-S)-(310+S,190+S),15,B:S=S+S:NEXT:UY=0
12 Y3=2:C=3:SZ=RND*20:YY=100:X=160:C2=1:SOUND ON:PLAY "MB":FOR A=141 TO 189:LINE(163,A)-(309,A),7,,RND*30000:NEXT:LINE(173,143)-(207,187),0,BF
13 FOR A=150 TO 180 STEP 5:LINE(180,A)-(185,A),9:LINE(195,A)-(200,A),9:NEXT:LINE(175,145)-(205,185),9,B:LINE(173,143)-(207,187),9,B:FOR A=141 TO 189:LINE(11,A)-(146,A),7,,RND*30000:NEXT
14 LINE(15,150)-(113,160),0,BF:LINE(15,150)-(113,160),12,B:LINE(15,166)-(113,176),0,BF:LINE(15,166)-(113,176),12,B
15 COLOR 10:LOCATE 22,3:PRINT "FORCE":LOCATE 20,3:PRINT "SCORE":LINE(215,174)-(295,184),0,BF
16 FOR A=174 TO 184 STEP 2:LINE(215,A)-(295,A),2:NEXT:COLOR 13:LOCATE 23,30:PRINT "QUASAR":LINE(220,145)-(290,169),0,BF:LINE(219,144)-(291,170),7,B
18 COLOR 11:LOCATE 20,8:PRINT " 0":GET(0,130)-(319,199),SCON:RETURN
19 VIEW SCREEN(0,21)-(319,129):GOTO 200
20 Y1=100:Y2=100:Y4=15:Y3=2:W=0:YM=0:GOSUB 120:SZ=RND*10:SP=RND*10:Y=100:X=140+RND*40:O=120:I=140+RND*40
21 COLOR 2:LOCATE 20,3:PRINT "SCORE"
22 COLOR 2:LOCATE 22,3:PRINT "FORCE"
23 ZO=0:C2=13
25 REM
26 IF ZO=0 THEN 30
27 IF ZO=1 THEN TM=21:ZO=2:GOSUB 805
28 TM=TM-1:SOUND 1200,.5,15,2:COLOR 3:LOCATE 1,37:PRINT TM:LOCATE 1,1:PRINT TM:IF TM<1 THEN LOCATE 1,1:GOSUB 800:COLOR 11:PRINT STRING$(40,32):ZO=0:PALETTE 11,11
30 CLS:LINE(11,Y1)-(309,Y2),10,,TYP:PSET(RND*320,RND*80+YM),15
31 Y3=Y3+(Y3/2):LINE(11,Y1+Y3-1)-(309,Y2+Y3-1),2,,Y3*Y3:IF Y3>50 THEN Y3=1
32 LINE(155,80)-(165,80),15:LINE(160,75)-(160,85),7
33 IF RND*50>4 THEN 35
34 SX1=X+(SZ+RND*(SZ*2)):SY1=Y+(SZ/2+RND*SZ):FOR A=1 TO 5:LINE(X,Y)-(SX1,SY1),RND*15,,ST:SOUND RND*999,1,15,0:NEXT:IF SX1>140 AND SX1<180 AND SY1>60 AND SY1<100 THEN 130 ELSE LINE(X,Y)-(SX1,SY1),0
35 IF STICK(0)<10 AND Y1>-40 THEN Y1=Y1-4:Y2=Y2+4:W=W+2 ELSE IF STICK(0)>110 AND Y2>-40 THEN Y1=Y1+4:Y2=Y2-4:W=W-2
36 IF STICK(1)<10 AND YM>-40 THEN Y1=Y1-4:Y2=Y2-4:YY=YY-4:YM=YM-4:YK=YK-4:GOSUB 120 ELSE IF STICK(1)>110 AND YM<40 THEN Y1=Y1+4:Y2=Y2+4:YY=YY+4:YM=YM+4:YK=YK+4:GOSUB 120
37 PSET(RND*320,RND*80+YM),7
41 X=X+(SZ/2)*W:ST=9999+(RND*9999):I=I+(SP/3)*W:SR=9999+(RND*9999)
45 Y=YY+(SZ/9):SZ=SZ+(SZ/2):IF SZ>200 THEN SZ=1:X=100+RND*120:YY=(YM+40)+RND*40:C=14
46 PSET(RND*320,RND*80+YM),7:GOSUB 920
48 IF UU=0 AND RND*20>19 AND CM>9 THEN UU=1 ELSE 50
49 IF UU=1 THEN UY=-SP*2:SOUND RND*O,.5,V,0:SOUND V*16,.7,V,1
50 O=W+YK+(SP/2)+UY:SP=SP+(SP/2.4):IF SP>200 THEN SP=1:I=110+RND*99:YK=(80+YM+W)+RND*30:UU=0:UY=0
51 PSET(RND*320,RND*80+YM),15
55 GOSUB 940
90 IF STRIG(1)=-1 THEN FOR A=1 TO 2:LINE(309,119)-(170,80),RND*15,,RND*26300:LINE(11,119)-(150,80),RND*15,,RND*26300:NOISE 4,15,.5:SOUND 200,.5,15,0:NEXT:E=E-100:LINE(309,119)-(170,80),0:LINE(11,119)-(150,80),0:GOSUB 100
94 E=E-1:COLOR 3:IF E<0 THEN 300 ELSE LOCATE 22,8:PRINT E
95 IF ZO=0 THEN 30 ELSE 26
100 IF X-SZ/9<160 AND X+SZ/9>160 AND Y-SZ/9<80 AND Y+SZ/9>80 THEN GOTO 105
101 IF I-SP/6<160 AND I+SP/6>160 AND O-SP/6<80 AND O+SP/7>80 THEN S=S+2:COLOR 11:LOCATE 20,8:PRINT S:E=E+900:SP=1:I=110+RND*99:YK=(YM+80+W)+RND*30:FOR A=700 TO 300 STEP -40:SOUND A,.5,15,0:SOUND A*6,.5,15,1:NEXT:UU=0:UY=0:IF ZO=2 THEN RETURN 500
102 IF INKEY$=" " THEN 400 ELSE IF YM<-12 THEN FOR V=14 TO 2 STEP -3:NOISE 4,V,1:SOUND V*15,1,V,2:NEXT:RETURN ELSE RETURN
105 IF C=14 THEN C=12:FOR A=1 TO 10:SOUND RND*9999,.5,15,0:SOUND RND*9999,.5,15,1:NEXT:RETURN
106 S=S+2:C=0:LOCATE 20,8:COLOR 11:PRINT S:GOSUB 820:FOR A=700 TO 999 STEP 44:SOUND A,.9,15,0:SOUND A*9,.9,15,1:NEXT:IT=IT+1:IX=224+(IT*7):C=14:SZ=1:X=100+RND*120:YY=(YM+60)+RND*40:IF ZO>0 THEN ZO=0:LOCATE 1,1:PRINT STRING$(40,32):GOSUB 825
107 IF IT>8 THEN VIEW SCREEN(0,0)-(319,199):LINE(220,145)-(290,169),0,BF:VIEW SCREEN(0,21)-(319,129):IT=1:GOTO 107 ELSE IF IT=2 THEN ZO=1:M$="WARP TWO READY" ELSE IF IT=4 THEN ZO=1:M$="WARP FOUR READY" ELSE IF IT=6 THEN ZO=1:M$="WARP SIX READY"
108 V=4:VIEW SCREEN(0,0)-(319,199):LINE(IX,148)-(IX-8,158),V:LINE(IX-8,158)-(IX,168),V:LINE(IX,168)-(IX+8,158),V:LINE(IX+8,158)-(IX,148),V:PAINT(IX,158),V
109 V=14:LINE(IX,148)-(IX-8,158),V:LINE(IX-8,158)-(IX,168),V:LINE(IX,168)-(IX+8,158),V:LINE(IX+8,158)-(IX,148),V:VIEW SCREEN(0,21)-(319,129)
110 IF IT=8 THEN ZO=1:M$="WARP EIGHT READY":RETURN ELSE RETURN
120 VIEW SCREEN(0,0)-(319,199):LINE(186,ZZ+1)-(194,ZZ-1),0,B:ZZ=165+(YM/4):LINE(186,ZZ)-(194,ZZ),3:LINE(186,ZZ-1)-(194,ZZ+1),11,B:VIEW SCREEN(0,21)-(319,129)
121 IF CM>5 AND YM<-30 THEN NOISE 5,15,1:NOISE 6,15,1:E=E-15 ELSE IF CM>5 AND YM>30 THEN NOISE 5,15,1:NOISE 4,15,1:E=E-15
122 RETURN
130 FOR V=15 TO 10:NOISE 4,V,1:NOISE 6,V,1:SOUND V*99,1,V,0:COLOR ,V:NEXT:COLOR  ,0:E=E-250:LINE(X,Y)-(SX1,SY1),0:GOTO 35
200 S=1:A=0:Q=0
201 SS=1:G3=1
202 V=4:L=146
205 A=A+.3:S2=S/2
206 S=S+(S/2)
210 X1=160+S*COS(A):Y1=80+S2*SIN(A):SOUND RND*400,.5,V,0
211 X2=160+S*COS(A+1.65):Y2=80+S2*SIN(A+1.65):SOUND RND*400,.5,V,0
212 X3=160+S*COS(A+3.3):Y3=80+S2*SIN(A+3.3):SOUND RND*400,.5,V,0
213 X4=160+S*COS(A+4.95):Y4=80+S2*SIN(A+4.95):SOUND RND*400,.5,V,0
214 G3=G3+(G3/2):CLS:LINE(11,Y1+G3-1)-(309,Y2+G3-1),4,,G3*G3:LINE(11,Y1)-(309,Y2),5,,TYP:IF G3>50 THEN G3=1
215 LINE(X1,Y1)-(X2,Y2),12:LINE(X2,Y2)-(X3,Y3),13:SOUND RND*400,.5,V,0:LINE(X3,Y3)-(X4,Y4),12:LINE(X4,Y4)-(X1,Y1),13:SOUND RND*400,.5,V,0
216 SS=SS+(SS/7):IF SS>3 THEN M$="READY FOR LAUNCH":GOSUB 805:GOTO 219
217 V=V+1:SOUND RND*400,.5,V,0:GOTO 205
219 GOSUB 830:A=A+.36
220 X1=160+S*COS(A):Y1=80+S2*SIN(A):GOSUB 830
221 X2=160+S*COS(A+1.65):Y2=80+S2*SIN(A+1.65):GOSUB 830
222 X3=160+S*COS(A+3.3):Y3=80+S2*SIN(A+3.3):GOSUB 830
223 X4=160+S*COS(A+4.95):Y4=80+S2*SIN(A+4.95):GOSUB 830
224 CLS:LINE(X1,Y1)-(X2,Y2),12:LINE(X2,Y2)-(X3,Y3),13:LINE(X3,Y3)-(X4,Y4),12:LINE(X4,Y4)-(X1,Y1),13:GOSUB 830
225 LINE(11,Y1)-(309,Y2),5,,TYP:GOSUB 830
226 G3=G3+(G3/2):LINE(11,Y1+G3-1)-(309,Y2+G3-1),4,,G3*G3:GOSUB 830:IF G3>50 THEN G3=1
227 IF Q>0 THEN Q=Q+1:SS=SS+(SS/7):S=S+(S/7.5):S2=S/2.5:NOISE 6,12,12:IF Q=16 THEN S=0:FOR V=15 TO 0 STEP -1:NOISE 4,V,.5:SOUND 8*V,1.4,V,0:NOISE 5,V,.5:SOUND RND*2000,1,V,1:NEXT:GOTO 20
228 IF Q=0 AND STRIG(1)=-1 THEN E=9999:Q=1:VIEW SCREEN(0,0)-(319,199):LINE(220,146)-(290,168),0,BF:VIEW SCREEN(0,21)-(319,129):LOCATE 1,1:PRINT STRING$(40,32):GOTO 219 ELSE 219
300 LOCATE 22,8:PRINT " 0   ":C=0:LOCATE 1,1:PRINT STRING$(40,32)
301 CLS:FOR P=7 TO 15:FOR A=0 TO 3:PALETTE A,P:NOISE 4,P,.2:NEXT:COLOR ,P:NEXT:FOR P=15 TO 0 STEP -1:FOR A=0 TO 3:PALETTE A,P:NEXT:COLOR ,P:NOISE 6,P,1:NEXT:PALETTE 1,1:PALETTE 2,2:PALETTE 3,3
302 FOR A=1 TO 50:PSET(RND*320,RND*140),7:PSET(RND*320,RND*140),15:NEXT:L=146:Q=0
303 FOR A=1 TO 20:CIRCLE(220,50),A,9:NEXT
305 COLOR 10:A$="GAME OVER":LOCATE 3,5:FOR A=1 TO 9:B$=LEFT$(A$,A):B$=RIGHT$(B$,1):SOUND 800,.2,15,0:PRINT B$;:FOR P=1 TO 40:NEXT:NEXT
310 GM=FIX(100*(CM/48))
315 COLOR 2:A$="SKILL RATING :"+STR$(GM)+" %":LOCATE 12,8:FOR A=1 TO LEN(A$):B$=LEFT$(A$,A):B$=RIGHT$(B$,1):SOUND 700,.2,15,0:PRINT B$;:FOR P=1 TO 20:NEXT:NEXT
320 IF STRIG(1)=-1 THEN 1000 ELSE GOSUB 830:GOTO 320
399 END
400 CLS
401 FOR A=1 TO 50:PSET(RND*320,10+RND*130),1:PSET(RND*320,10+RND*130),9:SOUND RND*2000,.1,15,2:NEXT
402 COLOR 2:LOCATE 5,7:PRINT "A B  C D  E F  G H  I J  K L"
403 E=E+100
404 VIEW SCREEN(0,0)-(319,199):GET(220,145)-(290,169),CMD9:VIEW SCREEN(0,21)-(319,129)
405 FOR A=40 TO 280 STEP 20:LINE(40,10+A)-(280,10+A),4:LINE(A,40)-(A,140),12:NEXT
410 COLOR 2:LOCATE 8,4:PRINT "2":LOCATE  10,4:PRINT "4":LOCATE 13,4:PRINT "6":LOCATE 16,4:PRINT "8"
415 COLOR 10:LOCATE 3,16:PRINT "S E C T O R"
416 A$="STAR GATE":B=8:FOR A=1 TO 9:B$=LEFT$(A$,A):B$=RIGHT$(B$,1):LOCATE B,1:PRINT B$:B=B+1:NEXT
417 NY=40:FOR N=1 TO 4:NX=30:NY=NY+20:FOR V=15 TO 5 STEP -2:SOUND V*9,1,V,0:SOUND 100,1,V,1:SOUND RND*999,.5,V,2:NEXT:FOR A=1 TO 12:NX=NX+20:C$=LEFT$(N$(N),A):C$=RIGHT$(C$,1)
418 IF C$="0" THEN 428 ELSE IF C$="9" THEN 425
420 CIRCLE(NX,NY),5,9:PAINT(NX,NY),9:IF C$="4" THEN CIRCLE(NX,NY),3,7:PAINT(NX,NY),7:GOTO 428 ELSE 428
425 IF C$="9" THEN CIRCLE(NX,NY),5,5:CIRCLE(NX,NY),5,13,,,.4:CIRCLE(NX,NY),5,5,,,2:FOR V=15 TO 5 STEP -2:NOISE 4,V,.8:NEXT
428 NEXT:NEXT:FOR A=1 TO 150:A$=INKEY$:NEXT
429 VIEW SCREEN(0,0)-(319,199):LINE(220,145)-(290,169),1,BF:KJY=157:KD=0
431 GET(222,145)-(290,169),MMD9:LINE(289,145)-(290,169),1,BF:PUT(220,145),MMD9,PSET:PSET(290,KJY),15:KD=KD+.2:KJY=157+(SIN(KD)*12):IF KD>6.1 THEN KD=0
439 IF STRIG(1)=-1 THEN LOCATE 3,1:PRINT STRING$(40,32):FOR V=15 TO 0 STEP -1:SOUND V*19,1,V,0:SOUND V*15,1,V,1:NOISE 4,V,1:NEXT:PUT(220,145),CMD9,PSET:VIEW SCREEN(0,21)-(319,129):RETURN ELSE 431
495 END
500 LOCATE 1,1:PRINT STRING$(40,32):SC=S
501 CLS:LINE(11,Y1)-(309,Y2),10,,TYP
502 Y3=Y3+(Y3/2):LINE(11,Y1+Y3-1)-(309,Y2+Y3-1),2,,Y3*Y3:IF Y3>50 THEN Y3=1
503 YM=YM+2:Y1=Y1+2:Y2=Y2+2:IF YM>45 THEN 505
504 NOISE 4,12,4:GOTO 501
505 S=4:S2=64:YM=0:Y2=80:Y1=80:Y3=1
506 Q=0:QS=255:W=1:FOR V=15 TO 6 STEP -1:SOUND V*20,1,15,0:NOISE 5,V,1:NEXT:V=0
510 S=S+S:IF S>150 THEN S=4
511 CLS:LINE(11,Y1)-(309,Y2),11,,188
512 Y3=Y3+Y3:LINE(11,Y1+Y3-1)-(309,Y2+Y3-1),3,,Y3*6:IF Y3>50 THEN Y3=2
513 S2=S2+(S2/2):IF S2>150 THEN S2=4
514 LINE(160-S,80-S)-(160+S,80+S),1,B:LINE(160-S2,80-S2)-(160+S2,80+S2),9,B
515 NOISE 6,12,8:IF STICK(0)<10 THEN Y1=Y1-4:Y2=Y2+4:V=V+2 ELSE IF STICK(0)>110 THEN Y1=Y1+4:Y2=Y2-4:V=V-2
516 QS=QS+QS:IF QS>150 THEN GOSUB 526
517 QX=QX+((QS/4)*V):LINE(QX-QS,80+QS+V)-(QX+QS,80+QS+V),13:LINE(QX+QS,80+QS+V)-(QX,80-QS+V),4:LINE(QX,80-QS+V)-(QX-QS,80+QS+V),5
518 IF QS>63 THEN 520 ELSE 510
520 IF QX-(QS/2)<160 AND QX+(QS/2)>160 AND 80-(QS/2)+V<80 AND 80+(QS/2)+V>80 THEN 530
525 GOTO 510
526 W=W+1:IF W=3 THEN W=1
527 Q=Q+1:QX=20+(270*(W-1)):QS=2:IF Q=13 THEN RETURN 530 ELSE RETURN
530 QD=Q:FOR A=1 TO 15:S=S+(S/2):IF S>1000 THEN S=1000
531 Y1=Y1+A:Y2=Y2+A:Y3=Y3+A:CLS:LINE(11,Y1)-(309,Y2),3,,188
532 Y3=Y3+Y3:LINE(11,Y1+Y3-1)-(309,Y2+Y3-1),3,,Y3*6:IF Y3>50 THEN Y3=2
533 S2=S2+(S2/2):IF S2>1000 THEN S2=1000
534 LINE(160-S,80-S)-(160+S,80+S),1,B:LINE(160-S2,80-S2)-(160+S2,80+S2),1,B:SOUND A*A,.4,15,0:SOUND A*18,.4,15,1
535 NEXT:IF QD=13 THEN FOR V=15 TO 0 STEP -1:NOISE 4,15,.4:NOISE 6,V,.4:PALETTE 0,V:COLOR ,V:NEXT:S=SC:GOTO 20
536 A$=LEFT$(N$(IT/2),QD):A$=RIGHT$(A$,1):AM=VAL(A$):SGX=-320+FIX(RND*960):SGY=-140+FIX(RND*520):FOR V=15 TO 0 STEP -1:SOUND V*19,.6,15,0:NOISE 4,15,.2:NOISE 5,V,1:SOUND V*29,.6,V,1:NEXT:IF AM=10 THEN 2000
537 IF AM=0 THEN M$="QUADRANT SAFE":COLOR 9:FOR A=1 TO 13:A$=RIGHT$(M$,A):LOCATE 1,20-(A/2):PRINT A$:SOUND RND*3000,.5,15,0:SOUND RND*3000,.5,15,1:NEXT
538 FOR A=1 TO AM:AX(A)=-320+FIX(RND*960):AY(A)=-140+FIX(RND*520):NEXT:SP=10:S=SC:RT=CM*2:VIEW SCREEN(0,0)-(319,199):LINE(186,150)-(194,182),0,BF:VIEW SCREEN(0,21)-(319,129):IF AM=4 THEN RT=RT+25
539 IF AM=9 THEN 2000
540 FX=0:FY=0:IF SGX<0 THEN FX=-10 ELSE IF SGX>319 THEN FX=10
541 IF SGY<0 THEN FY=-8 ELSE IF SGY>140 THEN FY=8
542 CLS:LINE(160,75)-(160,85),11:LINE(155,80)-(165,80),11:LINE(160,80)-(160+FX,80+FY),12:PSET(RND*320,RND*140),7:IF FX=0 AND FY=0 THEN LINE(150,70)-(170,90),13,B:SOUND RND*9999,1,15,2
543 X=0:Y=0:IF STICK(0)<10 THEN X=-SP ELSE IF STICK(0)>110 THEN X=SP
544 IF STICK(1)<10 THEN Y=-SP ELSE IF STICK(1)>110 THEN Y=SP
545 PSET(RND*320,RND*140),15:SGX=SGX+X:SGY=SGY+Y:AX=AX+X:AY=AY+Y
546 SGX=SGX+(-10+RND*20):SGY=SGY+(-10+RND*20):IF AM=0 THEN 555 ELSE FOR A=1 TO AM:AX(A)=AX(A)+(-20+RND*40):AY(A)=AY(A)+(-20+RND*40):AX(A)=AX(A)+X:AY(A)=AY(A)+Y:NEXT
550 IF SGX<-320 THEN SGX=640 ELSE IF SGX>640 THEN SGX=-320
551 IF SGY<-140 THEN SGY=280 ELSE IF SGY>280 THEN SGY=-140
552 FOR A=1 TO AM:IF AX(A)<-320 THEN AX(A)=640 ELSE IF AX(A)>640 THEN AX(A)=-320
553 IF AY(A)<-140 THEN AY(A)=280 ELSE IF AY(A)>280 THEN AY(A)=-140
554 NEXT
555 IF SGX<0 OR SGX>320 OR SGY<20 OR SGY>140 THEN 560
556 CIRCLE(SGX,SGY),10,15:LINE(SGX,SGY-5)-(SGX,SGY+5),7:LINE(SGX-5,SGY)-(SGX+5,SGY),3
560 IF AM=0 THEN 593
561 FOR A=1 TO AM:IF AX(A)<0 OR AX(A)>319 OR AY(A)<20 OR AY(A)>140 THEN 565
562 SZ(A)=FIX(RND*20):T=RND*20000:LINE(AX(A)-SZ(A),AY(A))-(AX(A)+SZ(A),AY(A)+(SZ(A)/5)),4,B,T:LINE(AX(A)+SZ(A),AY(A))-(AX(A),AY(A)-(SZ(A)/2)),5,,T:LINE(AX(A),AY(A)-(SZ(A)/2))-(AX(A)-SZ(A),AY(A)),13,,T
563 IF AX(A)-30<160 AND AX(A)+30>160 AND AY(A)-20<80 AND AY(A)+20>80 AND SZ(A)>12 THEN EX=RT+FIX(RND*(320-(RT/2))):EY=RT/4+FIX(RND*(140-(RT/8))):FX=AX(A):FY=AY(A):GOSUB 598
565 NEXT
593 IF STRIG(1)=-1 THEN FOR A=1 TO 2:LINE(309,119)-(170,80),RND*15,,RND*26300:LINE(11,119)-(150,80),RND*15,,RND*26300:NOISE 4,15,.5:SOUND 200,.5,15,0:NEXT:E=E-100:LINE(309,119)-(170,80),0:LINE(11,119)-(150,80),0:GOSUB 596
594 E=E-1:COLOR 3:IF E<0 THEN 300 ELSE LOCATE 22,8:PRINT E
595 GOTO 540
596 IF SGX-5<160 AND SGX+5>160 AND SGY-5<80 AND SGY+5>80 THEN RETURN 700
597 FOR A=1 TO AM:IF AX(A)-SZ(A)<160 AND AX(A)+SZ(A)>160 AND AY(A)+SZ(A)/4>80 AND AY(A)-SZ(A)/2<80 THEN RETURN 600 ELSE NEXT:RETURN
598 FOR A=1 TO 3:LINE(FX,FY)-(EX,EY),RND*3,,RND*30000:NOISE 4,15,.3:SOUND 9,.5,15,0:SOUND 200,.5,15,1:NEXT:LINE(FX,FY)-(EX,EY),0:IF EX-30<160 AND EX+30>160 AND EY-15<80 AND EY+15>80 THEN 599 ELSE RETURN
599 FOR V=15 TO 0 STEP -1:NOISE 4,15,.5:NOISE 5,15,.5:COLOR ,V:PALETTE 0,0:SOUND V*V,1,V,0:PALETTE 7,V:NEXT:E=E-500:PALETTE 7,7:RETURN
600 E=E+FIX(1000-(SZ(A)*50)):S=S+10:FOR V=15 TO 0 STEP -1:NOISE 5,V,.5:SOUND V*20,.5,V,0:SOUND RND*2000,.5,V,1:NOISE 6,V,.5:NEXT
605 IF AM=1 THEN AM=0:CM=CM+1:GOTO 607
606 AM=AM-1:FOR A=1 TO AM:AX(A)=320-FIX(RND*960):AY(A)=140-FIX(RND*520):NEXT:N=IT/2:GOSUB 610
607 COLOR 11:LOCATE 20,8:PRINT S
608 IF AM=0 THEN M$="QUADRANT SAFE":COLOR 9:FOR A=1 TO 13:A$=RIGHT$(M$,A):LOCATE 1,20-(A/2):PRINT A$:SOUND RND*3000,.5,15,0:SOUND RND*30000,.5,15,1:NEXT:N=IT/2:GOSUB 610
609 GOTO 594
610 B$="":FOR A=1 TO 12:A$=LEFT$(N$(N),A):A$=RIGHT$(A$,1):IF A=QD THEN A$=RIGHT$(STR$(AM),1)
611 B$=B$+A$:NEXT:N$(N)=B$:RETURN
699 END
700 SC=S:S=2:A=0:S2=1:SS=1:LOCATE 1,1:PRINT STRING$(40,32)
701 VIEW SCREEN(0,0)-(319,199):LINE(220,145)-(290,169),0,BF:VIEW SCREEN(0,21)-(319,129):IT=0
702 SD=2
705 A=A+.36
706 X1=160+S*COS(A):Y1=80+S2*SIN(A)
707 X2=160+S*COS(A+1.65):Y2=80+S2*SIN(A+1.65)
708 X3=160+S*COS(A+3.3):Y3=80+S2*SIN(A+3.3):PSET(RND*320,RND*140),7:X4=160+S*COS(A+4.95):Y4=80+S2*SIN(A+4.95)
709 VIEW SCREEN(220,145)-(290,169):CLS:IF S<129 THEN LINE(255-SD,157-(SD/2))-(255+SD,157+(SD/2)),10,B:VIEW SCREEN(0,21)-(319,129):SD=SD+SD:IF SD>45 THEN SD=2 ELSE VIEW SCREEN(0,21)-(319,129)
710 CLS:CIRCLE(X1,Y1),SS,11:CIRCLE(X2,Y2),SS,3:CIRCLE(X3,Y3),SS,11:CIRCLE(X4,Y4),SS,3
711 PSET(RND*320,RND*140),7:PSET(RND*320,RND*140),15
713 SS=SS+(SS/3):S=S+(S/2):S2=S/2:IF S>260 THEN S=SC:FOR V=15 TO 0 STEP -2:FOR A=900 TO 500 STEP -100:SOUND A,.8,V,0:SOUND A*9,.8,V,1:NOISE 5,V,.8:NEXT:NEXT:YM=0:Y1=80:Y2=80:W=0:GOTO 20
714 NOISE 6,12,14:GOTO 705
800 FOR V=15 TO 3 STEP -1:FOR A=800 TO 900 STEP 100:SOUND A,.2,V,0:SOUND V*59,.2,V,1:SOUND A*2,.2,V,2:NEXT:NOISE 4,V,1.5:NEXT:RETURN
805 COLOR 10:FOR A=1 TO LEN(M$):A$=RIGHT$(M$,A):LOCATE 1,20-(A/2):PRINT A$:SOUND RND*3000,.5,15,0:SOUND RND*3000,.5,15,1:NEXT:RETURN
820 LINE(X,Y+SZ)-(X-SZ,Y-(SZ/4)),C,,ST:LINE(X-SZ,Y-(SZ/4))-(X+SZ,Y-(SZ/4)),C,,ST:LINE(X,Y+SZ)-(X+SZ,Y-(SZ/4)),C,,ST:LINE(X-(SZ/4),Y-(SZ/4))-(X,Y-SZ),C,,ST:LINE(X,Y-SZ)-(X+(SZ/4),Y-(SZ/4)),C,,ST:RETURN
825 FOR B=1 TO 3:FOR A=1 TO 5:SOUND B*99*A,.2,15,0:NOISE 5,A,.4:NEXT:FOR P=1 TO 11:NEXT:NEXT:FOR V=15 TO 0 STEP -.4:SOUND V*99,.3,V,0:SOUND V*50,.3,V,1:NEXT:RETURN
830 IF Q>0 THEN RETURN ELSE VIEW SCREEN(0,0)-(319,199):LINE(220,L)-(290,L),0:L=L+1:IF L>168 THEN L=146
832 LINE(220,L)-(290,L),14,,RND*30000:VIEW SCREEN(0,21)-(319,129):RETURN
900 CLS
905 C=3
910 X=160:Y=100:SZ=1
915 ST=32767
920 J=(W/9)*SZ:LINE(X+J,Y+SZ)-(X-SZ,Y-(SZ/4)+J),C,,ST:LINE(X-SZ,Y-(SZ/4)+J)-(X+SZ,Y-(SZ/4)-J),C,,ST:LINE(X+J,Y+SZ)-(X+SZ,Y-(SZ/4)-J),C,,ST:LINE(X-(SZ/4),Y-(SZ/4)+J)-(X+J,Y-SZ),C,,ST:LINE(X+J,Y-SZ)-(X+(SZ/4),Y-(SZ/4)-J),C,,ST
921 IF SZ<98 THEN RETURN
922 IF X>-60 AND X<380 THEN E=E-500:FOR P=15 TO 0 STEP -1:NOISE 6,P,.3:NOISE 5,P,.3:PALETTE 0,P:COLOR ,P:SOUND 200,.3,P,0:NEXT
925 RETURN
940 LINE(I-SP,O)-(I+SP,O),12,,SR:LINE(I,O)-(I-(SP/2),O+SP),5,,SR:LINE(I,O)-(I+(SP/2),O+SP),4,,SR:LINE(I-SP,O)-(I,O-(SP/2)),13,,SR:LINE(I,O-(SP/2))-(I+SP,O),13,,SR
941 IF SP<98 THEN RETURN
942 IF I>-60 AND I<380 AND O<140 THEN E=E-500:FOR P=15 TO 0 STEP -1:NOISE 5,P,.3:NOISE 4,P,.4:PALETTE 0,P:COLOR ,P:SOUND 100,.3,P,0:NEXT
943 RETURN
946 O=O+1:IF O=1 THEN GOSUB 920 ELSE GOSUB 940:O=0
1000 SCREEN 2:SCREEN 5:CLS
1001 CIRCLE(260,110),90,5:PAINT(260,110),5:CIRCLE(90,170),20,1:PAINT(90,170),1
1002 CIRCLE(260,110),99,12,,,.2:PAINT(260,110),12
1003 COLOR 15
1004 LOCATE 5,7:PRINT "QUASAR":COLOR 7
1005 LOCATE 7,2:PRINT "(C)1990 Rufus Pro"
1006 COLOR 3:LOCATE 8,0:PRINT "Program by B.DeForest"
1020 P=0:X=0:Y=0:C=0:A=0:B=0
1021 PSET(X,Y),P:X=RND*319:Y=RND*199:P=POINT(X,Y):IF P<>0 THEN 1021 ELSE PSET(X,Y),14
1022 IF INKEY$=CHR$(27) THEN SCREEN 2:SCREEN 0:CHDIR "..":RUN "menu"
1025 IF STRIG(1)=-1 THEN CLS:GOTO 7
1029 PSET(A,B),C:A=RND*319:B=RND*199:C=POINT(A,B):IF C<>0 THEN 1029 ELSE PSET(A,B),12
1030 GOTO 1021
1040 FOR A=1 TO 3:B=1+FIX(RND*11):IF C$(B)<>"0" THEN A=A-1 ELSE C$(B)="9"
1045 NEXT:RETURN
2000 CLS
2005 B=2:FOR A=1 TO 19:CLS:CIRCLE(160,80),B,10,,,A*SIN(B/A):B=B+(B/4):SOUND A*9,1,15,2:LINE(-1,80-B*1.2)-(320,80+B*1.2),14,B,B+A:PSET(RND*320,RND*140),11:PSET(RND*320,RND*140),1:PALETTE 7,RND*14:PALETTE 15,RND*14
2006 SOUND A*A,1,A/1.4,0:NOISE 5,A/2,.5:NOISE 4,A/2,.5:NOISE 5,13,6
2007 GOSUB 2040
2008 PALETTE 15,RND*15:PALETTE 7,RND*15
2010 NEXT
2015 CLS:FOR V=15 TO 0 STEP -1:FOR A=900 TO 1200 STEP 100:SOUND A,.9,V,0:SOUND A*2,.9,V,1:NOISE 6,V,.5:NEXT:NEXT:PALETTE 7,7:PALETTE 15,15
2020 B=2:FOR A=1 TO 8:LINE(160-B,80-B)-(160+B,80+B),12,BF:B=B+B:SOUND B,.7,15,0:SOUND A*19,.6,15,1:GOSUB 2040:NEXT
2025 B=2:FOR A=1 TO 8:LINE(160-B,80-B)-(160+B,80+B),9,BF:B=B+B:SOUND RND*B*19,.8,15,0:SOUND A*19,.8,15,1:GOSUB 2040:NEXT
2030 B=2:FOR A=1 TO 8:LINE(160-B,80-B)-(160+B,80+B),1,BF:B=B+B:SOUND B,.6,15,0:SOUND A*19,.6,15,1:GOSUB 2040:NEXT
2035 FOR V=15 TO 0 STEP -1:PALETTE 0,V:COLOR ,V:NOISE 4,V,.5:NOISE 6,V,.5:SOUND 99,1,V,0:NEXT
2039 GOTO 300
2040 E=E-573:IF E<0 THEN E=0
2045 COLOR 3:LOCATE 22,8:PRINT STR$(E):RETURN

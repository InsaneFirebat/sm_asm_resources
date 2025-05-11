
; This resource moves Samus tiles out of lorom banks ($80-BF) and into hirom banks ($C0-FF), or anywhere you choose
; Edit these defines to easily repoint these four banks of graphics
!SamusTilesBank0 = $E08000
!SamusTilesBank1 = $E18000
!SamusTilesBank2 = $E28000
!SamusTilesBank3 = $E38000

; Enable (set to 1) this define to write $FF bytes over the old graphics. This is optional
!MARK_FREESPACE = 0 ; (0 is disabled)


; The magic happens down here
; This is all ripped from the disassembly at https://github.com/InsaneFirebat/sm_disassembly
; The comments are from P.JBoy's bank logs at https://patrickjohnston.org/bank/index.html



; This section uses labels to write pointers for each graphics file
org $92CBEE

; Samus tiles definition format:
;     aaaaaa nnnn NNNN
; where:
;     a: Source address
;     n: Part 1 size, n = 0 means 10000h bytes are transferred
;     N: Part 2 size, N = 0 means no bytes are transferred


;;; $CBEE: Samus top tiles - set 0 (general) ;;;
SamusTopTiles_Set0_CBEE:
; Actually used by:
;     9: Moving right - not aiming - frame 0
;     9: Moving right - not aiming - frame 5
;     4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 3
;     C7h: Facing right - vertical shinespark windup - frame 3
;     F0h: Facing right - grabbed by Draygon - moving - frame 2
;     F0h: Facing right - grabbed by Draygon - moving - frame 5

; Meaninglessly used by:
;     0: Facing forward - power suit - frame 1
;     1: Facing right - normal - frame 4
;     2: Facing left-   normal - frame 4
;     19h: Facing right - spin jump - frames 9..Ah
;     1Ah: Facing left-   spin jump - frames 9..Ah
;     1Bh: Facing right - space jump - frames 9..Ah
;     1Ch: Facing left-   space jump - frames 9..Ah
;     1Dh: Facing right - morph ball - no springball - on ground - frame 8
;     1Eh: Moving right - morph ball - no springball - on ground - frame 8
;     1Fh: Moving left-   morph ball - no springball - on ground - frame 8
;     20h: Unused - frames 9..Ah
;     21h: Unused - frames 9..Ah
;     22h: Unused - frames 9..Ah
;     23h: Unused - frames 9..Ah
;     24h: Unused - frames 9..Ah
;     27h: Facing right - crouching - frame 4
;     28h: Facing left-   crouching - frame 4
;     29h: Facing right - falling - frames 3..4
;     2Ah: Facing left-   falling - frames 3..4
;     31h: Facing right - morph ball - no springball - in air - frame 8
;     32h: Facing left-   morph ball - no springball - in air - frame 8
;     33h: Unused - frames 9..Ah
;     34h: Unused - frames 9..Ah
;     39h: Unused - frames 9..Ah
;     3Ah: Unused - frames 9..Ah
;     3Fh: Unused - frame 8
;     40h: Unused - frame 8
;     41h: Facing left-   morph ball - no springball - on ground - frame 8
;     42h: Unused - frames 9..Ah
;     47h: Unused - frame 4
;     48h: Unused - frame 4
;     67h: Facing right - falling - gun extended - frames 3..4
;     68h: Facing left-   falling - gun extended - frames 3..4
;     79h: Facing right - morph ball - spring ball - on ground - frame 8
;     7Ah: Facing left-   morph ball - spring ball - on ground - frame 8
;     7Bh: Moving right - morph ball - spring ball - on ground - frame 8
;     7Ch: Moving left-   morph ball - spring ball - on ground - frame 8
;     7Dh: Facing right - morph ball - spring ball - falling - frame 8
;     7Eh: Facing left-   morph ball - spring ball - falling - frame 8
;     7Fh: Facing right - morph ball - spring ball - in air - frame 8
;     80h: Facing left-   morph ball - spring ball - in air - frame 8
;     81h: Facing right - screw attack - frames 19h..1Ah
;     82h: Facing left-   screw attack - frames 19h..1Ah
;     83h: Facing right - wall jump - frame 2
;     83h: Facing right - wall jump - frames Bh..Ch
;     83h: Facing right - wall jump - frames 15h..16h
;     84h: Facing left-   wall jump - frame 2
;     84h: Facing left-   wall jump - frames Bh..Ch
;     84h: Facing left-   wall jump - frames 15h..16h
;     89h: Facing right - ran into a wall - frame 4
;     8Ah: Facing left-   ran into a wall - frame 4
;     9Bh: Facing forward - varia/gravity suit - frame 1
;     A8h: Facing right - grappling - frame 4
;     A9h: Facing left-   grappling - frame 4
;     B4h: Facing right - grappling - crouching - frame 4
;     B5h: Facing left-   grappling - crouching - frame 4
;     C5h: Unused - frame 8
;     D3h: Facing right - crystal flash - frames 4..5
;     D3h: Facing right - crystal flash - frames Ah..Bh
;     D4h: Facing left-   crystal flash - frames 4..5
;     D4h: Facing left-   crystal flash - frames Ah..Bh
;     DFh: Unused. Related to Draygon - frame 8
;     E8h: Facing right - Samus drained - crouching/falling - frames Ch..Dh
;     E9h: Facing left-   Samus drained - crouching/falling - frames Ch..Dh
;     E9h: Facing left-   Samus drained - crouching/falling - frames 11h..12h
;     E9h: Facing left-   Samus drained - crouching/falling - frames 18h..19h
;     E9h: Facing left-   Samus drained - crouching/falling - frames 1Bh..1Ch
;     E9h: Facing left-   Samus drained - crouching/falling - frames 1Eh..1Fh
;     EAh: Facing right - Samus drained - standing - frame 4
;     EBh: Facing left-   Samus drained - standing - frame 4
    dl SamusTiles_Top_Set0_Entry0 : dw $0080,$0080                       ;92CBEE;

SamusTopTiles_Set0_CBF5:
; 9: Moving right - not aiming - frame 4
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 4
; C7h: Facing right - vertical shinespark windup - frame 4
; F0h: Facing right - grabbed by Draygon - moving - frame 0
    dl SamusTiles_Top_Set0_Entry1 : dw $0080,$0080                       ;92CBF5;

SamusTopTiles_Set0_CBFC:
; 9: Moving right - not aiming - frame 2
; F0h: Facing right - grabbed by Draygon - moving - frame 1
    dl SamusTiles_Top_Set0_Entry2 : dw $00A0,$0080                       ;92CBFC;

SamusTopTiles_Set0_CC03:
; 9: Moving right - not aiming - frame 3
    dl SamusTiles_Top_Set0_Entry3 : dw $00A0,$0080                       ;92CC03;

SamusTopTiles_Set0_CC0A:
; 9: Moving right - not aiming - frame 9
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 0
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 2
; C7h: Facing right - vertical shinespark windup - frame 0
; C7h: Facing right - vertical shinespark windup - frame 2
; F0h: Facing right - grabbed by Draygon - moving - frame 3
    dl SamusTiles_Top_Set0_Entry4 : dw $0080,$0080                       ;92CC0A;

SamusTopTiles_Set0_CC11:
; 9: Moving right - not aiming - frame 7
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 1
; C7h: Facing right - vertical shinespark windup - frame 1
; F0h: Facing right - grabbed by Draygon - moving - frame 4
    dl SamusTiles_Top_Set0_Entry5 : dw $00C0,$00C0                       ;92CC11;

SamusTopTiles_Set0_CC18:
; Ah: Moving left-   not aiming - frame 0
; Ah: Moving left-   not aiming - frame 5
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 3
; BEh: Facing left-   grabbed by Draygon - moving - frame 2
; BEh: Facing left-   grabbed by Draygon - moving - frame 5
; C8h: Facing left-   vertical shinespark windup - frame 3
    dl SamusTiles_Top_Set0_Entry6 : dw $0080,$0080                       ;92CC18;

SamusTopTiles_Set0_CC1F:
; Ah: Moving left-   not aiming - frame 4
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 4
; BEh: Facing left-   grabbed by Draygon - moving - frame 0
; C8h: Facing left-   vertical shinespark windup - frame 4
    dl SamusTiles_Top_Set0_Entry7 : dw $0080,$0080                       ;92CC1F;

SamusTopTiles_Set0_CC26:
; Ah: Moving left-   not aiming - frame 2
; BEh: Facing left-   grabbed by Draygon - moving - frame 1
    dl SamusTiles_Top_Set0_Entry8 : dw $00C0,$00C0                       ;92CC26;

SamusTopTiles_Set0_CC2D:
; Ah: Moving left-   not aiming - frame 3
    dl SamusTiles_Top_Set0_Entry9 : dw $00C0,$00C0                       ;92CC2D;

SamusTopTiles_Set0_CC34:
; Ah: Moving left-   not aiming - frame 9
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 0
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 2
; BEh: Facing left-   grabbed by Draygon - moving - frame 3
; C8h: Facing left-   vertical shinespark windup - frame 0
; C8h: Facing left-   vertical shinespark windup - frame 2
    dl SamusTiles_Top_Set0_EntryA : dw $0080,$0080                       ;92CC34;

SamusTopTiles_Set0_CC3B:
; Ah: Moving left-   not aiming - frame 7
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 1
; BEh: Facing left-   grabbed by Draygon - moving - frame 4
; C8h: Facing left-   vertical shinespark windup - frame 1
    dl SamusTiles_Top_Set0_EntryB : dw $00A0,$0080                       ;92CC3B;

SamusTopTiles_Set0_CC42:
; 11h: Moving right - aiming down-right - frames 0..1
; 11h: Moving right - aiming down-right - frames 5..6
; 17h: Facing right - normal jump - aiming down - frame 0
; 2Dh: Facing right - falling - aiming down - frame 0
; 6Bh: Facing right - normal jump - aiming down-right - frames 0..1
; 6Fh: Facing right - falling - aiming down-right - frames 0..2
; 78h: Facing right - moonwalk - aiming down-right - frame 0
; 78h: Facing right - moonwalk - aiming down-right - frame 3
; AEh: Unused. Facing right - grappling - in air - aiming down - frame 0
; B0h: Unused. Facing right - grappling - in air - aiming down-right - frames 0..1
; EFh: Facing right - grabbed by Draygon - not moving - aiming down-right - frame 0
    dl SamusTiles_Top_Set0_EntryC : dw $00E0,$0040                       ;92CC42;

SamusTopTiles_Set0_CC49:
; 12h: Moving left-   aiming down-left - frames 0..1
; 12h: Moving left-   aiming down-left - frames 5..6
; 18h: Facing left-   normal jump - aiming down - frame 0
; 2Eh: Facing left-   falling - aiming down - frame 0
; 6Ch: Facing left-   normal jump - aiming down-left - frames 0..1
; 70h: Facing left-   falling - aiming down-left - frames 0..2
; 77h: Facing left-   moonwalk - aiming down-left - frame 0
; 77h: Facing left-   moonwalk - aiming down-left - frame 3
; AFh: Unused. Facing left-   grappling - in air - aiming down - frame 0
; B1h: Unused. Facing left-   grappling - in air - aiming down-left - frames 0..1
; BDh: Facing left-   grabbed by Draygon - not moving - aiming down-left - frame 0
    dl SamusTiles_Top_Set0_EntryD : dw $00E0,$0040                       ;92CC49;

SamusTopTiles_Set0_CC50:
; 7: Facing right - aiming down-right - frame 0
; 59h: Facing right - normal jump transition - aiming down-right - frame 0
; 73h: Facing right - crouching - aiming down-right - frame 0
; AAh: Facing right - grappling - aiming down-right - frame 0
; B6h: Facing right - grappling - crouching - aiming down-right - frame 0
; D1h: Facing right - ran into a wall - aiming down-right - frame 0
; E4h: Facing right - landing from normal jump - aiming down-right - frames 0..1
; F5h: Facing right - crouching transition - aiming down-right - frame 0
; FBh: Facing right - standing transition - aiming down-right - frame 0
    dl SamusTiles_Top_Set0_EntryE : dw $00E0,$0080                       ;92CC50;

SamusTopTiles_Set0_CC57:
; 8: Facing left-   aiming down-left - frame 0
; 5Ah: Facing left-   normal jump transition - aiming down-left - frame 0
; 74h: Facing left-   crouching - aiming down-left - frame 0
; ABh: Facing left-   grappling - aiming down-left - frame 0
; B7h: Facing left-   grappling - crouching - aiming down-left - frame 0
; D2h: Facing left-   ran into a wall - aiming down-left - frame 0
; E5h: Facing left-   landing from normal jump - aiming down-left - frames 0..1
; F6h: Facing left-   crouching transition - aiming down-left - frame 0
; FCh: Facing left-   standing transition - aiming down-left - frame 0
    dl SamusTiles_Top_Set0_EntryF : dw $00E0,$0080                       ;92CC57;

SamusTopTiles_Set0_CC5E:
; 13h: Facing right - normal jump - not aiming - not moving - gun extended - frames 0..1
; 35h: Facing right - crouching transition - frame 0
; 3Bh: Facing right - standing transition - frame 0
; 4Ah: Facing right - moonwalk - frame 0
; 4Ah: Facing right - moonwalk - frame 3
; 51h: Facing right - normal jump - not aiming - moving forward - frames 0..1
; 67h: Facing right - falling - gun extended - frames 0..2
; 67h: Facing right - falling - gun extended - frames 5..6
; ACh: Unused. Facing right - grappling - in air - frames 0..1
; D3h: Facing right - crystal flash - frame Eh
; D5h: Facing right - x-ray - standing - frame 2
; D7h: Facing right - crystal flash ending - frame 3
; D9h: Facing right - x-ray - crouching - frame 2
; DBh: Unused - frame 0
; DDh: Unused - frame 2
; E6h: Facing right - landing from normal jump - firing - frames 0..1
; E8h: Facing right - Samus drained - crouching/falling - frame Eh
; EAh: Facing right - Samus drained - standing - frame 5
; EEh: Facing right - grabbed by Draygon - firing - frame 0
    dl SamusTiles_Top_Set0_Entry10 : dw $00C0,$0040                      ;92CC5E;

SamusTopTiles_Set0_CC65:
; 14h: Facing left-   normal jump - not aiming - not moving - gun extended - frames 0..1
; 36h: Facing left-   crouching transition - frame 0
; 3Ch: Facing left-   standing transition - frame 0
; 49h: Facing left-   moonwalk - frame 0
; 49h: Facing left-   moonwalk - frame 3
; 52h: Facing left-   normal jump - not aiming - moving forward - frames 0..1
; 68h: Facing left-   falling - gun extended - frames 0..2
; 68h: Facing left-   falling - gun extended - frames 5..6
; ADh: Unused. Facing left-   grappling - in air - frames 0..1
; BCh: Facing left-   grabbed by Draygon - firing - frame 0
; D4h: Facing left-   crystal flash - frame Eh
; D6h: Facing left-   x-ray - standing - frame 2
; D8h: Facing left-   crystal flash ending - frame 3
; DAh: Facing left-   x-ray - crouching - frame 2
; DCh: Unused - frame 0
; DEh: Unused - frame 2
; E7h: Facing left-   landing from normal jump - firing - frames 0..1
; EBh: Facing left-   Samus drained - standing - frame 5
    dl SamusTiles_Top_Set0_Entry11 : dw $00C0,$0040                      ;92CC65;

SamusTopTiles_Set0_CC6C:
; 3: Facing right - aiming up - frame 0
; 5: Facing right - aiming up-right - frame 0
; 15h: Facing right - normal jump - aiming up - frame 0
; 2Bh: Facing right - falling - aiming up - frame 0
; 57h: Facing right - normal jump transition - aiming up-right - frame 0
; 71h: Facing right - crouching - aiming up-right - frame 0
; 85h: Facing right - crouching - aiming up - frame 0
; CFh: Facing right - ran into a wall - aiming up-right - frame 0
; E2h: Facing right - landing from normal jump - aiming up-right - frames 0..1
; F3h: Facing right - crouching transition - aiming up-right - frame 0
; F9h: Facing right - standing transition - aiming up-right - frame 0
    dl SamusTiles_Top_Set0_Entry12 : dw $00C0,$0080                      ;92CC6C;

SamusTopTiles_Set0_CC73:
; 4: Facing left-   aiming up - frame 0
; 6: Facing left-   aiming up-left - frame 0
; 16h: Facing left-   normal jump - aiming up - frame 0
; 2Ch: Facing left-   falling - aiming up - frame 0
; 58h: Facing left-   normal jump transition - aiming up-left - frame 0
; 72h: Facing left-   crouching - aiming up-left - frame 0
; 86h: Facing left-   crouching - aiming up - frame 0
; D0h: Facing left-   ran into a wall - aiming up-left - frame 0
; E3h: Facing left-   landing from normal jump - aiming up-left - frames 0..1
; F4h: Facing left-   crouching transition - aiming up-left - frame 0
; FAh: Facing left-   standing transition - aiming up-left - frame 0
    dl SamusTiles_Top_Set0_Entry13 : dw $00C0,$0080                      ;92CC73;

SamusTopTiles_Set0_CC7A:
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 5
; C7h: Facing right - vertical shinespark windup - frame 5
    dl SamusTiles_Top_Set0_Entry14 : dw $00A0,$0080                      ;92CC7A;

SamusTopTiles_Set0_CC81:
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 5
; C8h: Facing left-   vertical shinespark windup - frame 5
    dl SamusTiles_Top_Set0_Entry15 : dw $00C0,$00C0                      ;92CC81;

SamusTopTiles_Set0_CC88:
; 3: Facing right - aiming up - frame 1
; Dh: Moving right - aiming up (unused) - frames 0..1
; Dh: Moving right - aiming up (unused) - frames 5..6
; 15h: Facing right - normal jump - aiming up - frame 1
; 2Bh: Facing right - falling - aiming up - frames 1..2
; 55h: Facing right - normal jump transition - aiming up - frame 0
; 85h: Facing right - crouching - aiming up - frame 1
; E0h: Facing right - landing from normal jump - aiming up - frames 0..1
; F1h: Facing right - crouching transition - aiming up - frame 0
; F7h: Facing right - standing transition - aiming up - frame 0
    dl SamusTiles_Top_Set0_Entry16 : dw $00C0,$0040                      ;92CC88;

SamusTopTiles_Set0_CC8F:
; 4: Facing left-   aiming up - frame 1
; Eh: Moving left-   aiming up (unused) - frames 0..1
; Eh: Moving left-   aiming up (unused) - frames 5..6
; 16h: Facing left-   normal jump - aiming up - frame 1
; 2Ch: Facing left-   falling - aiming up - frames 1..2
; 56h: Facing left-   normal jump transition - aiming up - frame 0
; 86h: Facing left-   crouching - aiming up - frame 1
; E1h: Facing left-   landing from normal jump - aiming up - frames 0..1
; F2h: Facing left-   crouching transition - aiming up - frame 0
; F8h: Facing left-   standing transition - aiming up - frame 0
    dl SamusTiles_Top_Set0_Entry17 : dw $00C0,$0040                      ;92CC8F;

SamusTopTiles_Set0_CC96:
; 9: Moving right - not aiming - frame 8
    dl SamusTiles_Top_Set0_Entry18 : dw $00A0,$0080                      ;92CC96;

SamusTopTiles_Set0_CC9D:
; Ah: Moving left-   not aiming - frame 8
    dl SamusTiles_Top_Set0_Entry19 : dw $00A0,$0080                      ;92CC9D;

SamusTopTiles_Set0_CCA4:
; Fh: Moving right - aiming up-right - frames 0..1
; Fh: Moving right - aiming up-right - frames 5..6
; 69h: Facing right - normal jump - aiming up-right - frames 0..1
; 6Dh: Facing right - falling - aiming up-right - frames 0..2
; 76h: Facing right - moonwalk - aiming up-right - frame 0
; 76h: Facing right - moonwalk - aiming up-right - frame 3
; EDh: Facing right - grabbed by Draygon - not moving - aiming up-right - frame 0
    dl SamusTiles_Top_Set0_Entry1A : dw $00C0,$0040                      ;92CCA4;

SamusTopTiles_Set0_CCAB:
; 10h: Moving left-   aiming up-left - frames 0..1
; 10h: Moving left-   aiming up-left - frames 5..6
; 6Ah: Facing left-   normal jump - aiming up-left - frames 0..1
; 6Eh: Facing left-   falling - aiming up-left - frames 0..2
; 75h: Facing left-   moonwalk - aiming up-left - frame 0
; 75h: Facing left-   moonwalk - aiming up-left - frame 3
; BBh: Facing left-   grabbed by Draygon - not moving - aiming up-left - frame 0
    dl SamusTiles_Top_Set0_Entry1B : dw $00E0,$0040                      ;92CCAB;

SamusTopTiles_Set0_CCB2:
; 54h: Facing left-   knockback - frames 0..1
; D8h: Facing left-   crystal flash ending - frames 4..5
; E9h: Facing left-   Samus drained - crouching/falling - frames 2..6
    dl SamusTiles_Top_Set0_Entry1C : dw $0100,$00C0                      ;92CCB2;

SamusTopTiles_Set0_CCB9:
; 53h: Facing right - knockback - frames 0..1
; D7h: Facing right - crystal flash ending - frames 4..5
; E8h: Facing right - Samus drained - crouching/falling - frames 3..7
    dl SamusTiles_Top_Set0_Entry1D : dw $0100,$00C0                      ;92CCB9;


UNUSED_SamusTopTiles_Set0_92CCC0:
    dl SamusTiles_Top_Set0_Entry1E : dw $0100,$0040                      ;92CCC0;

UNUSED_SamusTopTiles_Set0_92CCC7:
    dl SamusTiles_Top_Set0_Entry1F : dw $0100,$0040                      ;92CCC7;



;;; $CCCE: Samus top tiles - set 1 (general) ;;;
UNUSED_SamusTopTiles_Set1_92CCCE:
    dl SamusTiles_Top_Set1_Entry0 : dw $00C0,$0080                       ;92CCCE;


UNUSED_SamusTopTiles_Set1_92CCD5:
    dl SamusTiles_Top_Set1_Entry1 : dw $00C0,$0080                       ;92CCD5;


SamusTopTiles_Set1_CCDC:
; 8Bh: Facing right - turning - standing - aiming up - frame 1
; 8Ch: Facing left-   turning - standing - aiming up - frame 1
; 8Fh: Facing right - turning - in air - aiming up - frame 1
; 90h: Facing left-   turning - in air - aiming up - frame 1
; 93h: Facing right - turning - falling - aiming up - frame 1
; 94h: Facing left-   turning - falling - aiming up - frame 1
; 97h: Facing right - turning - crouching - aiming up - frame 1
; 98h: Facing left-   turning - crouching - aiming up - frame 1
; 9Ch: Facing right - turning - standing - aiming up-right - frame 1
; 9Dh: Facing left-   turning - standing - aiming up-left - frame 1
; 9Eh: Facing right - turning - in air - aiming up-right - frame 1
; 9Fh: Facing left-   turning - in air - aiming up-left - frame 1
; A0h: Facing right - turning - falling - aiming up-right - frame 1
; A1h: Facing left-   turning - falling - aiming up-left - frame 1
; A2h: Facing right - turning - crouching - aiming up-right - frame 1
; A3h: Facing left-   turning - crouching - aiming up-left - frame 1
; C1h: Facing right - moonwalking - turn/jump left-   aiming up-right - frame 1
; C2h: Facing left-   moonwalking - turn/jump right - aiming up-left - frame 1
    dl SamusTiles_Top_Set1_Entry2 : dw $00E0,$00C0                       ;92CCDC;

SamusTopTiles_Set1_CCE3:
; 8Dh: Facing right - turning - standing - aiming down-right - frame 1
; 8Eh: Facing left-   turning - standing - aiming down-left - frame 1
; 91h: Facing right - turning - in air - aiming down/down-right - frame 1
; 92h: Facing left-   turning - in air - aiming down/down-left - frame 1
; 95h: Facing right - turning - falling - aiming down/down-right - frame 1
; 96h: Facing left-   turning - falling - aiming down/down-left - frame 1
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 1
; 9Ah: Facing left-   turning - crouching - aiming down/down-left - frame 1
; C3h: Facing right - moonwalking - turn/jump left-   aiming down-right - frame 1
; C4h: Facing left-   moonwalking - turn/jump right - aiming down-left - frame 1
    dl SamusTiles_Top_Set1_Entry3 : dw $0100,$00C0                       ;92CCE3;

SamusTopTiles_Set1_CCEA:
    dl SamusTiles_Top_Set1_Entry4 : dw $0020,$0000                       ;92CCEA;

SamusTopTiles_Set1_CCF1:
; 9Bh: Facing forward - varia/gravity suit - frame 0
    dl SamusTiles_Top_Set1_Entry5 : dw $0040,$0040                       ;92CCF1;

SamusTopTiles_Set1_CCF8:
; 25h: Facing right - turning - standing - frame 2
; 26h: Facing left-   turning - standing - frame 0
; 2Fh: Facing right - turning - jumping - frame 2
; 30h: Facing left-   turning - jumping - frame 0
; 43h: Facing right - turning - crouching - frame 2
; 44h: Facing left-   turning - crouching - frame 0
; 87h: Facing right - turning - falling - frame 2
; 88h: Facing left-   turning - falling - frame 0
; BFh: Facing right - moonwalking - turn/jump left - frame 2
; C0h: Facing left-   moonwalking - turn/jump right - frame 0
; C6h: Unused - frame 2
    dl SamusTiles_Top_Set1_Entry6 : dw $00C0,$0080                       ;92CCF8;

SamusTopTiles_Set1_CCFF:
; 25h: Facing right - turning - standing - frame 0
; 26h: Facing left-   turning - standing - frame 2
; 2Fh: Facing right - turning - jumping - frame 0
; 30h: Facing left-   turning - jumping - frame 2
; 43h: Facing right - turning - crouching - frame 0
; 44h: Facing left-   turning - crouching - frame 2
; 87h: Facing right - turning - falling - frame 0
; 88h: Facing left-   turning - falling - frame 2
; BFh: Facing right - moonwalking - turn/jump left - frame 0
; C0h: Facing left-   moonwalking - turn/jump right - frame 2
; C6h: Unused - frame 0
    dl SamusTiles_Top_Set1_Entry7 : dw $00C0,$0080                       ;92CCFF;

SamusTopTiles_Set1_CD06:
; 8Bh: Facing right - turning - standing - aiming up - frame 2
; 8Ch: Facing left-   turning - standing - aiming up - frame 0
; 8Fh: Facing right - turning - in air - aiming up - frame 2
; 90h: Facing left-   turning - in air - aiming up - frame 0
; 93h: Facing right - turning - falling - aiming up - frame 2
; 94h: Facing left-   turning - falling - aiming up - frame 0
; 97h: Facing right - turning - crouching - aiming up - frame 2
; 98h: Facing left-   turning - crouching - aiming up - frame 0
; 9Ch: Facing right - turning - standing - aiming up-right - frame 2
; 9Dh: Facing left-   turning - standing - aiming up-left - frame 0
; 9Eh: Facing right - turning - in air - aiming up-right - frame 2
; 9Fh: Facing left-   turning - in air - aiming up-left - frame 0
; A0h: Facing right - turning - falling - aiming up-right - frame 2
; A1h: Facing left-   turning - falling - aiming up-left - frame 0
; A2h: Facing right - turning - crouching - aiming up-right - frame 2
; A3h: Facing left-   turning - crouching - aiming up-left - frame 0
; C1h: Facing right - moonwalking - turn/jump left-   aiming up-right - frame 2
; C2h: Facing left-   moonwalking - turn/jump right - aiming up-left - frame 0
    dl SamusTiles_Top_Set1_Entry8 : dw $00E0,$0040                       ;92CD06;

SamusTopTiles_Set1_CD0D:
; 8Bh: Facing right - turning - standing - aiming up - frame 0
; 8Ch: Facing left-   turning - standing - aiming up - frame 2
; 8Fh: Facing right - turning - in air - aiming up - frame 0
; 90h: Facing left-   turning - in air - aiming up - frame 2
; 93h: Facing right - turning - falling - aiming up - frame 0
; 94h: Facing left-   turning - falling - aiming up - frame 2
; 97h: Facing right - turning - crouching - aiming up - frame 0
; 98h: Facing left-   turning - crouching - aiming up - frame 2
; 9Ch: Facing right - turning - standing - aiming up-right - frame 0
; 9Dh: Facing left-   turning - standing - aiming up-left - frame 2
; 9Eh: Facing right - turning - in air - aiming up-right - frame 0
; 9Fh: Facing left-   turning - in air - aiming up-left - frame 2
; A0h: Facing right - turning - falling - aiming up-right - frame 0
; A1h: Facing left-   turning - falling - aiming up-left - frame 2
; A2h: Facing right - turning - crouching - aiming up-right - frame 0
; A3h: Facing left-   turning - crouching - aiming up-left - frame 2
; C1h: Facing right - moonwalking - turn/jump left-   aiming up-right - frame 0
; C2h: Facing left-   moonwalking - turn/jump right - aiming up-left - frame 2
    dl SamusTiles_Top_Set1_Entry9 : dw $00C0,$0040                       ;92CD0D;

SamusTopTiles_Set1_CD14:
; 25h: Facing right - turning - standing - frame 1
; 26h: Facing left-   turning - standing - frame 1
; 2Fh: Facing right - turning - jumping - frame 1
; 30h: Facing left-   turning - jumping - frame 1
; 43h: Facing right - turning - crouching - frame 1
; 44h: Facing left-   turning - crouching - frame 1
; 87h: Facing right - turning - falling - frame 1
; 88h: Facing left-   turning - falling - frame 1
; BFh: Facing right - moonwalking - turn/jump left - frame 1
; C0h: Facing left-   moonwalking - turn/jump right - frame 1
; C6h: Unused - frame 1
    dl SamusTiles_Top_Set1_EntryA : dw $00E0,$00C0                       ;92CD14;

SamusTopTiles_Set1_CD1B:
; 5Ch: Unused - frame 0
; 64h: Unused. Related to movement type Dh - frame 1
; B9h: Facing right - grapple wall jump pose - frame 0
    dl SamusTiles_Top_Set1_EntryB : dw $0100,$0080                       ;92CD1B;

SamusTopTiles_Set1_CD22:
; 45h: Unused - frame 0
; 46h: Unused - frame 0
; 5Bh: Unused - frame 0
; 63h: Unused. Related to movement type Dh - frame 1
; B8h: Facing left-   grapple wall jump pose - frame 0
    dl SamusTiles_Top_Set1_EntryC : dw $0100,$0080                       ;92CD22;

SamusTopTiles_Set1_CD29:
; 9: Moving right - not aiming - frame 1
    dl SamusTiles_Top_Set1_EntryD : dw $0080,$0080                       ;92CD29;

SamusTopTiles_Set1_CD30:
; 9: Moving right - not aiming - frame 6
    dl SamusTiles_Top_Set1_EntryE : dw $0080,$0080                       ;92CD30;

SamusTopTiles_Set1_CD37:
; Ah: Moving left-   not aiming - frame 1
    dl SamusTiles_Top_Set1_EntryF : dw $0080,$0080                       ;92CD37;

SamusTopTiles_Set1_CD3E:
; Ah: Moving left-   not aiming - frame 6
    dl SamusTiles_Top_Set1_Entry10 : dw $0080,$0080                      ;92CD3E;

SamusTopTiles_Set1_CD45:
; 0: Facing forward - power suit - frame 0
    dl SamusTiles_Top_Set1_Entry11 : dw $0080,$0080                      ;92CD45;

SamusTopTiles_Set1_CD4C:
; 65h: Unused. Related to movement type Dh - frame 0
; 83h: Facing right - wall jump - frame 0
    dl SamusTiles_Top_Set1_Entry12 : dw $0080,$0080                      ;92CD4C;

SamusTopTiles_Set1_CD53:
; 66h: Unused. Related to movement type Dh - frame 0
; 84h: Facing left-   wall jump - frame 0
    dl SamusTiles_Top_Set1_Entry13 : dw $0080,$0080                      ;92CD53;

SamusTopTiles_Set1_CD5A:
; 63h: Unused. Related to movement type Dh - frame 0
; C9h: Facing right - shinespark - horizontal - frame 0
; CDh: Facing right - shinespark - diagonal - frame 0
    dl SamusTiles_Top_Set1_Entry14 : dw $0100,$00C0                      ;92CD5A;

SamusTopTiles_Set1_CD61:
; 64h: Unused. Related to movement type Dh - frame 0
; CAh: Facing left-   shinespark - horizontal - frame 0
; CEh: Facing left-   shinespark - diagonal - frame 0
    dl SamusTiles_Top_Set1_Entry15 : dw $0100,$00C0                      ;92CD61;


UNUSED_SamusTopTiles_Set1_92CD68:
    dl SamusTiles_Top_Set1_Entry16 : dw $0020,$0000                      ;92CD68;

UNUSED_SamusTopTiles_Set1_92CD6F:
    dl SamusTiles_Top_Set1_Entry17 : dw $0020,$0000                      ;92CD6F;


SamusTopTiles_Set1_CD76:
; 8Dh: Facing right - turning - standing - aiming down-right - frame 2
; 8Eh: Facing left-   turning - standing - aiming down-left - frame 0
; 91h: Facing right - turning - in air - aiming down/down-right - frame 2
; 92h: Facing left-   turning - in air - aiming down/down-left - frame 0
; 95h: Facing right - turning - falling - aiming down/down-right - frame 2
; 96h: Facing left-   turning - falling - aiming down/down-left - frame 0
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 2
; 9Ah: Facing left-   turning - crouching - aiming down/down-left - frame 0
; C3h: Facing right - moonwalking - turn/jump left-   aiming down-right - frame 2
; C4h: Facing left-   moonwalking - turn/jump right - aiming down-left - frame 0
    dl SamusTiles_Top_Set1_Entry18 : dw $00E0,$0040                      ;92CD76;

SamusTopTiles_Set1_CD7D:
; 8Dh: Facing right - turning - standing - aiming down-right - frame 0
; 8Eh: Facing left-   turning - standing - aiming down-left - frame 2
; 91h: Facing right - turning - in air - aiming down/down-right - frame 0
; 92h: Facing left-   turning - in air - aiming down/down-left - frame 2
; 95h: Facing right - turning - falling - aiming down/down-right - frame 0
; 96h: Facing left-   turning - falling - aiming down/down-left - frame 2
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 0
; 9Ah: Facing left-   turning - crouching - aiming down/down-left - frame 2
; C3h: Facing right - moonwalking - turn/jump left-   aiming down-right - frame 0
; C4h: Facing left-   moonwalking - turn/jump right - aiming down-left - frame 2
    dl SamusTiles_Top_Set1_Entry19 : dw $00E0,$0040                      ;92CD7D;

SamusTopTiles_Set1_CD84:
; 17h: Facing right - normal jump - aiming down - frame 1
; 2Dh: Facing right - falling - aiming down - frame 1
; AEh: Unused. Facing right - grappling - in air - aiming down - frame 1
    dl SamusTiles_Top_Set1_Entry1A : dw $00C0,$0080                      ;92CD84;

SamusTopTiles_Set1_CD8B:
; 18h: Facing left-   normal jump - aiming down - frame 1
; 2Eh: Facing left-   falling - aiming down - frame 1
; AFh: Unused. Facing left-   grappling - in air - aiming down - frame 1
    dl SamusTiles_Top_Set1_Entry1B : dw $00C0,$0080                      ;92CD8B;

SamusTopTiles_Set1_CD92:
; 19h: Facing right - spin jump - frame Bh
; 1Bh: Facing right - space jump - frame Bh
; 20h: Unused - frame Bh
; 21h: Unused - frame Bh
; 22h: Unused - frame Bh
; 23h: Unused - frame Bh
; 24h: Unused - frame Bh
; 33h: Unused - frame Bh
; 34h: Unused - frame Bh
; 39h: Unused - frame Bh
; 3Ah: Unused - frame Bh
; 42h: Unused - frame Bh
; 81h: Facing right - screw attack - frame 1Bh
    dl SamusTiles_Top_Set1_Entry1C : dw $00C0,$0080                      ;92CD92;

SamusTopTiles_Set1_CD99:
; 1Ah: Facing left-   spin jump - frame Bh
; 1Ch: Facing left-   space jump - frame Bh
; 82h: Facing left-   screw attack - frame 1Bh
    dl SamusTiles_Top_Set1_Entry1D : dw $00C0,$0080                      ;92CD99;


;;; $CDA0: Samus top tiles - set 2 (general) ;;;
SamusTopTiles_Set2_CDA0:
; 4Bh: Facing right - normal jump transition - frame 0
; A4h: Facing right - landing from normal jump - frame 0
; A6h: Facing right - landing from spin jump - frame 1
    dl SamusTiles_Top_Set2_Entry0 : dw $0080,$0040                       ;92CDA0;

SamusTopTiles_Set2_CDA7:
; 4Ch: Facing left-   normal jump transition - frame 0
; A5h: Facing left-   landing from normal jump - frame 0
; A7h: Facing left-   landing from spin jump - frame 1
    dl SamusTiles_Top_Set2_Entry1 : dw $0080,$0080                       ;92CDA7;


UNUSED_SamusTopTiles_Set2_92CDAE:
    dl SamusTiles_Top_Set2_Entry2 : dw $00C0,$0080                       ;92CDAE;


SamusTopTiles_Set2_CDB5:
; E9h: Facing left-   Samus drained - crouching/falling - frame 10h
; E9h: Facing left-   Samus drained - crouching/falling - frame 15h
    dl SamusTiles_Top_Set2_Entry3 : dw $0080,$0080                       ;92CDB5;

SamusTopTiles_Set2_CDBC:
; 19h: Facing right - spin jump - frame 0
; 1Bh: Facing right - space jump - frame 0
; 20h: Unused - frame 0
; 21h: Unused - frame 0
; 22h: Unused - frame 0
; 23h: Unused - frame 0
; 24h: Unused - frame 0
; 29h: Facing right - falling - frame 0
; 29h: Facing right - falling - frame 6
; 33h: Unused - frame 0
; 34h: Unused - frame 0
; 39h: Unused - frame 0
; 3Ah: Unused - frame 0
; 42h: Unused - frame 0
; 50h: Facing right - damage boost - frames 0..1
; 81h: Facing right - screw attack - frame 0
; 83h: Facing right - wall jump - frame 1
; A4h: Facing right - landing from normal jump - frame 1
; A6h: Facing right - landing from spin jump - frame 0
; A6h: Facing right - landing from spin jump - frame 2
; ECh: Facing right - grabbed by Draygon - not moving - not aiming - frame 0
    dl SamusTiles_Top_Set2_Entry4 : dw $0080,$0040                       ;92CDBC;

SamusTopTiles_Set2_CDC3:
; 1Ah: Facing left-   spin jump - frame 0
; 1Ch: Facing left-   space jump - frame 0
; 2Ah: Facing left-   falling - frame 0
; 2Ah: Facing left-   falling - frame 6
; 4Fh: Facing left-   damage boost - frames 0..1
; 82h: Facing left-   screw attack - frame 0
; 84h: Facing left-   wall jump - frame 1
; A5h: Facing left-   landing from normal jump - frame 1
; A7h: Facing left-   landing from spin jump - frame 0
; A7h: Facing left-   landing from spin jump - frame 2
; BAh: Facing left-   grabbed by Draygon - not moving - not aiming - frame 0
    dl SamusTiles_Top_Set2_Entry5 : dw $0080,$0080                       ;92CDC3;

SamusTopTiles_Set2_CDCA:
; 11h: Moving right - aiming down-right - frame 2
; 11h: Moving right - aiming down-right - frame 4
; 11h: Moving right - aiming down-right - frame 7
; 11h: Moving right - aiming down-right - frame 9
; 78h: Facing right - moonwalk - aiming down-right - frames 1..2
; 78h: Facing right - moonwalk - aiming down-right - frames 4..5
    dl SamusTiles_Top_Set2_Entry6 : dw $00E0,$0040                       ;92CDCA;

SamusTopTiles_Set2_CDD1:
; 12h: Moving left-   aiming down-left - frame 2
; 12h: Moving left-   aiming down-left - frame 4
; 12h: Moving left-   aiming down-left - frame 7
; 12h: Moving left-   aiming down-left - frame 9
; 77h: Facing left-   moonwalk - aiming down-left - frames 1..2
; 77h: Facing left-   moonwalk - aiming down-left - frames 4..5
    dl SamusTiles_Top_Set2_Entry7 : dw $00E0,$0040                       ;92CDD1;

SamusTopTiles_Set2_CDD8:
; D5h: Facing right - x-ray - standing - frame 1
; D9h: Facing right - x-ray - crouching - frame 1
    dl SamusTiles_Top_Set2_Entry8 : dw $00C0,$0040                       ;92CDD8;

SamusTopTiles_Set2_CDDF:
; D5h: Facing right - x-ray - standing - frame 0
; D9h: Facing right - x-ray - crouching - frame 0
    dl SamusTiles_Top_Set2_Entry9 : dw $00C0,$0040                       ;92CDDF;

SamusTopTiles_Set2_CDE6:
; D5h: Facing right - x-ray - standing - frame 3
; D9h: Facing right - x-ray - crouching - frame 3
    dl SamusTiles_Top_Set2_EntryA : dw $00C0,$0040                       ;92CDE6;

SamusTopTiles_Set2_CDED:
; D5h: Facing right - x-ray - standing - frame 4
; D9h: Facing right - x-ray - crouching - frame 4
    dl SamusTiles_Top_Set2_EntryB : dw $00C0,$0040                       ;92CDED;

SamusTopTiles_Set2_CDF4:
; D6h: Facing left-   x-ray - standing - frame 1
; DAh: Facing left-   x-ray - crouching - frame 1
    dl SamusTiles_Top_Set2_EntryC : dw $00C0,$0040                       ;92CDF4;

SamusTopTiles_Set2_CDFB:
; D6h: Facing left-   x-ray - standing - frame 0
; DAh: Facing left-   x-ray - crouching - frame 0
    dl SamusTiles_Top_Set2_EntryD : dw $00C0,$0040                       ;92CDFB;

SamusTopTiles_Set2_CE02:
; Dh: Moving right - aiming up (unused) - frame 2
; Dh: Moving right - aiming up (unused) - frame 4
; Dh: Moving right - aiming up (unused) - frame 7
; Dh: Moving right - aiming up (unused) - frame 9
; D6h: Facing left-   x-ray - standing - frame 3
; DAh: Facing left-   x-ray - crouching - frame 3
    dl SamusTiles_Top_Set2_EntryE : dw $00C0,$0040                       ;92CE02;

SamusTopTiles_Set2_CE09:
; Eh: Moving left-   aiming up (unused) - frame 2
; Eh: Moving left-   aiming up (unused) - frame 4
; Eh: Moving left-   aiming up (unused) - frame 7
; Eh: Moving left-   aiming up (unused) - frame 9
; D6h: Facing left-   x-ray - standing - frame 4
; DAh: Facing left-   x-ray - crouching - frame 4
    dl SamusTiles_Top_Set2_EntryF : dw $00C0,$0040                       ;92CE09;

SamusTopTiles_Set2_CE10:
; Fh: Moving right - aiming up-right - frame 2
; Fh: Moving right - aiming up-right - frame 4
; Fh: Moving right - aiming up-right - frame 7
; Fh: Moving right - aiming up-right - frame 9
; 76h: Facing right - moonwalk - aiming up-right - frames 1..2
; 76h: Facing right - moonwalk - aiming up-right - frames 4..5
    dl SamusTiles_Top_Set2_Entry10 : dw $00C0,$0040                      ;92CE10;

SamusTopTiles_Set2_CE17:
; 10h: Moving left-   aiming up-left - frame 2
; 10h: Moving left-   aiming up-left - frame 4
; 10h: Moving left-   aiming up-left - frame 7
; 10h: Moving left-   aiming up-left - frame 9
; 75h: Facing left-   moonwalk - aiming up-left - frames 1..2
; 75h: Facing left-   moonwalk - aiming up-left - frames 4..5
    dl SamusTiles_Top_Set2_Entry11 : dw $00E0,$0040                      ;92CE17;


UNUSED_SamusTopTiles_Set2_92CE1E:
    dl SamusTiles_Top_Set2_Entry12 : dw $0100,$0040                      ;92CE1E;

UNUSED_SamusTopTiles_Set2_92CE25:
    dl SamusTiles_Top_Set2_Entry13 : dw $0100,$0040                      ;92CE25;

UNUSED_SamusTopTiles_Set2_92CE2C:
    dl SamusTiles_Top_Set2_Entry14 : dw $0100,$0040                      ;92CE2C;

UNUSED_SamusTopTiles_Set2_92CE33:
    dl SamusTiles_Top_Set2_Entry15 : dw $0100,$0040                      ;92CE33;


SamusTopTiles_Set2_CE3A:
; Fh: Moving right - aiming up-right - frame 3
; Fh: Moving right - aiming up-right - frame 8
    dl SamusTiles_Top_Set2_Entry16 : dw $00C0,$0040                      ;92CE3A;

SamusTopTiles_Set2_CE41:
; 10h: Moving left-   aiming up-left - frame 3
; 10h: Moving left-   aiming up-left - frame 8
    dl SamusTiles_Top_Set2_Entry17 : dw $00E0,$0040                      ;92CE41;

SamusTopTiles_Set2_CE48:
; 11h: Moving right - aiming down-right - frame 3
; 11h: Moving right - aiming down-right - frame 8
    dl SamusTiles_Top_Set2_Entry18 : dw $00E0,$0040                      ;92CE48;

SamusTopTiles_Set2_CE4F:
; 12h: Moving left-   aiming down-left - frame 3
; 12h: Moving left-   aiming down-left - frame 8
    dl SamusTiles_Top_Set2_Entry19 : dw $00E0,$0040                      ;92CE4F;

SamusTopTiles_Set2_CE56:
; 4Ah: Facing right - moonwalk - frames 1..2
; 4Ah: Facing right - moonwalk - frames 4..5
    dl SamusTiles_Top_Set2_Entry1A : dw $00C0,$0040                      ;92CE56;

SamusTopTiles_Set2_CE5D:
; 49h: Facing left-   moonwalk - frames 1..2
; 49h: Facing left-   moonwalk - frames 4..5
    dl SamusTiles_Top_Set2_Entry1B : dw $00C0,$0040                      ;92CE5D;

SamusTopTiles_Set2_CE64:
; 29h: Facing right - falling - frame 1
; 29h: Facing right - falling - frame 5
    dl SamusTiles_Top_Set2_Entry1C : dw $00E0,$0040                      ;92CE64;

SamusTopTiles_Set2_CE6B:
; 29h: Facing right - falling - frame 2
; 50h: Facing right - damage boost - frame 9
    dl SamusTiles_Top_Set2_Entry1D : dw $00C0,$0040                      ;92CE6B;

SamusTopTiles_Set2_CE72:
; Dh: Moving right - aiming up (unused) - frame 3
; Dh: Moving right - aiming up (unused) - frame 8
; 2Ah: Facing left-   falling - frame 1
; 2Ah: Facing left-   falling - frame 5
    dl SamusTiles_Top_Set2_Entry1E : dw $00C0,$0040                      ;92CE72;

SamusTopTiles_Set2_CE79:
; Eh: Moving left-   aiming up (unused) - frame 3
; Eh: Moving left-   aiming up (unused) - frame 8
; 2Ah: Facing left-   falling - frame 2
; 4Fh: Facing left-   damage boost - frame 9
    dl SamusTiles_Top_Set2_Entry1F : dw $00C0,$0040                      ;92CE79;


;;; $CE80: Samus top tiles - set 3 (facing clockwise - grappling - in air - upside up) ;;;
SamusTopTiles_Set3_CE80:
; 5Dh: Unused - frame 18h
; 5Dh: Unused - frame 38h
; 5Eh: Unused - frame 18h
; 5Eh: Unused - frame 38h
; 5Fh: Unused - frame 18h
; 5Fh: Unused - frame 38h
; 60h: Unused - frame 18h
; 60h: Unused - frame 38h
; 61h: Unused - frame 18h
; 61h: Unused - frame 38h
; B2h: Facing clockwise   -   grapple - in air - frame 18h
; B2h: Facing clockwise   -   grapple - in air - frame 38h
    dl SamusTiles_Top_Set3_Entry0 : dw $00C0,$0080                       ;92CE80;

SamusTopTiles_Set3_CE87:
; 5Dh: Unused - frame 17h
; 5Dh: Unused - frame 37h
; 5Eh: Unused - frame 17h
; 5Eh: Unused - frame 37h
; 5Fh: Unused - frame 17h
; 5Fh: Unused - frame 37h
; 60h: Unused - frame 17h
; 60h: Unused - frame 37h
; 61h: Unused - frame 17h
; 61h: Unused - frame 37h
; B2h: Facing clockwise   -   grapple - in air - frame 17h
; B2h: Facing clockwise   -   grapple - in air - frame 37h
    dl SamusTiles_Top_Set3_Entry1 : dw $00C0,$0080                       ;92CE87;

SamusTopTiles_Set3_CE8E:
; 5Dh: Unused - frame 16h
; 5Dh: Unused - frame 36h
; 5Eh: Unused - frame 16h
; 5Eh: Unused - frame 36h
; 5Fh: Unused - frame 16h
; 5Fh: Unused - frame 36h
; 60h: Unused - frame 16h
; 60h: Unused - frame 36h
; 61h: Unused - frame 16h
; 61h: Unused - frame 36h
; B2h: Facing clockwise   -   grapple - in air - frame 16h
; B2h: Facing clockwise   -   grapple - in air - frame 36h
    dl SamusTiles_Top_Set3_Entry2 : dw $00C0,$00C0                       ;92CE8E;

SamusTopTiles_Set3_CE95:
; 5Dh: Unused - frame 15h
; 5Dh: Unused - frame 35h
; 5Eh: Unused - frame 15h
; 5Eh: Unused - frame 35h
; 5Fh: Unused - frame 15h
; 5Fh: Unused - frame 35h
; 60h: Unused - frame 15h
; 60h: Unused - frame 35h
; 61h: Unused - frame 15h
; 61h: Unused - frame 35h
; B2h: Facing clockwise   -   grapple - in air - frame 15h
; B2h: Facing clockwise   -   grapple - in air - frame 35h
    dl SamusTiles_Top_Set3_Entry3 : dw $00C0,$00C0                       ;92CE95;

SamusTopTiles_Set3_CE9C:
; 5Dh: Unused - frame 14h
; 5Dh: Unused - frame 34h
; 5Eh: Unused - frame 14h
; 5Eh: Unused - frame 34h
; 5Fh: Unused - frame 14h
; 5Fh: Unused - frame 34h
; 60h: Unused - frame 14h
; 60h: Unused - frame 34h
; 61h: Unused - frame 14h
; 61h: Unused - frame 34h
; B2h: Facing clockwise   -   grapple - in air - frame 14h
; B2h: Facing clockwise   -   grapple - in air - frame 34h
    dl SamusTiles_Top_Set3_Entry4 : dw $00C0,$00C0                       ;92CE9C;

SamusTopTiles_Set3_CEA3:
; 5Dh: Unused - frame 13h
; 5Dh: Unused - frame 33h
; 5Eh: Unused - frame 13h
; 5Eh: Unused - frame 33h
; 5Fh: Unused - frame 13h
; 5Fh: Unused - frame 33h
; 60h: Unused - frame 13h
; 60h: Unused - frame 33h
; 61h: Unused - frame 13h
; 61h: Unused - frame 33h
; B2h: Facing clockwise   -   grapple - in air - frame 13h
; B2h: Facing clockwise   -   grapple - in air - frame 33h
    dl SamusTiles_Top_Set3_Entry5 : dw $00C0,$00C0                       ;92CEA3;

SamusTopTiles_Set3_CEAA:
; 5Dh: Unused - frame 12h
; 5Dh: Unused - frame 32h
; 5Eh: Unused - frame 12h
; 5Eh: Unused - frame 32h
; 5Fh: Unused - frame 12h
; 5Fh: Unused - frame 32h
; 60h: Unused - frame 12h
; 60h: Unused - frame 32h
; 61h: Unused - frame 12h
; 61h: Unused - frame 32h
; B2h: Facing clockwise   -   grapple - in air - frame 12h
; B2h: Facing clockwise   -   grapple - in air - frame 32h
    dl SamusTiles_Top_Set3_Entry6 : dw $00C0,$00C0                       ;92CEAA;

SamusTopTiles_Set3_CEB1:
; 5Dh: Unused - frame 11h
; 5Dh: Unused - frame 31h
; 5Eh: Unused - frame 11h
; 5Eh: Unused - frame 31h
; 5Fh: Unused - frame 11h
; 5Fh: Unused - frame 31h
; 60h: Unused - frame 11h
; 60h: Unused - frame 31h
; 61h: Unused - frame 11h
; 61h: Unused - frame 31h
; B2h: Facing clockwise   -   grapple - in air - frame 11h
; B2h: Facing clockwise   -   grapple - in air - frame 31h
    dl SamusTiles_Top_Set3_Entry7 : dw $00C0,$0080                       ;92CEB1;

SamusTopTiles_Set3_CEB8:
; 5Dh: Unused - frame 10h
; 5Dh: Unused - frame 30h
; 5Dh: Unused - frames 40h..41h
; 5Eh: Unused - frame 10h
; 5Eh: Unused - frame 30h
; 5Eh: Unused - frames 40h..41h
; 5Fh: Unused - frame 10h
; 5Fh: Unused - frame 30h
; 5Fh: Unused - frames 40h..41h
; 60h: Unused - frame 10h
; 60h: Unused - frame 30h
; 60h: Unused - frames 40h..41h
; 61h: Unused - frame 10h
; 61h: Unused - frame 30h
; 61h: Unused - frames 40h..41h
; B2h: Facing clockwise   -   grapple - in air - frame 10h
; B2h: Facing clockwise   -   grapple - in air - frame 30h
; B2h: Facing clockwise   -   grapple - in air - frames 40h..41h
    dl SamusTiles_Top_Set3_Entry8 : dw $00C0,$0080                       ;92CEB8;

SamusTopTiles_Set3_CEBF:
; 5Dh: Unused - frame Fh
; 5Dh: Unused - frame 2Fh
; 5Eh: Unused - frame Fh
; 5Eh: Unused - frame 2Fh
; 5Fh: Unused - frame Fh
; 5Fh: Unused - frame 2Fh
; 60h: Unused - frame Fh
; 60h: Unused - frame 2Fh
; 61h: Unused - frame Fh
; 61h: Unused - frame 2Fh
; B2h: Facing clockwise   -   grapple - in air - frame Fh
; B2h: Facing clockwise   -   grapple - in air - frame 2Fh
    dl SamusTiles_Top_Set3_Entry9 : dw $00C0,$0080                       ;92CEBF;

SamusTopTiles_Set3_CEC6:
; 5Dh: Unused - frame Eh
; 5Dh: Unused - frame 2Eh
; 5Eh: Unused - frame Eh
; 5Eh: Unused - frame 2Eh
; 5Fh: Unused - frame Eh
; 5Fh: Unused - frame 2Eh
; 60h: Unused - frame Eh
; 60h: Unused - frame 2Eh
; 61h: Unused - frame Eh
; 61h: Unused - frame 2Eh
; B2h: Facing clockwise   -   grapple - in air - frame Eh
; B2h: Facing clockwise   -   grapple - in air - frame 2Eh
    dl SamusTiles_Top_Set3_EntryA : dw $00C0,$00C0                       ;92CEC6;

SamusTopTiles_Set3_CECD:
; 5Dh: Unused - frame Dh
; 5Dh: Unused - frame 2Dh
; 5Eh: Unused - frame Dh
; 5Eh: Unused - frame 2Dh
; 5Fh: Unused - frame Dh
; 5Fh: Unused - frame 2Dh
; 60h: Unused - frame Dh
; 60h: Unused - frame 2Dh
; 61h: Unused - frame Dh
; 61h: Unused - frame 2Dh
; B2h: Facing clockwise   -   grapple - in air - frame Dh
; B2h: Facing clockwise   -   grapple - in air - frame 2Dh
    dl SamusTiles_Top_Set3_EntryB : dw $00C0,$00C0                       ;92CECD;

SamusTopTiles_Set3_CED4:
; 5Dh: Unused - frame Ch
; 5Dh: Unused - frame 2Ch
; 5Eh: Unused - frame Ch
; 5Eh: Unused - frame 2Ch
; 5Fh: Unused - frame Ch
; 5Fh: Unused - frame 2Ch
; 60h: Unused - frame Ch
; 60h: Unused - frame 2Ch
; 61h: Unused - frame Ch
; 61h: Unused - frame 2Ch
; B2h: Facing clockwise   -   grapple - in air - frame Ch
; B2h: Facing clockwise   -   grapple - in air - frame 2Ch
    dl SamusTiles_Top_Set3_EntryC : dw $00C0,$00C0                       ;92CED4;

SamusTopTiles_Set3_CEDB:
; 5Dh: Unused - frame Bh
; 5Dh: Unused - frame 2Bh
; 5Eh: Unused - frame Bh
; 5Eh: Unused - frame 2Bh
; 5Fh: Unused - frame Bh
; 5Fh: Unused - frame 2Bh
; 60h: Unused - frame Bh
; 60h: Unused - frame 2Bh
; 61h: Unused - frame Bh
; 61h: Unused - frame 2Bh
; B2h: Facing clockwise   -   grapple - in air - frame Bh
; B2h: Facing clockwise   -   grapple - in air - frame 2Bh
    dl SamusTiles_Top_Set3_EntryD : dw $00C0,$00C0                       ;92CEDB;

SamusTopTiles_Set3_CEE2:
; 5Dh: Unused - frame Ah
; 5Dh: Unused - frame 2Ah
; 5Eh: Unused - frame Ah
; 5Eh: Unused - frame 2Ah
; 5Fh: Unused - frame Ah
; 5Fh: Unused - frame 2Ah
; 60h: Unused - frame Ah
; 60h: Unused - frame 2Ah
; 61h: Unused - frame Ah
; 61h: Unused - frame 2Ah
; B2h: Facing clockwise   -   grapple - in air - frame Ah
; B2h: Facing clockwise   -   grapple - in air - frame 2Ah
    dl SamusTiles_Top_Set3_EntryE : dw $00C0,$00C0                       ;92CEE2;

SamusTopTiles_Set3_CEE9:
; 5Dh: Unused - frame 9
; 5Dh: Unused - frame 29h
; 5Eh: Unused - frame 9
; 5Eh: Unused - frame 29h
; 5Fh: Unused - frame 9
; 5Fh: Unused - frame 29h
; 60h: Unused - frame 9
; 60h: Unused - frame 29h
; 61h: Unused - frame 9
; 61h: Unused - frame 29h
; B2h: Facing clockwise   -   grapple - in air - frame 9
; B2h: Facing clockwise   -   grapple - in air - frame 29h
    dl SamusTiles_Top_Set3_EntryF : dw $00C0,$0080                       ;92CEE9;


UNUSED_SamusTopTiles_Set3_92CEF0:
    dl SamusTiles_Top_Set3_Entry10 : dw $00C0,$0080                      ;92CEF0;



;;; $CEF7: Samus top tiles - set 4 (facing anticlockwise - grappling - in air - upside up) ;;;
SamusTopTiles_Set4_CEF7:
; 62h: Unused - frame 8
; 62h: Unused - frame 28h
; B3h: Facing anticlockwise - grapple - in air - frame 8
; B3h: Facing anticlockwise - grapple - in air - frame 28h
    dl SamusTiles_Top_Set4_Entry0 : dw $0100,$00C0                       ;92CEF7;

SamusTopTiles_Set4_CEFE:
; 62h: Unused - frame 9
; 62h: Unused - frame 29h
; B3h: Facing anticlockwise - grapple - in air - frame 9
; B3h: Facing anticlockwise - grapple - in air - frame 29h
    dl SamusTiles_Top_Set4_Entry1 : dw $0100,$00C0                       ;92CEFE;

SamusTopTiles_Set4_CF05:
; 62h: Unused - frame Ah
; 62h: Unused - frame 2Ah
; B3h: Facing anticlockwise - grapple - in air - frame Ah
; B3h: Facing anticlockwise - grapple - in air - frame 2Ah
    dl SamusTiles_Top_Set4_Entry2 : dw $0100,$0100                       ;92CF05;

SamusTopTiles_Set4_CF0C:
; 62h: Unused - frame Bh
; 62h: Unused - frame 2Bh
; B3h: Facing anticlockwise - grapple - in air - frame Bh
; B3h: Facing anticlockwise - grapple - in air - frame 2Bh
    dl SamusTiles_Top_Set4_Entry3 : dw $0100,$0100                       ;92CF0C;

SamusTopTiles_Set4_CF13:
; 62h: Unused - frame Ch
; 62h: Unused - frame 2Ch
; B3h: Facing anticlockwise - grapple - in air - frame Ch
; B3h: Facing anticlockwise - grapple - in air - frame 2Ch
    dl SamusTiles_Top_Set4_Entry4 : dw $0100,$00E0                       ;92CF13;

SamusTopTiles_Set4_CF1A:
; 62h: Unused - frame Dh
; 62h: Unused - frame 2Dh
; B3h: Facing anticlockwise - grapple - in air - frame Dh
; B3h: Facing anticlockwise - grapple - in air - frame 2Dh
    dl SamusTiles_Top_Set4_Entry5 : dw $0100,$00E0                       ;92CF1A;

SamusTopTiles_Set4_CF21:
; 62h: Unused - frame Eh
; 62h: Unused - frame 2Eh
; B3h: Facing anticlockwise - grapple - in air - frame Eh
; B3h: Facing anticlockwise - grapple - in air - frame 2Eh
    dl SamusTiles_Top_Set4_Entry6 : dw $0100,$00E0                       ;92CF21;

SamusTopTiles_Set4_CF28:
; 62h: Unused - frame Fh
; 62h: Unused - frame 2Fh
; B3h: Facing anticlockwise - grapple - in air - frame Fh
; B3h: Facing anticlockwise - grapple - in air - frame 2Fh
    dl SamusTiles_Top_Set4_Entry7 : dw $0100,$00C0                       ;92CF28;

SamusTopTiles_Set4_CF2F:
; 62h: Unused - frame 10h
; 62h: Unused - frame 30h
; 62h: Unused - frames 40h..41h
; B3h: Facing anticlockwise - grapple - in air - frame 10h
; B3h: Facing anticlockwise - grapple - in air - frame 30h
; B3h: Facing anticlockwise - grapple - in air - frames 40h..41h
    dl SamusTiles_Top_Set4_Entry8 : dw $0100,$00C0                       ;92CF2F;

SamusTopTiles_Set4_CF36:
; 62h: Unused - frame 11h
; 62h: Unused - frame 31h
; B3h: Facing anticlockwise - grapple - in air - frame 11h
; B3h: Facing anticlockwise - grapple - in air - frame 31h
    dl SamusTiles_Top_Set4_Entry9 : dw $0100,$00C0                       ;92CF36;

SamusTopTiles_Set4_CF3D:
; 62h: Unused - frame 12h
; 62h: Unused - frame 32h
; B3h: Facing anticlockwise - grapple - in air - frame 12h
; B3h: Facing anticlockwise - grapple - in air - frame 32h
    dl SamusTiles_Top_Set4_EntryA : dw $0100,$00E0                       ;92CF3D;

SamusTopTiles_Set4_CF44:
; 62h: Unused - frame 13h
; 62h: Unused - frame 33h
; B3h: Facing anticlockwise - grapple - in air - frame 13h
; B3h: Facing anticlockwise - grapple - in air - frame 33h
    dl SamusTiles_Top_Set4_EntryB : dw $0100,$0100                       ;92CF44;

SamusTopTiles_Set4_CF4B:
; 62h: Unused - frame 14h
; 62h: Unused - frame 34h
; B3h: Facing anticlockwise - grapple - in air - frame 14h
; B3h: Facing anticlockwise - grapple - in air - frame 34h
    dl SamusTiles_Top_Set4_EntryC : dw $0100,$0100                       ;92CF4B;

SamusTopTiles_Set4_CF52:
; 62h: Unused - frame 15h
; 62h: Unused - frame 35h
; B3h: Facing anticlockwise - grapple - in air - frame 15h
; B3h: Facing anticlockwise - grapple - in air - frame 35h
    dl SamusTiles_Top_Set4_EntryD : dw $0100,$0100                       ;92CF52;

SamusTopTiles_Set4_CF59:
; 62h: Unused - frame 16h
; 62h: Unused - frame 36h
; B3h: Facing anticlockwise - grapple - in air - frame 16h
; B3h: Facing anticlockwise - grapple - in air - frame 36h
    dl SamusTiles_Top_Set4_EntryE : dw $0100,$0100                       ;92CF59;

SamusTopTiles_Set4_CF60:
; 62h: Unused - frame 17h
; 62h: Unused - frame 37h
; B3h: Facing anticlockwise - grapple - in air - frame 17h
; B3h: Facing anticlockwise - grapple - in air - frame 37h
    dl SamusTiles_Top_Set4_EntryF : dw $0100,$00E0                       ;92CF60;


UNUSED_SamusTopTiles_Set4_92CF67:
    dl SamusTiles_Top_Set4_Entry10 : dw $0100,$00E0                      ;92CF67;



;;; $CF6E: Samus top tiles - set 5 (facing clockwise - grappling - in air - upside down) ;;;
SamusTopTiles_Set5_CF6E:
; 5Dh: Unused - frame 8
; 5Dh: Unused - frame 28h
; 5Eh: Unused - frame 8
; 5Eh: Unused - frame 28h
; 5Fh: Unused - frame 8
; 5Fh: Unused - frame 28h
; 60h: Unused - frame 8
; 60h: Unused - frame 28h
; 61h: Unused - frame 8
; 61h: Unused - frame 28h
; B2h: Facing clockwise   -   grapple - in air - frame 8
; B2h: Facing clockwise   -   grapple - in air - frame 28h
    dl SamusTiles_Top_Set5_Entry0 : dw $00C0,$0080                       ;92CF6E;

SamusTopTiles_Set5_CF75:
; 5Dh: Unused - frame 7
; 5Dh: Unused - frame 27h
; 5Eh: Unused - frame 7
; 5Eh: Unused - frame 27h
; 5Fh: Unused - frame 7
; 5Fh: Unused - frame 27h
; 60h: Unused - frame 7
; 60h: Unused - frame 27h
; 61h: Unused - frame 7
; 61h: Unused - frame 27h
; B2h: Facing clockwise   -   grapple - in air - frame 7
; B2h: Facing clockwise   -   grapple - in air - frame 27h
    dl SamusTiles_Top_Set5_Entry1 : dw $00C0,$0080                       ;92CF75;

SamusTopTiles_Set5_CF7C:
; 5Dh: Unused - frame 6
; 5Dh: Unused - frame 26h
; 5Eh: Unused - frame 6
; 5Eh: Unused - frame 26h
; 5Fh: Unused - frame 6
; 5Fh: Unused - frame 26h
; 60h: Unused - frame 6
; 60h: Unused - frame 26h
; 61h: Unused - frame 6
; 61h: Unused - frame 26h
; B2h: Facing clockwise   -   grapple - in air - frame 6
; B2h: Facing clockwise   -   grapple - in air - frame 26h
    dl SamusTiles_Top_Set5_Entry2 : dw $00C0,$00C0                       ;92CF7C;

SamusTopTiles_Set5_CF83:
; 5Dh: Unused - frame 5
; 5Dh: Unused - frame 25h
; 5Eh: Unused - frame 5
; 5Eh: Unused - frame 25h
; 5Fh: Unused - frame 5
; 5Fh: Unused - frame 25h
; 60h: Unused - frame 5
; 60h: Unused - frame 25h
; 61h: Unused - frame 5
; 61h: Unused - frame 25h
; B2h: Facing clockwise   -   grapple - in air - frame 5
; B2h: Facing clockwise   -   grapple - in air - frame 25h
    dl SamusTiles_Top_Set5_Entry3 : dw $00C0,$00C0                       ;92CF83;

SamusTopTiles_Set5_CF8A:
; 5Dh: Unused - frame 4
; 5Dh: Unused - frame 24h
; 5Eh: Unused - frame 4
; 5Eh: Unused - frame 24h
; 5Fh: Unused - frame 4
; 5Fh: Unused - frame 24h
; 60h: Unused - frame 4
; 60h: Unused - frame 24h
; 61h: Unused - frame 4
; 61h: Unused - frame 24h
; B2h: Facing clockwise   -   grapple - in air - frame 4
; B2h: Facing clockwise   -   grapple - in air - frame 24h
    dl SamusTiles_Top_Set5_Entry4 : dw $00C0,$00C0                       ;92CF8A;

SamusTopTiles_Set5_CF91:
; 5Dh: Unused - frame 3
; 5Dh: Unused - frame 23h
; 5Eh: Unused - frame 3
; 5Eh: Unused - frame 23h
; 5Fh: Unused - frame 3
; 5Fh: Unused - frame 23h
; 60h: Unused - frame 3
; 60h: Unused - frame 23h
; 61h: Unused - frame 3
; 61h: Unused - frame 23h
; B2h: Facing clockwise   -   grapple - in air - frame 3
; B2h: Facing clockwise   -   grapple - in air - frame 23h
    dl SamusTiles_Top_Set5_Entry5 : dw $00C0,$00C0                       ;92CF91;

SamusTopTiles_Set5_CF98:
; 5Dh: Unused - frame 2
; 5Dh: Unused - frame 22h
; 5Eh: Unused - frame 2
; 5Eh: Unused - frame 22h
; 5Fh: Unused - frame 2
; 5Fh: Unused - frame 22h
; 60h: Unused - frame 2
; 60h: Unused - frame 22h
; 61h: Unused - frame 2
; 61h: Unused - frame 22h
; B2h: Facing clockwise   -   grapple - in air - frame 2
; B2h: Facing clockwise   -   grapple - in air - frame 22h
    dl SamusTiles_Top_Set5_Entry6 : dw $00C0,$00C0                       ;92CF98;

SamusTopTiles_Set5_CF9F:
; 5Dh: Unused - frame 1
; 5Dh: Unused - frame 21h
; 5Eh: Unused - frame 1
; 5Eh: Unused - frame 21h
; 5Fh: Unused - frame 1
; 5Fh: Unused - frame 21h
; 60h: Unused - frame 1
; 60h: Unused - frame 21h
; 61h: Unused - frame 1
; 61h: Unused - frame 21h
; B2h: Facing clockwise   -   grapple - in air - frame 1
; B2h: Facing clockwise   -   grapple - in air - frame 21h
    dl SamusTiles_Top_Set5_Entry7 : dw $00C0,$0080                       ;92CF9F;

SamusTopTiles_Set5_CFA6:
; 5Dh: Unused - frame 0
; 5Dh: Unused - frame 20h
; 5Eh: Unused - frame 0
; 5Eh: Unused - frame 20h
; 5Fh: Unused - frame 0
; 5Fh: Unused - frame 20h
; 60h: Unused - frame 0
; 60h: Unused - frame 20h
; 61h: Unused - frame 0
; 61h: Unused - frame 20h
; B2h: Facing clockwise   -   grapple - in air - frame 0
; B2h: Facing clockwise   -   grapple - in air - frame 20h
    dl SamusTiles_Top_Set5_Entry8 : dw $00C0,$0080                       ;92CFA6;

SamusTopTiles_Set5_CFAD:
; 5Dh: Unused - frame 1Fh
; 5Dh: Unused - frame 3Fh
; 5Eh: Unused - frame 1Fh
; 5Eh: Unused - frame 3Fh
; 5Fh: Unused - frame 1Fh
; 5Fh: Unused - frame 3Fh
; 60h: Unused - frame 1Fh
; 60h: Unused - frame 3Fh
; 61h: Unused - frame 1Fh
; 61h: Unused - frame 3Fh
; B2h: Facing clockwise   -   grapple - in air - frame 1Fh
; B2h: Facing clockwise   -   grapple - in air - frame 3Fh
    dl SamusTiles_Top_Set5_Entry9 : dw $00C0,$0080                       ;92CFAD;

SamusTopTiles_Set5_CFB4:
; 5Dh: Unused - frame 1Eh
; 5Dh: Unused - frame 3Eh
; 5Eh: Unused - frame 1Eh
; 5Eh: Unused - frame 3Eh
; 5Fh: Unused - frame 1Eh
; 5Fh: Unused - frame 3Eh
; 60h: Unused - frame 1Eh
; 60h: Unused - frame 3Eh
; 61h: Unused - frame 1Eh
; 61h: Unused - frame 3Eh
; B2h: Facing clockwise   -   grapple - in air - frame 1Eh
; B2h: Facing clockwise   -   grapple - in air - frame 3Eh
    dl SamusTiles_Top_Set5_EntryA : dw $00C0,$00C0                       ;92CFB4;

SamusTopTiles_Set5_CFBB:
; 5Dh: Unused - frame 1Dh
; 5Dh: Unused - frame 3Dh
; 5Eh: Unused - frame 1Dh
; 5Eh: Unused - frame 3Dh
; 5Fh: Unused - frame 1Dh
; 5Fh: Unused - frame 3Dh
; 60h: Unused - frame 1Dh
; 60h: Unused - frame 3Dh
; 61h: Unused - frame 1Dh
; 61h: Unused - frame 3Dh
; B2h: Facing clockwise   -   grapple - in air - frame 1Dh
; B2h: Facing clockwise   -   grapple - in air - frame 3Dh
    dl SamusTiles_Top_Set5_EntryB : dw $00C0,$00C0                       ;92CFBB;

SamusTopTiles_Set5_CFC2:
; 5Dh: Unused - frame 1Ch
; 5Dh: Unused - frame 3Ch
; 5Eh: Unused - frame 1Ch
; 5Eh: Unused - frame 3Ch
; 5Fh: Unused - frame 1Ch
; 5Fh: Unused - frame 3Ch
; 60h: Unused - frame 1Ch
; 60h: Unused - frame 3Ch
; 61h: Unused - frame 1Ch
; 61h: Unused - frame 3Ch
; B2h: Facing clockwise   -   grapple - in air - frame 1Ch
; B2h: Facing clockwise   -   grapple - in air - frame 3Ch
    dl SamusTiles_Top_Set5_EntryC : dw $00C0,$00C0                       ;92CFC2;

SamusTopTiles_Set5_CFC9:
; 5Dh: Unused - frame 1Bh
; 5Dh: Unused - frame 3Bh
; 5Eh: Unused - frame 1Bh
; 5Eh: Unused - frame 3Bh
; 5Fh: Unused - frame 1Bh
; 5Fh: Unused - frame 3Bh
; 60h: Unused - frame 1Bh
; 60h: Unused - frame 3Bh
; 61h: Unused - frame 1Bh
; 61h: Unused - frame 3Bh
; B2h: Facing clockwise   -   grapple - in air - frame 1Bh
; B2h: Facing clockwise   -   grapple - in air - frame 3Bh
    dl SamusTiles_Top_Set5_EntryD : dw $00C0,$00C0                       ;92CFC9;

SamusTopTiles_Set5_CFD0:
; 5Dh: Unused - frame 1Ah
; 5Dh: Unused - frame 3Ah
; 5Eh: Unused - frame 1Ah
; 5Eh: Unused - frame 3Ah
; 5Fh: Unused - frame 1Ah
; 5Fh: Unused - frame 3Ah
; 60h: Unused - frame 1Ah
; 60h: Unused - frame 3Ah
; 61h: Unused - frame 1Ah
; 61h: Unused - frame 3Ah
; B2h: Facing clockwise   -   grapple - in air - frame 1Ah
; B2h: Facing clockwise   -   grapple - in air - frame 3Ah
    dl SamusTiles_Top_Set5_EntryE : dw $00C0,$00C0                       ;92CFD0;

SamusTopTiles_Set5_CFD7:
; 5Dh: Unused - frame 19h
; 5Dh: Unused - frame 39h
; 5Eh: Unused - frame 19h
; 5Eh: Unused - frame 39h
; 5Fh: Unused - frame 19h
; 5Fh: Unused - frame 39h
; 60h: Unused - frame 19h
; 60h: Unused - frame 39h
; 61h: Unused - frame 19h
; 61h: Unused - frame 39h
; B2h: Facing clockwise   -   grapple - in air - frame 19h
; B2h: Facing clockwise   -   grapple - in air - frame 39h
    dl SamusTiles_Top_Set5_EntryF : dw $00C0,$0080                       ;92CFD7;


UNUSED_SamusTopTiles_Set5_92CFDE:
    dl SamusTiles_Top_Set5_Entry10 : dw $00C0,$0080                      ;92CFDE;



;;; $CFE5: Samus top tiles - set 6 (facing anticlockwise - grappling - in air - upside down) ;;;
SamusTopTiles_Set6_CFE5:
; 62h: Unused - frame 18h
; 62h: Unused - frame 38h
; B3h: Facing anticlockwise - grapple - in air - frame 18h
; B3h: Facing anticlockwise - grapple - in air - frame 38h
    dl SamusTiles_Top_Set6_Entry0 : dw $0100,$00C0                       ;92CFE5;

SamusTopTiles_Set6_CFEC:
; 62h: Unused - frame 19h
; 62h: Unused - frame 39h
; B3h: Facing anticlockwise - grapple - in air - frame 19h
; B3h: Facing anticlockwise - grapple - in air - frame 39h
    dl SamusTiles_Top_Set6_Entry1 : dw $0100,$00C0                       ;92CFEC;

SamusTopTiles_Set6_CFF3:
; 62h: Unused - frame 1Ah
; 62h: Unused - frame 3Ah
; B3h: Facing anticlockwise - grapple - in air - frame 1Ah
; B3h: Facing anticlockwise - grapple - in air - frame 3Ah
    dl SamusTiles_Top_Set6_Entry2 : dw $0100,$0100                       ;92CFF3;

SamusTopTiles_Set6_CFFA:
; 62h: Unused - frame 1Bh
; 62h: Unused - frame 3Bh
; B3h: Facing anticlockwise - grapple - in air - frame 1Bh
; B3h: Facing anticlockwise - grapple - in air - frame 3Bh
    dl SamusTiles_Top_Set6_Entry3 : dw $0100,$0100                       ;92CFFA;

SamusTopTiles_Set6_D001:
; 62h: Unused - frame 1Ch
; 62h: Unused - frame 3Ch
; B3h: Facing anticlockwise - grapple - in air - frame 1Ch
; B3h: Facing anticlockwise - grapple - in air - frame 3Ch
    dl SamusTiles_Top_Set6_Entry4 : dw $0100,$00E0                       ;92D001;

SamusTopTiles_Set6_D008:
; 62h: Unused - frame 1Dh
; 62h: Unused - frame 3Dh
; B3h: Facing anticlockwise - grapple - in air - frame 1Dh
; B3h: Facing anticlockwise - grapple - in air - frame 3Dh
    dl SamusTiles_Top_Set6_Entry5 : dw $0100,$00E0                       ;92D008;

SamusTopTiles_Set6_D00F:
; 62h: Unused - frame 1Eh
; 62h: Unused - frame 3Eh
; B3h: Facing anticlockwise - grapple - in air - frame 1Eh
; B3h: Facing anticlockwise - grapple - in air - frame 3Eh
    dl SamusTiles_Top_Set6_Entry6 : dw $0100,$00E0                       ;92D00F;

SamusTopTiles_Set6_D016:
; 62h: Unused - frame 1Fh
; 62h: Unused - frame 3Fh
; B3h: Facing anticlockwise - grapple - in air - frame 1Fh
; B3h: Facing anticlockwise - grapple - in air - frame 3Fh
    dl SamusTiles_Top_Set6_Entry7 : dw $0100,$00C0                       ;92D016;

SamusTopTiles_Set6_D01D:
; 62h: Unused - frame 0
; 62h: Unused - frame 20h
; B3h: Facing anticlockwise - grapple - in air - frame 0
; B3h: Facing anticlockwise - grapple - in air - frame 20h
    dl SamusTiles_Top_Set6_Entry8 : dw $0100,$00C0                       ;92D01D;

SamusTopTiles_Set6_D024:
; 62h: Unused - frame 1
; 62h: Unused - frame 21h
; B3h: Facing anticlockwise - grapple - in air - frame 1
; B3h: Facing anticlockwise - grapple - in air - frame 21h
    dl SamusTiles_Top_Set6_Entry9 : dw $0100,$00C0                       ;92D024;

SamusTopTiles_Set6_D02B:
; 62h: Unused - frame 2
; 62h: Unused - frame 22h
; B3h: Facing anticlockwise - grapple - in air - frame 2
; B3h: Facing anticlockwise - grapple - in air - frame 22h
    dl SamusTiles_Top_Set6_EntryA : dw $0100,$00E0                       ;92D02B;

SamusTopTiles_Set6_D032:
; 62h: Unused - frame 3
; 62h: Unused - frame 23h
; B3h: Facing anticlockwise - grapple - in air - frame 3
; B3h: Facing anticlockwise - grapple - in air - frame 23h
    dl SamusTiles_Top_Set6_EntryB : dw $0100,$0100                       ;92D032;

SamusTopTiles_Set6_D039:
; 62h: Unused - frame 4
; 62h: Unused - frame 24h
; B3h: Facing anticlockwise - grapple - in air - frame 4
; B3h: Facing anticlockwise - grapple - in air - frame 24h
    dl SamusTiles_Top_Set6_EntryC : dw $0100,$0100                       ;92D039;

SamusTopTiles_Set6_D040:
; 62h: Unused - frame 5
; 62h: Unused - frame 25h
; B3h: Facing anticlockwise - grapple - in air - frame 5
; B3h: Facing anticlockwise - grapple - in air - frame 25h
    dl SamusTiles_Top_Set6_EntryD : dw $0100,$0100                       ;92D040;

SamusTopTiles_Set6_D047:
; 62h: Unused - frame 6
; 62h: Unused - frame 26h
; B3h: Facing anticlockwise - grapple - in air - frame 6
; B3h: Facing anticlockwise - grapple - in air - frame 26h
    dl SamusTiles_Top_Set6_EntryE : dw $0100,$0100                       ;92D047;

SamusTopTiles_Set6_D04E:
; 62h: Unused - frame 7
; 62h: Unused - frame 27h
; B3h: Facing anticlockwise - grapple - in air - frame 7
; B3h: Facing anticlockwise - grapple - in air - frame 27h
    dl SamusTiles_Top_Set6_EntryF : dw $0100,$00E0                       ;92D04E;


UNUSED_SamusTopTiles_Set6_92D055:
    dl SamusTiles_Top_Set6_Entry10 : dw $0100,$00E0                      ;92D055;



;;; $D05C: Samus top tiles - set 7 (standing, crouching, drained) ;;;
SamusTopTiles_Set7_D05C:
; E9h: Facing left-   Samus drained - crouching/falling - frame 8
; E9h: Facing left-   Samus drained - crouching/falling - frame 1Ah
; E9h: Facing left-   Samus drained - crouching/falling - frame 1Dh
    dl SamusTiles_Top_Set7_Entry0 : dw $00E0,$0040                       ;92D05C;

SamusTopTiles_Set7_D063:
; E9h: Facing left-   Samus drained - crouching/falling - frame 7
; E9h: Facing left-   Samus drained - crouching/falling - frame 9
; E9h: Facing left-   Samus drained - crouching/falling - frame Bh
; E9h: Facing left-   Samus drained - crouching/falling - frame Eh
; E9h: Facing left-   Samus drained - crouching/falling - frame 13h
; E9h: Facing left-   Samus drained - crouching/falling - frame 17h
    dl SamusTiles_Top_Set7_Entry1 : dw $00E0,$0040                       ;92D063;

SamusTopTiles_Set7_D06A:
; E9h: Facing left-   Samus drained - crouching/falling - frame Ah
    dl SamusTiles_Top_Set7_Entry2 : dw $00E0,$0040                       ;92D06A;

SamusTopTiles_Set7_D071:
; E8h: Facing right - Samus drained - crouching/falling - frame 8
    dl SamusTiles_Top_Set7_Entry3 : dw $0100,$0040                       ;92D071;

SamusTopTiles_Set7_D078:
; E8h: Facing right - Samus drained - crouching/falling - frame 9
; E8h: Facing right - Samus drained - crouching/falling - frame Bh
    dl SamusTiles_Top_Set7_Entry4 : dw $0100,$0040                       ;92D078;

SamusTopTiles_Set7_D07F:
; E8h: Facing right - Samus drained - crouching/falling - frame Ah
    dl SamusTiles_Top_Set7_Entry5 : dw $0100,$0040                       ;92D07F;

SamusTopTiles_Set7_D086:
; EBh: Facing left-   Samus drained - standing - frame 0
    dl SamusTiles_Top_Set7_Entry6 : dw $00E0,$0040                       ;92D086;

SamusTopTiles_Set7_D08D:
; E9h: Facing left-   Samus drained - crouching/falling - frame Fh
; E9h: Facing left-   Samus drained - crouching/falling - frame 14h
; E9h: Facing left-   Samus drained - crouching/falling - frame 16h
; EBh: Facing left-   Samus drained - standing - frame 1
; EBh: Facing left-   Samus drained - standing - frame 3
    dl SamusTiles_Top_Set7_Entry7 : dw $00E0,$0040                       ;92D08D;

SamusTopTiles_Set7_D094:
; EBh: Facing left-   Samus drained - standing - frame 2
    dl SamusTiles_Top_Set7_Entry8 : dw $00E0,$0040                       ;92D094;

SamusTopTiles_Set7_D09B:
; EAh: Facing right - Samus drained - standing - frame 0
    dl SamusTiles_Top_Set7_Entry9 : dw $0100,$0040                       ;92D09B;

SamusTopTiles_Set7_D0A2:
; EAh: Facing right - Samus drained - standing - frame 1
; EAh: Facing right - Samus drained - standing - frame 3
    dl SamusTiles_Top_Set7_EntryA : dw $0100,$0040                       ;92D0A2;

SamusTopTiles_Set7_D0A9:
; EAh: Facing right - Samus drained - standing - frame 2
    dl SamusTiles_Top_Set7_EntryB : dw $0100,$0040                       ;92D0A9;

SamusTopTiles_Set7_D0B0:
; 1: Facing right - normal - frame 0
; 1: Facing right - normal - frame 5
; 27h: Facing right - crouching - frame 0
; 27h: Facing right - crouching - frame 5
; 47h: Unused - frame 0
; 47h: Unused - frame 5
; 89h: Facing right - ran into a wall - frame 0
; 89h: Facing right - ran into a wall - frame 5
; A8h: Facing right - grappling - frame 0
; A8h: Facing right - grappling - frame 5
; B4h: Facing right - grappling - crouching - frame 0
; B4h: Facing right - grappling - crouching - frame 5
    dl SamusTiles_Top_Set7_EntryC : dw $00C0,$0080                       ;92D0B0;

SamusTopTiles_Set7_D0B7:
; 1: Facing right - normal - frame 1
; 1: Facing right - normal - frame 3
; 1: Facing right - normal - frame 6
; 1: Facing right - normal - frame 8
; 27h: Facing right - crouching - frame 1
; 27h: Facing right - crouching - frame 3
; 27h: Facing right - crouching - frame 6
; 27h: Facing right - crouching - frame 8
; 47h: Unused - frame 1
; 47h: Unused - frame 3
; 47h: Unused - frame 6
; 47h: Unused - frame 8
; 89h: Facing right - ran into a wall - frame 1
; 89h: Facing right - ran into a wall - frame 3
; 89h: Facing right - ran into a wall - frame 6
; 89h: Facing right - ran into a wall - frame 8
; A8h: Facing right - grappling - frame 1
; A8h: Facing right - grappling - frame 3
; A8h: Facing right - grappling - frame 6
; A8h: Facing right - grappling - frame 8
; B4h: Facing right - grappling - crouching - frame 1
; B4h: Facing right - grappling - crouching - frame 3
; B4h: Facing right - grappling - crouching - frame 6
; B4h: Facing right - grappling - crouching - frame 8
    dl SamusTiles_Top_Set7_EntryD : dw $00C0,$0080                       ;92D0B7;

SamusTopTiles_Set7_D0BE:
; 1: Facing right - normal - frame 2
; 27h: Facing right - crouching - frame 2
; 47h: Unused - frame 2
; 89h: Facing right - ran into a wall - frame 2
; A8h: Facing right - grappling - frame 2
; B4h: Facing right - grappling - crouching - frame 2
    dl SamusTiles_Top_Set7_EntryE : dw $00C0,$0080                       ;92D0BE;

SamusTopTiles_Set7_D0C5:
; 2: Facing left-   normal - frame 0
; 2: Facing left-   normal - frame 5
; 28h: Facing left-   crouching - frame 0
; 28h: Facing left-   crouching - frame 5
; 48h: Unused - frame 0
; 48h: Unused - frame 5
; 8Ah: Facing left-   ran into a wall - frame 0
; 8Ah: Facing left-   ran into a wall - frame 5
; A9h: Facing left-   grappling - frame 0
; A9h: Facing left-   grappling - frame 5
; B5h: Facing left-   grappling - crouching - frame 0
; B5h: Facing left-   grappling - crouching - frame 5
    dl SamusTiles_Top_Set7_EntryF : dw $00C0,$0080                       ;92D0C5;

SamusTopTiles_Set7_D0CC:
; 2: Facing left-   normal - frame 1
; 2: Facing left-   normal - frame 3
; 2: Facing left-   normal - frame 6
; 2: Facing left-   normal - frame 8
; 28h: Facing left-   crouching - frame 1
; 28h: Facing left-   crouching - frame 3
; 28h: Facing left-   crouching - frame 6
; 28h: Facing left-   crouching - frame 8
; 48h: Unused - frame 1
; 48h: Unused - frame 3
; 48h: Unused - frame 6
; 48h: Unused - frame 8
; 8Ah: Facing left-   ran into a wall - frame 1
; 8Ah: Facing left-   ran into a wall - frame 3
; 8Ah: Facing left-   ran into a wall - frame 6
; 8Ah: Facing left-   ran into a wall - frame 8
; A9h: Facing left-   grappling - frame 1
; A9h: Facing left-   grappling - frame 3
; A9h: Facing left-   grappling - frame 6
; A9h: Facing left-   grappling - frame 8
; B5h: Facing left-   grappling - crouching - frame 1
; B5h: Facing left-   grappling - crouching - frame 3
; B5h: Facing left-   grappling - crouching - frame 6
; B5h: Facing left-   grappling - crouching - frame 8
    dl SamusTiles_Top_Set7_Entry10 : dw $00C0,$0080                      ;92D0CC;

SamusTopTiles_Set7_D0D3:
; 2: Facing left-   normal - frame 2
; 28h: Facing left-   crouching - frame 2
; 48h: Unused - frame 2
; 8Ah: Facing left-   ran into a wall - frame 2
; A9h: Facing left-   grappling - frame 2
; B5h: Facing left-   grappling - crouching - frame 2
    dl SamusTiles_Top_Set7_Entry11 : dw $00C0,$0080                      ;92D0D3;

SamusTopTiles_Set7_D0DA:
; 1: Facing right - normal - frame 7
; 27h: Facing right - crouching - frame 7
; 47h: Unused - frame 7
; 89h: Facing right - ran into a wall - frame 7
; A8h: Facing right - grappling - frame 7
; B4h: Facing right - grappling - crouching - frame 7
    dl SamusTiles_Top_Set7_Entry12 : dw $00C0,$0040                      ;92D0DA;

SamusTopTiles_Set7_D0E1:
; 2: Facing left-   normal - frame 7
; 28h: Facing left-   crouching - frame 7
; 48h: Unused - frame 7
; 8Ah: Facing left-   ran into a wall - frame 7
; A9h: Facing left-   grappling - frame 7
; B5h: Facing left-   grappling - crouching - frame 7
    dl SamusTiles_Top_Set7_Entry13 : dw $00C0,$0040                      ;92D0E1;


;;; $D0E8: Samus top tiles - set 8 (Samus appearance electricity) ;;;
SamusTopTiles_Set8_D0E8:
; 0: Facing forward - power suit - frame 3
; 0: Facing forward - power suit - frame 5
; 0: Facing forward - power suit - frame 7
; 0: Facing forward - power suit - frame 9
; 0: Facing forward - power suit - frame Bh
; 0: Facing forward - power suit - frame Dh
; 0: Facing forward - power suit - frame Fh
; 0: Facing forward - power suit - frame 11h
; 0: Facing forward - power suit - frame 13h
; 0: Facing forward - power suit - frame 15h
; 0: Facing forward - power suit - frame 17h
; 0: Facing forward - power suit - frame 19h
; 0: Facing forward - power suit - frame 1Bh
; 0: Facing forward - power suit - frame 1Dh
; 0: Facing forward - power suit - frame 1Fh
; 0: Facing forward - power suit - frame 21h
; 0: Facing forward - power suit - frame 23h
; 0: Facing forward - power suit - frame 25h
; 0: Facing forward - power suit - frame 27h
; 0: Facing forward - power suit - frame 29h
; 0: Facing forward - power suit - frame 2Bh
; 0: Facing forward - power suit - frame 2Dh
; 0: Facing forward - power suit - frame 2Fh
; 0: Facing forward - power suit - frame 31h
; 0: Facing forward - power suit - frame 33h
; 0: Facing forward - power suit - frame 35h
; 0: Facing forward - power suit - frame 37h
; 0: Facing forward - power suit - frame 39h
; 0: Facing forward - power suit - frame 3Bh
; 0: Facing forward - power suit - frame 3Dh
; 0: Facing forward - power suit - frame 3Fh
; 0: Facing forward - power suit - frame 41h
; 0: Facing forward - power suit - frame 43h
; 0: Facing forward - power suit - frame 45h
; 0: Facing forward - power suit - frame 47h
; 0: Facing forward - power suit - frame 49h
; 0: Facing forward - power suit - frame 4Bh
; 0: Facing forward - power suit - frame 4Dh
; 0: Facing forward - power suit - frame 4Fh
; 0: Facing forward - power suit - frame 51h
; 0: Facing forward - power suit - frame 53h
; 0: Facing forward - power suit - frame 55h
; 0: Facing forward - power suit - frame 57h
; 0: Facing forward - power suit - frame 59h
; 0: Facing forward - power suit - frame 5Bh
; 0: Facing forward - power suit - frame 5Dh
; 0: Facing forward - power suit - frame 5Fh
; 9Bh: Facing forward - varia/gravity suit - frame 3
; 9Bh: Facing forward - varia/gravity suit - frame 5
; 9Bh: Facing forward - varia/gravity suit - frame 7
; 9Bh: Facing forward - varia/gravity suit - frame 9
; 9Bh: Facing forward - varia/gravity suit - frame Bh
; 9Bh: Facing forward - varia/gravity suit - frame Dh
; 9Bh: Facing forward - varia/gravity suit - frame Fh
; 9Bh: Facing forward - varia/gravity suit - frame 11h
; 9Bh: Facing forward - varia/gravity suit - frame 13h
; 9Bh: Facing forward - varia/gravity suit - frame 15h
; 9Bh: Facing forward - varia/gravity suit - frame 17h
; 9Bh: Facing forward - varia/gravity suit - frame 19h
; 9Bh: Facing forward - varia/gravity suit - frame 1Bh
; 9Bh: Facing forward - varia/gravity suit - frame 1Dh
; 9Bh: Facing forward - varia/gravity suit - frame 1Fh
; 9Bh: Facing forward - varia/gravity suit - frame 21h
; 9Bh: Facing forward - varia/gravity suit - frame 23h
; 9Bh: Facing forward - varia/gravity suit - frame 25h
; 9Bh: Facing forward - varia/gravity suit - frame 27h
; 9Bh: Facing forward - varia/gravity suit - frame 29h
; 9Bh: Facing forward - varia/gravity suit - frame 2Bh
; 9Bh: Facing forward - varia/gravity suit - frame 2Dh
; 9Bh: Facing forward - varia/gravity suit - frame 2Fh
; 9Bh: Facing forward - varia/gravity suit - frame 31h
; 9Bh: Facing forward - varia/gravity suit - frame 33h
; 9Bh: Facing forward - varia/gravity suit - frame 35h
; 9Bh: Facing forward - varia/gravity suit - frame 37h
; 9Bh: Facing forward - varia/gravity suit - frame 39h
; 9Bh: Facing forward - varia/gravity suit - frame 3Bh
; 9Bh: Facing forward - varia/gravity suit - frame 3Dh
; 9Bh: Facing forward - varia/gravity suit - frame 3Fh
; 9Bh: Facing forward - varia/gravity suit - frame 41h
; 9Bh: Facing forward - varia/gravity suit - frame 43h
; 9Bh: Facing forward - varia/gravity suit - frame 45h
; 9Bh: Facing forward - varia/gravity suit - frame 47h
; 9Bh: Facing forward - varia/gravity suit - frame 49h
; 9Bh: Facing forward - varia/gravity suit - frame 4Bh
; 9Bh: Facing forward - varia/gravity suit - frame 4Dh
; 9Bh: Facing forward - varia/gravity suit - frame 4Fh
; 9Bh: Facing forward - varia/gravity suit - frame 51h
; 9Bh: Facing forward - varia/gravity suit - frame 53h
; 9Bh: Facing forward - varia/gravity suit - frame 55h
; 9Bh: Facing forward - varia/gravity suit - frame 57h
; 9Bh: Facing forward - varia/gravity suit - frame 59h
; 9Bh: Facing forward - varia/gravity suit - frame 5Bh
; 9Bh: Facing forward - varia/gravity suit - frame 5Dh
; 9Bh: Facing forward - varia/gravity suit - frame 5Fh
    dl SamusTiles_Top_Set8_Entry0 : dw $0020,$0000                       ;92D0E8;


UNUSED_SamusTopTiles_Set8_92D0EF:
    dl SamusTiles_Top_Set8_Entry1 : dw $0020,$0000                       ;92D0EF;


SamusTopTiles_Set8_D0F6:
; 0: Facing forward - power suit - frame 2
; 0: Facing forward - power suit - frame 8
; 0: Facing forward - power suit - frame Eh
; 0: Facing forward - power suit - frame 14h
; 0: Facing forward - power suit - frame 1Ah
; 0: Facing forward - power suit - frame 20h
; 0: Facing forward - power suit - frame 26h
; 0: Facing forward - power suit - frame 2Ch
; 0: Facing forward - power suit - frame 32h
; 0: Facing forward - power suit - frame 38h
; 0: Facing forward - power suit - frame 3Eh
; 0: Facing forward - power suit - frame 44h
; 0: Facing forward - power suit - frame 4Ah
; 9Bh: Facing forward - varia/gravity suit - frame 2
; 9Bh: Facing forward - varia/gravity suit - frame 8
; 9Bh: Facing forward - varia/gravity suit - frame Eh
; 9Bh: Facing forward - varia/gravity suit - frame 14h
; 9Bh: Facing forward - varia/gravity suit - frame 1Ah
; 9Bh: Facing forward - varia/gravity suit - frame 20h
; 9Bh: Facing forward - varia/gravity suit - frame 26h
; 9Bh: Facing forward - varia/gravity suit - frame 2Ch
; 9Bh: Facing forward - varia/gravity suit - frame 32h
; 9Bh: Facing forward - varia/gravity suit - frame 38h
; 9Bh: Facing forward - varia/gravity suit - frame 3Eh
; 9Bh: Facing forward - varia/gravity suit - frame 44h
; 9Bh: Facing forward - varia/gravity suit - frame 4Ah
    dl SamusTiles_Top_Set8_Entry2 : dw $0100,$0020                       ;92D0F6;

SamusTopTiles_Set8_D0FD:
; 0: Facing forward - power suit - frame 4
; 0: Facing forward - power suit - frame Ah
; 0: Facing forward - power suit - frame 10h
; 0: Facing forward - power suit - frame 16h
; 0: Facing forward - power suit - frame 1Ch
; 0: Facing forward - power suit - frame 22h
; 0: Facing forward - power suit - frame 28h
; 0: Facing forward - power suit - frame 2Eh
; 0: Facing forward - power suit - frame 34h
; 0: Facing forward - power suit - frame 3Ah
; 0: Facing forward - power suit - frame 40h
; 0: Facing forward - power suit - frame 46h
; 0: Facing forward - power suit - frame 4Ch
; 9Bh: Facing forward - varia/gravity suit - frame 4
; 9Bh: Facing forward - varia/gravity suit - frame Ah
; 9Bh: Facing forward - varia/gravity suit - frame 10h
; 9Bh: Facing forward - varia/gravity suit - frame 16h
; 9Bh: Facing forward - varia/gravity suit - frame 1Ch
; 9Bh: Facing forward - varia/gravity suit - frame 22h
; 9Bh: Facing forward - varia/gravity suit - frame 28h
; 9Bh: Facing forward - varia/gravity suit - frame 2Eh
; 9Bh: Facing forward - varia/gravity suit - frame 34h
; 9Bh: Facing forward - varia/gravity suit - frame 3Ah
; 9Bh: Facing forward - varia/gravity suit - frame 40h
; 9Bh: Facing forward - varia/gravity suit - frame 46h
; 9Bh: Facing forward - varia/gravity suit - frame 4Ch
    dl SamusTiles_Top_Set8_Entry3 : dw $00E0,$0000                       ;92D0FD;

SamusTopTiles_Set8_D104:
; 0: Facing forward - power suit - frame 6
; 0: Facing forward - power suit - frame Ch
; 0: Facing forward - power suit - frame 12h
; 0: Facing forward - power suit - frame 18h
; 0: Facing forward - power suit - frame 1Eh
; 0: Facing forward - power suit - frame 24h
; 0: Facing forward - power suit - frame 2Ah
; 0: Facing forward - power suit - frame 30h
; 0: Facing forward - power suit - frame 36h
; 0: Facing forward - power suit - frame 3Ch
; 0: Facing forward - power suit - frame 42h
; 0: Facing forward - power suit - frame 48h
; 0: Facing forward - power suit - frame 4Eh
; 9Bh: Facing forward - varia/gravity suit - frame 6
; 9Bh: Facing forward - varia/gravity suit - frame Ch
; 9Bh: Facing forward - varia/gravity suit - frame 12h
; 9Bh: Facing forward - varia/gravity suit - frame 18h
; 9Bh: Facing forward - varia/gravity suit - frame 1Eh
; 9Bh: Facing forward - varia/gravity suit - frame 24h
; 9Bh: Facing forward - varia/gravity suit - frame 2Ah
; 9Bh: Facing forward - varia/gravity suit - frame 30h
; 9Bh: Facing forward - varia/gravity suit - frame 36h
; 9Bh: Facing forward - varia/gravity suit - frame 3Ch
; 9Bh: Facing forward - varia/gravity suit - frame 42h
; 9Bh: Facing forward - varia/gravity suit - frame 48h
; 9Bh: Facing forward - varia/gravity suit - frame 4Eh
    dl SamusTiles_Top_Set8_Entry4 : dw $0100,$0060                       ;92D104;

SamusTopTiles_Set8_D10B:
; 0: Facing forward - power suit - frame 50h
; 9Bh: Facing forward - varia/gravity suit - frame 50h
    dl SamusTiles_Top_Set8_Entry5 : dw $0100,$00E0                       ;92D10B;

SamusTopTiles_Set8_D112:
; 0: Facing forward - power suit - frame 52h
; 9Bh: Facing forward - varia/gravity suit - frame 52h
    dl SamusTiles_Top_Set8_Entry6 : dw $0100,$0000                       ;92D112;

SamusTopTiles_Set8_D119:
; 0: Facing forward - power suit - frame 54h
; 0: Facing forward - power suit - frame 5Ah
; 9Bh: Facing forward - varia/gravity suit - frame 54h
; 9Bh: Facing forward - varia/gravity suit - frame 5Ah
    dl SamusTiles_Top_Set8_Entry7 : dw $0100,$0040                       ;92D119;

SamusTopTiles_Set8_D120:
; 0: Facing forward - power suit - frame 56h
; 0: Facing forward - power suit - frame 5Ch
; 9Bh: Facing forward - varia/gravity suit - frame 56h
; 9Bh: Facing forward - varia/gravity suit - frame 5Ch
    dl SamusTiles_Top_Set8_Entry8 : dw $0100,$0060                       ;92D120;

SamusTopTiles_Set8_D127:
; 0: Facing forward - power suit - frame 58h
; 0: Facing forward - power suit - frame 5Eh
; 9Bh: Facing forward - varia/gravity suit - frame 58h
; 9Bh: Facing forward - varia/gravity suit - frame 5Eh
    dl SamusTiles_Top_Set8_Entry9 : dw $00E0,$0000                       ;92D127;


;;; $D12E: Samus top tiles - set 9 (moving - gun extended) ;;;
SamusTopTiles_Set9_D12E:
; Bh: Moving right - gun extended - frame 0
; Bh: Moving right - gun extended - frame 5
    dl SamusTiles_Top_Set9_Entry0 : dw $0080,$0040                       ;92D12E;

SamusTopTiles_Set9_D135:
; Bh: Moving right - gun extended - frame 4
    dl SamusTiles_Top_Set9_Entry1 : dw $0080,$0040                       ;92D135;

SamusTopTiles_Set9_D13C:
; Bh: Moving right - gun extended - frame 2
    dl SamusTiles_Top_Set9_Entry2 : dw $00A0,$0040                       ;92D13C;

SamusTopTiles_Set9_D143:
; Bh: Moving right - gun extended - frame 3
    dl SamusTiles_Top_Set9_Entry3 : dw $00C0,$0040                       ;92D143;

SamusTopTiles_Set9_D14A:
; Bh: Moving right - gun extended - frame 6
; Bh: Moving right - gun extended - frame 9
    dl SamusTiles_Top_Set9_Entry4 : dw $0080,$0040                       ;92D14A;

SamusTopTiles_Set9_D151:
; Bh: Moving right - gun extended - frame 7
    dl SamusTiles_Top_Set9_Entry5 : dw $00A0,$0040                       ;92D151;

SamusTopTiles_Set9_D158:
; Ch: Moving left-   gun extended - frame 0
; Ch: Moving left-   gun extended - frame 5
    dl SamusTiles_Top_Set9_Entry6 : dw $00C0,$0040                       ;92D158;

SamusTopTiles_Set9_D15F:
; Ch: Moving left-   gun extended - frame 4
    dl SamusTiles_Top_Set9_Entry7 : dw $00C0,$0040                       ;92D15F;

SamusTopTiles_Set9_D166:
; Ch: Moving left-   gun extended - frame 3
    dl SamusTiles_Top_Set9_Entry8 : dw $00E0,$0040                       ;92D166;

SamusTopTiles_Set9_D16D:
; Ch: Moving left-   gun extended - frame 2
    dl SamusTiles_Top_Set9_Entry9 : dw $00E0,$0040                       ;92D16D;

SamusTopTiles_Set9_D174:
; Ch: Moving left-   gun extended - frame 6
; Ch: Moving left-   gun extended - frame 9
    dl SamusTiles_Top_Set9_EntryA : dw $00C0,$0040                       ;92D174;

SamusTopTiles_Set9_D17B:
; Ch: Moving left-   gun extended - frame 8
    dl SamusTiles_Top_Set9_EntryB : dw $0100,$0040                       ;92D17B;

SamusTopTiles_Set9_D182:
; Bh: Moving right - gun extended - frame 8
    dl SamusTiles_Top_Set9_EntryC : dw $00C0,$0040                       ;92D182;

SamusTopTiles_Set9_D189:
; Ch: Moving left-   gun extended - frame 7
    dl SamusTiles_Top_Set9_EntryD : dw $0100,$0040                       ;92D189;

SamusTopTiles_Set9_D190:
; Bh: Moving right - gun extended - frame 1
    dl SamusTiles_Top_Set9_EntryE : dw $0080,$0040                       ;92D190;

SamusTopTiles_Set9_D197:
; Ch: Moving left-   gun extended - frame 1
    dl SamusTiles_Top_Set9_EntryF : dw $00C0,$0040                       ;92D197;


;;; $D19E: Samus bottom tiles - set 0 (general) ;;;
SamusBottomTiles_Set0_D19E:
; Actually used by:
;     9: Moving right - not aiming - frame 0
;     Ah: Moving left-   not aiming - frame 0
;     Bh: Moving right - gun extended - frame 0
;     Ch: Moving left-   gun extended - frame 0
;     Dh: Moving right - aiming up (unused) - frame 0
;     Eh: Moving left-   aiming up (unused) - frame 0
;     Fh: Moving right - aiming up-right - frame 0
;     10h: Moving left-   aiming up-left - frame 0
;     11h: Moving right - aiming down-right - frame 0
;     12h: Moving left-   aiming down-left - frame 0

; Meaninglessly used by:
;     0: Facing forward - power suit - frame 1
;     1: Facing right - normal - frame 4
;     2: Facing left-   normal - frame 4
;     19h: Facing right - spin jump - frames 1..Ah
;     1Ah: Facing left-   spin jump - frames 1..Ah
;     1Bh: Facing right - space jump - frames 9..Ah
;     1Ch: Facing left-   space jump - frames 9..Ah
;     1Dh: Facing right - morph ball - no springball - on ground - frames 0..9
;     1Eh: Moving right - morph ball - no springball - on ground - frames 0..9
;     1Fh: Moving left-   morph ball - no springball - on ground - frames 0..9
;     20h: Unused - frames 1..Ah
;     21h: Unused - frames 1..Ah
;     22h: Unused - frames 1..Ah
;     23h: Unused - frames 1..Ah
;     24h: Unused - frames 1..Ah
;     27h: Facing right - crouching - frame 4
;     28h: Facing left-   crouching - frame 4
;     29h: Facing right - falling - frames 3..4
;     2Ah: Facing left-   falling - frames 3..4
;     31h: Facing right - morph ball - no springball - in air - frames 0..9
;     32h: Facing left-   morph ball - no springball - in air - frames 0..9
;     33h: Unused - frames 1..Ah
;     34h: Unused - frames 1..Ah
;     37h: Facing right - morphing transition - frames 0..1
;     38h: Facing left-   morphing transition - frames 0..1
;     39h: Unused - frames 1..Ah
;     3Ah: Unused - frames 1..Ah
;     3Dh: Facing right - unmorphing transition - frames 0..1
;     3Eh: Facing left-   unmorphing transition - frames 0..1
;     3Fh: Unused - frames 0..9
;     40h: Unused - frames 0..9
;     41h: Facing left-   morph ball - no springball - on ground - frames 0..9
;     42h: Unused - frames 1..Ah
;     47h: Unused - frame 4
;     48h: Unused - frame 4
;     4Fh: Facing left-   damage boost - frames 2..8
;     50h: Facing right - damage boost - frames 2..8
;     65h: Unused. Related to movement type Dh - frames 1..8
;     66h: Unused. Related to movement type Dh - frames 1..8
;     67h: Facing right - falling - gun extended - frames 3..4
;     68h: Facing left-   falling - gun extended - frames 3..4
;     79h: Facing right - morph ball - spring ball - on ground - frames 0..9
;     7Ah: Facing left-   morph ball - spring ball - on ground - frames 0..9
;     7Bh: Moving right - morph ball - spring ball - on ground - frames 0..9
;     7Ch: Moving left-   morph ball - spring ball - on ground - frames 0..9
;     7Dh: Facing right - morph ball - spring ball - falling - frames 0..9
;     7Eh: Facing left-   morph ball - spring ball - falling - frames 0..9
;     7Fh: Facing right - morph ball - spring ball - in air - frames 0..9
;     80h: Facing left-   morph ball - spring ball - in air - frames 0..9
;     81h: Facing right - screw attack - frames 19h..1Ah
;     82h: Facing left-   screw attack - frames 19h..1Ah
;     83h: Facing right - wall jump - frames 2..Ch
;     83h: Facing right - wall jump - frames 15h..16h
;     84h: Facing left-   wall jump - frames 2..Ch
;     84h: Facing left-   wall jump - frames 15h..16h
;     89h: Facing right - ran into a wall - frame 4
;     8Ah: Facing left-   ran into a wall - frame 4
;     9Bh: Facing forward - varia/gravity suit - frame 1
;     A8h: Facing right - grappling - frame 4
;     A9h: Facing left-   grappling - frame 4
;     B4h: Facing right - grappling - crouching - frame 4
;     B5h: Facing left-   grappling - crouching - frame 4
;     C5h: Unused - frames 0..9
;     CBh: Facing right - shinespark - vertical - frame 0
;     CCh: Facing left-   shinespark - vertical - frame 0
;     D3h: Facing right - crystal flash - frames 4..5
;     D3h: Facing right - crystal flash - frames Ah..Bh
;     D4h: Facing left-   crystal flash - frames 4..5
;     D4h: Facing left-   crystal flash - frames Ah..Bh
;     DBh: Unused - frames 1..2
;     DCh: Unused - frames 1..2
;     DDh: Unused - frames 0..1
;     DEh: Unused - frames 0..1
;     DFh: Unused. Related to Draygon - frames 0..9
;     E8h: Facing right - Samus drained - crouching/falling - frames Ch..Dh
;     E9h: Facing left-   Samus drained - crouching/falling - frames Ch..Dh
;     E9h: Facing left-   Samus drained - crouching/falling - frames 11h..12h
;     E9h: Facing left-   Samus drained - crouching/falling - frames 18h..19h
;     E9h: Facing left-   Samus drained - crouching/falling - frames 1Bh..1Ch
;     E9h: Facing left-   Samus drained - crouching/falling - frames 1Eh..1Fh
;     EAh: Facing right - Samus drained - standing - frame 4
;     EBh: Facing left-   Samus drained - standing - frame 4
    dl SamusTiles_Bottom_Set0_Entry0 : dw $0080,$0080                    ;92D19E;

SamusBottomTiles_Set0_D1A5:
; 9: Moving right - not aiming - frame 2
; Ah: Moving left-   not aiming - frame 2
; Bh: Moving right - gun extended - frame 2
; Ch: Moving left-   gun extended - frame 2
; Dh: Moving right - aiming up (unused) - frame 2
; Eh: Moving left-   aiming up (unused) - frame 2
; Fh: Moving right - aiming up-right - frame 2
; 10h: Moving left-   aiming up-left - frame 2
; 11h: Moving right - aiming down-right - frame 2
; 12h: Moving left-   aiming down-left - frame 2
    dl SamusTiles_Bottom_Set0_Entry1 : dw $00E0,$0080                    ;92D1A5;

SamusBottomTiles_Set0_D1AC:
; 9: Moving right - not aiming - frame 4
; Ah: Moving left-   not aiming - frame 4
; Bh: Moving right - gun extended - frame 4
; Ch: Moving left-   gun extended - frame 4
; Dh: Moving right - aiming up (unused) - frame 4
; Eh: Moving left-   aiming up (unused) - frame 4
; Fh: Moving right - aiming up-right - frame 4
; 10h: Moving left-   aiming up-left - frame 4
; 11h: Moving right - aiming down-right - frame 4
; 12h: Moving left-   aiming down-left - frame 4
    dl SamusTiles_Bottom_Set0_Entry2 : dw $00E0,$00C0                    ;92D1AC;

SamusBottomTiles_Set0_D1B3:
; 9: Moving right - not aiming - frame 5
; Ah: Moving left-   not aiming - frame 5
; Bh: Moving right - gun extended - frame 5
; Ch: Moving left-   gun extended - frame 5
; Dh: Moving right - aiming up (unused) - frame 5
; Eh: Moving left-   aiming up (unused) - frame 5
; Fh: Moving right - aiming up-right - frame 5
; 10h: Moving left-   aiming up-left - frame 5
; 11h: Moving right - aiming down-right - frame 5
; 12h: Moving left-   aiming down-left - frame 5
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 0
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 0
; C7h: Facing right - vertical shinespark windup - frame 0
; C8h: Facing left-   vertical shinespark windup - frame 0
    dl SamusTiles_Bottom_Set0_Entry3 : dw $0080,$0080                    ;92D1B3;

SamusBottomTiles_Set0_D1BA:
; 9: Moving right - not aiming - frame 7
; Ah: Moving left-   not aiming - frame 7
; Bh: Moving right - gun extended - frame 7
; Ch: Moving left-   gun extended - frame 7
; Dh: Moving right - aiming up (unused) - frame 7
; Eh: Moving left-   aiming up (unused) - frame 7
; Fh: Moving right - aiming up-right - frame 7
; 10h: Moving left-   aiming up-left - frame 7
; 11h: Moving right - aiming down-right - frame 7
; 12h: Moving left-   aiming down-left - frame 7
    dl SamusTiles_Bottom_Set0_Entry4 : dw $0100,$0080                    ;92D1BA;

SamusBottomTiles_Set0_D1C1:
; 9: Moving right - not aiming - frame 9
; Ah: Moving left-   not aiming - frame 9
; Bh: Moving right - gun extended - frame 9
; Ch: Moving left-   gun extended - frame 9
; Dh: Moving right - aiming up (unused) - frame 9
; Eh: Moving left-   aiming up (unused) - frame 9
; Fh: Moving right - aiming up-right - frame 9
; 10h: Moving left-   aiming up-left - frame 9
; 11h: Moving right - aiming down-right - frame 9
; 12h: Moving left-   aiming down-left - frame 9
    dl SamusTiles_Bottom_Set0_Entry5 : dw $00E0,$00C0                    ;92D1C1;

SamusBottomTiles_Set0_D1C8:
; 1: Facing right - normal - frame 0
; 1: Facing right - normal - frame 5
; 2: Facing left-   normal - frame 0
; 2: Facing left-   normal - frame 5
; 47h: Unused - frame 0
; 47h: Unused - frame 5
; 48h: Unused - frame 0
; 48h: Unused - frame 5
; 89h: Facing right - ran into a wall - frame 0
; 89h: Facing right - ran into a wall - frame 5
; 8Ah: Facing left-   ran into a wall - frame 0
; 8Ah: Facing left-   ran into a wall - frame 5
; A4h: Facing right - landing from normal jump - frame 1
; A5h: Facing left-   landing from normal jump - frame 1
; A6h: Facing right - landing from spin jump - frame 2
; A7h: Facing left-   landing from spin jump - frame 2
; A8h: Facing right - grappling - frame 0
; A8h: Facing right - grappling - frame 5
; A9h: Facing left-   grappling - frame 0
; A9h: Facing left-   grappling - frame 5
; D5h: Facing right - x-ray - standing - frames 0..4
; D6h: Facing left-   x-ray - standing - frames 0..4
; E0h: Facing right - landing from normal jump - aiming up - frame 1
; E1h: Facing left-   landing from normal jump - aiming up - frame 1
; E2h: Facing right - landing from normal jump - aiming up-right - frame 1
; E3h: Facing left-   landing from normal jump - aiming up-left - frame 1
; E4h: Facing right - landing from normal jump - aiming down-right - frame 1
; E5h: Facing left-   landing from normal jump - aiming down-left - frame 1
; E6h: Facing right - landing from normal jump - firing - frame 1
; E7h: Facing left-   landing from normal jump - firing - frame 1
    dl SamusTiles_Bottom_Set0_Entry6 : dw $00C0,$00C0                    ;92D1C8;

SamusBottomTiles_Set0_D1CF:
; 27h: Facing right - crouching - frames 0..3
; 27h: Facing right - crouching - frames 5..8
; 28h: Facing left-   crouching - frames 0..3
; 28h: Facing left-   crouching - frames 5..8
; 71h: Facing right - crouching - aiming up-right - frame 0
; 72h: Facing left-   crouching - aiming up-left - frame 0
; 73h: Facing right - crouching - aiming down-right - frame 0
; 74h: Facing left-   crouching - aiming down-left - frame 0
; 85h: Facing right - crouching - aiming up - frames 0..1
; 86h: Facing left-   crouching - aiming up - frames 0..1
; B4h: Facing right - grappling - crouching - frames 0..3
; B4h: Facing right - grappling - crouching - frames 5..8
; B5h: Facing left-   grappling - crouching - frames 0..3
; B5h: Facing left-   grappling - crouching - frames 5..8
; B6h: Facing right - grappling - crouching - aiming down-right - frame 0
; B7h: Facing left-   grappling - crouching - aiming down-left - frame 0
; D9h: Facing right - x-ray - crouching - frames 0..4
; DAh: Facing left-   x-ray - crouching - frames 0..4
    dl SamusTiles_Bottom_Set0_Entry7 : dw $0080,$0080                    ;92D1CF;

SamusBottomTiles_Set0_D1D6:
; 9: Moving right - not aiming - frame 1
; Ah: Moving left-   not aiming - frame 1
; Bh: Moving right - gun extended - frame 1
; Ch: Moving left-   gun extended - frame 1
; Dh: Moving right - aiming up (unused) - frame 1
; Eh: Moving left-   aiming up (unused) - frame 1
; Fh: Moving right - aiming up-right - frame 1
; 10h: Moving left-   aiming up-left - frame 1
; 11h: Moving right - aiming down-right - frame 1
; 12h: Moving left-   aiming down-left - frame 1
    dl SamusTiles_Bottom_Set0_Entry8 : dw $00C0,$0080                    ;92D1D6;

SamusBottomTiles_Set0_D1DD:
; 9: Moving right - not aiming - frame 3
; Ah: Moving left-   not aiming - frame 3
; Bh: Moving right - gun extended - frame 3
; Ch: Moving left-   gun extended - frame 3
; Dh: Moving right - aiming up (unused) - frame 3
; Eh: Moving left-   aiming up (unused) - frame 3
; Fh: Moving right - aiming up-right - frame 3
; 10h: Moving left-   aiming up-left - frame 3
; 11h: Moving right - aiming down-right - frame 3
; 12h: Moving left-   aiming down-left - frame 3
    dl SamusTiles_Bottom_Set0_Entry9 : dw $0100,$0080                    ;92D1DD;

SamusBottomTiles_Set0_D1E4:
; 9: Moving right - not aiming - frame 6
; Ah: Moving left-   not aiming - frame 6
; Bh: Moving right - gun extended - frame 6
; Ch: Moving left-   gun extended - frame 6
; Dh: Moving right - aiming up (unused) - frame 6
; Eh: Moving left-   aiming up (unused) - frame 6
; Fh: Moving right - aiming up-right - frame 6
; 10h: Moving left-   aiming up-left - frame 6
; 11h: Moving right - aiming down-right - frame 6
; 12h: Moving left-   aiming down-left - frame 6
    dl SamusTiles_Bottom_Set0_EntryA : dw $00C0,$0080                    ;92D1E4;

SamusBottomTiles_Set0_D1EB:
; 9: Moving right - not aiming - frame 8
; Ah: Moving left-   not aiming - frame 8
; Bh: Moving right - gun extended - frame 8
; Ch: Moving left-   gun extended - frame 8
; Dh: Moving right - aiming up (unused) - frame 8
; Eh: Moving left-   aiming up (unused) - frame 8
; Fh: Moving right - aiming up-right - frame 8
; 10h: Moving left-   aiming up-left - frame 8
; 11h: Moving right - aiming down-right - frame 8
; 12h: Moving left-   aiming down-left - frame 8
    dl SamusTiles_Bottom_Set0_EntryB : dw $0100,$0080                    ;92D1EB;

SamusBottomTiles_Set0_D1F2:
; 0: Facing forward - power suit - frame 0
    dl SamusTiles_Bottom_Set0_EntryC : dw $0100,$00C0                    ;92D1F2;

SamusBottomTiles_Set0_D1F9:
; 9Bh: Facing forward - varia/gravity suit - frame 0
    dl SamusTiles_Bottom_Set0_EntryD : dw $0100,$00C0                    ;92D1F9;

SamusBottomTiles_Set0_D200:
; 1: Facing right - normal - frame 1
; 1: Facing right - normal - frame 3
; 1: Facing right - normal - frame 6
; 1: Facing right - normal - frame 8
; 47h: Unused - frame 1
; 47h: Unused - frame 3
; 47h: Unused - frame 6
; 47h: Unused - frame 8
; 89h: Facing right - ran into a wall - frame 1
; 89h: Facing right - ran into a wall - frame 3
; 89h: Facing right - ran into a wall - frame 6
; 89h: Facing right - ran into a wall - frame 8
; A8h: Facing right - grappling - frame 1
; A8h: Facing right - grappling - frame 3
; A8h: Facing right - grappling - frame 6
; A8h: Facing right - grappling - frame 8
    dl SamusTiles_Bottom_Set0_EntryE : dw $00C0,$00C0                    ;92D200;

SamusBottomTiles_Set0_D207:
; 1: Facing right - normal - frame 2
; 1: Facing right - normal - frame 7
; 47h: Unused - frame 2
; 47h: Unused - frame 7
; 89h: Facing right - ran into a wall - frame 2
; 89h: Facing right - ran into a wall - frame 7
; A8h: Facing right - grappling - frame 2
; A8h: Facing right - grappling - frame 7
    dl SamusTiles_Bottom_Set0_EntryF : dw $00C0,$00C0                    ;92D207;

SamusBottomTiles_Set0_D20E:
; 2: Facing left-   normal - frame 1
; 2: Facing left-   normal - frame 3
; 2: Facing left-   normal - frame 6
; 2: Facing left-   normal - frame 8
; 48h: Unused - frame 1
; 48h: Unused - frame 3
; 48h: Unused - frame 6
; 48h: Unused - frame 8
; 8Ah: Facing left-   ran into a wall - frame 1
; 8Ah: Facing left-   ran into a wall - frame 3
; 8Ah: Facing left-   ran into a wall - frame 6
; 8Ah: Facing left-   ran into a wall - frame 8
; A9h: Facing left-   grappling - frame 1
; A9h: Facing left-   grappling - frame 3
; A9h: Facing left-   grappling - frame 6
; A9h: Facing left-   grappling - frame 8
    dl SamusTiles_Bottom_Set0_Entry10 : dw $00C0,$00C0                   ;92D20E;

SamusBottomTiles_Set0_D215:
; 4Fh: Facing left-   damage boost - frame 0
    dl SamusTiles_Bottom_Set0_Entry11 : dw $00A0,$0040                   ;92D215;

SamusBottomTiles_Set0_D21C:
; 50h: Facing right - damage boost - frame 0
    dl SamusTiles_Bottom_Set0_Entry12 : dw $00A0,$0040                   ;92D21C;

SamusBottomTiles_Set0_D223:
; 15h: Facing right - normal jump - aiming up - frame 1
; 69h: Facing right - normal jump - aiming up-right - frame 1
    dl SamusTiles_Bottom_Set0_Entry13 : dw $00A0,$0080                   ;92D223;

SamusBottomTiles_Set0_D22A:
; 16h: Facing left-   normal jump - aiming up - frame 1
; 6Ah: Facing left-   normal jump - aiming up-left - frame 1
    dl SamusTiles_Bottom_Set0_Entry14 : dw $00A0,$0080                   ;92D22A;

SamusBottomTiles_Set0_D231:
; 25h: Facing right - turning - standing - frame 2
; 26h: Facing left-   turning - standing - frame 0
; 8Bh: Facing right - turning - standing - aiming up - frame 2
; 8Ch: Facing left-   turning - standing - aiming up - frame 0
; 8Dh: Facing right - turning - standing - aiming down-right - frame 2
; 8Eh: Facing left-   turning - standing - aiming down-left - frame 0
; 9Ch: Facing right - turning - standing - aiming up-right - frame 2
; 9Dh: Facing left-   turning - standing - aiming up-left - frame 0
; BFh: Facing right - moonwalking - turn/jump left - frame 2
; C0h: Facing left-   moonwalking - turn/jump right - frame 0
; C1h: Facing right - moonwalking - turn/jump left-   aiming up-right - frame 2
; C2h: Facing left-   moonwalking - turn/jump right - aiming up-left - frame 0
; C3h: Facing right - moonwalking - turn/jump left-   aiming down-right - frame 2
; C4h: Facing left-   moonwalking - turn/jump right - aiming down-left - frame 0
; C6h: Unused - frame 2
    dl SamusTiles_Bottom_Set0_Entry15 : dw $00A0,$0080                   ;92D231;

SamusBottomTiles_Set0_D238:
; 25h: Facing right - turning - standing - frame 0
; 26h: Facing left-   turning - standing - frame 2
; 8Bh: Facing right - turning - standing - aiming up - frame 0
; 8Ch: Facing left-   turning - standing - aiming up - frame 2
; 8Dh: Facing right - turning - standing - aiming down-right - frame 0
; 8Eh: Facing left-   turning - standing - aiming down-left - frame 2
; 9Ch: Facing right - turning - standing - aiming up-right - frame 0
; 9Dh: Facing left-   turning - standing - aiming up-left - frame 2
; BFh: Facing right - moonwalking - turn/jump left - frame 0
; C0h: Facing left-   moonwalking - turn/jump right - frame 2
; C1h: Facing right - moonwalking - turn/jump left-   aiming up-right - frame 0
; C2h: Facing left-   moonwalking - turn/jump right - aiming up-left - frame 2
; C3h: Facing right - moonwalking - turn/jump left-   aiming down-right - frame 0
; C4h: Facing left-   moonwalking - turn/jump right - aiming down-left - frame 2
; C6h: Unused - frame 0
    dl SamusTiles_Bottom_Set0_Entry16 : dw $00A0,$0080                   ;92D238;

SamusBottomTiles_Set0_D23F:
; 2Fh: Facing right - turning - jumping - frame 2
; 30h: Facing left-   turning - jumping - frame 0
; 43h: Facing right - turning - crouching - frame 2
; 44h: Facing left-   turning - crouching - frame 0
; 87h: Facing right - turning - falling - frame 2
; 88h: Facing left-   turning - falling - frame 0
; 8Fh: Facing right - turning - in air - aiming up - frame 2
; 90h: Facing left-   turning - in air - aiming up - frame 0
; 91h: Facing right - turning - in air - aiming down/down-right - frame 2
; 92h: Facing left-   turning - in air - aiming down/down-left - frame 0
; 93h: Facing right - turning - falling - aiming up - frame 2
; 94h: Facing left-   turning - falling - aiming up - frame 0
; 95h: Facing right - turning - falling - aiming down/down-right - frame 2
; 96h: Facing left-   turning - falling - aiming down/down-left - frame 0
; 97h: Facing right - turning - crouching - aiming up - frame 2
; 98h: Facing left-   turning - crouching - aiming up - frame 0
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 2
; 9Ah: Facing left-   turning - crouching - aiming down/down-left - frame 0
; 9Eh: Facing right - turning - in air - aiming up-right - frame 2
; 9Fh: Facing left-   turning - in air - aiming up-left - frame 0
; A0h: Facing right - turning - falling - aiming up-right - frame 2
; A1h: Facing left-   turning - falling - aiming up-left - frame 0
; A2h: Facing right - turning - crouching - aiming up-right - frame 2
; A3h: Facing left-   turning - crouching - aiming up-left - frame 0
    dl SamusTiles_Bottom_Set0_Entry17 : dw $0080,$0040                   ;92D23F;

SamusBottomTiles_Set0_D246:
; 2Fh: Facing right - turning - jumping - frame 0
; 30h: Facing left-   turning - jumping - frame 2
; 43h: Facing right - turning - crouching - frame 0
; 44h: Facing left-   turning - crouching - frame 2
; 87h: Facing right - turning - falling - frame 0
; 88h: Facing left-   turning - falling - frame 2
; 8Fh: Facing right - turning - in air - aiming up - frame 0
; 90h: Facing left-   turning - in air - aiming up - frame 2
; 91h: Facing right - turning - in air - aiming down/down-right - frame 0
; 92h: Facing left-   turning - in air - aiming down/down-left - frame 2
; 93h: Facing right - turning - falling - aiming up - frame 0
; 94h: Facing left-   turning - falling - aiming up - frame 2
; 95h: Facing right - turning - falling - aiming down/down-right - frame 0
; 96h: Facing left-   turning - falling - aiming down/down-left - frame 2
; 97h: Facing right - turning - crouching - aiming up - frame 0
; 98h: Facing left-   turning - crouching - aiming up - frame 2
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 0
; 9Ah: Facing left-   turning - crouching - aiming down/down-left - frame 2
; 9Eh: Facing right - turning - in air - aiming up-right - frame 0
; 9Fh: Facing left-   turning - in air - aiming up-left - frame 2
; A0h: Facing right - turning - falling - aiming up-right - frame 0
; A1h: Facing left-   turning - falling - aiming up-left - frame 2
; A2h: Facing right - turning - crouching - aiming up-right - frame 0
; A3h: Facing left-   turning - crouching - aiming up-left - frame 2
    dl SamusTiles_Bottom_Set0_Entry18 : dw $0080,$0040                   ;92D246;

SamusBottomTiles_Set0_D24D:
; 5Ch: Unused - frame 0
; 64h: Unused. Related to movement type Dh - frame 1
; B9h: Facing right - grapple wall jump pose - frame 0
    dl SamusTiles_Bottom_Set0_Entry19 : dw $0080,$0080                   ;92D24D;

SamusBottomTiles_Set0_D254:
; 45h: Unused - frame 0
; 46h: Unused - frame 0
; 5Bh: Unused - frame 0
; 63h: Unused. Related to movement type Dh - frame 1
; B8h: Facing left-   grapple wall jump pose - frame 0
    dl SamusTiles_Bottom_Set0_Entry1A : dw $0080,$0080                   ;92D254;

SamusBottomTiles_Set0_D25B:
; C9h: Facing right - shinespark - horizontal - frame 0
; CDh: Facing right - shinespark - diagonal - frame 0
    dl SamusTiles_Bottom_Set0_Entry1B : dw $00C0,$0080                   ;92D25B;

SamusBottomTiles_Set0_D262:
; CAh: Facing left-   shinespark - horizontal - frame 0
; CEh: Facing left-   shinespark - diagonal - frame 0
    dl SamusTiles_Bottom_Set0_Entry1C : dw $00C0,$0080                   ;92D262;

SamusBottomTiles_Set0_D269:
; 2: Facing left-   normal - frame 2
; 2: Facing left-   normal - frame 7
; 48h: Unused - frame 2
; 48h: Unused - frame 7
; 8Ah: Facing left-   ran into a wall - frame 2
; 8Ah: Facing left-   ran into a wall - frame 7
; A9h: Facing left-   grappling - frame 2
; A9h: Facing left-   grappling - frame 7
    dl SamusTiles_Bottom_Set0_Entry1D : dw $00C0,$00C0                   ;92D269;

SamusBottomTiles_Set0_D270:
; 19h: Facing right - spin jump - frame Bh
; 1Bh: Facing right - space jump - frame Bh
; 20h: Unused - frame Bh
; 21h: Unused - frame Bh
; 22h: Unused - frame Bh
; 23h: Unused - frame Bh
; 24h: Unused - frame Bh
; 33h: Unused - frame Bh
; 34h: Unused - frame Bh
; 39h: Unused - frame Bh
; 3Ah: Unused - frame Bh
; 42h: Unused - frame Bh
; 81h: Facing right - screw attack - frame 1Bh
    dl SamusTiles_Bottom_Set0_Entry1E : dw $0080,$0080                   ;92D270;

SamusBottomTiles_Set0_D277:
; 1Ah: Facing left-   spin jump - frame Bh
; 1Ch: Facing left-   space jump - frame Bh
; 82h: Facing left-   screw attack - frame 1Bh
    dl SamusTiles_Bottom_Set0_Entry1F : dw $0080,$0080                   ;92D277;


;;; $D27E: Samus bottom tiles - set 1 (general) ;;;
SamusBottomTiles_Set1_D27E:
; 49h: Facing left-   moonwalk - frame 3
; 4Ah: Facing right - moonwalk - frame 3
; 75h: Facing left-   moonwalk - aiming up-left - frame 3
; 76h: Facing right - moonwalk - aiming up-right - frame 3
; 77h: Facing left-   moonwalk - aiming down-left - frame 3
; 78h: Facing right - moonwalk - aiming down-right - frame 3
    dl SamusTiles_Bottom_Set1_Entry0 : dw $00C0,$0080                    ;92D27E;

SamusBottomTiles_Set1_D285:
; 25h: Facing right - turning - standing - frame 1
; 26h: Facing left-   turning - standing - frame 1
; 8Bh: Facing right - turning - standing - aiming up - frame 1
; 8Ch: Facing left-   turning - standing - aiming up - frame 1
; 8Dh: Facing right - turning - standing - aiming down-right - frame 1
; 8Eh: Facing left-   turning - standing - aiming down-left - frame 1
; 9Ch: Facing right - turning - standing - aiming up-right - frame 1
; 9Dh: Facing left-   turning - standing - aiming up-left - frame 1
; BFh: Facing right - moonwalking - turn/jump left - frame 1
; C0h: Facing left-   moonwalking - turn/jump right - frame 1
; C1h: Facing right - moonwalking - turn/jump left-   aiming up-right - frame 1
; C2h: Facing left-   moonwalking - turn/jump right - aiming up-left - frame 1
; C3h: Facing right - moonwalking - turn/jump left-   aiming down-right - frame 1
; C4h: Facing left-   moonwalking - turn/jump right - aiming down-left - frame 1
; C6h: Unused - frame 1
    dl SamusTiles_Bottom_Set1_Entry1 : dw $0080,$0080                    ;92D285;

SamusBottomTiles_Set1_D28C:
; 2Fh: Facing right - turning - jumping - frame 1
; 30h: Facing left-   turning - jumping - frame 1
; 43h: Facing right - turning - crouching - frame 1
; 44h: Facing left-   turning - crouching - frame 1
; 87h: Facing right - turning - falling - frame 1
; 88h: Facing left-   turning - falling - frame 1
; 8Fh: Facing right - turning - in air - aiming up - frame 1
; 90h: Facing left-   turning - in air - aiming up - frame 1
; 91h: Facing right - turning - in air - aiming down/down-right - frame 1
; 92h: Facing left-   turning - in air - aiming down/down-left - frame 1
; 93h: Facing right - turning - falling - aiming up - frame 1
; 94h: Facing left-   turning - falling - aiming up - frame 1
; 95h: Facing right - turning - falling - aiming down/down-right - frame 1
; 96h: Facing left-   turning - falling - aiming down/down-left - frame 1
; 97h: Facing right - turning - crouching - aiming up - frame 1
; 98h: Facing left-   turning - crouching - aiming up - frame 1
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 1
; 9Ah: Facing left-   turning - crouching - aiming down/down-left - frame 1
; 9Eh: Facing right - turning - in air - aiming up-right - frame 1
; 9Fh: Facing left-   turning - in air - aiming up-left - frame 1
; A0h: Facing right - turning - falling - aiming up-right - frame 1
; A1h: Facing left-   turning - falling - aiming up-left - frame 1
; A2h: Facing right - turning - crouching - aiming up-right - frame 1
; A3h: Facing left-   turning - crouching - aiming up-left - frame 1
    dl SamusTiles_Bottom_Set1_Entry2 : dw $0040,$0040                    ;92D28C;

SamusBottomTiles_Set1_D293:
; 49h: Facing left-   moonwalk - frame 0
; 4Ah: Facing right - moonwalk - frame 0
; 75h: Facing left-   moonwalk - aiming up-left - frame 0
; 76h: Facing right - moonwalk - aiming up-right - frame 0
; 77h: Facing left-   moonwalk - aiming down-left - frame 0
; 78h: Facing right - moonwalk - aiming down-right - frame 0
    dl SamusTiles_Bottom_Set1_Entry3 : dw $00C0,$0080                    ;92D293;

SamusBottomTiles_Set1_D29A:
; 49h: Facing left-   moonwalk - frame 1
; 4Ah: Facing right - moonwalk - frame 1
; 75h: Facing left-   moonwalk - aiming up-left - frame 1
; 76h: Facing right - moonwalk - aiming up-right - frame 1
; 77h: Facing left-   moonwalk - aiming down-left - frame 1
; 78h: Facing right - moonwalk - aiming down-right - frame 1
    dl SamusTiles_Bottom_Set1_Entry4 : dw $0080,$0080                    ;92D29A;

SamusBottomTiles_Set1_D2A1:
; 49h: Facing left-   moonwalk - frame 4
; 4Ah: Facing right - moonwalk - frame 4
; 75h: Facing left-   moonwalk - aiming up-left - frame 4
; 76h: Facing right - moonwalk - aiming up-right - frame 4
; 77h: Facing left-   moonwalk - aiming down-left - frame 4
; 78h: Facing right - moonwalk - aiming down-right - frame 4
    dl SamusTiles_Bottom_Set1_Entry5 : dw $0080,$0080                    ;92D2A1;

SamusBottomTiles_Set1_D2A8:
; 35h: Facing right - crouching transition - frame 0
; 3Bh: Facing right - standing transition - frame 0
; 4Bh: Facing right - normal jump transition - frame 0
; 55h: Facing right - normal jump transition - aiming up - frame 0
; 57h: Facing right - normal jump transition - aiming up-right - frame 0
; 59h: Facing right - normal jump transition - aiming down-right - frame 0
; A4h: Facing right - landing from normal jump - frame 0
; A6h: Facing right - landing from spin jump - frame 1
; D3h: Facing right - crystal flash - frame Eh
; D7h: Facing right - crystal flash ending - frames 0..3
; D8h: Facing left-   crystal flash ending - frames 0..2
; DBh: Unused - frame 0
; DCh: Unused - frame 0
; DDh: Unused - frame 2
; DEh: Unused - frame 2
; E0h: Facing right - landing from normal jump - aiming up - frame 0
; E2h: Facing right - landing from normal jump - aiming up-right - frame 0
; E4h: Facing right - landing from normal jump - aiming down-right - frame 0
; E6h: Facing right - landing from normal jump - firing - frame 0
; E8h: Facing right - Samus drained - crouching/falling - frames 0..2
; E8h: Facing right - Samus drained - crouching/falling - frame Eh
; E9h: Facing left-   Samus drained - crouching/falling - frames 0..1
; EAh: Facing right - Samus drained - standing - frame 5
; F1h: Facing right - crouching transition - aiming up - frame 0
; F3h: Facing right - crouching transition - aiming up-right - frame 0
; F5h: Facing right - crouching transition - aiming down-right - frame 0
; F7h: Facing right - standing transition - aiming up - frame 0
; F9h: Facing right - standing transition - aiming up-right - frame 0
; FBh: Facing right - standing transition - aiming down-right - frame 0
    dl SamusTiles_Bottom_Set1_Entry6 : dw $00C0,$0080                    ;92D2A8;

SamusBottomTiles_Set1_D2AF:
; 36h: Facing left-   crouching transition - frame 0
; 3Ch: Facing left-   standing transition - frame 0
; 4Ch: Facing left-   normal jump transition - frame 0
; 56h: Facing left-   normal jump transition - aiming up - frame 0
; 58h: Facing left-   normal jump transition - aiming up-left - frame 0
; 5Ah: Facing left-   normal jump transition - aiming down-left - frame 0
; A5h: Facing left-   landing from normal jump - frame 0
; A7h: Facing left-   landing from spin jump - frame 1
; D4h: Facing left-   crystal flash - frame Eh
; D8h: Facing left-   crystal flash ending - frame 3
; E1h: Facing left-   landing from normal jump - aiming up - frame 0
; E3h: Facing left-   landing from normal jump - aiming up-left - frame 0
; E5h: Facing left-   landing from normal jump - aiming down-left - frame 0
; E7h: Facing left-   landing from normal jump - firing - frame 0
; E9h: Facing left-   Samus drained - crouching/falling - frame 7
; E9h: Facing left-   Samus drained - crouching/falling - frame Fh
; E9h: Facing left-   Samus drained - crouching/falling - frame 14h
; E9h: Facing left-   Samus drained - crouching/falling - frame 16h
; EBh: Facing left-   Samus drained - standing - frame 5
; F2h: Facing left-   crouching transition - aiming up - frame 0
; F4h: Facing left-   crouching transition - aiming up-left - frame 0
; F6h: Facing left-   crouching transition - aiming down-left - frame 0
; F8h: Facing left-   standing transition - aiming up - frame 0
; FAh: Facing left-   standing transition - aiming up-left - frame 0
; FCh: Facing left-   standing transition - aiming down-left - frame 0
    dl SamusTiles_Bottom_Set1_Entry7 : dw $00C0,$0080                    ;92D2AF;

SamusBottomTiles_Set1_D2B6:
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frames 2..3
; C7h: Facing right - vertical shinespark windup - frames 2..3
; F0h: Facing right - grabbed by Draygon - moving - frame 5
    dl SamusTiles_Bottom_Set1_Entry8 : dw $00E0,$0040                    ;92D2B6;

SamusBottomTiles_Set1_D2BD:
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frames 2..3
; BEh: Facing left-   grabbed by Draygon - moving - frame 5
; C8h: Facing left-   vertical shinespark windup - frames 2..3
    dl SamusTiles_Bottom_Set1_Entry9 : dw $00E0,$0040                    ;92D2BD;

SamusBottomTiles_Set1_D2C4:
; 13h: Facing right - normal jump - not aiming - not moving - gun extended - frame 0
; 15h: Facing right - normal jump - aiming up - frame 0
; 17h: Facing right - normal jump - aiming down - frame 0
; 29h: Facing right - falling - frame 0
; 29h: Facing right - falling - frame 5
; 2Bh: Facing right - falling - aiming up - frame 0
; 2Dh: Facing right - falling - aiming down - frame 0
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 4
; 50h: Facing right - damage boost - frame 1
; 51h: Facing right - normal jump - not aiming - moving forward - frame 0
; 67h: Facing right - falling - gun extended - frame 0
; 67h: Facing right - falling - gun extended - frame 5
; 69h: Facing right - normal jump - aiming up-right - frame 0
; 6Bh: Facing right - normal jump - aiming down-right - frame 0
; 6Dh: Facing right - falling - aiming up-right - frame 0
; 6Fh: Facing right - falling - aiming down-right - frame 0
; ACh: Unused. Facing right - grappling - in air - frame 0
; AEh: Unused. Facing right - grappling - in air - aiming down - frame 0
; B0h: Unused. Facing right - grappling - in air - aiming down-right - frame 0
; C7h: Facing right - vertical shinespark windup - frame 4
    dl SamusTiles_Bottom_Set1_EntryA : dw $00A0,$0080                    ;92D2C4;

SamusBottomTiles_Set1_D2CB:
; 14h: Facing left-   normal jump - not aiming - not moving - gun extended - frame 0
; 16h: Facing left-   normal jump - aiming up - frame 0
; 18h: Facing left-   normal jump - aiming down - frame 0
; 2Ah: Facing left-   falling - frame 0
; 2Ah: Facing left-   falling - frame 5
; 2Ch: Facing left-   falling - aiming up - frame 0
; 2Eh: Facing left-   falling - aiming down - frame 0
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 4
; 4Fh: Facing left-   damage boost - frame 1
; 52h: Facing left-   normal jump - not aiming - moving forward - frame 0
; 68h: Facing left-   falling - gun extended - frame 0
; 68h: Facing left-   falling - gun extended - frame 5
; 6Ah: Facing left-   normal jump - aiming up-left - frame 0
; 6Ch: Facing left-   normal jump - aiming down-left - frame 0
; 6Eh: Facing left-   falling - aiming up-left - frame 0
; 70h: Facing left-   falling - aiming down-left - frame 0
; ADh: Unused. Facing left-   grappling - in air - frame 0
; AFh: Unused. Facing left-   grappling - in air - aiming down - frame 0
; B1h: Unused. Facing left-   grappling - in air - aiming down-left - frame 0
; C8h: Facing left-   vertical shinespark windup - frame 4
    dl SamusTiles_Bottom_Set1_EntryB : dw $00A0,$0080                    ;92D2CB;

SamusBottomTiles_Set1_D2D2:
; 29h: Facing right - falling - frames 1..2
; 2Bh: Facing right - falling - aiming up - frame 1
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 5
; 53h: Facing right - knockback - frame 0
; 67h: Facing right - falling - gun extended - frames 1..2
; 6Dh: Facing right - falling - aiming up-right - frame 1
; 6Fh: Facing right - falling - aiming down-right - frame 1
; C7h: Facing right - vertical shinespark windup - frame 5
; D7h: Facing right - crystal flash ending - frame 4
; E8h: Facing right - Samus drained - crouching/falling - frames 3..7
; F0h: Facing right - grabbed by Draygon - moving - frame 0
; F0h: Facing right - grabbed by Draygon - moving - frame 3
    dl SamusTiles_Bottom_Set1_EntryC : dw $0080,$0080                    ;92D2D2;

SamusBottomTiles_Set1_D2D9:
; 2Ah: Facing left-   falling - frames 1..2
; 2Ch: Facing left-   falling - aiming up - frame 1
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 5
; 54h: Facing left-   knockback - frame 0
; 68h: Facing left-   falling - gun extended - frames 1..2
; 6Eh: Facing left-   falling - aiming up-left - frame 1
; 70h: Facing left-   falling - aiming down-left - frame 1
; BEh: Facing left-   grabbed by Draygon - moving - frame 0
; BEh: Facing left-   grabbed by Draygon - moving - frame 3
; C8h: Facing left-   vertical shinespark windup - frame 5
; D8h: Facing left-   crystal flash ending - frame 4
; E9h: Facing left-   Samus drained - crouching/falling - frames 2..6
    dl SamusTiles_Bottom_Set1_EntryD : dw $0080,$0080                    ;92D2D9;

SamusBottomTiles_Set1_D2E0:
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 1
; C7h: Facing right - vertical shinespark windup - frame 1
; F0h: Facing right - grabbed by Draygon - moving - frame 4
    dl SamusTiles_Bottom_Set1_EntryE : dw $00C0,$0040                    ;92D2E0;

SamusBottomTiles_Set1_D2E7:
; 4Eh: Facing left-   normal jump - not aiming - not moving - gun not extended - frame 1
; BEh: Facing left-   grabbed by Draygon - moving - frame 4
; C8h: Facing left-   vertical shinespark windup - frame 1
    dl SamusTiles_Bottom_Set1_EntryF : dw $00C0,$0040                    ;92D2E7;


UNUSED_SamusBottomTiles_Set1_92D2EE:
    dl SamusTiles_Bottom_Set1_Entry10 : dw $0020,$0000                   ;92D2EE;


SamusBottomTiles_Set1_D2F5:
; 17h: Facing right - normal jump - aiming down - frame 1
; 2Dh: Facing right - falling - aiming down - frame 1
; AEh: Unused. Facing right - grappling - in air - aiming down - frame 1
    dl SamusTiles_Bottom_Set1_Entry11 : dw $00E0,$0040                   ;92D2F5;

SamusBottomTiles_Set1_D2FC:
; 18h: Facing left-   normal jump - aiming down - frame 1
; 2Eh: Facing left-   falling - aiming down - frame 1
; AFh: Unused. Facing left-   grappling - in air - aiming down - frame 1
    dl SamusTiles_Bottom_Set1_Entry12 : dw $00E0,$0040                   ;92D2FC;

SamusBottomTiles_Set1_D303:
; 65h: Unused. Related to movement type Dh - frame 0
; 83h: Facing right - wall jump - frame 0
    dl SamusTiles_Bottom_Set1_Entry13 : dw $0100,$0040                   ;92D303;

SamusBottomTiles_Set1_D30A:
; 66h: Unused. Related to movement type Dh - frame 0
; 84h: Facing left-   wall jump - frame 0
    dl SamusTiles_Bottom_Set1_Entry14 : dw $00C0,$0040                   ;92D30A;

SamusBottomTiles_Set1_D311:
; 49h: Facing left-   moonwalk - frame 2
; 63h: Unused. Related to movement type Dh - frame 0
    dl SamusTiles_Bottom_Set1_Entry15 : dw $00A0,$0080                   ;92D311;

SamusBottomTiles_Set1_D318:
; 49h: Facing left-   moonwalk - frame 5
; 64h: Unused. Related to movement type Dh - frame 0
    dl SamusTiles_Bottom_Set1_Entry16 : dw $00A0,$0080                   ;92D318;

SamusBottomTiles_Set1_D31F:
; 4Ah: Facing right - moonwalk - frame 2
; 75h: Facing left-   moonwalk - aiming up-left - frame 2
; 76h: Facing right - moonwalk - aiming up-right - frame 2
; 77h: Facing left-   moonwalk - aiming down-left - frame 2
; 78h: Facing right - moonwalk - aiming down-right - frame 2
    dl SamusTiles_Bottom_Set1_Entry17 : dw $00A0,$0080                   ;92D31F;

SamusBottomTiles_Set1_D326:
; 4Ah: Facing right - moonwalk - frame 5
; 75h: Facing left-   moonwalk - aiming up-left - frame 5
; 76h: Facing right - moonwalk - aiming up-right - frame 5
; 77h: Facing left-   moonwalk - aiming down-left - frame 5
; 78h: Facing right - moonwalk - aiming down-right - frame 5
    dl SamusTiles_Bottom_Set1_Entry18 : dw $00A0,$0080                   ;92D326;

SamusBottomTiles_Set1_D32D:
; 13h: Facing right - normal jump - not aiming - not moving - gun extended - frame 1
; 19h: Facing right - spin jump - frame 0
; 1Bh: Facing right - space jump - frame 0
; 20h: Unused - frame 0
; 21h: Unused - frame 0
; 22h: Unused - frame 0
; 23h: Unused - frame 0
; 24h: Unused - frame 0
; 29h: Facing right - falling - frame 6
; 2Bh: Facing right - falling - aiming up - frame 2
; 33h: Unused - frame 0
; 34h: Unused - frame 0
; 39h: Unused - frame 0
; 3Ah: Unused - frame 0
; 42h: Unused - frame 0
; 50h: Facing right - damage boost - frame 9
; 51h: Facing right - normal jump - not aiming - moving forward - frame 1
; 67h: Facing right - falling - gun extended - frame 6
; 6Bh: Facing right - normal jump - aiming down-right - frame 1
; 6Dh: Facing right - falling - aiming up-right - frame 2
; 6Fh: Facing right - falling - aiming down-right - frame 2
; 81h: Facing right - screw attack - frame 0
; 83h: Facing right - wall jump - frame 1
; A6h: Facing right - landing from spin jump - frame 0
; ACh: Unused. Facing right - grappling - in air - frame 1
; B0h: Unused. Facing right - grappling - in air - aiming down-right - frame 1
; F0h: Facing right - grabbed by Draygon - moving - frame 2
    dl SamusTiles_Bottom_Set1_Entry19 : dw $00E0,$0080                   ;92D32D;

SamusBottomTiles_Set1_D334:
; 14h: Facing left-   normal jump - not aiming - not moving - gun extended - frame 1
; 1Ah: Facing left-   spin jump - frame 0
; 1Ch: Facing left-   space jump - frame 0
; 2Ah: Facing left-   falling - frame 6
; 2Ch: Facing left-   falling - aiming up - frame 2
; 4Fh: Facing left-   damage boost - frame 9
; 52h: Facing left-   normal jump - not aiming - moving forward - frame 1
; 68h: Facing left-   falling - gun extended - frame 6
; 6Ch: Facing left-   normal jump - aiming down-left - frame 1
; 6Eh: Facing left-   falling - aiming up-left - frame 2
; 70h: Facing left-   falling - aiming down-left - frame 2
; 82h: Facing left-   screw attack - frame 0
; 84h: Facing left-   wall jump - frame 1
; A7h: Facing left-   landing from spin jump - frame 0
; ADh: Unused. Facing left-   grappling - in air - frame 1
; B1h: Unused. Facing left-   grappling - in air - aiming down-left - frame 1
; BEh: Facing left-   grabbed by Draygon - moving - frame 2
; E9h: Facing left-   Samus drained - crouching/falling - frame Eh
; E9h: Facing left-   Samus drained - crouching/falling - frame 13h
; E9h: Facing left-   Samus drained - crouching/falling - frame 17h
    dl SamusTiles_Bottom_Set1_Entry1A : dw $00E0,$0080                   ;92D334;

SamusBottomTiles_Set1_D33B:
; 53h: Facing right - knockback - frame 1
; D7h: Facing right - crystal flash ending - frame 5
; ECh: Facing right - grabbed by Draygon - not moving - not aiming - frame 0
; EDh: Facing right - grabbed by Draygon - not moving - aiming up-right - frame 0
; EEh: Facing right - grabbed by Draygon - firing - frame 0
; EFh: Facing right - grabbed by Draygon - not moving - aiming down-right - frame 0
; F0h: Facing right - grabbed by Draygon - moving - frame 1
    dl SamusTiles_Bottom_Set1_Entry1B : dw $00C0,$0080                   ;92D33B;

SamusBottomTiles_Set1_D342:
; 54h: Facing left-   knockback - frame 1
; BAh: Facing left-   grabbed by Draygon - not moving - not aiming - frame 0
; BBh: Facing left-   grabbed by Draygon - not moving - aiming up-left - frame 0
; BCh: Facing left-   grabbed by Draygon - firing - frame 0
; BDh: Facing left-   grabbed by Draygon - not moving - aiming down-left - frame 0
; BEh: Facing left-   grabbed by Draygon - moving - frame 1
; D8h: Facing left-   crystal flash ending - frame 5
    dl SamusTiles_Bottom_Set1_Entry1C : dw $00C0,$0080                   ;92D342;


UNUSED_SamusBottomTiles_Set1_92D349:
    dl SamusTiles_Bottom_Set1_Entry1D : dw $0080,$0080                   ;92D349;


SamusBottomTiles_Set1_D350:
; E9h: Facing left-   Samus drained - crouching/falling - frames 8..Bh
; E9h: Facing left-   Samus drained - crouching/falling - frame 1Ah
; E9h: Facing left-   Samus drained - crouching/falling - frame 1Dh
; EBh: Facing left-   Samus drained - standing - frames 0..3
    dl SamusTiles_Bottom_Set1_Entry1E : dw $0060,$0040                   ;92D350;

SamusBottomTiles_Set1_D357:
; E8h: Facing right - Samus drained - crouching/falling - frames 8..Bh
; EAh: Facing right - Samus drained - standing - frames 0..3
    dl SamusTiles_Bottom_Set1_Entry1F : dw $0060,$0040                   ;92D357;


;;; $D35E: Samus bottom tiles - set 2 (facing clockwise - grappling - in air - upside up) ;;;
SamusBottomTiles_Set2_D35E:
; 5Dh: Unused - frames 17h..19h
; 5Eh: Unused - frames 17h..19h
; 5Fh: Unused - frames 17h..19h
; 60h: Unused - frames 17h..19h
; 61h: Unused - frames 17h..19h
; B2h: Facing clockwise   -   grapple - in air - frames 17h..19h
    dl SamusTiles_Bottom_Set2_Entry0 : dw $0080,$0040                    ;92D35E;

SamusBottomTiles_Set2_D365:
; 5Dh: Unused - frames 15h..16h
; 5Eh: Unused - frames 15h..16h
; 5Fh: Unused - frames 15h..16h
; 60h: Unused - frames 15h..16h
; 61h: Unused - frames 15h..16h
; B2h: Facing clockwise   -   grapple - in air - frames 15h..16h
    dl SamusTiles_Bottom_Set2_Entry1 : dw $00E0,$0040                    ;92D365;

SamusBottomTiles_Set2_D36C:
; 5Dh: Unused - frames 13h..14h
; 5Eh: Unused - frames 13h..14h
; 5Fh: Unused - frames 13h..14h
; 60h: Unused - frames 13h..14h
; 61h: Unused - frames 13h..14h
; B2h: Facing clockwise   -   grapple - in air - frames 13h..14h
    dl SamusTiles_Bottom_Set2_Entry2 : dw $00A0,$0080                    ;92D36C;

SamusBottomTiles_Set2_D373:
; 5Dh: Unused - frame 12h
; 5Eh: Unused - frame 12h
; 5Fh: Unused - frame 12h
; 60h: Unused - frame 12h
; 61h: Unused - frame 12h
; B2h: Facing clockwise   -   grapple - in air - frame 12h
    dl SamusTiles_Bottom_Set2_Entry3 : dw $00A0,$0040                    ;92D373;

SamusBottomTiles_Set2_D37A:
; 5Dh: Unused - frame 11h
; 5Eh: Unused - frame 11h
; 5Fh: Unused - frame 11h
; 60h: Unused - frame 11h
; 61h: Unused - frame 11h
; B2h: Facing clockwise   -   grapple - in air - frame 11h
    dl SamusTiles_Bottom_Set2_Entry4 : dw $00C0,$0040                    ;92D37A;

SamusBottomTiles_Set2_D381:
; 5Dh: Unused - frame 10h
; 5Eh: Unused - frame 10h
; 5Fh: Unused - frame 10h
; 60h: Unused - frame 10h
; 61h: Unused - frame 10h
; B2h: Facing clockwise   -   grapple - in air - frame 10h
    dl SamusTiles_Bottom_Set2_Entry5 : dw $00C0,$0040                    ;92D381;

SamusBottomTiles_Set2_D388:
; 5Dh: Unused - frame Fh
; 5Eh: Unused - frame Fh
; 5Fh: Unused - frame Fh
; 60h: Unused - frame Fh
; 61h: Unused - frame Fh
; B2h: Facing clockwise   -   grapple - in air - frame Fh
    dl SamusTiles_Bottom_Set2_Entry6 : dw $0080,$0040                    ;92D388;

SamusBottomTiles_Set2_D38F:
; 5Dh: Unused - frame Eh
; 5Eh: Unused - frame Eh
; 5Fh: Unused - frame Eh
; 60h: Unused - frame Eh
; 61h: Unused - frame Eh
; B2h: Facing clockwise   -   grapple - in air - frame Eh
    dl SamusTiles_Bottom_Set2_Entry7 : dw $00A0,$0040                    ;92D38F;

SamusBottomTiles_Set2_D396:
; 5Dh: Unused - frames Ch..Dh
; 5Eh: Unused - frames Ch..Dh
; 5Fh: Unused - frames Ch..Dh
; 60h: Unused - frames Ch..Dh
; 61h: Unused - frames Ch..Dh
; B2h: Facing clockwise   -   grapple - in air - frames Ch..Dh
    dl SamusTiles_Bottom_Set2_Entry8 : dw $00A0,$0040                    ;92D396;

SamusBottomTiles_Set2_D39D:
; 5Dh: Unused - frames Ah..Bh
; 5Eh: Unused - frames Ah..Bh
; 5Fh: Unused - frames Ah..Bh
; 60h: Unused - frames Ah..Bh
; 61h: Unused - frames Ah..Bh
; B2h: Facing clockwise   -   grapple - in air - frames Ah..Bh
    dl SamusTiles_Bottom_Set2_Entry9 : dw $00C0,$0040                    ;92D39D;


UNUSED_SamusBottomTiles_Set2_92D3A4:
    dl SamusTiles_Bottom_Set2_EntryA : dw $00A0,$0080                    ;92D3A4;


SamusBottomTiles_Set2_D3AB:
; 5Dh: Unused - frame 40h
; 5Eh: Unused - frame 40h
; 5Fh: Unused - frame 40h
; 60h: Unused - frame 40h
; 61h: Unused - frame 40h
; B2h: Facing clockwise   -   grapple - in air - frame 40h
    dl SamusTiles_Bottom_Set2_EntryB : dw $0080,$0080                    ;92D3AB;

SamusBottomTiles_Set2_D3B2:
; 5Dh: Unused - frame 41h
; 5Eh: Unused - frame 41h
; 5Fh: Unused - frame 41h
; 60h: Unused - frame 41h
; 61h: Unused - frame 41h
; B2h: Facing clockwise   -   grapple - in air - frame 41h
    dl SamusTiles_Bottom_Set2_EntryC : dw $0080,$0080                    ;92D3B2;

SamusBottomTiles_Set2_D3B9:
; 5Dh: Unused - frames 37h..39h
; 5Eh: Unused - frames 37h..39h
; 5Fh: Unused - frames 37h..39h
; 60h: Unused - frames 37h..39h
; 61h: Unused - frames 37h..39h
; B2h: Facing clockwise   -   grapple - in air - frames 37h..39h
    dl SamusTiles_Bottom_Set2_EntryD : dw $0080,$0080                    ;92D3B9;

SamusBottomTiles_Set2_D3C0:
; 5Dh: Unused - frames 35h..36h
; 5Eh: Unused - frames 35h..36h
; 5Fh: Unused - frames 35h..36h
; 60h: Unused - frames 35h..36h
; 61h: Unused - frames 35h..36h
; B2h: Facing clockwise   -   grapple - in air - frames 35h..36h
    dl SamusTiles_Bottom_Set2_EntryE : dw $00A0,$0040                    ;92D3C0;

SamusBottomTiles_Set2_D3C7:
; 5Dh: Unused - frames 33h..34h
; 5Eh: Unused - frames 33h..34h
; 5Fh: Unused - frames 33h..34h
; 60h: Unused - frames 33h..34h
; 61h: Unused - frames 33h..34h
; B2h: Facing clockwise   -   grapple - in air - frames 33h..34h
    dl SamusTiles_Bottom_Set2_EntryF : dw $0080,$0080                    ;92D3C7;

SamusBottomTiles_Set2_D3CE:
; 5Dh: Unused - frame 32h
; 5Eh: Unused - frame 32h
; 5Fh: Unused - frame 32h
; 60h: Unused - frame 32h
; 61h: Unused - frame 32h
; B2h: Facing clockwise   -   grapple - in air - frame 32h
    dl SamusTiles_Bottom_Set2_Entry10 : dw $0080,$0080                   ;92D3CE;

SamusBottomTiles_Set2_D3D5:
; 5Dh: Unused - frame 31h
; 5Eh: Unused - frame 31h
; 5Fh: Unused - frame 31h
; 60h: Unused - frame 31h
; 61h: Unused - frame 31h
; B2h: Facing clockwise   -   grapple - in air - frame 31h
    dl SamusTiles_Bottom_Set2_Entry11 : dw $00A0,$0040                   ;92D3D5;

SamusBottomTiles_Set2_D3DC:
; 5Dh: Unused - frame 30h
; 5Eh: Unused - frame 30h
; 5Fh: Unused - frame 30h
; 60h: Unused - frame 30h
; 61h: Unused - frame 30h
; B2h: Facing clockwise   -   grapple - in air - frame 30h
    dl SamusTiles_Bottom_Set2_Entry12 : dw $0080,$0080                   ;92D3DC;

SamusBottomTiles_Set2_D3E3:
; 5Dh: Unused - frame 2Fh
; 5Eh: Unused - frame 2Fh
; 5Fh: Unused - frame 2Fh
; 60h: Unused - frame 2Fh
; 61h: Unused - frame 2Fh
; B2h: Facing clockwise   -   grapple - in air - frame 2Fh
    dl SamusTiles_Bottom_Set2_Entry13 : dw $0080,$0080                   ;92D3E3;

SamusBottomTiles_Set2_D3EA:
; 5Dh: Unused - frame 2Eh
; 5Eh: Unused - frame 2Eh
; 5Fh: Unused - frame 2Eh
; 60h: Unused - frame 2Eh
; 61h: Unused - frame 2Eh
; B2h: Facing clockwise   -   grapple - in air - frame 2Eh
    dl SamusTiles_Bottom_Set2_Entry14 : dw $0080,$0080                   ;92D3EA;

SamusBottomTiles_Set2_D3F1:
; 5Dh: Unused - frames 2Ch..2Dh
; 5Eh: Unused - frames 2Ch..2Dh
; 5Fh: Unused - frames 2Ch..2Dh
; 60h: Unused - frames 2Ch..2Dh
; 61h: Unused - frames 2Ch..2Dh
; B2h: Facing clockwise   -   grapple - in air - frames 2Ch..2Dh
    dl SamusTiles_Bottom_Set2_Entry15 : dw $00C0,$0080                   ;92D3F1;

SamusBottomTiles_Set2_D3F8:
; 5Dh: Unused - frames 2Ah..2Bh
; 5Eh: Unused - frames 2Ah..2Bh
; 5Fh: Unused - frames 2Ah..2Bh
; 60h: Unused - frames 2Ah..2Bh
; 61h: Unused - frames 2Ah..2Bh
; B2h: Facing clockwise   -   grapple - in air - frames 2Ah..2Bh
    dl SamusTiles_Bottom_Set2_Entry16 : dw $0080,$0080                   ;92D3F8;


UNUSED_SamusBottomTiles_Set2_92D3FF:
    dl SamusTiles_Bottom_Set2_Entry17 : dw $0080,$0080                   ;92D3FF;



;;; $D406: Samus bottom tiles - set 4 (facing clockwise - grappling - in air - upside down) ;;;
SamusBottomTiles_Set4_D406:
; 5Dh: Unused - frames 7..9
; 5Eh: Unused - frames 7..9
; 5Fh: Unused - frames 7..9
; 60h: Unused - frames 7..9
; 61h: Unused - frames 7..9
; B2h: Facing clockwise   -   grapple - in air - frames 7..9
    dl SamusTiles_Bottom_Set4_Entry0 : dw $0080,$0040                    ;92D406;

SamusBottomTiles_Set4_D40D:
; 5Dh: Unused - frames 5..6
; 5Eh: Unused - frames 5..6
; 5Fh: Unused - frames 5..6
; 60h: Unused - frames 5..6
; 61h: Unused - frames 5..6
; B2h: Facing clockwise   -   grapple - in air - frames 5..6
    dl SamusTiles_Bottom_Set4_Entry1 : dw $00E0,$0040                    ;92D40D;

SamusBottomTiles_Set4_D414:
; 5Dh: Unused - frames 3..4
; 5Eh: Unused - frames 3..4
; 5Fh: Unused - frames 3..4
; 60h: Unused - frames 3..4
; 61h: Unused - frames 3..4
; B2h: Facing clockwise   -   grapple - in air - frames 3..4
    dl SamusTiles_Bottom_Set4_Entry2 : dw $00A0,$0080                    ;92D414;

SamusBottomTiles_Set4_D41B:
; 5Dh: Unused - frame 2
; 5Eh: Unused - frame 2
; 5Fh: Unused - frame 2
; 60h: Unused - frame 2
; 61h: Unused - frame 2
; B2h: Facing clockwise   -   grapple - in air - frame 2
    dl SamusTiles_Bottom_Set4_Entry3 : dw $00A0,$0040                    ;92D41B;

SamusBottomTiles_Set4_D422:
; 5Dh: Unused - frame 1
; 5Eh: Unused - frame 1
; 5Fh: Unused - frame 1
; 60h: Unused - frame 1
; 61h: Unused - frame 1
; B2h: Facing clockwise   -   grapple - in air - frame 1
    dl SamusTiles_Bottom_Set4_Entry4 : dw $00C0,$0040                    ;92D422;

SamusBottomTiles_Set4_D429:
; 5Dh: Unused - frame 0
; 5Eh: Unused - frame 0
; 5Fh: Unused - frame 0
; 60h: Unused - frame 0
; 61h: Unused - frame 0
; B2h: Facing clockwise   -   grapple - in air - frame 0
    dl SamusTiles_Bottom_Set4_Entry5 : dw $00C0,$0040                    ;92D429;

SamusBottomTiles_Set4_D430:
; 5Dh: Unused - frame 1Fh
; 5Eh: Unused - frame 1Fh
; 5Fh: Unused - frame 1Fh
; 60h: Unused - frame 1Fh
; 61h: Unused - frame 1Fh
; B2h: Facing clockwise   -   grapple - in air - frame 1Fh
    dl SamusTiles_Bottom_Set4_Entry6 : dw $0080,$0040                    ;92D430;

SamusBottomTiles_Set4_D437:
; 5Dh: Unused - frame 1Eh
; 5Eh: Unused - frame 1Eh
; 5Fh: Unused - frame 1Eh
; 60h: Unused - frame 1Eh
; 61h: Unused - frame 1Eh
; B2h: Facing clockwise   -   grapple - in air - frame 1Eh
    dl SamusTiles_Bottom_Set4_Entry7 : dw $00A0,$0040                    ;92D437;

SamusBottomTiles_Set4_D43E:
; 5Dh: Unused - frames 1Ch..1Dh
; 5Eh: Unused - frames 1Ch..1Dh
; 5Fh: Unused - frames 1Ch..1Dh
; 60h: Unused - frames 1Ch..1Dh
; 61h: Unused - frames 1Ch..1Dh
; B2h: Facing clockwise   -   grapple - in air - frames 1Ch..1Dh
    dl SamusTiles_Bottom_Set4_Entry8 : dw $00A0,$0040                    ;92D43E;

SamusBottomTiles_Set4_D445:
; 5Dh: Unused - frames 1Ah..1Bh
; 5Eh: Unused - frames 1Ah..1Bh
; 5Fh: Unused - frames 1Ah..1Bh
; 60h: Unused - frames 1Ah..1Bh
; 61h: Unused - frames 1Ah..1Bh
; B2h: Facing clockwise   -   grapple - in air - frames 1Ah..1Bh
    dl SamusTiles_Bottom_Set4_Entry9 : dw $00C0,$0040                    ;92D445;


UNUSED_SamusBottomTiles_Set4_92D44C:
    dl SamusTiles_Bottom_Set4_EntryA : dw $00A0,$0080                    ;92D44C;

UNUSED_SamusBottomTiles_Set4_92D453:
    dl SamusTiles_Bottom_Set4_EntryB : dw $0080,$0080                    ;92D453;

UNUSED_SamusBottomTiles_Set4_92D45A:
    dl SamusTiles_Bottom_Set4_EntryC : dw $0080,$0080                    ;92D45A;


SamusBottomTiles_Set4_D461:
; 5Dh: Unused - frames 27h..29h
; 5Eh: Unused - frames 27h..29h
; 5Fh: Unused - frames 27h..29h
; 60h: Unused - frames 27h..29h
; 61h: Unused - frames 27h..29h
; B2h: Facing clockwise   -   grapple - in air - frames 27h..29h
    dl SamusTiles_Bottom_Set4_EntryD : dw $0080,$0080                    ;92D461;

SamusBottomTiles_Set4_D468:
; 5Dh: Unused - frames 25h..26h
; 5Eh: Unused - frames 25h..26h
; 5Fh: Unused - frames 25h..26h
; 60h: Unused - frames 25h..26h
; 61h: Unused - frames 25h..26h
; B2h: Facing clockwise   -   grapple - in air - frames 25h..26h
    dl SamusTiles_Bottom_Set4_EntryE : dw $00A0,$0040                    ;92D468;

SamusBottomTiles_Set4_D46F:
; 5Dh: Unused - frames 23h..24h
; 5Eh: Unused - frames 23h..24h
; 5Fh: Unused - frames 23h..24h
; 60h: Unused - frames 23h..24h
; 61h: Unused - frames 23h..24h
; B2h: Facing clockwise   -   grapple - in air - frames 23h..24h
    dl SamusTiles_Bottom_Set4_EntryF : dw $0080,$0080                    ;92D46F;

SamusBottomTiles_Set4_D476:
; 5Dh: Unused - frame 22h
; 5Eh: Unused - frame 22h
; 5Fh: Unused - frame 22h
; 60h: Unused - frame 22h
; 61h: Unused - frame 22h
; B2h: Facing clockwise   -   grapple - in air - frame 22h
    dl SamusTiles_Bottom_Set4_Entry10 : dw $0080,$0080                   ;92D476;

SamusBottomTiles_Set4_D47D:
; 5Dh: Unused - frame 21h
; 5Eh: Unused - frame 21h
; 5Fh: Unused - frame 21h
; 60h: Unused - frame 21h
; 61h: Unused - frame 21h
; B2h: Facing clockwise   -   grapple - in air - frame 21h
    dl SamusTiles_Bottom_Set4_Entry11 : dw $00A0,$0040                   ;92D47D;

SamusBottomTiles_Set4_D484:
; 5Dh: Unused - frame 20h
; 5Dh: Unused - frame 3Fh
; 5Eh: Unused - frame 20h
; 5Eh: Unused - frame 3Fh
; 5Fh: Unused - frame 20h
; 5Fh: Unused - frame 3Fh
; 60h: Unused - frame 20h
; 60h: Unused - frame 3Fh
; 61h: Unused - frame 20h
; 61h: Unused - frame 3Fh
; B2h: Facing clockwise   -   grapple - in air - frame 20h
; B2h: Facing clockwise   -   grapple - in air - frame 3Fh
    dl SamusTiles_Bottom_Set4_Entry12 : dw $0080,$0080                   ;92D484;

SamusBottomTiles_Set4_D48B:
; 5Dh: Unused - frame 3Eh
; 5Eh: Unused - frame 3Eh
; 5Fh: Unused - frame 3Eh
; 60h: Unused - frame 3Eh
; 61h: Unused - frame 3Eh
; B2h: Facing clockwise   -   grapple - in air - frame 3Eh
    dl SamusTiles_Bottom_Set4_Entry13 : dw $0080,$0080                   ;92D48B;

SamusBottomTiles_Set4_D492:
; 5Dh: Unused - frames 3Ch..3Dh
; 5Eh: Unused - frames 3Ch..3Dh
; 5Fh: Unused - frames 3Ch..3Dh
; 60h: Unused - frames 3Ch..3Dh
; 61h: Unused - frames 3Ch..3Dh
; B2h: Facing clockwise   -   grapple - in air - frames 3Ch..3Dh
    dl SamusTiles_Bottom_Set4_Entry14 : dw $0080,$0080                   ;92D492;

SamusBottomTiles_Set4_D499:
; 5Dh: Unused - frames 3Ah..3Bh
; 5Eh: Unused - frames 3Ah..3Bh
; 5Fh: Unused - frames 3Ah..3Bh
; 60h: Unused - frames 3Ah..3Bh
; 61h: Unused - frames 3Ah..3Bh
; B2h: Facing clockwise   -   grapple - in air - frames 3Ah..3Bh
    dl SamusTiles_Bottom_Set4_Entry15 : dw $0080,$0080                   ;92D499;


UNUSED_SamusBottomTiles_Set4_92D4A0:
    dl SamusTiles_Bottom_Set4_Entry16 : dw $0080,$0080                   ;92D4A0;



;;; $D4A7: Samus bottom tiles - set 5 (facing anticlockwise - grappling - in air - upside up) ;;;
SamusBottomTiles_Set5_D4A7:
; 62h: Unused - frames 7..9
; B3h: Facing anticlockwise - grapple - in air - frames 7..9
    dl SamusTiles_Bottom_Set5_Entry0 : dw $0080,$0040                    ;92D4A7;

SamusBottomTiles_Set5_D4AE:
; 62h: Unused - frames Ah..Bh
; B3h: Facing anticlockwise - grapple - in air - frames Ah..Bh
    dl SamusTiles_Bottom_Set5_Entry1 : dw $00E0,$0040                    ;92D4AE;

SamusBottomTiles_Set5_D4B5:
; 62h: Unused - frames Ch..Dh
; B3h: Facing anticlockwise - grapple - in air - frames Ch..Dh
    dl SamusTiles_Bottom_Set5_Entry2 : dw $00A0,$0080                    ;92D4B5;

SamusBottomTiles_Set5_D4BC:
; 62h: Unused - frame Eh
; B3h: Facing anticlockwise - grapple - in air - frame Eh
    dl SamusTiles_Bottom_Set5_Entry3 : dw $00A0,$0040                    ;92D4BC;

SamusBottomTiles_Set5_D4C3:
; 62h: Unused - frame Fh
; B3h: Facing anticlockwise - grapple - in air - frame Fh
    dl SamusTiles_Bottom_Set5_Entry4 : dw $00C0,$0040                    ;92D4C3;

SamusBottomTiles_Set5_D4CA:
; 62h: Unused - frame 10h
; B3h: Facing anticlockwise - grapple - in air - frame 10h
    dl SamusTiles_Bottom_Set5_Entry5 : dw $00C0,$0040                    ;92D4CA;

SamusBottomTiles_Set5_D4D1:
; 62h: Unused - frame 11h
; B3h: Facing anticlockwise - grapple - in air - frame 11h
    dl SamusTiles_Bottom_Set5_Entry6 : dw $0080,$0040                    ;92D4D1;

SamusBottomTiles_Set5_D4D8:
; 62h: Unused - frame 12h
; B3h: Facing anticlockwise - grapple - in air - frame 12h
    dl SamusTiles_Bottom_Set5_Entry7 : dw $00A0,$0040                    ;92D4D8;

SamusBottomTiles_Set5_D4DF:
; 62h: Unused - frames 13h..14h
; B3h: Facing anticlockwise - grapple - in air - frames 13h..14h
    dl SamusTiles_Bottom_Set5_Entry8 : dw $00A0,$0040                    ;92D4DF;

SamusBottomTiles_Set5_D4E6:
; 62h: Unused - frames 15h..16h
; B3h: Facing anticlockwise - grapple - in air - frames 15h..16h
    dl SamusTiles_Bottom_Set5_Entry9 : dw $00C0,$0040                    ;92D4E6;


UNUSED_SamusBottomTiles_Set5_92D4ED:
    dl SamusTiles_Bottom_Set5_EntryA : dw $00A0,$0080                    ;92D4ED;


SamusBottomTiles_Set5_D4F4:
; 62h: Unused - frame 40h
; B3h: Facing anticlockwise - grapple - in air - frame 40h
    dl SamusTiles_Bottom_Set5_EntryB : dw $0080,$0080                    ;92D4F4;

SamusBottomTiles_Set5_D4FB:
; 62h: Unused - frame 41h
; B3h: Facing anticlockwise - grapple - in air - frame 41h
    dl SamusTiles_Bottom_Set5_EntryC : dw $0080,$0080                    ;92D4FB;


UNUSED_SamusBottomTiles_Set5_92D502:
; 62h: Unused - frames 27h..29h
; B3h: Facing anticlockwise - grapple - in air - frames 27h..29h
    dl SamusTiles_Bottom_Set5_EntryD : dw $0080,$0080                    ;92D502;


SamusBottomTiles_Set5_D509:
; 62h: Unused - frames 2Ah..2Bh
; B3h: Facing anticlockwise - grapple - in air - frames 2Ah..2Bh
    dl SamusTiles_Bottom_Set5_EntryE : dw $00A0,$0040                    ;92D509;

SamusBottomTiles_Set5_D510:
; 62h: Unused - frames 2Ch..2Dh
; B3h: Facing anticlockwise - grapple - in air - frames 2Ch..2Dh
    dl SamusTiles_Bottom_Set5_EntryF : dw $0080,$0080                    ;92D510;

SamusBottomTiles_Set5_D517:
; 62h: Unused - frame 2Eh
; B3h: Facing anticlockwise - grapple - in air - frame 2Eh
    dl SamusTiles_Bottom_Set5_Entry10 : dw $0080,$0080                   ;92D517;

SamusBottomTiles_Set5_D51E:
; 62h: Unused - frame 2Fh
; B3h: Facing anticlockwise - grapple - in air - frame 2Fh
    dl SamusTiles_Bottom_Set5_Entry11 : dw $00A0,$0040                   ;92D51E;

SamusBottomTiles_Set5_D525:
; 62h: Unused - frame 30h
; B3h: Facing anticlockwise - grapple - in air - frame 30h
    dl SamusTiles_Bottom_Set5_Entry12 : dw $0080,$0080                   ;92D525;

SamusBottomTiles_Set5_D52C:
; 62h: Unused - frame 31h
; B3h: Facing anticlockwise - grapple - in air - frame 31h
    dl SamusTiles_Bottom_Set5_Entry13 : dw $0080,$0080                   ;92D52C;

SamusBottomTiles_Set5_D533:
; 62h: Unused - frame 32h
; B3h: Facing anticlockwise - grapple - in air - frame 32h
    dl SamusTiles_Bottom_Set5_Entry14 : dw $0080,$0080                   ;92D533;

SamusBottomTiles_Set5_D53A:
; 62h: Unused - frames 33h..34h
; B3h: Facing anticlockwise - grapple - in air - frames 33h..34h
    dl SamusTiles_Bottom_Set5_Entry15 : dw $00C0,$0080                   ;92D53A;

SamusBottomTiles_Set5_D541:
; 62h: Unused - frames 35h..36h
; B3h: Facing anticlockwise - grapple - in air - frames 35h..36h
    dl SamusTiles_Bottom_Set5_Entry16 : dw $0080,$0080                   ;92D541;


UNUSED_SamusBottomTiles_Set5_92D548:
    dl SamusTiles_Bottom_Set5_Entry17 : dw $0080,$0080                   ;92D548;



;;; $D54F: Samus bottom tiles - set 6 (facing anticlockwise - grappling - in air - upside down) ;;;
SamusBottomTiles_Set6_D54F:
; 62h: Unused - frames 17h..19h
; B3h: Facing anticlockwise - grapple - in air - frames 17h..19h
    dl SamusTiles_Bottom_Set6_Entry0 : dw $0080,$0040                    ;92D54F;

SamusBottomTiles_Set6_D556:
; 62h: Unused - frames 1Ah..1Bh
; B3h: Facing anticlockwise - grapple - in air - frames 1Ah..1Bh
    dl SamusTiles_Bottom_Set6_Entry1 : dw $00E0,$0040                    ;92D556;

SamusBottomTiles_Set6_D55D:
; 62h: Unused - frames 1Ch..1Dh
; B3h: Facing anticlockwise - grapple - in air - frames 1Ch..1Dh
    dl SamusTiles_Bottom_Set6_Entry2 : dw $00A0,$0080                    ;92D55D;

SamusBottomTiles_Set6_D564:
; 62h: Unused - frame 1Eh
; B3h: Facing anticlockwise - grapple - in air - frame 1Eh
    dl SamusTiles_Bottom_Set6_Entry3 : dw $00A0,$0040                    ;92D564;

SamusBottomTiles_Set6_D56B:
; 62h: Unused - frame 1Fh
; B3h: Facing anticlockwise - grapple - in air - frame 1Fh
    dl SamusTiles_Bottom_Set6_Entry4 : dw $00C0,$0040                    ;92D56B;

SamusBottomTiles_Set6_D572:
; 62h: Unused - frame 0
; B3h: Facing anticlockwise - grapple - in air - frame 0
    dl SamusTiles_Bottom_Set6_Entry5 : dw $00C0,$0040                    ;92D572;

SamusBottomTiles_Set6_D579:
; 62h: Unused - frame 1
; B3h: Facing anticlockwise - grapple - in air - frame 1
    dl SamusTiles_Bottom_Set6_Entry6 : dw $0080,$0040                    ;92D579;

SamusBottomTiles_Set6_D580:
; 62h: Unused - frame 2
; B3h: Facing anticlockwise - grapple - in air - frame 2
    dl SamusTiles_Bottom_Set6_Entry7 : dw $00A0,$0040                    ;92D580;

SamusBottomTiles_Set6_D587:
; 62h: Unused - frames 3..4
; B3h: Facing anticlockwise - grapple - in air - frames 3..4
    dl SamusTiles_Bottom_Set6_Entry8 : dw $00A0,$0040                    ;92D587;

SamusBottomTiles_Set6_D58E:
; 62h: Unused - frames 5..6
; B3h: Facing anticlockwise - grapple - in air - frames 5..6
    dl SamusTiles_Bottom_Set6_Entry9 : dw $00C0,$0040                    ;92D58E;


UNUSED_SamusBottomTiles_Set6_92D595:
    dl SamusTiles_Bottom_Set6_EntryA : dw $00A0,$0080                    ;92D595;

UNUSED_SamusBottomTiles_Set6_92D59C:
    dl SamusTiles_Bottom_Set6_EntryB : dw $0080,$0080                    ;92D59C;

UNUSED_SamusBottomTiles_Set6_92D5A3:
    dl SamusTiles_Bottom_Set6_EntryC : dw $0080,$0080                    ;92D5A3;


SamusBottomTiles_Set6_D5AA:
; 62h: Unused - frames 37h..39h
; B3h: Facing anticlockwise - grapple - in air - frames 37h..39h
    dl SamusTiles_Bottom_Set6_EntryD : dw $0080,$0080                    ;92D5AA;

SamusBottomTiles_Set6_D5B1:
; 62h: Unused - frames 3Ah..3Bh
; B3h: Facing anticlockwise - grapple - in air - frames 3Ah..3Bh
    dl SamusTiles_Bottom_Set6_EntryE : dw $00A0,$0040                    ;92D5B1;

SamusBottomTiles_Set6_D5B8:
; 62h: Unused - frames 3Ch..3Dh
; B3h: Facing anticlockwise - grapple - in air - frames 3Ch..3Dh
    dl SamusTiles_Bottom_Set6_EntryF : dw $0080,$0080                    ;92D5B8;

SamusBottomTiles_Set6_D5BF:
; 62h: Unused - frame 3Eh
; B3h: Facing anticlockwise - grapple - in air - frame 3Eh
    dl SamusTiles_Bottom_Set6_Entry10 : dw $0080,$0080                   ;92D5BF;

SamusBottomTiles_Set6_D5C6:
; 62h: Unused - frame 3Fh
; B3h: Facing anticlockwise - grapple - in air - frame 3Fh
    dl SamusTiles_Bottom_Set6_Entry11 : dw $00A0,$0040                   ;92D5C6;

SamusBottomTiles_Set6_D5CD:
; 62h: Unused - frame 20h
; B3h: Facing anticlockwise - grapple - in air - frame 20h
    dl SamusTiles_Bottom_Set6_Entry12 : dw $0080,$0080                   ;92D5CD;

SamusBottomTiles_Set6_D5D4:
; 62h: Unused - frame 21h
; B3h: Facing anticlockwise - grapple - in air - frame 21h
    dl SamusTiles_Bottom_Set6_Entry13 : dw $0080,$0080                   ;92D5D4;

SamusBottomTiles_Set6_D5DB:
; 62h: Unused - frame 22h
; B3h: Facing anticlockwise - grapple - in air - frame 22h
    dl SamusTiles_Bottom_Set6_Entry14 : dw $0080,$0080                   ;92D5DB;

SamusBottomTiles_Set6_D5E2:
; 62h: Unused - frames 23h..24h
; B3h: Facing anticlockwise - grapple - in air - frames 23h..24h
    dl SamusTiles_Bottom_Set6_Entry15 : dw $0080,$0080                   ;92D5E2;

SamusBottomTiles_Set6_D5E9:
; 62h: Unused - frames 25h..26h
; B3h: Facing anticlockwise - grapple - in air - frames 25h..26h
    dl SamusTiles_Bottom_Set6_Entry16 : dw $0080,$0080                   ;92D5E9;


;;; $D5F0: Samus bottom tiles - set 8 (facing forward) ;;;
SamusBottomTiles_Set8_D5F0:
; 0: Facing forward - power suit - frames 2..5Fh
    dl SamusTiles_Bottom_Set8_Entry0 : dw $0100,$0100                    ;92D5F0;

SamusBottomTiles_Set8_D5F7:
; 9Bh: Facing forward - varia/gravity suit - frames 2..5Fh
    dl SamusTiles_Bottom_Set8_Entry1 : dw $0100,$0100                    ;92D5F7;


UNUSED_SamusBottomTiles_Set8_92D5FE:
    dl SamusTiles_Bottom_Set8_Entry2 : dw $0020,$0000                    ;92D5FE;



;;; $D605: Samus bottom tiles - set Ah (general) ;;;
SamusBottomTiles_SetA_D605:
; 3: Facing right - aiming up - frames 0..1
; 5: Facing right - aiming up-right - frame 0
; 7: Facing right - aiming down-right - frame 0
; AAh: Facing right - grappling - aiming down-right - frame 0
; CFh: Facing right - ran into a wall - aiming up-right - frame 0
; D1h: Facing right - ran into a wall - aiming down-right - frame 0
    dl SamusTiles_Bottom_SetA_Entry0 : dw $00C0,$0080                    ;92D605;

SamusBottomTiles_SetA_D60C:
; 4: Facing left-   aiming up - frames 0..1
; 6: Facing left-   aiming up-left - frame 0
; 8: Facing left-   aiming down-left - frame 0
; ABh: Facing left-   grappling - aiming down-left - frame 0
; D0h: Facing left-   ran into a wall - aiming up-left - frame 0
; D2h: Facing left-   ran into a wall - aiming down-left - frame 0
; E9h: Facing left-   Samus drained - crouching/falling - frame 10h
; E9h: Facing left-   Samus drained - crouching/falling - frame 15h
    dl SamusTiles_Bottom_SetA_Entry1 : dw $00C0,$0080                    ;92D60C;


;;; $D613: Samus top tiles - set Ah (morph ball, spin jump, screw attack sparks) ;;;
SamusTopTiles_SetA_D613:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 0
; 1Eh: Moving right - morph ball - no springball - on ground - frame 0
; 1Fh: Moving left-   morph ball - no springball - on ground - frame 7
; 31h: Facing right - morph ball - no springball - in air - frame 0
; 32h: Facing left-   morph ball - no springball - in air - frame 0
; 3Fh: Unused - frame 0
; 40h: Unused - frame 0
; 41h: Facing left-   morph ball - no springball - on ground - frame 7
; 79h: Facing right - morph ball - spring ball - on ground - frame 0
; 7Ah: Facing left-   morph ball - spring ball - on ground - frame 7
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 0
; 7Ch: Moving left-   morph ball - spring ball - on ground - frame 7
; 7Dh: Facing right - morph ball - spring ball - falling - frame 0
; 7Eh: Facing left-   morph ball - spring ball - falling - frame 7
; 7Fh: Facing right - morph ball - spring ball - in air - frame 0
; 80h: Facing left-   morph ball - spring ball - in air - frame 7
; C5h: Unused - frame 7
; D7h: Facing right - crystal flash ending - frame 0
; DFh: Unused. Related to Draygon - frame 7
; E8h: Facing right - Samus drained - crouching/falling - frame 0
    dl SamusTiles_Top_SetA_Entry0 : dw $0060,$0040                       ;92D613;

SamusTopTiles_SetA_D61A:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 2
; 1Eh: Moving right - morph ball - no springball - on ground - frame 2
; 1Fh: Moving left-   morph ball - no springball - on ground - frame 5
; 31h: Facing right - morph ball - no springball - in air - frame 2
; 32h: Facing left-   morph ball - no springball - in air - frame 2
; 3Fh: Unused - frame 2
; 40h: Unused - frame 2
; 41h: Facing left-   morph ball - no springball - on ground - frame 5
; 79h: Facing right - morph ball - spring ball - on ground - frame 2
; 7Ah: Facing left-   morph ball - spring ball - on ground - frame 5
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 2
; 7Ch: Moving left-   morph ball - spring ball - on ground - frame 5
; 7Dh: Facing right - morph ball - spring ball - falling - frame 2
; 7Eh: Facing left-   morph ball - spring ball - falling - frame 5
; 7Fh: Facing right - morph ball - spring ball - in air - frame 2
; 80h: Facing left-   morph ball - spring ball - in air - frame 5
; C5h: Unused - frame 5
; DFh: Unused. Related to Draygon - frame 5
    dl SamusTiles_Top_SetA_Entry1 : dw $0060,$0040                       ;92D61A;

SamusTopTiles_SetA_D621:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 4
; 1Eh: Moving right - morph ball - no springball - on ground - frame 4
; 1Fh: Moving left-   morph ball - no springball - on ground - frame 3
; 31h: Facing right - morph ball - no springball - in air - frame 4
; 32h: Facing left-   morph ball - no springball - in air - frame 4
; 3Fh: Unused - frame 4
; 40h: Unused - frame 4
; 41h: Facing left-   morph ball - no springball - on ground - frame 3
; 79h: Facing right - morph ball - spring ball - on ground - frame 4
; 7Ah: Facing left-   morph ball - spring ball - on ground - frame 3
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 4
; 7Ch: Moving left-   morph ball - spring ball - on ground - frame 3
; 7Dh: Facing right - morph ball - spring ball - falling - frame 4
; 7Eh: Facing left-   morph ball - spring ball - falling - frame 3
; 7Fh: Facing right - morph ball - spring ball - in air - frame 4
; 80h: Facing left-   morph ball - spring ball - in air - frame 3
; C5h: Unused - frame 3
; DFh: Unused. Related to Draygon - frame 3
    dl SamusTiles_Top_SetA_Entry2 : dw $0060,$0040                       ;92D621;

SamusTopTiles_SetA_D628:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 6
; 1Eh: Moving right - morph ball - no springball - on ground - frame 6
; 1Fh: Moving left-   morph ball - no springball - on ground - frame 1
; 31h: Facing right - morph ball - no springball - in air - frame 6
; 32h: Facing left-   morph ball - no springball - in air - frame 6
; 3Fh: Unused - frame 6
; 40h: Unused - frame 6
; 41h: Facing left-   morph ball - no springball - on ground - frame 1
; 79h: Facing right - morph ball - spring ball - on ground - frame 6
; 7Ah: Facing left-   morph ball - spring ball - on ground - frame 1
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 6
; 7Ch: Moving left-   morph ball - spring ball - on ground - frame 1
; 7Dh: Facing right - morph ball - spring ball - falling - frame 6
; 7Eh: Facing left-   morph ball - spring ball - falling - frame 1
; 7Fh: Facing right - morph ball - spring ball - in air - frame 6
; 80h: Facing left-   morph ball - spring ball - in air - frame 1
; C5h: Unused - frame 1
; DFh: Unused. Related to Draygon - frame 1
    dl SamusTiles_Top_SetA_Entry3 : dw $0060,$0040                       ;92D628;

SamusTopTiles_SetA_D62F:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 1
; 1Eh: Moving right - morph ball - no springball - on ground - frame 1
; 1Fh: Moving left-   morph ball - no springball - on ground - frame 6
; 31h: Facing right - morph ball - no springball - in air - frame 1
; 32h: Facing left-   morph ball - no springball - in air - frame 1
; 3Fh: Unused - frame 1
; 40h: Unused - frame 1
; 41h: Facing left-   morph ball - no springball - on ground - frame 6
; 79h: Facing right - morph ball - spring ball - on ground - frame 1
; 7Ah: Facing left-   morph ball - spring ball - on ground - frame 6
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 1
; 7Ch: Moving left-   morph ball - spring ball - on ground - frame 6
; 7Dh: Facing right - morph ball - spring ball - falling - frame 1
; 7Eh: Facing left-   morph ball - spring ball - falling - frame 6
; 7Fh: Facing right - morph ball - spring ball - in air - frame 1
; 80h: Facing left-   morph ball - spring ball - in air - frame 6
; C5h: Unused - frame 6
; DFh: Unused. Related to Draygon - frame 6
    dl SamusTiles_Top_SetA_Entry4 : dw $00A0,$0000                       ;92D62F;

SamusTopTiles_SetA_D636:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 3
; 1Eh: Moving right - morph ball - no springball - on ground - frame 3
; 1Fh: Moving left-   morph ball - no springball - on ground - frame 4
; 31h: Facing right - morph ball - no springball - in air - frame 3
; 32h: Facing left-   morph ball - no springball - in air - frame 3
; 3Fh: Unused - frame 3
; 40h: Unused - frame 3
; 41h: Facing left-   morph ball - no springball - on ground - frame 4
; 79h: Facing right - morph ball - spring ball - on ground - frame 3
; 7Ah: Facing left-   morph ball - spring ball - on ground - frame 4
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 3
; 7Ch: Moving left-   morph ball - spring ball - on ground - frame 4
; 7Dh: Facing right - morph ball - spring ball - falling - frame 3
; 7Eh: Facing left-   morph ball - spring ball - falling - frame 4
; 7Fh: Facing right - morph ball - spring ball - in air - frame 3
; 80h: Facing left-   morph ball - spring ball - in air - frame 4
; C5h: Unused - frame 4
; DFh: Unused. Related to Draygon - frame 4
    dl SamusTiles_Top_SetA_Entry5 : dw $0060,$0040                       ;92D636;

SamusTopTiles_SetA_D63D:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 5
; 1Eh: Moving right - morph ball - no springball - on ground - frame 5
; 1Fh: Moving left-   morph ball - no springball - on ground - frame 2
; 31h: Facing right - morph ball - no springball - in air - frame 5
; 32h: Facing left-   morph ball - no springball - in air - frame 5
; 3Fh: Unused - frame 5
; 40h: Unused - frame 5
; 41h: Facing left-   morph ball - no springball - on ground - frame 2
; 79h: Facing right - morph ball - spring ball - on ground - frame 5
; 7Ah: Facing left-   morph ball - spring ball - on ground - frame 2
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 5
; 7Ch: Moving left-   morph ball - spring ball - on ground - frame 2
; 7Dh: Facing right - morph ball - spring ball - falling - frame 5
; 7Eh: Facing left-   morph ball - spring ball - falling - frame 2
; 7Fh: Facing right - morph ball - spring ball - in air - frame 5
; 80h: Facing left-   morph ball - spring ball - in air - frame 2
; C5h: Unused - frame 2
; DFh: Unused. Related to Draygon - frame 2
    dl SamusTiles_Top_SetA_Entry6 : dw $0060,$0040                       ;92D63D;

SamusTopTiles_SetA_D644:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 7
; 1Eh: Moving right - morph ball - no springball - on ground - frame 7
; 1Fh: Moving left-   morph ball - no springball - on ground - frame 0
; 31h: Facing right - morph ball - no springball - in air - frame 7
; 32h: Facing left-   morph ball - no springball - in air - frame 7
; 3Fh: Unused - frame 7
; 40h: Unused - frame 7
; 41h: Facing left-   morph ball - no springball - on ground - frame 0
; 79h: Facing right - morph ball - spring ball - on ground - frame 7
; 7Ah: Facing left-   morph ball - spring ball - on ground - frame 0
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 7
; 7Ch: Moving left-   morph ball - spring ball - on ground - frame 0
; 7Dh: Facing right - morph ball - spring ball - falling - frame 7
; 7Eh: Facing left-   morph ball - spring ball - falling - frame 0
; 7Fh: Facing right - morph ball - spring ball - in air - frame 7
; 80h: Facing left-   morph ball - spring ball - in air - frame 0
; C5h: Unused - frame 0
; DFh: Unused. Related to Draygon - frame 0
    dl SamusTiles_Top_SetA_Entry7 : dw $0060,$0040                       ;92D644;

SamusTopTiles_SetA_D64B:
; 19h: Facing right - spin jump - frame 1
; 1Ah: Facing left-   spin jump - frame 1
; 20h: Unused - frame 1
; 21h: Unused - frame 1
; 22h: Unused - frame 1
; 23h: Unused - frame 1
; 24h: Unused - frame 1
; 33h: Unused - frame 1
; 34h: Unused - frame 1
; 39h: Unused - frame 1
; 3Ah: Unused - frame 1
; 42h: Unused - frame 1
; 83h: Facing right - wall jump - frame 3
; 84h: Facing left-   wall jump - frame 3
    dl SamusTiles_Top_SetA_Entry8 : dw $0080,$0080                       ;92D64B;

SamusTopTiles_SetA_D652:
; 19h: Facing right - spin jump - frame 2
; 1Ah: Facing left-   spin jump - frame 2
; 20h: Unused - frame 2
; 21h: Unused - frame 2
; 22h: Unused - frame 2
; 23h: Unused - frame 2
; 24h: Unused - frame 2
; 33h: Unused - frame 2
; 34h: Unused - frame 2
; 39h: Unused - frame 2
; 3Ah: Unused - frame 2
; 42h: Unused - frame 2
; 4Fh: Facing left-   damage boost - frame 8
; 50h: Facing right - damage boost - frame 8
; 83h: Facing right - wall jump - frame 4
; 84h: Facing left-   wall jump - frame 4
    dl SamusTiles_Top_SetA_Entry9 : dw $0100,$0100                       ;92D652;

SamusTopTiles_SetA_D659:
; 19h: Facing right - spin jump - frame 3
; 1Ah: Facing left-   spin jump - frame 3
; 20h: Unused - frame 3
; 21h: Unused - frame 3
; 22h: Unused - frame 3
; 23h: Unused - frame 3
; 24h: Unused - frame 3
; 33h: Unused - frame 3
; 34h: Unused - frame 3
; 39h: Unused - frame 3
; 3Ah: Unused - frame 3
; 42h: Unused - frame 3
; 4Fh: Facing left-   damage boost - frame 7
; 50h: Facing right - damage boost - frame 7
; 83h: Facing right - wall jump - frame 5
; 84h: Facing left-   wall jump - frame 5
    dl SamusTiles_Top_SetA_EntryA : dw $0080,$0080                       ;92D659;

SamusTopTiles_SetA_D660:
; 19h: Facing right - spin jump - frame 4
; 1Ah: Facing left-   spin jump - frame 4
; 20h: Unused - frame 4
; 21h: Unused - frame 4
; 22h: Unused - frame 4
; 23h: Unused - frame 4
; 24h: Unused - frame 4
; 33h: Unused - frame 4
; 34h: Unused - frame 4
; 39h: Unused - frame 4
; 3Ah: Unused - frame 4
; 42h: Unused - frame 4
; 4Fh: Facing left-   damage boost - frame 6
; 50h: Facing right - damage boost - frame 6
; 83h: Facing right - wall jump - frame 6
; 84h: Facing left-   wall jump - frame 6
    dl SamusTiles_Top_SetA_EntryB : dw $0100,$0100                       ;92D660;

SamusTopTiles_SetA_D667:
; 19h: Facing right - spin jump - frame 5
; 1Ah: Facing left-   spin jump - frame 5
; 20h: Unused - frame 5
; 21h: Unused - frame 5
; 22h: Unused - frame 5
; 23h: Unused - frame 5
; 24h: Unused - frame 5
; 33h: Unused - frame 5
; 34h: Unused - frame 5
; 39h: Unused - frame 5
; 3Ah: Unused - frame 5
; 42h: Unused - frame 5
; 4Fh: Facing left-   damage boost - frame 5
; 50h: Facing right - damage boost - frame 5
; 83h: Facing right - wall jump - frame 7
; 84h: Facing left-   wall jump - frame 7
    dl SamusTiles_Top_SetA_EntryC : dw $0080,$0080                       ;92D667;

SamusTopTiles_SetA_D66E:
; 19h: Facing right - spin jump - frame 6
; 1Ah: Facing left-   spin jump - frame 6
; 20h: Unused - frame 6
; 21h: Unused - frame 6
; 22h: Unused - frame 6
; 23h: Unused - frame 6
; 24h: Unused - frame 6
; 33h: Unused - frame 6
; 34h: Unused - frame 6
; 39h: Unused - frame 6
; 3Ah: Unused - frame 6
; 42h: Unused - frame 6
; 4Fh: Facing left-   damage boost - frame 4
; 50h: Facing right - damage boost - frame 4
; 83h: Facing right - wall jump - frame 8
; 84h: Facing left-   wall jump - frame 8
    dl SamusTiles_Top_SetA_EntryD : dw $0100,$0100                       ;92D66E;

SamusTopTiles_SetA_D675:
; 19h: Facing right - spin jump - frame 7
; 1Ah: Facing left-   spin jump - frame 7
; 20h: Unused - frame 7
; 21h: Unused - frame 7
; 22h: Unused - frame 7
; 23h: Unused - frame 7
; 24h: Unused - frame 7
; 33h: Unused - frame 7
; 34h: Unused - frame 7
; 39h: Unused - frame 7
; 3Ah: Unused - frame 7
; 42h: Unused - frame 7
; 4Fh: Facing left-   damage boost - frame 3
; 50h: Facing right - damage boost - frame 3
; 83h: Facing right - wall jump - frame 9
; 84h: Facing left-   wall jump - frame 9
    dl SamusTiles_Top_SetA_EntryE : dw $0080,$0080                       ;92D675;

SamusTopTiles_SetA_D67C:
; 19h: Facing right - spin jump - frame 8
; 1Ah: Facing left-   spin jump - frame 8
; 20h: Unused - frame 8
; 21h: Unused - frame 8
; 22h: Unused - frame 8
; 23h: Unused - frame 8
; 24h: Unused - frame 8
; 33h: Unused - frame 8
; 34h: Unused - frame 8
; 39h: Unused - frame 8
; 3Ah: Unused - frame 8
; 42h: Unused - frame 8
; 4Fh: Facing left-   damage boost - frame 2
; 50h: Facing right - damage boost - frame 2
; 83h: Facing right - wall jump - frame Ah
; 84h: Facing left-   wall jump - frame Ah
    dl SamusTiles_Top_SetA_EntryF : dw $0100,$0100                       ;92D67C;

SamusTopTiles_SetA_D683:
; 65h: Unused. Related to movement type Dh - frame 1
; 66h: Unused. Related to movement type Dh - frame 1
; 81h: Facing right - screw attack - frames 1..3
; 82h: Facing left-   screw attack - frames 1..3
; 83h: Facing right - wall jump - frames 17h..19h
; 84h: Facing left-   wall jump - frames 17h..19h
    dl SamusTiles_Top_SetA_Entry10 : dw $0100,$0040                      ;92D683;

SamusTopTiles_SetA_D68A:
; 65h: Unused. Related to movement type Dh - frame 2
; 66h: Unused. Related to movement type Dh - frame 2
; 81h: Facing right - screw attack - frames 7..9
; 82h: Facing left-   screw attack - frames 7..9
; 83h: Facing right - wall jump - frames 1Dh..1Fh
; 84h: Facing left-   wall jump - frames 1Dh..1Fh
    dl SamusTiles_Top_SetA_Entry11 : dw $0100,$0060                      ;92D68A;

SamusTopTiles_SetA_D691:
; 65h: Unused. Related to movement type Dh - frame 3
; 66h: Unused. Related to movement type Dh - frame 3
; 81h: Facing right - screw attack - frames Dh..Fh
; 82h: Facing left-   screw attack - frames Dh..Fh
; 83h: Facing right - wall jump - frames 23h..25h
; 84h: Facing left-   wall jump - frames 23h..25h
    dl SamusTiles_Top_SetA_Entry12 : dw $0100,$0060                      ;92D691;

SamusTopTiles_SetA_D698:
; 65h: Unused. Related to movement type Dh - frame 4
; 66h: Unused. Related to movement type Dh - frame 4
; 81h: Facing right - screw attack - frames 13h..15h
; 82h: Facing left-   screw attack - frames 13h..15h
; 83h: Facing right - wall jump - frames 29h..2Bh
; 84h: Facing left-   wall jump - frames 29h..2Bh
    dl SamusTiles_Top_SetA_Entry13 : dw $0100,$0000                      ;92D698;

SamusTopTiles_SetA_D69F:
; 1Bh: Facing right - space jump - frames 1..8
; 1Ch: Facing left-   space jump - frames 1..8
; 65h: Unused. Related to movement type Dh - frame 5
; 66h: Unused. Related to movement type Dh - frame 5
; 81h: Facing right - screw attack - frames 4..6
; 81h: Facing right - screw attack - frames Ah..Ch
; 81h: Facing right - screw attack - frames 10h..12h
; 81h: Facing right - screw attack - frames 16h..18h
; 82h: Facing left-   screw attack - frames 4..6
; 82h: Facing left-   screw attack - frames Ah..Ch
; 82h: Facing left-   screw attack - frames 10h..12h
; 82h: Facing left-   screw attack - frames 16h..18h
; 83h: Facing right - wall jump - frames Dh..14h
; 83h: Facing right - wall jump - frames 1Ah..1Ch
; 83h: Facing right - wall jump - frames 20h..22h
; 83h: Facing right - wall jump - frames 26h..28h
; 83h: Facing right - wall jump - frames 2Ch..2Eh
; 84h: Facing left-   wall jump - frames Dh..14h
; 84h: Facing left-   wall jump - frames 1Ah..1Ch
; 84h: Facing left-   wall jump - frames 20h..22h
; 84h: Facing left-   wall jump - frames 26h..28h
; 84h: Facing left-   wall jump - frames 2Ch..2Eh
    dl SamusTiles_Top_SetA_Entry14 : dw $0020,$0000                      ;92D69F;


;;; $D6A6: Samus top tiles - set Bh (morphing transition, unused morph ball bounce) ;;;
UNUSED_SamusTopTiles_SetB_92D6A6:
    dl SamusTiles_Top_SetB_Entry0 : dw $0020,$0000                       ;92D6A6;

SamusTopTiles_SetB_D6AD:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 9
; 1Eh: Moving right - morph ball - no springball - on ground - frame 9
; 1Fh: Moving left-   morph ball - no springball - on ground - frame 9
; 31h: Facing right - morph ball - no springball - in air - frame 9
; 32h: Facing left-   morph ball - no springball - in air - frame 9
; 3Fh: Unused - frame 9
; 40h: Unused - frame 9
; 41h: Facing left-   morph ball - no springball - on ground - frame 9
; 79h: Facing right - morph ball - spring ball - on ground - frame 9
; 7Ah: Facing left-   morph ball - spring ball - on ground - frame 9
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 9
; 7Ch: Moving left-   morph ball - spring ball - on ground - frame 9
; 7Dh: Facing right - morph ball - spring ball - falling - frame 9
; 7Eh: Facing left-   morph ball - spring ball - falling - frame 9
; 7Fh: Facing right - morph ball - spring ball - in air - frame 9
; 80h: Facing left-   morph ball - spring ball - in air - frame 9
; C5h: Unused - frame 9
; DFh: Unused. Related to Draygon - frame 9
    dl SamusTiles_Top_SetB_Entry1 : dw $0060,$0040                       ;92D6AD;


UNUSED_SamusTopTiles_SetB_92D6B4:
    dl SamusTiles_Top_SetB_Entry2 : dw $0060,$0040                       ;92D6B4;


SamusTopTiles_SetB_D6BB:
; 38h: Facing left-   morphing transition - frame 1
; 3Eh: Facing left-   unmorphing transition - frame 0
; D4h: Facing left-   crystal flash - frame 0
; D8h: Facing left-   crystal flash ending - frame 1
; DCh: Unused - frame 2
; DEh: Unused - frame 0
; E9h: Facing left-   Samus drained - crouching/falling - frame 0
    dl SamusTiles_Top_SetB_Entry3 : dw $0080,$0040                       ;92D6BB;

SamusTopTiles_SetB_D6C2:
; 38h: Facing left-   morphing transition - frame 0
; 3Eh: Facing left-   unmorphing transition - frame 1
; D4h: Facing left-   crystal flash - frame 1
; D4h: Facing left-   crystal flash - frame 3
; D4h: Facing left-   crystal flash - frames Ch..Dh
; D8h: Facing left-   crystal flash ending - frame 2
; DCh: Unused - frame 1
; DEh: Unused - frame 1
; E9h: Facing left-   Samus drained - crouching/falling - frame 1
    dl SamusTiles_Top_SetB_Entry4 : dw $00C0,$0040                       ;92D6C2;

SamusTopTiles_SetB_D6C9:
; 37h: Facing right - morphing transition - frame 1
; 3Dh: Facing right - unmorphing transition - frame 0
; D3h: Facing right - crystal flash - frame 0
; D7h: Facing right - crystal flash ending - frame 1
; DBh: Unused - frame 2
; DDh: Unused - frame 0
; E8h: Facing right - Samus drained - crouching/falling - frame 1
    dl SamusTiles_Top_SetB_Entry5 : dw $0080,$0040                       ;92D6C9;

SamusTopTiles_SetB_D6D0:
; 37h: Facing right - morphing transition - frame 0
; 3Dh: Facing right - unmorphing transition - frame 1
; D3h: Facing right - crystal flash - frame 1
; D3h: Facing right - crystal flash - frame 3
; D3h: Facing right - crystal flash - frames Ch..Dh
; D7h: Facing right - crystal flash ending - frame 2
; DBh: Unused - frame 1
; DDh: Unused - frame 1
; E8h: Facing right - Samus drained - crouching/falling - frame 2
    dl SamusTiles_Top_SetB_Entry6 : dw $00C0,$0040                       ;92D6D0;


;;; $D6D7: Samus bottom tiles - set 3 (unused) ;;;
UNUSED_SamusBottomTiles_Set3_92D6D7:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry0_9EE9C0 : dw $0040,$0040      ;92D6D7;


UNUSED_SamusBottomTiles_Set3_92D6DE:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry1_9EEA40 : dw $0080,$0080      ;92D6DE;

UNUSED_SamusBottomTiles_Set3_92D6E5:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry2_9EEB40 : dw $0040,$0040      ;92D6E5;

UNUSED_SamusBottomTiles_Set3_92D6EC:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry3_9EEBC0 : dw $0080,$0080      ;92D6EC;

UNUSED_SamusBottomTiles_Set3_92D6F3:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry4_9EECC0 : dw $0040,$0040      ;92D6F3;

UNUSED_SamusBottomTiles_Set3_92D6FA:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry5_9EED40 : dw $0080,$0080      ;92D6FA;

UNUSED_SamusBottomTiles_Set3_92D701:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry6_9EEE40 : dw $0040,$0040      ;92D701;

UNUSED_SamusBottomTiles_Set3_92D708:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry7_9EEEC0 : dw $0080,$0080      ;92D708;

UNUSED_SamusBottomTiles_Set3_92D70F:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry8_9EEFC0 : dw $0040,$0040      ;92D70F;

UNUSED_SamusBottomTiles_Set3_92D716:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry9_9EF040 : dw $0080,$0080      ;92D716;

UNUSED_SamusBottomTiles_Set3_92D71D:
    dl UNUSED_SamusTiles_Bottom_Set3_EntryA_9EF140 : dw $0040,$0040      ;92D71D;

UNUSED_SamusBottomTiles_Set3_92D724:
    dl UNUSED_SamusTiles_Bottom_Set3_EntryB_9EF1C0 : dw $0080,$0080      ;92D724;

UNUSED_SamusBottomTiles_Set3_92D72B:
    dl UNUSED_SamusTiles_Bottom_Set3_EntryC_9EF2C0 : dw $0040,$0040      ;92D72B;

UNUSED_SamusBottomTiles_Set3_92D732:
    dl UNUSED_SamusTiles_Bottom_Set3_EntryD_9EF340 : dw $0080,$0080      ;92D732;

UNUSED_SamusBottomTiles_Set3_92D739:
    dl UNUSED_SamusTiles_Bottom_Set3_EntryE_9EF440 : dw $0040,$0040      ;92D739;

UNUSED_SamusBottomTiles_Set3_92D740:
    dl UNUSED_SamusTiles_Bottom_Set3_EntryF_9EF4C0 : dw $0080,$0080      ;92D740;

UNUSED_SamusBottomTiles_Set3_92D747:
    dl UNUSED_SamusTiles_Bottom_Set3_Entry10_9EF5C0 : dw $0080,$0080     ;92D747;



;;; $D74E: Samus top tiles - set Ch (crystal flash, vertical shinespark) ;;;
SamusTopTiles_SetC_D74E:
; CBh: Facing right - shinespark - vertical - frame 0
    dl SamusTiles_Top_SetC_Entry0 : dw $0100,$00C0                       ;92D74E;

SamusTopTiles_SetC_D755:
; CCh: Facing left-   shinespark - vertical - frame 0
    dl SamusTiles_Top_SetC_Entry1 : dw $0100,$00C0                       ;92D755;

SamusTopTiles_SetC_D75C:
; D4h: Facing left-   crystal flash - frame 2
; D4h: Facing left-   crystal flash - frame 6
    dl SamusTiles_Top_SetC_Entry2 : dw $0100,$0040                       ;92D75C;

SamusTopTiles_SetC_D763:
; D4h: Facing left-   crystal flash - frame 7
; D4h: Facing left-   crystal flash - frame 9
    dl SamusTiles_Top_SetC_Entry3 : dw $0100,$0040                       ;92D763;

SamusTopTiles_SetC_D76A:
; D4h: Facing left-   crystal flash - frame 8
    dl SamusTiles_Top_SetC_Entry4 : dw $0100,$0040                       ;92D76A;

SamusTopTiles_SetC_D771:
; D3h: Facing right - crystal flash - frame 2
; D3h: Facing right - crystal flash - frame 6
    dl SamusTiles_Top_SetC_Entry5 : dw $0100,$0040                       ;92D771;

SamusTopTiles_SetC_D778:
; D3h: Facing right - crystal flash - frame 7
; D3h: Facing right - crystal flash - frame 9
    dl SamusTiles_Top_SetC_Entry6 : dw $0100,$0040                       ;92D778;

SamusTopTiles_SetC_D77F:
; D3h: Facing right - crystal flash - frame 8
    dl SamusTiles_Top_SetC_Entry7 : dw $0100,$0040                       ;92D77F;


;;; $D786: Samus bottom tiles - set 7 (crystal flash bubble) ;;;
SamusBottomTiles_Set7_D786:
; D3h: Facing right - crystal flash - frame 0
; D3h: Facing right - crystal flash - frame Dh
; D4h: Facing left-   crystal flash - frame 0
; D4h: Facing left-   crystal flash - frame Dh
    dl SamusTiles_Bottom_Set7_Entry0 : dw $0040,$0040                    ;92D786;

SamusBottomTiles_Set7_D78D:
; D3h: Facing right - crystal flash - frame 1
; D3h: Facing right - crystal flash - frame Ch
; D4h: Facing left-   crystal flash - frame 1
; D4h: Facing left-   crystal flash - frame Ch
    dl SamusTiles_Bottom_Set7_Entry1 : dw $0100,$0100                    ;92D78D;

SamusBottomTiles_Set7_D794:
; D3h: Facing right - crystal flash - frames 2..3
; D3h: Facing right - crystal flash - frames 6..9
; D4h: Facing left-   crystal flash - frames 2..3
; D4h: Facing left-   crystal flash - frames 6..9
    dl SamusTiles_Bottom_Set7_Entry2 : dw $0100,$0100                    ;92D794;


;;; $D79B: Samus bottom tiles - set 9 (space jump) ;;;
SamusBottomTiles_Set9_D79B:
; 1Bh: Facing right - space jump - frame 1
; 1Ch: Facing left-   space jump - frame 1
; 81h: Facing right - screw attack - frame 1
; 81h: Facing right - screw attack - frame 9
; 81h: Facing right - screw attack - frame 11h
; 82h: Facing left-   screw attack - frame 1
; 82h: Facing left-   screw attack - frame 9
; 82h: Facing left-   screw attack - frame 11h
; 83h: Facing right - wall jump - frame Dh
; 83h: Facing right - wall jump - frame 17h
; 83h: Facing right - wall jump - frame 1Fh
; 83h: Facing right - wall jump - frame 27h
; 84h: Facing left-   wall jump - frame Dh
; 84h: Facing left-   wall jump - frame 17h
; 84h: Facing left-   wall jump - frame 1Fh
; 84h: Facing left-   wall jump - frame 27h
    dl SamusTiles_Bottom_Set9_Entry0 : dw $0100,$0100                    ;92D79B;

SamusBottomTiles_Set9_D7A2:
; 1Bh: Facing right - space jump - frame 2
; 1Ch: Facing left-   space jump - frame 2
; 81h: Facing right - screw attack - frame 2
; 81h: Facing right - screw attack - frame Ah
; 81h: Facing right - screw attack - frame 12h
; 82h: Facing left-   screw attack - frame 2
; 82h: Facing left-   screw attack - frame Ah
; 82h: Facing left-   screw attack - frame 12h
; 83h: Facing right - wall jump - frame Eh
; 83h: Facing right - wall jump - frame 18h
; 83h: Facing right - wall jump - frame 20h
; 83h: Facing right - wall jump - frame 28h
; 84h: Facing left-   wall jump - frame Eh
; 84h: Facing left-   wall jump - frame 18h
; 84h: Facing left-   wall jump - frame 20h
; 84h: Facing left-   wall jump - frame 28h
    dl SamusTiles_Bottom_Set9_Entry1 : dw $0100,$0100                    ;92D7A2;

SamusBottomTiles_Set9_D7A9:
; 1Bh: Facing right - space jump - frame 3
; 1Ch: Facing left-   space jump - frame 3
; 81h: Facing right - screw attack - frame 3
; 81h: Facing right - screw attack - frame Bh
; 81h: Facing right - screw attack - frame 13h
; 82h: Facing left-   screw attack - frame 3
; 82h: Facing left-   screw attack - frame Bh
; 82h: Facing left-   screw attack - frame 13h
; 83h: Facing right - wall jump - frame Fh
; 83h: Facing right - wall jump - frame 19h
; 83h: Facing right - wall jump - frame 21h
; 83h: Facing right - wall jump - frame 29h
; 84h: Facing left-   wall jump - frame Fh
; 84h: Facing left-   wall jump - frame 19h
; 84h: Facing left-   wall jump - frame 21h
; 84h: Facing left-   wall jump - frame 29h
    dl SamusTiles_Bottom_Set9_Entry2 : dw $0100,$0100                    ;92D7A9;

SamusBottomTiles_Set9_D7B0:
; 1Bh: Facing right - space jump - frame 4
; 1Ch: Facing left-   space jump - frame 4
; 81h: Facing right - screw attack - frame 4
; 81h: Facing right - screw attack - frame Ch
; 81h: Facing right - screw attack - frame 14h
; 82h: Facing left-   screw attack - frame 4
; 82h: Facing left-   screw attack - frame Ch
; 82h: Facing left-   screw attack - frame 14h
; 83h: Facing right - wall jump - frame 10h
; 83h: Facing right - wall jump - frame 1Ah
; 83h: Facing right - wall jump - frame 22h
; 83h: Facing right - wall jump - frame 2Ah
; 84h: Facing left-   wall jump - frame 10h
; 84h: Facing left-   wall jump - frame 1Ah
; 84h: Facing left-   wall jump - frame 22h
; 84h: Facing left-   wall jump - frame 2Ah
    dl SamusTiles_Bottom_Set9_Entry3 : dw $0100,$0100                    ;92D7B0;

SamusBottomTiles_Set9_D7B7:
; 1Bh: Facing right - space jump - frame 5
; 1Ch: Facing left-   space jump - frame 5
; 81h: Facing right - screw attack - frame 5
; 81h: Facing right - screw attack - frame Dh
; 81h: Facing right - screw attack - frame 15h
; 82h: Facing left-   screw attack - frame 5
; 82h: Facing left-   screw attack - frame Dh
; 82h: Facing left-   screw attack - frame 15h
; 83h: Facing right - wall jump - frame 11h
; 83h: Facing right - wall jump - frame 1Bh
; 83h: Facing right - wall jump - frame 23h
; 83h: Facing right - wall jump - frame 2Bh
; 84h: Facing left-   wall jump - frame 11h
; 84h: Facing left-   wall jump - frame 1Bh
; 84h: Facing left-   wall jump - frame 23h
; 84h: Facing left-   wall jump - frame 2Bh
    dl SamusTiles_Bottom_Set9_Entry4 : dw $0100,$0100                    ;92D7B7;

SamusBottomTiles_Set9_D7BE:
; 1Bh: Facing right - space jump - frame 6
; 1Ch: Facing left-   space jump - frame 6
; 81h: Facing right - screw attack - frame 6
; 81h: Facing right - screw attack - frame Eh
; 81h: Facing right - screw attack - frame 16h
; 82h: Facing left-   screw attack - frame 6
; 82h: Facing left-   screw attack - frame Eh
; 82h: Facing left-   screw attack - frame 16h
; 83h: Facing right - wall jump - frame 12h
; 83h: Facing right - wall jump - frame 1Ch
; 83h: Facing right - wall jump - frame 24h
; 83h: Facing right - wall jump - frame 2Ch
; 84h: Facing left-   wall jump - frame 12h
; 84h: Facing left-   wall jump - frame 1Ch
; 84h: Facing left-   wall jump - frame 24h
; 84h: Facing left-   wall jump - frame 2Ch
    dl SamusTiles_Bottom_Set9_Entry5 : dw $0100,$0100                    ;92D7BE;

SamusBottomTiles_Set9_D7C5:
; 1Bh: Facing right - space jump - frame 7
; 1Ch: Facing left-   space jump - frame 7
; 81h: Facing right - screw attack - frame 7
; 81h: Facing right - screw attack - frame Fh
; 81h: Facing right - screw attack - frame 17h
; 82h: Facing left-   screw attack - frame 7
; 82h: Facing left-   screw attack - frame Fh
; 82h: Facing left-   screw attack - frame 17h
; 83h: Facing right - wall jump - frame 13h
; 83h: Facing right - wall jump - frame 1Dh
; 83h: Facing right - wall jump - frame 25h
; 83h: Facing right - wall jump - frame 2Dh
; 84h: Facing left-   wall jump - frame 13h
; 84h: Facing left-   wall jump - frame 1Dh
; 84h: Facing left-   wall jump - frame 25h
; 84h: Facing left-   wall jump - frame 2Dh
    dl SamusTiles_Bottom_Set9_Entry6 : dw $0100,$0100                    ;92D7C5;

SamusBottomTiles_Set9_D7CC:
; 1Bh: Facing right - space jump - frame 8
; 1Ch: Facing left-   space jump - frame 8
; 81h: Facing right - screw attack - frame 8
; 81h: Facing right - screw attack - frame 10h
; 81h: Facing right - screw attack - frame 18h
; 82h: Facing left-   screw attack - frame 8
; 82h: Facing left-   screw attack - frame 10h
; 82h: Facing left-   screw attack - frame 18h
; 83h: Facing right - wall jump - frame 14h
; 83h: Facing right - wall jump - frame 1Eh
; 83h: Facing right - wall jump - frame 26h
; 83h: Facing right - wall jump - frame 2Eh
; 84h: Facing left-   wall jump - frame 14h
; 84h: Facing left-   wall jump - frame 1Eh
; 84h: Facing left-   wall jump - frame 26h
; 84h: Facing left-   wall jump - frame 2Eh
    dl SamusTiles_Bottom_Set9_Entry7 : dw $0100,$0100                    ;92D7CC;



; This section moves the graphics files into banks of your choosing (defines at the top)
org !SamusTilesBank0

;;; $8000: Samus top tiles - set Ah - entry 0 ;;;
SamusTiles_Top_SetA_Entry0:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 0
; 1Eh: Moving right - morph ball - no springball - on ground - frame 0
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 7
; 31h: Facing right - morph ball - no springball - in air - frame 0
; 32h: Facing left  - morph ball - no springball - in air - frame 0
; 3Fh: Unused - frame 0
; 40h: Unused - frame 0
; 41h: Facing left  - morph ball - no springball - on ground - frame 7
; 79h: Facing right - morph ball - spring ball - on ground - frame 0
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 7
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 0
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 7
; 7Dh: Facing right - morph ball - spring ball - falling - frame 0
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 7
; 7Fh: Facing right - morph ball - spring ball - in air - frame 0
; 80h: Facing left  - morph ball - spring ball - in air - frame 7
; C5h: Unused - frame 7
; D7h: Facing right - crystal flash ending - frame 0
; DFh: Unused. Related to Draygon - frame 7
; E8h: Facing right - Samus drained - crouching/falling - frame 0
incbin "data/SamusTiles_Top_SetA_Entry0.bin" ; $A0 bytes


;;; $80A0: Samus top tiles - set Ah - entry 1 ;;;
SamusTiles_Top_SetA_Entry1:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 2
; 1Eh: Moving right - morph ball - no springball - on ground - frame 2
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 5
; 31h: Facing right - morph ball - no springball - in air - frame 2
; 32h: Facing left  - morph ball - no springball - in air - frame 2
; 3Fh: Unused - frame 2
; 40h: Unused - frame 2
; 41h: Facing left  - morph ball - no springball - on ground - frame 5
; 79h: Facing right - morph ball - spring ball - on ground - frame 2
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 5
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 2
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 5
; 7Dh: Facing right - morph ball - spring ball - falling - frame 2
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 5
; 7Fh: Facing right - morph ball - spring ball - in air - frame 2
; 80h: Facing left  - morph ball - spring ball - in air - frame 5
; C5h: Unused - frame 5
; DFh: Unused. Related to Draygon - frame 5
incbin "data/SamusTiles_Top_SetA_Entry1.bin" ; $A0 bytes


;;; $8140: Samus top tiles - set Ah - entry 2 ;;;
SamusTiles_Top_SetA_Entry2:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 4
; 1Eh: Moving right - morph ball - no springball - on ground - frame 4
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 3
; 31h: Facing right - morph ball - no springball - in air - frame 4
; 32h: Facing left  - morph ball - no springball - in air - frame 4
; 3Fh: Unused - frame 4
; 40h: Unused - frame 4
; 41h: Facing left  - morph ball - no springball - on ground - frame 3
; 79h: Facing right - morph ball - spring ball - on ground - frame 4
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 3
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 4
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 3
; 7Dh: Facing right - morph ball - spring ball - falling - frame 4
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 3
; 7Fh: Facing right - morph ball - spring ball - in air - frame 4
; 80h: Facing left  - morph ball - spring ball - in air - frame 3
; C5h: Unused - frame 3
; DFh: Unused. Related to Draygon - frame 3
incbin "data/SamusTiles_Top_SetA_Entry2.bin" ; $A0 bytes


;;; $81E0: Samus top tiles - set Ah - entry 3 ;;;
SamusTiles_Top_SetA_Entry3:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 6
; 1Eh: Moving right - morph ball - no springball - on ground - frame 6
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 1
; 31h: Facing right - morph ball - no springball - in air - frame 6
; 32h: Facing left  - morph ball - no springball - in air - frame 6
; 3Fh: Unused - frame 6
; 40h: Unused - frame 6
; 41h: Facing left  - morph ball - no springball - on ground - frame 1
; 79h: Facing right - morph ball - spring ball - on ground - frame 6
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 1
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 6
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 1
; 7Dh: Facing right - morph ball - spring ball - falling - frame 6
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 1
; 7Fh: Facing right - morph ball - spring ball - in air - frame 6
; 80h: Facing left  - morph ball - spring ball - in air - frame 1
; C5h: Unused - frame 1
; DFh: Unused. Related to Draygon - frame 1
incbin "data/SamusTiles_Top_SetA_Entry3.bin" ; $A0 bytes


;;; $8280: Samus top tiles - set Ah - entry 4 ;;;
SamusTiles_Top_SetA_Entry4:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 1
; 1Eh: Moving right - morph ball - no springball - on ground - frame 1
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 6
; 31h: Facing right - morph ball - no springball - in air - frame 1
; 32h: Facing left  - morph ball - no springball - in air - frame 1
; 3Fh: Unused - frame 1
; 40h: Unused - frame 1
; 41h: Facing left  - morph ball - no springball - on ground - frame 6
; 79h: Facing right - morph ball - spring ball - on ground - frame 1
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 6
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 1
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 6
; 7Dh: Facing right - morph ball - spring ball - falling - frame 1
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 6
; 7Fh: Facing right - morph ball - spring ball - in air - frame 1
; 80h: Facing left  - morph ball - spring ball - in air - frame 6
; C5h: Unused - frame 6
; DFh: Unused. Related to Draygon - frame 6
incbin "data/SamusTiles_Top_SetA_Entry4.bin" ; $A0 bytes


;;; $8320: Samus top tiles - set Ah - entry 5 ;;;
SamusTiles_Top_SetA_Entry5:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 3
; 1Eh: Moving right - morph ball - no springball - on ground - frame 3
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 4
; 31h: Facing right - morph ball - no springball - in air - frame 3
; 32h: Facing left  - morph ball - no springball - in air - frame 3
; 3Fh: Unused - frame 3
; 40h: Unused - frame 3
; 41h: Facing left  - morph ball - no springball - on ground - frame 4
; 79h: Facing right - morph ball - spring ball - on ground - frame 3
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 4
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 3
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 4
; 7Dh: Facing right - morph ball - spring ball - falling - frame 3
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 4
; 7Fh: Facing right - morph ball - spring ball - in air - frame 3
; 80h: Facing left  - morph ball - spring ball - in air - frame 4
; C5h: Unused - frame 4
; DFh: Unused. Related to Draygon - frame 4
incbin "data/SamusTiles_Top_SetA_Entry5.bin" ; $A0 bytes


;;; $83C0: Samus top tiles - set Ah - entry 6 ;;;
SamusTiles_Top_SetA_Entry6:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 5
; 1Eh: Moving right - morph ball - no springball - on ground - frame 5
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 2
; 31h: Facing right - morph ball - no springball - in air - frame 5
; 32h: Facing left  - morph ball - no springball - in air - frame 5
; 3Fh: Unused - frame 5
; 40h: Unused - frame 5
; 41h: Facing left  - morph ball - no springball - on ground - frame 2
; 79h: Facing right - morph ball - spring ball - on ground - frame 5
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 2
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 5
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 2
; 7Dh: Facing right - morph ball - spring ball - falling - frame 5
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 2
; 7Fh: Facing right - morph ball - spring ball - in air - frame 5
; 80h: Facing left  - morph ball - spring ball - in air - frame 2
; C5h: Unused - frame 2
; DFh: Unused. Related to Draygon - frame 2
incbin "data/SamusTiles_Top_SetA_Entry6.bin" ; $A0 bytes


;;; $8460: Samus top tiles - set Ah - entry 7 ;;;
SamusTiles_Top_SetA_Entry7:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 7
; 1Eh: Moving right - morph ball - no springball - on ground - frame 7
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 0
; 31h: Facing right - morph ball - no springball - in air - frame 7
; 32h: Facing left  - morph ball - no springball - in air - frame 7
; 3Fh: Unused - frame 7
; 40h: Unused - frame 7
; 41h: Facing left  - morph ball - no springball - on ground - frame 0
; 79h: Facing right - morph ball - spring ball - on ground - frame 7
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 0
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 7
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 0
; 7Dh: Facing right - morph ball - spring ball - falling - frame 7
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 0
; 7Fh: Facing right - morph ball - spring ball - in air - frame 7
; 80h: Facing left  - morph ball - spring ball - in air - frame 0
; C5h: Unused - frame 0
; DFh: Unused. Related to Draygon - frame 0
incbin "data/SamusTiles_Top_SetA_Entry7.bin" ; $A0 bytes


;;; $8500: Samus top tiles - set Ah - entry 8 ;;;
SamusTiles_Top_SetA_Entry8:
; 19h: Facing right - spin jump - frame 1
; 1Ah: Facing left  - spin jump - frame 1
; 20h: Unused - frame 1
; 21h: Unused - frame 1
; 22h: Unused - frame 1
; 23h: Unused - frame 1
; 24h: Unused - frame 1
; 33h: Unused - frame 1
; 34h: Unused - frame 1
; 39h: Unused - frame 1
; 3Ah: Unused - frame 1
; 42h: Unused - frame 1
; 83h: Facing right - wall jump - frame 3
; 84h: Facing left  - wall jump - frame 3
incbin "data/SamusTiles_Top_SetA_Entry8.bin" ; $100 bytes


;;; $8600: Samus top tiles - set Ah - entry 9 ;;;
SamusTiles_Top_SetA_Entry9:
; 19h: Facing right - spin jump - frame 2
; 1Ah: Facing left  - spin jump - frame 2
; 20h: Unused - frame 2
; 21h: Unused - frame 2
; 22h: Unused - frame 2
; 23h: Unused - frame 2
; 24h: Unused - frame 2
; 33h: Unused - frame 2
; 34h: Unused - frame 2
; 39h: Unused - frame 2
; 3Ah: Unused - frame 2
; 42h: Unused - frame 2
; 4Fh: Facing left  - damage boost - frame 8
; 50h: Facing right - damage boost - frame 8
; 83h: Facing right - wall jump - frame 4
; 84h: Facing left  - wall jump - frame 4
incbin "data/SamusTiles_Top_SetA_Entry9.bin" ; $200 bytes


;;; $8800: Samus top tiles - set Ah - entry Ah ;;;
SamusTiles_Top_SetA_EntryA:
; 19h: Facing right - spin jump - frame 3
; 1Ah: Facing left  - spin jump - frame 3
; 20h: Unused - frame 3
; 21h: Unused - frame 3
; 22h: Unused - frame 3
; 23h: Unused - frame 3
; 24h: Unused - frame 3
; 33h: Unused - frame 3
; 34h: Unused - frame 3
; 39h: Unused - frame 3
; 3Ah: Unused - frame 3
; 42h: Unused - frame 3
; 4Fh: Facing left  - damage boost - frame 7
; 50h: Facing right - damage boost - frame 7
; 83h: Facing right - wall jump - frame 5
; 84h: Facing left  - wall jump - frame 5
incbin "data/SamusTiles_Top_SetA_EntryA.bin" ; $100 bytes


;;; $8900: Samus top tiles - set Ah - entry Bh ;;;
SamusTiles_Top_SetA_EntryB:
; 19h: Facing right - spin jump - frame 4
; 1Ah: Facing left  - spin jump - frame 4
; 20h: Unused - frame 4
; 21h: Unused - frame 4
; 22h: Unused - frame 4
; 23h: Unused - frame 4
; 24h: Unused - frame 4
; 33h: Unused - frame 4
; 34h: Unused - frame 4
; 39h: Unused - frame 4
; 3Ah: Unused - frame 4
; 42h: Unused - frame 4
; 4Fh: Facing left  - damage boost - frame 6
; 50h: Facing right - damage boost - frame 6
; 83h: Facing right - wall jump - frame 6
; 84h: Facing left  - wall jump - frame 6
incbin "data/SamusTiles_Top_SetA_EntryB.bin" ; $200 bytes


;;; $8B00: Samus top tiles - set Ah - entry Ch ;;;
SamusTiles_Top_SetA_EntryC:
; 19h: Facing right - spin jump - frame 5
; 1Ah: Facing left  - spin jump - frame 5
; 20h: Unused - frame 5
; 21h: Unused - frame 5
; 22h: Unused - frame 5
; 23h: Unused - frame 5
; 24h: Unused - frame 5
; 33h: Unused - frame 5
; 34h: Unused - frame 5
; 39h: Unused - frame 5
; 3Ah: Unused - frame 5
; 42h: Unused - frame 5
; 4Fh: Facing left  - damage boost - frame 5
; 50h: Facing right - damage boost - frame 5
; 83h: Facing right - wall jump - frame 7
; 84h: Facing left  - wall jump - frame 7
incbin "data/SamusTiles_Top_SetA_EntryC.bin" ; $100 bytes


;;; $8C00: Samus top tiles - set Ah - entry Dh ;;;
SamusTiles_Top_SetA_EntryD:
; 19h: Facing right - spin jump - frame 6
; 1Ah: Facing left  - spin jump - frame 6
; 20h: Unused - frame 6
; 21h: Unused - frame 6
; 22h: Unused - frame 6
; 23h: Unused - frame 6
; 24h: Unused - frame 6
; 33h: Unused - frame 6
; 34h: Unused - frame 6
; 39h: Unused - frame 6
; 3Ah: Unused - frame 6
; 42h: Unused - frame 6
; 4Fh: Facing left  - damage boost - frame 4
; 50h: Facing right - damage boost - frame 4
; 83h: Facing right - wall jump - frame 8
; 84h: Facing left  - wall jump - frame 8
incbin "data/SamusTiles_Top_SetA_EntryD.bin" ; $200 bytes


;;; $8E00: Samus top tiles - set Ah - entry Eh ;;;
SamusTiles_Top_SetA_EntryE:
; 19h: Facing right - spin jump - frame 7
; 1Ah: Facing left  - spin jump - frame 7
; 20h: Unused - frame 7
; 21h: Unused - frame 7
; 22h: Unused - frame 7
; 23h: Unused - frame 7
; 24h: Unused - frame 7
; 33h: Unused - frame 7
; 34h: Unused - frame 7
; 39h: Unused - frame 7
; 3Ah: Unused - frame 7
; 42h: Unused - frame 7
; 4Fh: Facing left  - damage boost - frame 3
; 50h: Facing right - damage boost - frame 3
; 83h: Facing right - wall jump - frame 9
; 84h: Facing left  - wall jump - frame 9
incbin "data/SamusTiles_Top_SetA_EntryE.bin" ; $100 bytes


;;; $8F00: Samus top tiles - set Ah - entry Fh ;;;
SamusTiles_Top_SetA_EntryF:
; 19h: Facing right - spin jump - frame 8
; 1Ah: Facing left  - spin jump - frame 8
; 20h: Unused - frame 8
; 21h: Unused - frame 8
; 22h: Unused - frame 8
; 23h: Unused - frame 8
; 24h: Unused - frame 8
; 33h: Unused - frame 8
; 34h: Unused - frame 8
; 39h: Unused - frame 8
; 3Ah: Unused - frame 8
; 42h: Unused - frame 8
; 4Fh: Facing left  - damage boost - frame 2
; 50h: Facing right - damage boost - frame 2
; 83h: Facing right - wall jump - frame Ah
; 84h: Facing left  - wall jump - frame Ah
incbin "data/SamusTiles_Top_SetA_EntryF.bin" ; $200 bytes


;;; $9100: Samus top tiles - set Ah - entry 10h ;;;
SamusTiles_Top_SetA_Entry10:
; 65h: Unused. Related to movement type Dh - frame 1
; 66h: Unused. Related to movement type Dh - frame 1
; 81h: Facing right - screw attack - frames 1..3
; 82h: Facing left  - screw attack - frames 1..3
; 83h: Facing right - wall jump - frames 17h..19h
; 84h: Facing left  - wall jump - frames 17h..19h
incbin "data/SamusTiles_Top_SetA_Entry10.bin" ; $140 bytes


;;; $9240: Samus top tiles - set Ah - entry 11h ;;;
SamusTiles_Top_SetA_Entry11:
; 65h: Unused. Related to movement type Dh - frame 2
; 66h: Unused. Related to movement type Dh - frame 2
; 81h: Facing right - screw attack - frames 7..9
; 82h: Facing left  - screw attack - frames 7..9
; 83h: Facing right - wall jump - frames 1Dh..1Fh
; 84h: Facing left  - wall jump - frames 1Dh..1Fh
incbin "data/SamusTiles_Top_SetA_Entry11.bin" ; $160 bytes


;;; $93A0: Samus top tiles - set Ah - entry 12h ;;;
SamusTiles_Top_SetA_Entry12:
; 65h: Unused. Related to movement type Dh - frame 3
; 66h: Unused. Related to movement type Dh - frame 3
; 81h: Facing right - screw attack - frames Dh..Fh
; 82h: Facing left  - screw attack - frames Dh..Fh
; 83h: Facing right - wall jump - frames 23h..25h
; 84h: Facing left  - wall jump - frames 23h..25h
incbin "data/SamusTiles_Top_SetA_Entry12.bin" ; $160 bytes


;;; $9500: Samus top tiles - set Ah - entry 13h ;;;
SamusTiles_Top_SetA_Entry13:
; 65h: Unused. Related to movement type Dh - frame 4
; 66h: Unused. Related to movement type Dh - frame 4
; 81h: Facing right - screw attack - frames 13h..15h
; 82h: Facing left  - screw attack - frames 13h..15h
; 83h: Facing right - wall jump - frames 29h..2Bh
; 84h: Facing left  - wall jump - frames 29h..2Bh
incbin "data/SamusTiles_Top_SetA_Entry13.bin" ; $100 bytes


;;; $9600: Samus top tiles - set Ah - entry 14h ;;;
SamusTiles_Top_SetA_Entry14:
; 1Bh: Facing right - space jump - frames 1..8
; 1Ch: Facing left  - space jump - frames 1..8
; 65h: Unused. Related to movement type Dh - frame 5
; 66h: Unused. Related to movement type Dh - frame 5
; 81h: Facing right - screw attack - frames 4..6
; 81h: Facing right - screw attack - frames Ah..Ch
; 81h: Facing right - screw attack - frames 10h..12h
; 81h: Facing right - screw attack - frames 16h..18h
; 82h: Facing left  - screw attack - frames 4..6
; 82h: Facing left  - screw attack - frames Ah..Ch
; 82h: Facing left  - screw attack - frames 10h..12h
; 82h: Facing left  - screw attack - frames 16h..18h
; 83h: Facing right - wall jump - frames Dh..14h
; 83h: Facing right - wall jump - frames 1Ah..1Ch
; 83h: Facing right - wall jump - frames 20h..22h
; 83h: Facing right - wall jump - frames 26h..28h
; 83h: Facing right - wall jump - frames 2Ch..2Eh
; 84h: Facing left  - wall jump - frames Dh..14h
; 84h: Facing left  - wall jump - frames 1Ah..1Ch
; 84h: Facing left  - wall jump - frames 20h..22h
; 84h: Facing left  - wall jump - frames 26h..28h
; 84h: Facing left  - wall jump - frames 2Ch..2Eh
incbin "data/SamusTiles_Top_SetA_Entry14.bin" ; $20 bytes


;;; $9620: Samus top tiles - set Bh - entry 0 ;;;
SamusTiles_Top_SetB_Entry0:
; Unused
incbin "data/SamusTiles_Top_SetB_Entry0.bin" ; $20 bytes


;;; $9640: Samus top tiles - set Bh - entry 1 ;;;
SamusTiles_Top_SetB_Entry1:
; 1Dh: Facing right - morph ball - no springball - on ground - frame 9
; 1Eh: Moving right - morph ball - no springball - on ground - frame 9
; 1Fh: Moving left  - morph ball - no springball - on ground - frame 9
; 31h: Facing right - morph ball - no springball - in air - frame 9
; 32h: Facing left  - morph ball - no springball - in air - frame 9
; 3Fh: Unused - frame 9
; 40h: Unused - frame 9
; 41h: Facing left  - morph ball - no springball - on ground - frame 9
; 79h: Facing right - morph ball - spring ball - on ground - frame 9
; 7Ah: Facing left  - morph ball - spring ball - on ground - frame 9
; 7Bh: Moving right - morph ball - spring ball - on ground - frame 9
; 7Ch: Moving left  - morph ball - spring ball - on ground - frame 9
; 7Dh: Facing right - morph ball - spring ball - falling - frame 9
; 7Eh: Facing left  - morph ball - spring ball - falling - frame 9
; 7Fh: Facing right - morph ball - spring ball - in air - frame 9
; 80h: Facing left  - morph ball - spring ball - in air - frame 9
; C5h: Unused - frame 9
; DFh: Unused. Related to Draygon - frame 9
incbin "data/SamusTiles_Top_SetB_Entry1.bin" ; $A0 bytes


;;; $96E0: Samus top tiles - set Bh - entry 2 ;;;
SamusTiles_Top_SetB_Entry2:
; Unused
incbin "data/SamusTiles_Top_SetB_Entry2.bin" ; $A0 bytes


;;; $9780: Samus top tiles - set Bh - entry 3 ;;;
SamusTiles_Top_SetB_Entry3:
; 38h: Facing left  - morphing transition - frame 1
; 3Eh: Facing left  - unmorphing transition - frame 0
; D4h: Facing left  - crystal flash - frame 0
; D8h: Facing left  - crystal flash ending - frame 1
; DCh: Unused - frame 2
; DEh: Unused - frame 0
; E9h: Facing left  - Samus drained - crouching/falling - frame 0
incbin "data/SamusTiles_Top_SetB_Entry3.bin" ; $C0 bytes


;;; $9840: Samus top tiles - set Bh - entry 4 ;;;
SamusTiles_Top_SetB_Entry4:
; 38h: Facing left  - morphing transition - frame 0
; 3Eh: Facing left  - unmorphing transition - frame 1
; D4h: Facing left  - crystal flash - frame 1
; D4h: Facing left  - crystal flash - frame 3
; D4h: Facing left  - crystal flash - frames Ch..Dh
; D8h: Facing left  - crystal flash ending - frame 2
; DCh: Unused - frame 1
; DEh: Unused - frame 1
; E9h: Facing left  - Samus drained - crouching/falling - frame 1
incbin "data/SamusTiles_Top_SetB_Entry4.bin" ; $100 bytes


;;; $9940: Samus top tiles - set Bh - entry 5 ;;;
SamusTiles_Top_SetB_Entry5:
; 37h: Facing right - morphing transition - frame 1
; 3Dh: Facing right - unmorphing transition - frame 0
; D3h: Facing right - crystal flash - frame 0
; D7h: Facing right - crystal flash ending - frame 1
; DBh: Unused - frame 2
; DDh: Unused - frame 0
; E8h: Facing right - Samus drained - crouching/falling - frame 1
incbin "data/SamusTiles_Top_SetB_Entry5.bin" ; $C0 bytes


;;; $9A00: Samus top tiles - set Bh - entry 6 ;;;
SamusTiles_Top_SetB_Entry6:
; 37h: Facing right - morphing transition - frame 0
; 3Dh: Facing right - unmorphing transition - frame 1
; D3h: Facing right - crystal flash - frame 1
; D3h: Facing right - crystal flash - frame 3
; D3h: Facing right - crystal flash - frames Ch..Dh
; D7h: Facing right - crystal flash ending - frame 2
; DBh: Unused - frame 1
; DDh: Unused - frame 1
; E8h: Facing right - Samus drained - crouching/falling - frame 2
incbin "data/SamusTiles_Top_SetB_Entry6.bin" ; $100 bytes


;;; $9B00: Samus top tiles - set 3 - entry 0 ;;;
SamusTiles_Top_Set3_Entry0:
; 5Dh: Unused - frame 18h
; 5Dh: Unused - frame 38h
; 5Eh: Unused - frame 18h
; 5Eh: Unused - frame 38h
; 5Fh: Unused - frame 18h
; 5Fh: Unused - frame 38h
; 60h: Unused - frame 18h
; 60h: Unused - frame 38h
; 61h: Unused - frame 18h
; 61h: Unused - frame 38h
; B2h: Facing clockwise     - grapple - in air - frame 18h
; B2h: Facing clockwise     - grapple - in air - frame 38h
incbin "data/SamusTiles_Top_Set3_Entry0.bin" ; $140 bytes


;;; $9C40: Samus top tiles - set 3 - entry 1 ;;;
SamusTiles_Top_Set3_Entry1:
; 5Dh: Unused - frame 17h
; 5Dh: Unused - frame 37h
; 5Eh: Unused - frame 17h
; 5Eh: Unused - frame 37h
; 5Fh: Unused - frame 17h
; 5Fh: Unused - frame 37h
; 60h: Unused - frame 17h
; 60h: Unused - frame 37h
; 61h: Unused - frame 17h
; 61h: Unused - frame 37h
; B2h: Facing clockwise     - grapple - in air - frame 17h
; B2h: Facing clockwise     - grapple - in air - frame 37h
incbin "data/SamusTiles_Top_Set3_Entry1.bin" ; $140 bytes


;;; $9D80: Samus top tiles - set 3 - entry 2 ;;;
SamusTiles_Top_Set3_Entry2:
; 5Dh: Unused - frame 16h
; 5Dh: Unused - frame 36h
; 5Eh: Unused - frame 16h
; 5Eh: Unused - frame 36h
; 5Fh: Unused - frame 16h
; 5Fh: Unused - frame 36h
; 60h: Unused - frame 16h
; 60h: Unused - frame 36h
; 61h: Unused - frame 16h
; 61h: Unused - frame 36h
; B2h: Facing clockwise     - grapple - in air - frame 16h
; B2h: Facing clockwise     - grapple - in air - frame 36h
incbin "data/SamusTiles_Top_Set3_Entry2.bin" ; $180 bytes


;;; $9F00: Samus top tiles - set 3 - entry 3 ;;;
SamusTiles_Top_Set3_Entry3:
; 5Dh: Unused - frame 15h
; 5Dh: Unused - frame 35h
; 5Eh: Unused - frame 15h
; 5Eh: Unused - frame 35h
; 5Fh: Unused - frame 15h
; 5Fh: Unused - frame 35h
; 60h: Unused - frame 15h
; 60h: Unused - frame 35h
; 61h: Unused - frame 15h
; 61h: Unused - frame 35h
; B2h: Facing clockwise     - grapple - in air - frame 15h
; B2h: Facing clockwise     - grapple - in air - frame 35h
incbin "data/SamusTiles_Top_Set3_Entry3.bin" ; $180 bytes


;;; $A080: Samus top tiles - set 3 - entry 4 ;;;
SamusTiles_Top_Set3_Entry4:
; 5Dh: Unused - frame 14h
; 5Dh: Unused - frame 34h
; 5Eh: Unused - frame 14h
; 5Eh: Unused - frame 34h
; 5Fh: Unused - frame 14h
; 5Fh: Unused - frame 34h
; 60h: Unused - frame 14h
; 60h: Unused - frame 34h
; 61h: Unused - frame 14h
; 61h: Unused - frame 34h
; B2h: Facing clockwise     - grapple - in air - frame 14h
; B2h: Facing clockwise     - grapple - in air - frame 34h
incbin "data/SamusTiles_Top_Set3_Entry4.bin" ; $180 bytes


;;; $A200: Samus top tiles - set 3 - entry 5 ;;;
SamusTiles_Top_Set3_Entry5:
; 5Dh: Unused - frame 13h
; 5Dh: Unused - frame 33h
; 5Eh: Unused - frame 13h
; 5Eh: Unused - frame 33h
; 5Fh: Unused - frame 13h
; 5Fh: Unused - frame 33h
; 60h: Unused - frame 13h
; 60h: Unused - frame 33h
; 61h: Unused - frame 13h
; 61h: Unused - frame 33h
; B2h: Facing clockwise     - grapple - in air - frame 13h
; B2h: Facing clockwise     - grapple - in air - frame 33h
incbin "data/SamusTiles_Top_Set3_Entry5.bin" ; $180 bytes


;;; $A380: Samus top tiles - set 3 - entry 6 ;;;
SamusTiles_Top_Set3_Entry6:
; 5Dh: Unused - frame 12h
; 5Dh: Unused - frame 32h
; 5Eh: Unused - frame 12h
; 5Eh: Unused - frame 32h
; 5Fh: Unused - frame 12h
; 5Fh: Unused - frame 32h
; 60h: Unused - frame 12h
; 60h: Unused - frame 32h
; 61h: Unused - frame 12h
; 61h: Unused - frame 32h
; B2h: Facing clockwise     - grapple - in air - frame 12h
; B2h: Facing clockwise     - grapple - in air - frame 32h
incbin "data/SamusTiles_Top_Set3_Entry6.bin" ; $180 bytes


;;; $A500: Samus top tiles - set 3 - entry 7 ;;;
SamusTiles_Top_Set3_Entry7:
; 5Dh: Unused - frame 11h
; 5Dh: Unused - frame 31h
; 5Eh: Unused - frame 11h
; 5Eh: Unused - frame 31h
; 5Fh: Unused - frame 11h
; 5Fh: Unused - frame 31h
; 60h: Unused - frame 11h
; 60h: Unused - frame 31h
; 61h: Unused - frame 11h
; 61h: Unused - frame 31h
; B2h: Facing clockwise     - grapple - in air - frame 11h
; B2h: Facing clockwise     - grapple - in air - frame 31h
incbin "data/SamusTiles_Top_Set3_Entry7.bin" ; $140 bytes


;;; $A640: Samus top tiles - set 3 - entry 8 ;;;
SamusTiles_Top_Set3_Entry8:
; 5Dh: Unused - frame 10h
; 5Dh: Unused - frame 30h
; 5Dh: Unused - frames 40h..41h
; 5Eh: Unused - frame 10h
; 5Eh: Unused - frame 30h
; 5Eh: Unused - frames 40h..41h
; 5Fh: Unused - frame 10h
; 5Fh: Unused - frame 30h
; 5Fh: Unused - frames 40h..41h
; 60h: Unused - frame 10h
; 60h: Unused - frame 30h
; 60h: Unused - frames 40h..41h
; 61h: Unused - frame 10h
; 61h: Unused - frame 30h
; 61h: Unused - frames 40h..41h
; B2h: Facing clockwise     - grapple - in air - frame 10h
; B2h: Facing clockwise     - grapple - in air - frame 30h
; B2h: Facing clockwise     - grapple - in air - frames 40h..41h
incbin "data/SamusTiles_Top_Set3_Entry8.bin" ; $140 bytes


;;; $A780: Samus top tiles - set 3 - entry 9 ;;;
SamusTiles_Top_Set3_Entry9:
; 5Dh: Unused - frame Fh
; 5Dh: Unused - frame 2Fh
; 5Eh: Unused - frame Fh
; 5Eh: Unused - frame 2Fh
; 5Fh: Unused - frame Fh
; 5Fh: Unused - frame 2Fh
; 60h: Unused - frame Fh
; 60h: Unused - frame 2Fh
; 61h: Unused - frame Fh
; 61h: Unused - frame 2Fh
; B2h: Facing clockwise     - grapple - in air - frame Fh
; B2h: Facing clockwise     - grapple - in air - frame 2Fh
incbin "data/SamusTiles_Top_Set3_Entry9.bin" ; $140 bytes


;;; $A8C0: Samus top tiles - set 3 - entry Ah ;;;
SamusTiles_Top_Set3_EntryA:
; 5Dh: Unused - frame Eh
; 5Dh: Unused - frame 2Eh
; 5Eh: Unused - frame Eh
; 5Eh: Unused - frame 2Eh
; 5Fh: Unused - frame Eh
; 5Fh: Unused - frame 2Eh
; 60h: Unused - frame Eh
; 60h: Unused - frame 2Eh
; 61h: Unused - frame Eh
; 61h: Unused - frame 2Eh
; B2h: Facing clockwise     - grapple - in air - frame Eh
; B2h: Facing clockwise     - grapple - in air - frame 2Eh
incbin "data/SamusTiles_Top_Set3_EntryA.bin" ; $180 bytes


;;; $AA40: Samus top tiles - set 3 - entry Bh ;;;
SamusTiles_Top_Set3_EntryB:
; 5Dh: Unused - frame Dh
; 5Dh: Unused - frame 2Dh
; 5Eh: Unused - frame Dh
; 5Eh: Unused - frame 2Dh
; 5Fh: Unused - frame Dh
; 5Fh: Unused - frame 2Dh
; 60h: Unused - frame Dh
; 60h: Unused - frame 2Dh
; 61h: Unused - frame Dh
; 61h: Unused - frame 2Dh
; B2h: Facing clockwise     - grapple - in air - frame Dh
; B2h: Facing clockwise     - grapple - in air - frame 2Dh
incbin "data/SamusTiles_Top_Set3_EntryB.bin" ; $180 bytes


;;; $ABC0: Samus top tiles - set 3 - entry Ch ;;;
SamusTiles_Top_Set3_EntryC:
; 5Dh: Unused - frame Ch
; 5Dh: Unused - frame 2Ch
; 5Eh: Unused - frame Ch
; 5Eh: Unused - frame 2Ch
; 5Fh: Unused - frame Ch
; 5Fh: Unused - frame 2Ch
; 60h: Unused - frame Ch
; 60h: Unused - frame 2Ch
; 61h: Unused - frame Ch
; 61h: Unused - frame 2Ch
; B2h: Facing clockwise     - grapple - in air - frame Ch
; B2h: Facing clockwise     - grapple - in air - frame 2Ch
incbin "data/SamusTiles_Top_Set3_EntryC.bin" ; $180 bytes


;;; $AD40: Samus top tiles - set 3 - entry Dh ;;;
SamusTiles_Top_Set3_EntryD:
; 5Dh: Unused - frame Bh
; 5Dh: Unused - frame 2Bh
; 5Eh: Unused - frame Bh
; 5Eh: Unused - frame 2Bh
; 5Fh: Unused - frame Bh
; 5Fh: Unused - frame 2Bh
; 60h: Unused - frame Bh
; 60h: Unused - frame 2Bh
; 61h: Unused - frame Bh
; 61h: Unused - frame 2Bh
; B2h: Facing clockwise     - grapple - in air - frame Bh
; B2h: Facing clockwise     - grapple - in air - frame 2Bh
incbin "data/SamusTiles_Top_Set3_EntryD.bin" ; $180 bytes


;;; $AEC0: Samus top tiles - set 3 - entry Eh ;;;
SamusTiles_Top_Set3_EntryE:
; 5Dh: Unused - frame Ah
; 5Dh: Unused - frame 2Ah
; 5Eh: Unused - frame Ah
; 5Eh: Unused - frame 2Ah
; 5Fh: Unused - frame Ah
; 5Fh: Unused - frame 2Ah
; 60h: Unused - frame Ah
; 60h: Unused - frame 2Ah
; 61h: Unused - frame Ah
; 61h: Unused - frame 2Ah
; B2h: Facing clockwise     - grapple - in air - frame Ah
; B2h: Facing clockwise     - grapple - in air - frame 2Ah
incbin "data/SamusTiles_Top_Set3_EntryE.bin" ; $180 bytes


;;; $B040: Samus top tiles - set 3 - entry Fh ;;;
SamusTiles_Top_Set3_EntryF:
; 5Dh: Unused - frame 9
; 5Dh: Unused - frame 29h
; 5Eh: Unused - frame 9
; 5Eh: Unused - frame 29h
; 5Fh: Unused - frame 9
; 5Fh: Unused - frame 29h
; 60h: Unused - frame 9
; 60h: Unused - frame 29h
; 61h: Unused - frame 9
; 61h: Unused - frame 29h
; B2h: Facing clockwise     - grapple - in air - frame 9
; B2h: Facing clockwise     - grapple - in air - frame 29h
incbin "data/SamusTiles_Top_Set3_EntryF.bin" ; $140 bytes


;;; $B180: Samus top tiles - set 3 - entry 10h ;;;
SamusTiles_Top_Set3_Entry10:
; Unused
incbin "data/SamusTiles_Top_Set3_Entry10.bin" ; $140 bytes


;;; $B2C0..D2BF: Samus top tiles - set 4 (facing anticlockwise - grappling - in air - upside up) ;;;
SamusTiles_Top_Set4_Entry0:
; 62h: Unused - frame 8
; 62h: Unused - frame 28h
; B3h: Facing anticlockwise - grapple - in air - frame 8
; B3h: Facing anticlockwise - grapple - in air - frame 28h
incbin "data/SamusTiles_Top_Set4_Entry0.bin" ; $1C0 bytes


;;; $B480: Samus top tiles - set 4 - entry 1 ;;;
SamusTiles_Top_Set4_Entry1:
; 62h: Unused - frame 9
; 62h: Unused - frame 29h
; B3h: Facing anticlockwise - grapple - in air - frame 9
; B3h: Facing anticlockwise - grapple - in air - frame 29h
incbin "data/SamusTiles_Top_Set4_Entry1.bin" ; $140 bytes


;;; $B640: Samus top tiles - set 4 - entry 2 ;;;
SamusTiles_Top_Set4_Entry2:
; 62h: Unused - frame Ah
; 62h: Unused - frame 2Ah
; B3h: Facing anticlockwise - grapple - in air - frame Ah
; B3h: Facing anticlockwise - grapple - in air - frame 2Ah
incbin "data/SamusTiles_Top_Set4_Entry2.bin" ; $180 bytes


;;; $B840: Samus top tiles - set 4 - entry 3 ;;;
SamusTiles_Top_Set4_Entry3:
; 62h: Unused - frame Bh
; 62h: Unused - frame 2Bh
; B3h: Facing anticlockwise - grapple - in air - frame Bh
; B3h: Facing anticlockwise - grapple - in air - frame 2Bh
incbin "data/SamusTiles_Top_Set4_Entry3.bin" ; $200 bytes


;;; $BA40: Samus top tiles - set 4 - entry 4 ;;;
SamusTiles_Top_Set4_Entry4:
; 62h: Unused - frame Ch
; 62h: Unused - frame 2Ch
; B3h: Facing anticlockwise - grapple - in air - frame Ch
; B3h: Facing anticlockwise - grapple - in air - frame 2Ch
incbin "data/SamusTiles_Top_Set4_Entry4.bin" ; $1E0 bytes


;;; $BC20: Samus top tiles - set 4 - entry 5 ;;;
SamusTiles_Top_Set4_Entry5:
; 62h: Unused - frame Dh
; 62h: Unused - frame 2Dh
; B3h: Facing anticlockwise - grapple - in air - frame Dh
; B3h: Facing anticlockwise - grapple - in air - frame 2Dh
incbin "data/SamusTiles_Top_Set4_Entry5.bin" ; $1E0 bytes


;;; $BE00: Samus top tiles - set 4 - entry 6 ;;;
SamusTiles_Top_Set4_Entry6:
; 62h: Unused - frame Eh
; 62h: Unused - frame 2Eh
; B3h: Facing anticlockwise - grapple - in air - frame Eh
; B3h: Facing anticlockwise - grapple - in air - frame 2Eh
incbin "data/SamusTiles_Top_Set4_Entry6.bin" ; $1E0 bytes


;;; $BFE0: Samus top tiles - set 4 - entry 7 ;;;
SamusTiles_Top_Set4_Entry7:
; 62h: Unused - frame Fh
; 62h: Unused - frame 2Fh
; B3h: Facing anticlockwise - grapple - in air - frame Fh
; B3h: Facing anticlockwise - grapple - in air - frame 2Fh
incbin "data/SamusTiles_Top_Set4_Entry7.bin" ; $1C0 bytes


;;; $C1A0: Samus top tiles - set 4 - entry 8 ;;;
SamusTiles_Top_Set4_Entry8:
; 62h: Unused - frame 10h
; 62h: Unused - frame 30h
; 62h: Unused - frames 40h..41h
; B3h: Facing anticlockwise - grapple - in air - frame 10h
; B3h: Facing anticlockwise - grapple - in air - frame 30h
; B3h: Facing anticlockwise - grapple - in air - frames 40h..41h
incbin "data/SamusTiles_Top_Set4_Entry8.bin" ; $1C0 bytes


;;; $C360: Samus top tiles - set 4 - entry 9 ;;;
SamusTiles_Top_Set4_Entry9:
; 62h: Unused - frame 11h
; 62h: Unused - frame 31h
; B3h: Facing anticlockwise - grapple - in air - frame 11h
; B3h: Facing anticlockwise - grapple - in air - frame 31h
incbin "data/SamusTiles_Top_Set4_Entry9.bin" ; $1C0 bytes


;;; $C520: Samus top tiles - set 4 - entry Ah ;;;
SamusTiles_Top_Set4_EntryA:
; 62h: Unused - frame 12h
; 62h: Unused - frame 32h
; B3h: Facing anticlockwise - grapple - in air - frame 12h
; B3h: Facing anticlockwise - grapple - in air - frame 32h
incbin "data/SamusTiles_Top_Set4_EntryA.bin" ; $1E0 bytes


;;; $C700: Samus top tiles - set 4 - entry Bh ;;;
SamusTiles_Top_Set4_EntryB:
; 62h: Unused - frame 13h
; 62h: Unused - frame 33h
; B3h: Facing anticlockwise - grapple - in air - frame 13h
; B3h: Facing anticlockwise - grapple - in air - frame 33h
incbin "data/SamusTiles_Top_Set4_EntryB.bin" ; $200 bytes


;;; $C900: Samus top tiles - set 4 - entry Ch ;;;
SamusTiles_Top_Set4_EntryC:
; 62h: Unused - frame 14h
; 62h: Unused - frame 34h
; B3h: Facing anticlockwise - grapple - in air - frame 14h
; B3h: Facing anticlockwise - grapple - in air - frame 34h
incbin "data/SamusTiles_Top_Set4_EntryC.bin" ; $200 bytes


;;; $CB00: Samus top tiles - set 4 - entry Dh ;;;
SamusTiles_Top_Set4_EntryD:
; 62h: Unused - frame 15h
; 62h: Unused - frame 35h
; B3h: Facing anticlockwise - grapple - in air - frame 15h
; B3h: Facing anticlockwise - grapple - in air - frame 35h
incbin "data/SamusTiles_Top_Set4_EntryD.bin" ; $200 bytes


;;; $CD00: Samus top tiles - set 4 - entry Eh ;;;
SamusTiles_Top_Set4_EntryE:
; 62h: Unused - frame 16h
; 62h: Unused - frame 36h
; B3h: Facing anticlockwise - grapple - in air - frame 16h
; B3h: Facing anticlockwise - grapple - in air - frame 36h
incbin "data/SamusTiles_Top_Set4_EntryE.bin" ; $200 bytes


;;; $CF00: Samus top tiles - set 4 - entry Fh ;;;
SamusTiles_Top_Set4_EntryF:
; 62h: Unused - frame 17h
; 62h: Unused - frame 37h
; B3h: Facing anticlockwise - grapple - in air - frame 17h
; B3h: Facing anticlockwise - grapple - in air - frame 37h
incbin "data/SamusTiles_Top_Set4_EntryF.bin" ; $200 bytes


;;; $D0E0: Samus top tiles - set 4 - entry 10h ;;;
SamusTiles_Top_Set4_Entry10:
; Unused
incbin "data/SamusTiles_Top_Set4_Entry10.bin" ; $1E0 bytes


;;; $D2C0: Samus top tiles - set 7 - entry 0 ;;;
SamusTiles_Top_Set7_Entry0:
; E9h: Facing left  - Samus drained - crouching/falling - frame 8
; E9h: Facing left  - Samus drained - crouching/falling - frame 1Ah
; E9h: Facing left  - Samus drained - crouching/falling - frame 1Dh
incbin "data/SamusTiles_Top_Set7_Entry0.bin" ; $120 bytes


;;; $D3E0: Samus top tiles - set 7 - entry 1 ;;;
SamusTiles_Top_Set7_Entry1:
; E9h: Facing left  - Samus drained - crouching/falling - frame 7
; E9h: Facing left  - Samus drained - crouching/falling - frame 9
; E9h: Facing left  - Samus drained - crouching/falling - frame Bh
; E9h: Facing left  - Samus drained - crouching/falling - frame Eh
; E9h: Facing left  - Samus drained - crouching/falling - frame 13h
; E9h: Facing left  - Samus drained - crouching/falling - frame 17h
incbin "data/SamusTiles_Top_Set7_Entry1.bin" ; $120 bytes


;;; $D500: Samus top tiles - set 7 - entry 2 ;;;
SamusTiles_Top_Set7_Entry2:
; E9h: Facing left  - Samus drained - crouching/falling - frame Ah
incbin "data/SamusTiles_Top_Set7_Entry2.bin" ; $120 bytes


;;; $D620: Samus top tiles - set 7 - entry 3 ;;;
SamusTiles_Top_Set7_Entry3:
; E8h: Facing right - Samus drained - crouching/falling - frame 8
incbin "data/SamusTiles_Top_Set7_Entry3.bin" ; $140 bytes


;;; $D760: Samus top tiles - set 7 - entry 4 ;;;
SamusTiles_Top_Set7_Entry4:
; E8h: Facing right - Samus drained - crouching/falling - frame 9
; E8h: Facing right - Samus drained - crouching/falling - frame Bh
incbin "data/SamusTiles_Top_Set7_Entry4.bin" ; $140 bytes


;;; $D8A0: Samus top tiles - set 7 - entry 5 ;;;
SamusTiles_Top_Set7_Entry5:
; E8h: Facing right - Samus drained - crouching/falling - frame Ah
incbin "data/SamusTiles_Top_Set7_Entry5.bin" ; $140 bytes


;;; $D9E0: Samus top tiles - set 7 - entry 6 ;;;
SamusTiles_Top_Set7_Entry6:
; EBh: Facing left  - Samus drained - standing - frame 0
incbin "data/SamusTiles_Top_Set7_Entry6.bin" ; $120 bytes


;;; $DB00: Samus top tiles - set 7 - entry 7 ;;;
SamusTiles_Top_Set7_Entry7:
; E9h: Facing left  - Samus drained - crouching/falling - frame Fh
; E9h: Facing left  - Samus drained - crouching/falling - frame 14h
; E9h: Facing left  - Samus drained - crouching/falling - frame 16h
; EBh: Facing left  - Samus drained - standing - frame 1
; EBh: Facing left  - Samus drained - standing - frame 3
incbin "data/SamusTiles_Top_Set7_Entry7.bin" ; $120 bytes


;;; $DC20: Samus top tiles - set 7 - entry 8 ;;;
SamusTiles_Top_Set7_Entry8:
; EBh: Facing left  - Samus drained - standing - frame 2
incbin "data/SamusTiles_Top_Set7_Entry8.bin" ; $120 bytes


;;; $DD40: Samus top tiles - set 7 - entry 9 ;;;
SamusTiles_Top_Set7_Entry9:
; EAh: Facing right - Samus drained - standing - frame 0
incbin "data/SamusTiles_Top_Set7_Entry9.bin" ; $140 bytes


;;; $DE80: Samus top tiles - set 7 - entry Ah ;;;
SamusTiles_Top_Set7_EntryA:
; EAh: Facing right - Samus drained - standing - frame 1
; EAh: Facing right - Samus drained - standing - frame 3
incbin "data/SamusTiles_Top_Set7_EntryA.bin" ; $140 bytes


;;; $DFC0: Samus top tiles - set 7 - entry Bh ;;;
SamusTiles_Top_Set7_EntryB:
; EAh: Facing right - Samus drained - standing - frame 2
incbin "data/SamusTiles_Top_Set7_EntryB.bin" ; $140 bytes


;;; $E100: Samus top tiles - set 7 - entry Ch ;;;
SamusTiles_Top_Set7_EntryC:
; 1: Facing right - normal - frame 0
; 1: Facing right - normal - frame 5
; 27h: Facing right - crouching - frame 0
; 27h: Facing right - crouching - frame 5
; 47h: Unused - frame 0
; 47h: Unused - frame 5
; 89h: Facing right - ran into a wall - frame 0
; 89h: Facing right - ran into a wall - frame 5
; A8h: Facing right - grappling - frame 0
; A8h: Facing right - grappling - frame 5
; B4h: Facing right - grappling - crouching - frame 0
; B4h: Facing right - grappling - crouching - frame 5
incbin "data/SamusTiles_Top_Set7_EntryC.bin" ; $140 bytes


;;; $E240: Samus top tiles - set 7 - entry Dh ;;;
SamusTiles_Top_Set7_EntryD:
; 1: Facing right - normal - frame 1
; 1: Facing right - normal - frame 3
; 1: Facing right - normal - frame 6
; 1: Facing right - normal - frame 8
; 27h: Facing right - crouching - frame 1
; 27h: Facing right - crouching - frame 3
; 27h: Facing right - crouching - frame 6
; 27h: Facing right - crouching - frame 8
; 47h: Unused - frame 1
; 47h: Unused - frame 3
; 47h: Unused - frame 6
; 47h: Unused - frame 8
; 89h: Facing right - ran into a wall - frame 1
; 89h: Facing right - ran into a wall - frame 3
; 89h: Facing right - ran into a wall - frame 6
; 89h: Facing right - ran into a wall - frame 8
; A8h: Facing right - grappling - frame 1
; A8h: Facing right - grappling - frame 3
; A8h: Facing right - grappling - frame 6
; A8h: Facing right - grappling - frame 8
; B4h: Facing right - grappling - crouching - frame 1
; B4h: Facing right - grappling - crouching - frame 3
; B4h: Facing right - grappling - crouching - frame 6
; B4h: Facing right - grappling - crouching - frame 8
incbin "data/SamusTiles_Top_Set7_EntryD.bin" ; $140 bytes


;;; $E380: Samus top tiles - set 7 - entry Eh ;;;
SamusTiles_Top_Set7_EntryE:
; 1: Facing right - normal - frame 2
; 27h: Facing right - crouching - frame 2
; 47h: Unused - frame 2
; 89h: Facing right - ran into a wall - frame 2
; A8h: Facing right - grappling - frame 2
; B4h: Facing right - grappling - crouching - frame 2
incbin "data/SamusTiles_Top_Set7_EntryE.bin" ; $140 bytes


;;; $E4C0: Samus top tiles - set 7 - entry Fh ;;;
SamusTiles_Top_Set7_EntryF:
; 2: Facing left  - normal - frame 0
; 2: Facing left  - normal - frame 5
; 28h: Facing left  - crouching - frame 0
; 28h: Facing left  - crouching - frame 5
; 48h: Unused - frame 0
; 48h: Unused - frame 5
; 8Ah: Facing left  - ran into a wall - frame 0
; 8Ah: Facing left  - ran into a wall - frame 5
; A9h: Facing left  - grappling - frame 0
; A9h: Facing left  - grappling - frame 5
; B5h: Facing left  - grappling - crouching - frame 0
; B5h: Facing left  - grappling - crouching - frame 5
incbin "data/SamusTiles_Top_Set7_EntryF.bin" ; $140 bytes


;;; $E600: Samus top tiles - set 7 - entry 10h ;;;
SamusTiles_Top_Set7_Entry10:
; 2: Facing left  - normal - frame 1
; 2: Facing left  - normal - frame 3
; 2: Facing left  - normal - frame 6
; 2: Facing left  - normal - frame 8
; 28h: Facing left  - crouching - frame 1
; 28h: Facing left  - crouching - frame 3
; 28h: Facing left  - crouching - frame 6
; 28h: Facing left  - crouching - frame 8
; 48h: Unused - frame 1
; 48h: Unused - frame 3
; 48h: Unused - frame 6
; 48h: Unused - frame 8
; 8Ah: Facing left  - ran into a wall - frame 1
; 8Ah: Facing left  - ran into a wall - frame 3
; 8Ah: Facing left  - ran into a wall - frame 6
; 8Ah: Facing left  - ran into a wall - frame 8
; A9h: Facing left  - grappling - frame 1
; A9h: Facing left  - grappling - frame 3
; A9h: Facing left  - grappling - frame 6
; A9h: Facing left  - grappling - frame 8
; B5h: Facing left  - grappling - crouching - frame 1
; B5h: Facing left  - grappling - crouching - frame 3
; B5h: Facing left  - grappling - crouching - frame 6
; B5h: Facing left  - grappling - crouching - frame 8
incbin "data/SamusTiles_Top_Set7_Entry10.bin" ; $140 bytes


;;; $E740: Samus top tiles - set 7 - entry 11h ;;;
SamusTiles_Top_Set7_Entry11:
; 2: Facing left  - normal - frame 2
; 28h: Facing left  - crouching - frame 2
; 48h: Unused - frame 2
; 8Ah: Facing left  - ran into a wall - frame 2
; A9h: Facing left  - grappling - frame 2
; B5h: Facing left  - grappling - crouching - frame 2
incbin "data/SamusTiles_Top_Set7_Entry11.bin" ; $140 bytes


;;; $E880: Samus top tiles - set 7 - entry 12h ;;;
SamusTiles_Top_Set7_Entry12:
; 1: Facing right - normal - frame 7
; 27h: Facing right - crouching - frame 7
; 47h: Unused - frame 7
; 89h: Facing right - ran into a wall - frame 7
; A8h: Facing right - grappling - frame 7
; B4h: Facing right - grappling - crouching - frame 7
incbin "data/SamusTiles_Top_Set7_Entry12.bin" ; $100 bytes


;;; $E980: Samus top tiles - set 7 - entry 13h ;;;
SamusTiles_Top_Set7_Entry13:
; 2: Facing left  - normal - frame 7
; 28h: Facing left  - crouching - frame 7
; 48h: Unused - frame 7
; 8Ah: Facing left  - ran into a wall - frame 7
; A9h: Facing left  - grappling - frame 7
; B5h: Facing left  - grappling - crouching - frame 7
incbin "data/SamusTiles_Top_Set7_Entry13.bin" ; $100 bytes


;;; $EA80: Samus bottom tiles - set 9 - entry 0 ;;;
SamusTiles_Bottom_Set9_Entry0:
; 1Bh: Facing right - space jump - frame 1
; 1Ch: Facing left  - space jump - frame 1
; 81h: Facing right - screw attack - frame 1
; 81h: Facing right - screw attack - frame 9
; 81h: Facing right - screw attack - frame 11h
; 82h: Facing left  - screw attack - frame 1
; 82h: Facing left  - screw attack - frame 9
; 82h: Facing left  - screw attack - frame 11h
; 83h: Facing right - wall jump - frame Dh
; 83h: Facing right - wall jump - frame 17h
; 83h: Facing right - wall jump - frame 1Fh
; 83h: Facing right - wall jump - frame 27h
; 84h: Facing left  - wall jump - frame Dh
; 84h: Facing left  - wall jump - frame 17h
; 84h: Facing left  - wall jump - frame 1Fh
; 84h: Facing left  - wall jump - frame 27h
incbin "data/SamusTiles_Bottom_Set9_Entry0.bin" ; $200 bytes


;;; $EC80: Samus bottom tiles - set 9 - entry 1 ;;;
SamusTiles_Bottom_Set9_Entry1:
; 1Bh: Facing right - space jump - frame 2
; 1Ch: Facing left  - space jump - frame 2
; 81h: Facing right - screw attack - frame 2
; 81h: Facing right - screw attack - frame Ah
; 81h: Facing right - screw attack - frame 12h
; 82h: Facing left  - screw attack - frame 2
; 82h: Facing left  - screw attack - frame Ah
; 82h: Facing left  - screw attack - frame 12h
; 83h: Facing right - wall jump - frame Eh
; 83h: Facing right - wall jump - frame 18h
; 83h: Facing right - wall jump - frame 20h
; 83h: Facing right - wall jump - frame 28h
; 84h: Facing left  - wall jump - frame Eh
; 84h: Facing left  - wall jump - frame 18h
; 84h: Facing left  - wall jump - frame 20h
; 84h: Facing left  - wall jump - frame 28h
incbin "data/SamusTiles_Bottom_Set9_Entry1.bin" ; $200 bytes


;;; $EE80: Samus bottom tiles - set 9 - entry 2 ;;;
SamusTiles_Bottom_Set9_Entry2:
; 1Bh: Facing right - space jump - frame 3
; 1Ch: Facing left  - space jump - frame 3
; 81h: Facing right - screw attack - frame 3
; 81h: Facing right - screw attack - frame Bh
; 81h: Facing right - screw attack - frame 13h
; 82h: Facing left  - screw attack - frame 3
; 82h: Facing left  - screw attack - frame Bh
; 82h: Facing left  - screw attack - frame 13h
; 83h: Facing right - wall jump - frame Fh
; 83h: Facing right - wall jump - frame 19h
; 83h: Facing right - wall jump - frame 21h
; 83h: Facing right - wall jump - frame 29h
; 84h: Facing left  - wall jump - frame Fh
; 84h: Facing left  - wall jump - frame 19h
; 84h: Facing left  - wall jump - frame 21h
; 84h: Facing left  - wall jump - frame 29h
incbin "data/SamusTiles_Bottom_Set9_Entry2.bin" ; $200 bytes


;;; $F080: Samus bottom tiles - set 9 - entry 3 ;;;
SamusTiles_Bottom_Set9_Entry3:
; 1Bh: Facing right - space jump - frame 4
; 1Ch: Facing left  - space jump - frame 4
; 81h: Facing right - screw attack - frame 4
; 81h: Facing right - screw attack - frame Ch
; 81h: Facing right - screw attack - frame 14h
; 82h: Facing left  - screw attack - frame 4
; 82h: Facing left  - screw attack - frame Ch
; 82h: Facing left  - screw attack - frame 14h
; 83h: Facing right - wall jump - frame 10h
; 83h: Facing right - wall jump - frame 1Ah
; 83h: Facing right - wall jump - frame 22h
; 83h: Facing right - wall jump - frame 2Ah
; 84h: Facing left  - wall jump - frame 10h
; 84h: Facing left  - wall jump - frame 1Ah
; 84h: Facing left  - wall jump - frame 22h
; 84h: Facing left  - wall jump - frame 2Ah
incbin "data/SamusTiles_Bottom_Set9_Entry3.bin" ; $200 bytes


;;; $F280: Samus bottom tiles - set 9 - entry 4 ;;;
SamusTiles_Bottom_Set9_Entry4:
; 1Bh: Facing right - space jump - frame 5
; 1Ch: Facing left  - space jump - frame 5
; 81h: Facing right - screw attack - frame 5
; 81h: Facing right - screw attack - frame Dh
; 81h: Facing right - screw attack - frame 15h
; 82h: Facing left  - screw attack - frame 5
; 82h: Facing left  - screw attack - frame Dh
; 82h: Facing left  - screw attack - frame 15h
; 83h: Facing right - wall jump - frame 11h
; 83h: Facing right - wall jump - frame 1Bh
; 83h: Facing right - wall jump - frame 23h
; 83h: Facing right - wall jump - frame 2Bh
; 84h: Facing left  - wall jump - frame 11h
; 84h: Facing left  - wall jump - frame 1Bh
; 84h: Facing left  - wall jump - frame 23h
; 84h: Facing left  - wall jump - frame 2Bh
incbin "data/SamusTiles_Bottom_Set9_Entry4.bin" ; $200 bytes


;;; $F480: Samus bottom tiles - set 9 - entry 5 ;;;
SamusTiles_Bottom_Set9_Entry5:
; 1Bh: Facing right - space jump - frame 6
; 1Ch: Facing left  - space jump - frame 6
; 81h: Facing right - screw attack - frame 6
; 81h: Facing right - screw attack - frame Eh
; 81h: Facing right - screw attack - frame 16h
; 82h: Facing left  - screw attack - frame 6
; 82h: Facing left  - screw attack - frame Eh
; 82h: Facing left  - screw attack - frame 16h
; 83h: Facing right - wall jump - frame 12h
; 83h: Facing right - wall jump - frame 1Ch
; 83h: Facing right - wall jump - frame 24h
; 83h: Facing right - wall jump - frame 2Ch
; 84h: Facing left  - wall jump - frame 12h
; 84h: Facing left  - wall jump - frame 1Ch
; 84h: Facing left  - wall jump - frame 24h
; 84h: Facing left  - wall jump - frame 2Ch
incbin "data/SamusTiles_Bottom_Set9_Entry5.bin" ; $200 bytes


;;; $F680: Samus bottom tiles - set 9 - entry 6 ;;;
SamusTiles_Bottom_Set9_Entry6:
; 1Bh: Facing right - space jump - frame 7
; 1Ch: Facing left  - space jump - frame 7
; 81h: Facing right - screw attack - frame 7
; 81h: Facing right - screw attack - frame Fh
; 81h: Facing right - screw attack - frame 17h
; 82h: Facing left  - screw attack - frame 7
; 82h: Facing left  - screw attack - frame Fh
; 82h: Facing left  - screw attack - frame 17h
; 83h: Facing right - wall jump - frame 13h
; 83h: Facing right - wall jump - frame 1Dh
; 83h: Facing right - wall jump - frame 25h
; 83h: Facing right - wall jump - frame 2Dh
; 84h: Facing left  - wall jump - frame 13h
; 84h: Facing left  - wall jump - frame 1Dh
; 84h: Facing left  - wall jump - frame 25h
; 84h: Facing left  - wall jump - frame 2Dh
incbin "data/SamusTiles_Bottom_Set9_Entry6.bin" ; $200 bytes


;;; $F880: Samus bottom tiles - set 9 - entry 7 ;;;
SamusTiles_Bottom_Set9_Entry7:
; 1Bh: Facing right - space jump - frame 8
; 1Ch: Facing left  - space jump - frame 8
; 81h: Facing right - screw attack - frame 8
; 81h: Facing right - screw attack - frame 10h
; 81h: Facing right - screw attack - frame 18h
; 82h: Facing left  - screw attack - frame 8
; 82h: Facing left  - screw attack - frame 10h
; 82h: Facing left  - screw attack - frame 18h
; 83h: Facing right - wall jump - frame 14h
; 83h: Facing right - wall jump - frame 1Eh
; 83h: Facing right - wall jump - frame 26h
; 83h: Facing right - wall jump - frame 2Eh
; 84h: Facing left  - wall jump - frame 14h
; 84h: Facing left  - wall jump - frame 1Eh
; 84h: Facing left  - wall jump - frame 26h
; 84h: Facing left  - wall jump - frame 2Eh
incbin "data/SamusTiles_Bottom_Set9_Entry7.bin" ; $200 bytes


;;; $F860: Samus top tiles - set 9 - entry Bh ;;;
SamusTiles_Top_Set9_EntryB:
; Ch: Moving left  - gun extended - frame 8
incbin "data/SamusTiles_Top_Set9_EntryB.bin" ; $140 bytes


;;; $F9A0: Samus top tiles - set 9 - entry Ch ;;;
SamusTiles_Top_Set9_EntryC:
; Bh: Moving right - gun extended - frame 8
incbin "data/SamusTiles_Top_Set9_EntryC.bin" ; $E0 bytes


;;; $FAA0: Samus top tiles - set 9 - entry Dh ;;;
SamusTiles_Top_Set9_EntryD:
; Ch: Moving left  - gun extended - frame 7
incbin "data/SamusTiles_Top_Set9_EntryD.bin" ; $140 bytes


;;; $FBE0: Samus top tiles - set 9 - entry Eh ;;;
SamusTiles_Top_Set9_EntryE:
; Bh: Moving right - gun extended - frame 1
incbin "data/SamusTiles_Top_Set9_EntryE.bin" ; $C0 bytes


;;; $FCA0: Samus top tiles - set 9 - entry Fh ;;;
SamusTiles_Top_Set9_EntryF:
; Ch: Moving left  - gun extended - frame 1
incbin "data/SamusTiles_Top_Set9_EntryF.bin" ; $100 bytes



org !SamusTilesBank1


;;; $8000: Samus bottom tiles - set 0 - entry 0 ;;;
SamusTiles_Bottom_Set0_Entry0:
; 9: Moving right - not aiming - frame 0
; Ah: Moving left  - not aiming - frame 0
; Bh: Moving right - gun extended - frame 0
; Ch: Moving left  - gun extended - frame 0
; Dh: Moving right - aiming up (unused) - frame 0
; Eh: Moving left  - aiming up (unused) - frame 0
; Fh: Moving right - aiming up-right - frame 0
; 10h: Moving left  - aiming up-left - frame 0
; 11h: Moving right - aiming down-right - frame 0
; 12h: Moving left  - aiming down-left - frame 0
incbin "data/SamusTiles_Bottom_Set0_Entry0.bin" ; $100 bytes


;;; $8100: Samus bottom tiles - set 0 - entry 1 ;;;
SamusTiles_Bottom_Set0_Entry1:
; 9: Moving right - not aiming - frame 2
; Ah: Moving left  - not aiming - frame 2
; Bh: Moving right - gun extended - frame 2
; Ch: Moving left  - gun extended - frame 2
; Dh: Moving right - aiming up (unused) - frame 2
; Eh: Moving left  - aiming up (unused) - frame 2
; Fh: Moving right - aiming up-right - frame 2
; 10h: Moving left  - aiming up-left - frame 2
; 11h: Moving right - aiming down-right - frame 2
; 12h: Moving left  - aiming down-left - frame 2
incbin "data/SamusTiles_Bottom_Set0_Entry1.bin" ; $160 bytes


;;; $8260: Samus bottom tiles - set 0 - entry 2 ;;;
SamusTiles_Bottom_Set0_Entry2:
; 9: Moving right - not aiming - frame 4
; Ah: Moving left  - not aiming - frame 4
; Bh: Moving right - gun extended - frame 4
; Ch: Moving left  - gun extended - frame 4
; Dh: Moving right - aiming up (unused) - frame 4
; Eh: Moving left  - aiming up (unused) - frame 4
; Fh: Moving right - aiming up-right - frame 4
; 10h: Moving left  - aiming up-left - frame 4
; 11h: Moving right - aiming down-right - frame 4
; 12h: Moving left  - aiming down-left - frame 4
incbin "data/SamusTiles_Bottom_Set0_Entry2.bin" ; $1A0 bytes


;;; $8400: Samus bottom tiles - set 0 - entry 3 ;;;
SamusTiles_Bottom_Set0_Entry3:
; 9: Moving right - not aiming - frame 5
; Ah: Moving left  - not aiming - frame 5
; Bh: Moving right - gun extended - frame 5
; Ch: Moving left  - gun extended - frame 5
; Dh: Moving right - aiming up (unused) - frame 5
; Eh: Moving left  - aiming up (unused) - frame 5
; Fh: Moving right - aiming up-right - frame 5
; 10h: Moving left  - aiming up-left - frame 5
; 11h: Moving right - aiming down-right - frame 5
; 12h: Moving left  - aiming down-left - frame 5
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 0
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 0
; C7h: Facing right - vertical shinespark windup - frame 0
; C8h: Facing left  - vertical shinespark windup - frame 0
incbin "data/SamusTiles_Bottom_Set0_Entry3.bin" ; $100 bytes


;;; $8500: Samus bottom tiles - set 0 - entry 4 ;;;
SamusTiles_Bottom_Set0_Entry4:
; 9: Moving right - not aiming - frame 7
; Ah: Moving left  - not aiming - frame 7
; Bh: Moving right - gun extended - frame 7
; Ch: Moving left  - gun extended - frame 7
; Dh: Moving right - aiming up (unused) - frame 7
; Eh: Moving left  - aiming up (unused) - frame 7
; Fh: Moving right - aiming up-right - frame 7
; 10h: Moving left  - aiming up-left - frame 7
; 11h: Moving right - aiming down-right - frame 7
; 12h: Moving left  - aiming down-left - frame 7
incbin "data/SamusTiles_Bottom_Set0_Entry4.bin" ; $180 bytes


;;; $8680: Samus bottom tiles - set 0 - entry 5 ;;;
SamusTiles_Bottom_Set0_Entry5:
; 9: Moving right - not aiming - frame 9
; Ah: Moving left  - not aiming - frame 9
; Bh: Moving right - gun extended - frame 9
; Ch: Moving left  - gun extended - frame 9
; Dh: Moving right - aiming up (unused) - frame 9
; Eh: Moving left  - aiming up (unused) - frame 9
; Fh: Moving right - aiming up-right - frame 9
; 10h: Moving left  - aiming up-left - frame 9
; 11h: Moving right - aiming down-right - frame 9
; 12h: Moving left  - aiming down-left - frame 9
incbin "data/SamusTiles_Bottom_Set0_Entry5.bin" ; $1A0 bytes


;;; $8820: Samus bottom tiles - set 0 - entry 6 ;;;
SamusTiles_Bottom_Set0_Entry6:
; 1: Facing right - normal - frame 0
; 1: Facing right - normal - frame 5
; 2: Facing left  - normal - frame 0
; 2: Facing left  - normal - frame 5
; 47h: Unused - frame 0
; 47h: Unused - frame 5
; 48h: Unused - frame 0
; 48h: Unused - frame 5
; 89h: Facing right - ran into a wall - frame 0
; 89h: Facing right - ran into a wall - frame 5
; 8Ah: Facing left  - ran into a wall - frame 0
; 8Ah: Facing left  - ran into a wall - frame 5
; A4h: Facing right - landing from normal jump - frame 1
; A5h: Facing left  - landing from normal jump - frame 1
; A6h: Facing right - landing from spin jump - frame 2
; A7h: Facing left  - landing from spin jump - frame 2
; A8h: Facing right - grappling - frame 0
; A8h: Facing right - grappling - frame 5
; A9h: Facing left  - grappling - frame 0
; A9h: Facing left  - grappling - frame 5
; D5h: Facing right - x-ray - standing - frames 0..4
; D6h: Facing left  - x-ray - standing - frames 0..4
; E0h: Facing right - landing from normal jump - aiming up - frame 1
; E1h: Facing left  - landing from normal jump - aiming up - frame 1
; E2h: Facing right - landing from normal jump - aiming up-right - frame 1
; E3h: Facing left  - landing from normal jump - aiming up-left - frame 1
; E4h: Facing right - landing from normal jump - aiming down-right - frame 1
; E5h: Facing left  - landing from normal jump - aiming down-left - frame 1
; E6h: Facing right - landing from normal jump - firing - frame 1
; E7h: Facing left  - landing from normal jump - firing - frame 1
incbin "data/SamusTiles_Bottom_Set0_Entry6.bin" ; $180 bytes


;;; $89A0: Samus bottom tiles - set 0 - entry 7 ;;;
SamusTiles_Bottom_Set0_Entry7:
; 27h: Facing right - crouching - frames 0..3
; 27h: Facing right - crouching - frames 5..8
; 28h: Facing left  - crouching - frames 0..3
; 28h: Facing left  - crouching - frames 5..8
; 71h: Facing right - crouching - aiming up-right - frame 0
; 72h: Facing left  - crouching - aiming up-left - frame 0
; 73h: Facing right - crouching - aiming down-right - frame 0
; 74h: Facing left  - crouching - aiming down-left - frame 0
; 85h: Facing right - crouching - aiming up - frames 0..1
; 86h: Facing left  - crouching - aiming up - frames 0..1
; B4h: Facing right - grappling - crouching - frames 0..3
; B4h: Facing right - grappling - crouching - frames 5..8
; B5h: Facing left  - grappling - crouching - frames 0..3
; B5h: Facing left  - grappling - crouching - frames 5..8
; B6h: Facing right - grappling - crouching - aiming down-right - frame 0
; B7h: Facing left  - grappling - crouching - aiming down-left - frame 0
; D9h: Facing right - x-ray - crouching - frames 0..4
; DAh: Facing left  - x-ray - crouching - frames 0..4
incbin "data/SamusTiles_Bottom_Set0_Entry7.bin" ; $100 bytes


;;; $8AA0: Samus bottom tiles - set 0 - entry 8 ;;;
SamusTiles_Bottom_Set0_Entry8:
; 9: Moving right - not aiming - frame 1
; Ah: Moving left  - not aiming - frame 1
; Bh: Moving right - gun extended - frame 1
; Ch: Moving left  - gun extended - frame 1
; Dh: Moving right - aiming up (unused) - frame 1
; Eh: Moving left  - aiming up (unused) - frame 1
; Fh: Moving right - aiming up-right - frame 1
; 10h: Moving left  - aiming up-left - frame 1
; 11h: Moving right - aiming down-right - frame 1
; 12h: Moving left  - aiming down-left - frame 1
incbin "data/SamusTiles_Bottom_Set0_Entry8.bin" ; $140 bytes


;;; $8BE0: Samus bottom tiles - set 0 - entry 9 ;;;
SamusTiles_Bottom_Set0_Entry9:
; 9: Moving right - not aiming - frame 3
; Ah: Moving left  - not aiming - frame 3
; Bh: Moving right - gun extended - frame 3
; Ch: Moving left  - gun extended - frame 3
; Dh: Moving right - aiming up (unused) - frame 3
; Eh: Moving left  - aiming up (unused) - frame 3
; Fh: Moving right - aiming up-right - frame 3
; 10h: Moving left  - aiming up-left - frame 3
; 11h: Moving right - aiming down-right - frame 3
; 12h: Moving left  - aiming down-left - frame 3
incbin "data/SamusTiles_Bottom_Set0_Entry9.bin" ; $180 bytes


;;; $8D60: Samus bottom tiles - set 0 - entry Ah ;;;
SamusTiles_Bottom_Set0_EntryA:
; 9: Moving right - not aiming - frame 6
; Ah: Moving left  - not aiming - frame 6
; Bh: Moving right - gun extended - frame 6
; Ch: Moving left  - gun extended - frame 6
; Dh: Moving right - aiming up (unused) - frame 6
; Eh: Moving left  - aiming up (unused) - frame 6
; Fh: Moving right - aiming up-right - frame 6
; 10h: Moving left  - aiming up-left - frame 6
; 11h: Moving right - aiming down-right - frame 6
; 12h: Moving left  - aiming down-left - frame 6
incbin "data/SamusTiles_Bottom_Set0_EntryA.bin" ; $140 bytes


;;; $8EA0: Samus bottom tiles - set 0 - entry Bh ;;;
SamusTiles_Bottom_Set0_EntryB:
; 9: Moving right - not aiming - frame 8
; Ah: Moving left  - not aiming - frame 8
; Bh: Moving right - gun extended - frame 8
; Ch: Moving left  - gun extended - frame 8
; Dh: Moving right - aiming up (unused) - frame 8
; Eh: Moving left  - aiming up (unused) - frame 8
; Fh: Moving right - aiming up-right - frame 8
; 10h: Moving left  - aiming up-left - frame 8
; 11h: Moving right - aiming down-right - frame 8
; 12h: Moving left  - aiming down-left - frame 8
incbin "data/SamusTiles_Bottom_Set0_EntryB.bin" ; $180 bytes


;;; $9020: Samus bottom tiles - set 0 - entry Ch ;;;
SamusTiles_Bottom_Set0_EntryC:
; 0: Facing forward - power suit - frame 0
incbin "data/SamusTiles_Bottom_Set0_EntryC.bin" ; $1C0 bytes


;;; $91E0: Samus bottom tiles - set 0 - entry Dh ;;;
SamusTiles_Bottom_Set0_EntryD:
; 9Bh: Facing forward - varia/gravity suit - frame 0
incbin "data/SamusTiles_Bottom_Set0_EntryD.bin" ; $1C0 bytes


;;; $93A0: Samus bottom tiles - set 0 - entry Eh ;;;
SamusTiles_Bottom_Set0_EntryE:
; 1: Facing right - normal - frame 1
; 1: Facing right - normal - frame 3
; 1: Facing right - normal - frame 6
; 1: Facing right - normal - frame 8
; 47h: Unused - frame 1
; 47h: Unused - frame 3
; 47h: Unused - frame 6
; 47h: Unused - frame 8
; 89h: Facing right - ran into a wall - frame 1
; 89h: Facing right - ran into a wall - frame 3
; 89h: Facing right - ran into a wall - frame 6
; 89h: Facing right - ran into a wall - frame 8
; A8h: Facing right - grappling - frame 1
; A8h: Facing right - grappling - frame 3
; A8h: Facing right - grappling - frame 6
; A8h: Facing right - grappling - frame 8
incbin "data/SamusTiles_Bottom_Set0_EntryE.bin" ; $180 bytes


;;; $9520: Samus bottom tiles - set 0 - entry Fh ;;;
SamusTiles_Bottom_Set0_EntryF:
; 1: Facing right - normal - frame 2
; 1: Facing right - normal - frame 7
; 47h: Unused - frame 2
; 47h: Unused - frame 7
; 89h: Facing right - ran into a wall - frame 2
; 89h: Facing right - ran into a wall - frame 7
; A8h: Facing right - grappling - frame 2
; A8h: Facing right - grappling - frame 7
incbin "data/SamusTiles_Bottom_Set0_EntryF.bin" ; $180 bytes


;;; $96A0: Samus bottom tiles - set 0 - entry 10h ;;;
SamusTiles_Bottom_Set0_Entry10:
; 2: Facing left  - normal - frame 1
; 2: Facing left  - normal - frame 3
; 2: Facing left  - normal - frame 6
; 2: Facing left  - normal - frame 8
; 48h: Unused - frame 1
; 48h: Unused - frame 3
; 48h: Unused - frame 6
; 48h: Unused - frame 8
; 8Ah: Facing left  - ran into a wall - frame 1
; 8Ah: Facing left  - ran into a wall - frame 3
; 8Ah: Facing left  - ran into a wall - frame 6
; 8Ah: Facing left  - ran into a wall - frame 8
; A9h: Facing left  - grappling - frame 1
; A9h: Facing left  - grappling - frame 3
; A9h: Facing left  - grappling - frame 6
; A9h: Facing left  - grappling - frame 8
incbin "data/SamusTiles_Bottom_Set0_Entry10.bin" ; $180 bytes


;;; $9820: Samus bottom tiles - set 0 - entry 11h ;;;
SamusTiles_Bottom_Set0_Entry11:
; 4Fh: Facing left  - damage boost - frame 0
incbin "data/SamusTiles_Bottom_Set0_Entry11.bin" ; $E0 bytes


;;; $9900: Samus bottom tiles - set 0 - entry 12h ;;;
SamusTiles_Bottom_Set0_Entry12:
; 50h: Facing right - damage boost - frame 0
incbin "data/SamusTiles_Bottom_Set0_Entry12.bin" ; $E0 bytes


;;; $99E0: Samus bottom tiles - set 0 - entry 13h ;;;
SamusTiles_Bottom_Set0_Entry13:
; 15h: Facing right - normal jump - aiming up - frame 1
; 69h: Facing right - normal jump - aiming up-right - frame 1
incbin "data/SamusTiles_Bottom_Set0_Entry13.bin" ; $120 bytes


;;; $9B00: Samus bottom tiles - set 0 - entry 14h ;;;
SamusTiles_Bottom_Set0_Entry14:
; 16h: Facing left  - normal jump - aiming up - frame 1
; 6Ah: Facing left  - normal jump - aiming up-left - frame 1
incbin "data/SamusTiles_Bottom_Set0_Entry14.bin" ; $120 bytes


;;; $9C20: Samus bottom tiles - set 0 - entry 15h ;;;
SamusTiles_Bottom_Set0_Entry15:
; 25h: Facing right - turning - standing - frame 2
; 26h: Facing left  - turning - standing - frame 0
; 8Bh: Facing right - turning - standing - aiming up - frame 2
; 8Ch: Facing left  - turning - standing - aiming up - frame 0
; 8Dh: Facing right - turning - standing - aiming down-right - frame 2
; 8Eh: Facing left  - turning - standing - aiming down-left - frame 0
; 9Ch: Facing right - turning - standing - aiming up-right - frame 2
; 9Dh: Facing left  - turning - standing - aiming up-left - frame 0
; BFh: Facing right - moonwalking - turn/jump left - frame 2
; C0h: Facing left  - moonwalking - turn/jump right - frame 0
; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right - frame 2
; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left - frame 0
; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right - frame 2
; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left - frame 0
; C6h: Unused - frame 2
incbin "data/SamusTiles_Bottom_Set0_Entry15.bin" ; $120 bytes


;;; $9D40: Samus bottom tiles - set 0 - entry 16h ;;;
SamusTiles_Bottom_Set0_Entry16:
; 25h: Facing right - turning - standing - frame 0
; 26h: Facing left  - turning - standing - frame 2
; 8Bh: Facing right - turning - standing - aiming up - frame 0
; 8Ch: Facing left  - turning - standing - aiming up - frame 2
; 8Dh: Facing right - turning - standing - aiming down-right - frame 0
; 8Eh: Facing left  - turning - standing - aiming down-left - frame 2
; 9Ch: Facing right - turning - standing - aiming up-right - frame 0
; 9Dh: Facing left  - turning - standing - aiming up-left - frame 2
; BFh: Facing right - moonwalking - turn/jump left - frame 0
; C0h: Facing left  - moonwalking - turn/jump right - frame 2
; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right - frame 0
; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left - frame 2
; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right - frame 0
; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left - frame 2
; C6h: Unused - frame 0
incbin "data/SamusTiles_Bottom_Set0_Entry16.bin" ; $120 bytes


;;; $9E60: Samus bottom tiles - set 0 - entry 17h ;;;
SamusTiles_Bottom_Set0_Entry17:
; 2Fh: Facing right - turning - jumping - frame 2
; 30h: Facing left  - turning - jumping - frame 0
; 43h: Facing right - turning - crouching - frame 2
; 44h: Facing left  - turning - crouching - frame 0
; 87h: Facing right - turning - falling - frame 2
; 88h: Facing left  - turning - falling - frame 0
; 8Fh: Facing right - turning - in air - aiming up - frame 2
; 90h: Facing left  - turning - in air - aiming up - frame 0
; 91h: Facing right - turning - in air - aiming down/down-right - frame 2
; 92h: Facing left  - turning - in air - aiming down/down-left - frame 0
; 93h: Facing right - turning - falling - aiming up - frame 2
; 94h: Facing left  - turning - falling - aiming up - frame 0
; 95h: Facing right - turning - falling - aiming down/down-right - frame 2
; 96h: Facing left  - turning - falling - aiming down/down-left - frame 0
; 97h: Facing right - turning - crouching - aiming up - frame 2
; 98h: Facing left  - turning - crouching - aiming up - frame 0
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 2
; 9Ah: Facing left  - turning - crouching - aiming down/down-left - frame 0
; 9Eh: Facing right - turning - in air - aiming up-right - frame 2
; 9Fh: Facing left  - turning - in air - aiming up-left - frame 0
; A0h: Facing right - turning - falling - aiming up-right - frame 2
; A1h: Facing left  - turning - falling - aiming up-left - frame 0
; A2h: Facing right - turning - crouching - aiming up-right - frame 2
; A3h: Facing left  - turning - crouching - aiming up-left - frame 0
incbin "data/SamusTiles_Bottom_Set0_Entry17.bin" ; $C0 bytes


;;; $9F20: Samus bottom tiles - set 0 - entry 18h ;;;
SamusTiles_Bottom_Set0_Entry18:
; 2Fh: Facing right - turning - jumping - frame 0
; 30h: Facing left  - turning - jumping - frame 2
; 43h: Facing right - turning - crouching - frame 0
; 44h: Facing left  - turning - crouching - frame 2
; 87h: Facing right - turning - falling - frame 0
; 88h: Facing left  - turning - falling - frame 2
; 8Fh: Facing right - turning - in air - aiming up - frame 0
; 90h: Facing left  - turning - in air - aiming up - frame 2
; 91h: Facing right - turning - in air - aiming down/down-right - frame 0
; 92h: Facing left  - turning - in air - aiming down/down-left - frame 2
; 93h: Facing right - turning - falling - aiming up - frame 0
; 94h: Facing left  - turning - falling - aiming up - frame 2
; 95h: Facing right - turning - falling - aiming down/down-right - frame 0
; 96h: Facing left  - turning - falling - aiming down/down-left - frame 2
; 97h: Facing right - turning - crouching - aiming up - frame 0
; 98h: Facing left  - turning - crouching - aiming up - frame 2
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 0
; 9Ah: Facing left  - turning - crouching - aiming down/down-left - frame 2
; 9Eh: Facing right - turning - in air - aiming up-right - frame 0
; 9Fh: Facing left  - turning - in air - aiming up-left - frame 2
; A0h: Facing right - turning - falling - aiming up-right - frame 0
; A1h: Facing left  - turning - falling - aiming up-left - frame 2
; A2h: Facing right - turning - crouching - aiming up-right - frame 0
; A3h: Facing left  - turning - crouching - aiming up-left - frame 2
incbin "data/SamusTiles_Bottom_Set0_Entry18.bin" ; $C0 bytes


;;; $9FE0: Samus bottom tiles - set 0 - entry 19h ;;;
SamusTiles_Bottom_Set0_Entry19:
; 5Ch: Unused - frame 0
; 64h: Unused. Related to movement type Dh - frame 1
; B9h: Facing right - grapple wall jump pose - frame 0
incbin "data/SamusTiles_Bottom_Set0_Entry19.bin" ; $100 bytes


;;; $A0E0: Samus bottom tiles - set 0 - entry 1Ah ;;;
SamusTiles_Bottom_Set0_Entry1A:
; 45h: Unused - frame 0
; 46h: Unused - frame 0
; 5Bh: Unused - frame 0
; 63h: Unused. Related to movement type Dh - frame 1
; B8h: Facing left  - grapple wall jump pose - frame 0
incbin "data/SamusTiles_Bottom_Set0_Entry1A.bin" ; $100 bytes


;;; $A1E0: Samus bottom tiles - set 0 - entry 1Bh ;;;
SamusTiles_Bottom_Set0_Entry1B:
; C9h: Facing right - shinespark - horizontal - frame 0
; CDh: Facing right - shinespark - diagonal - frame 0
incbin "data/SamusTiles_Bottom_Set0_Entry1B.bin" ; $140 bytes


;;; $A320: Samus bottom tiles - set 0 - entry 1Ch ;;;
SamusTiles_Bottom_Set0_Entry1C:
; CAh: Facing left  - shinespark - horizontal - frame 0
; CEh: Facing left  - shinespark - diagonal - frame 0
incbin "data/SamusTiles_Bottom_Set0_Entry1C.bin" ; $140 bytes


;;; $A460: Samus bottom tiles - set 0 - entry 1Dh ;;;
SamusTiles_Bottom_Set0_Entry1D:
; 2: Facing left  - normal - frame 2
; 2: Facing left  - normal - frame 7
; 48h: Unused - frame 2
; 48h: Unused - frame 7
; 8Ah: Facing left  - ran into a wall - frame 2
; 8Ah: Facing left  - ran into a wall - frame 7
; A9h: Facing left  - grappling - frame 2
; A9h: Facing left  - grappling - frame 7
incbin "data/SamusTiles_Bottom_Set0_Entry1D.bin" ; $180 bytes


;;; $A5E0: Samus bottom tiles - set 0 - entry 1Eh ;;;
SamusTiles_Bottom_Set0_Entry1E:
; 19h: Facing right - spin jump - frame Bh
; 1Bh: Facing right - space jump - frame Bh
; 20h: Unused - frame Bh
; 21h: Unused - frame Bh
; 22h: Unused - frame Bh
; 23h: Unused - frame Bh
; 24h: Unused - frame Bh
; 33h: Unused - frame Bh
; 34h: Unused - frame Bh
; 39h: Unused - frame Bh
; 3Ah: Unused - frame Bh
; 42h: Unused - frame Bh
; 81h: Facing right - screw attack - frame 1Bh
incbin "data/SamusTiles_Bottom_Set0_Entry1E.bin" ; $100 bytes


;;; $A6E0: Samus bottom tiles - set 0 - entry 1Fh ;;;
SamusTiles_Bottom_Set0_Entry1F:
; 1Ah: Facing left  - spin jump - frame Bh
; 1Ch: Facing left  - space jump - frame Bh
; 82h: Facing left  - screw attack - frame 1Bh
incbin "data/SamusTiles_Bottom_Set0_Entry1F.bin" ; $100 bytes


;;; $A7E0: Samus bottom tiles - set 1 - entry 0 ;;;
SamusTiles_Bottom_Set1_Entry0:
; 49h: Facing left  - moonwalk - frame 3
; 4Ah: Facing right - moonwalk - frame 3
; 75h: Facing left  - moonwalk - aiming up-left - frame 3
; 76h: Facing right - moonwalk - aiming up-right - frame 3
; 77h: Facing left  - moonwalk - aiming down-left - frame 3
; 78h: Facing right - moonwalk - aiming down-right - frame 3
incbin "data/SamusTiles_Bottom_Set1_Entry0.bin" ; $140 bytes


;;; $A920: Samus bottom tiles - set 1 - entry 1 ;;;
SamusTiles_Bottom_Set1_Entry1:
; 25h: Facing right - turning - standing - frame 1
; 26h: Facing left  - turning - standing - frame 1
; 8Bh: Facing right - turning - standing - aiming up - frame 1
; 8Ch: Facing left  - turning - standing - aiming up - frame 1
; 8Dh: Facing right - turning - standing - aiming down-right - frame 1
; 8Eh: Facing left  - turning - standing - aiming down-left - frame 1
; 9Ch: Facing right - turning - standing - aiming up-right - frame 1
; 9Dh: Facing left  - turning - standing - aiming up-left - frame 1
; BFh: Facing right - moonwalking - turn/jump left - frame 1
; C0h: Facing left  - moonwalking - turn/jump right - frame 1
; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right - frame 1
; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left - frame 1
; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right - frame 1
; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left - frame 1
; C6h: Unused - frame 1
incbin "data/SamusTiles_Bottom_Set1_Entry1.bin" ; $100 bytes


;;; $AA20: Samus bottom tiles - set 1 - entry 2 ;;;
SamusTiles_Bottom_Set1_Entry2:
; 2Fh: Facing right - turning - jumping - frame 1
; 30h: Facing left  - turning - jumping - frame 1
; 43h: Facing right - turning - crouching - frame 1
; 44h: Facing left  - turning - crouching - frame 1
; 87h: Facing right - turning - falling - frame 1
; 88h: Facing left  - turning - falling - frame 1
; 8Fh: Facing right - turning - in air - aiming up - frame 1
; 90h: Facing left  - turning - in air - aiming up - frame 1
; 91h: Facing right - turning - in air - aiming down/down-right - frame 1
; 92h: Facing left  - turning - in air - aiming down/down-left - frame 1
; 93h: Facing right - turning - falling - aiming up - frame 1
; 94h: Facing left  - turning - falling - aiming up - frame 1
; 95h: Facing right - turning - falling - aiming down/down-right - frame 1
; 96h: Facing left  - turning - falling - aiming down/down-left - frame 1
; 97h: Facing right - turning - crouching - aiming up - frame 1
; 98h: Facing left  - turning - crouching - aiming up - frame 1
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 1
; 9Ah: Facing left  - turning - crouching - aiming down/down-left - frame 1
; 9Eh: Facing right - turning - in air - aiming up-right - frame 1
; 9Fh: Facing left  - turning - in air - aiming up-left - frame 1
; A0h: Facing right - turning - falling - aiming up-right - frame 1
; A1h: Facing left  - turning - falling - aiming up-left - frame 1
; A2h: Facing right - turning - crouching - aiming up-right - frame 1
; A3h: Facing left  - turning - crouching - aiming up-left - frame 1
incbin "data/SamusTiles_Bottom_Set1_Entry2.bin" ; $80 bytes


;;; $AAA0: Samus bottom tiles - set 1 - entry 3 ;;;
SamusTiles_Bottom_Set1_Entry3:
; 49h: Facing left  - moonwalk - frame 0
; 4Ah: Facing right - moonwalk - frame 0
; 75h: Facing left  - moonwalk - aiming up-left - frame 0
; 76h: Facing right - moonwalk - aiming up-right - frame 0
; 77h: Facing left  - moonwalk - aiming down-left - frame 0
; 78h: Facing right - moonwalk - aiming down-right - frame 0
incbin "data/SamusTiles_Bottom_Set1_Entry3.bin" ; $140 bytes


;;; $ABE0: Samus bottom tiles - set 1 - entry 4 ;;;
SamusTiles_Bottom_Set1_Entry4:
; 49h: Facing left  - moonwalk - frame 1
; 4Ah: Facing right - moonwalk - frame 1
; 75h: Facing left  - moonwalk - aiming up-left - frame 1
; 76h: Facing right - moonwalk - aiming up-right - frame 1
; 77h: Facing left  - moonwalk - aiming down-left - frame 1
; 78h: Facing right - moonwalk - aiming down-right - frame 1
incbin "data/SamusTiles_Bottom_Set1_Entry4.bin" ; $100 bytes


;;; $ACE0: Samus bottom tiles - set 1 - entry 5 ;;;
SamusTiles_Bottom_Set1_Entry5:
; 49h: Facing left  - moonwalk - frame 4
; 4Ah: Facing right - moonwalk - frame 4
; 75h: Facing left  - moonwalk - aiming up-left - frame 4
; 76h: Facing right - moonwalk - aiming up-right - frame 4
; 77h: Facing left  - moonwalk - aiming down-left - frame 4
; 78h: Facing right - moonwalk - aiming down-right - frame 4
incbin "data/SamusTiles_Bottom_Set1_Entry5.bin" ; $100 bytes


;;; $ADE0: Samus bottom tiles - set 1 - entry 6 ;;;
SamusTiles_Bottom_Set1_Entry6:
; 35h: Facing right - crouching transition - frame 0
; 3Bh: Facing right - standing transition - frame 0
; 4Bh: Facing right - normal jump transition - frame 0
; 55h: Facing right - normal jump transition - aiming up - frame 0
; 57h: Facing right - normal jump transition - aiming up-right - frame 0
; 59h: Facing right - normal jump transition - aiming down-right - frame 0
; A4h: Facing right - landing from normal jump - frame 0
; A6h: Facing right - landing from spin jump - frame 1
; D3h: Facing right - crystal flash - frame Eh
; D7h: Facing right - crystal flash ending - frames 0..3
; D8h: Facing left  - crystal flash ending - frames 0..2
; DBh: Unused - frame 0
; DCh: Unused - frame 0
; DDh: Unused - frame 2
; DEh: Unused - frame 2
; E0h: Facing right - landing from normal jump - aiming up - frame 0
; E2h: Facing right - landing from normal jump - aiming up-right - frame 0
; E4h: Facing right - landing from normal jump - aiming down-right - frame 0
; E6h: Facing right - landing from normal jump - firing - frame 0
; E8h: Facing right - Samus drained - crouching/falling - frames 0..2
; E8h: Facing right - Samus drained - crouching/falling - frame Eh
; E9h: Facing left  - Samus drained - crouching/falling - frames 0..1
; EAh: Facing right - Samus drained - standing - frame 5
; F1h: Facing right - crouching transition - aiming up - frame 0
; F3h: Facing right - crouching transition - aiming up-right - frame 0
; F5h: Facing right - crouching transition - aiming down-right - frame 0
; F7h: Facing right - standing transition - aiming up - frame 0
; F9h: Facing right - standing transition - aiming up-right - frame 0
; FBh: Facing right - standing transition - aiming down-right - frame 0
incbin "data/SamusTiles_Bottom_Set1_Entry6.bin" ; $140 bytes


;;; $AF20: Samus bottom tiles - set 1 - entry 7 ;;;
SamusTiles_Bottom_Set1_Entry7:
; 36h: Facing left  - crouching transition - frame 0
; 3Ch: Facing left  - standing transition - frame 0
; 4Ch: Facing left  - normal jump transition - frame 0
; 56h: Facing left  - normal jump transition - aiming up - frame 0
; 58h: Facing left  - normal jump transition - aiming up-left - frame 0
; 5Ah: Facing left  - normal jump transition - aiming down-left - frame 0
; A5h: Facing left  - landing from normal jump - frame 0
; A7h: Facing left  - landing from spin jump - frame 1
; D4h: Facing left  - crystal flash - frame Eh
; D8h: Facing left  - crystal flash ending - frame 3
; E1h: Facing left  - landing from normal jump - aiming up - frame 0
; E3h: Facing left  - landing from normal jump - aiming up-left - frame 0
; E5h: Facing left  - landing from normal jump - aiming down-left - frame 0
; E7h: Facing left  - landing from normal jump - firing - frame 0
; E9h: Facing left  - Samus drained - crouching/falling - frame 7
; E9h: Facing left  - Samus drained - crouching/falling - frame Fh
; E9h: Facing left  - Samus drained - crouching/falling - frame 14h
; E9h: Facing left  - Samus drained - crouching/falling - frame 16h
; EBh: Facing left  - Samus drained - standing - frame 5
; F2h: Facing left  - crouching transition - aiming up - frame 0
; F4h: Facing left  - crouching transition - aiming up-left - frame 0
; F6h: Facing left  - crouching transition - aiming down-left - frame 0
; F8h: Facing left  - standing transition - aiming up - frame 0
; FAh: Facing left  - standing transition - aiming up-left - frame 0
; FCh: Facing left  - standing transition - aiming down-left - frame 0
incbin "data/SamusTiles_Bottom_Set1_Entry7.bin" ; $140 bytes


;;; $B060: Samus bottom tiles - set 1 - entry 8 ;;;
SamusTiles_Bottom_Set1_Entry8:
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frames 2..3
; C7h: Facing right - vertical shinespark windup - frames 2..3
; F0h: Facing right - grabbed by Draygon - moving - frame 5
incbin "data/SamusTiles_Bottom_Set1_Entry8.bin" ; $140 bytes


;;; $B180: Samus bottom tiles - set 1 - entry 9 ;;;
SamusTiles_Bottom_Set1_Entry9:
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frames 2..3
; BEh: Facing left  - grabbed by Draygon - moving - frame 5
; C8h: Facing left  - vertical shinespark windup - frames 2..3
incbin "data/SamusTiles_Bottom_Set1_Entry9.bin" ; $120 bytes


;;; $B2A0: Samus bottom tiles - set 1 - entry Ah ;;;
SamusTiles_Bottom_Set1_EntryA:
; 13h: Facing right - normal jump - not aiming - not moving - gun extended - frame 0
; 15h: Facing right - normal jump - aiming up - frame 0
; 17h: Facing right - normal jump - aiming down - frame 0
; 29h: Facing right - falling - frame 0
; 29h: Facing right - falling - frame 5
; 2Bh: Facing right - falling - aiming up - frame 0
; 2Dh: Facing right - falling - aiming down - frame 0
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 4
; 50h: Facing right - damage boost - frame 1
; 51h: Facing right - normal jump - not aiming - moving forward - frame 0
; 67h: Facing right - falling - gun extended - frame 0
; 67h: Facing right - falling - gun extended - frame 5
; 69h: Facing right - normal jump - aiming up-right - frame 0
; 6Bh: Facing right - normal jump - aiming down-right - frame 0
; 6Dh: Facing right - falling - aiming up-right - frame 0
; 6Fh: Facing right - falling - aiming down-right - frame 0
; ACh: Unused. Facing right - grappling - in air - frame 0
; AEh: Unused. Facing right - grappling - in air - aiming down - frame 0
; B0h: Unused. Facing right - grappling - in air - aiming down-right - frame 0
; C7h: Facing right - vertical shinespark windup - frame 4
incbin "data/SamusTiles_Bottom_Set1_EntryA.bin" ; $120 bytes


;;; $B3C0: Samus bottom tiles - set 1 - entry Bh ;;;
SamusTiles_Bottom_Set1_EntryB:
; 14h: Facing left  - normal jump - not aiming - not moving - gun extended - frame 0
; 16h: Facing left  - normal jump - aiming up - frame 0
; 18h: Facing left  - normal jump - aiming down - frame 0
; 2Ah: Facing left  - falling - frame 0
; 2Ah: Facing left  - falling - frame 5
; 2Ch: Facing left  - falling - aiming up - frame 0
; 2Eh: Facing left  - falling - aiming down - frame 0
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 4
; 4Fh: Facing left  - damage boost - frame 1
; 52h: Facing left  - normal jump - not aiming - moving forward - frame 0
; 68h: Facing left  - falling - gun extended - frame 0
; 68h: Facing left  - falling - gun extended - frame 5
; 6Ah: Facing left  - normal jump - aiming up-left - frame 0
; 6Ch: Facing left  - normal jump - aiming down-left - frame 0
; 6Eh: Facing left  - falling - aiming up-left - frame 0
; 70h: Facing left  - falling - aiming down-left - frame 0
; ADh: Unused. Facing left  - grappling - in air - frame 0
; AFh: Unused. Facing left  - grappling - in air - aiming down - frame 0
; B1h: Unused. Facing left  - grappling - in air - aiming down-left - frame 0
; C8h: Facing left  - vertical shinespark windup - frame 4
incbin "data/SamusTiles_Bottom_Set1_EntryB.bin" ; $120 bytes


;;; $B4E0: Samus bottom tiles - set 1 - entry Ch ;;;
SamusTiles_Bottom_Set1_EntryC:
; 29h: Facing right - falling - frames 1..2
; 2Bh: Facing right - falling - aiming up - frame 1
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 5
; 53h: Facing right - knockback - frame 0
; 67h: Facing right - falling - gun extended - frames 1..2
; 6Dh: Facing right - falling - aiming up-right - frame 1
; 6Fh: Facing right - falling - aiming down-right - frame 1
; C7h: Facing right - vertical shinespark windup - frame 5
; D7h: Facing right - crystal flash ending - frame 4
; E8h: Facing right - Samus drained - crouching/falling - frames 3..7
; F0h: Facing right - grabbed by Draygon - moving - frame 0
; F0h: Facing right - grabbed by Draygon - moving - frame 3
incbin "data/SamusTiles_Bottom_Set1_EntryC.bin" ; $120 bytes


;;; $B5E0: Samus bottom tiles - set 1 - entry Dh ;;;
SamusTiles_Bottom_Set1_EntryD:
; 2Ah: Facing left  - falling - frames 1..2
; 2Ch: Facing left  - falling - aiming up - frame 1
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 5
; 54h: Facing left  - knockback - frame 0
; 68h: Facing left  - falling - gun extended - frames 1..2
; 6Eh: Facing left  - falling - aiming up-left - frame 1
; 70h: Facing left  - falling - aiming down-left - frame 1
; BEh: Facing left  - grabbed by Draygon - moving - frame 0
; BEh: Facing left  - grabbed by Draygon - moving - frame 3
; C8h: Facing left  - vertical shinespark windup - frame 5
; D8h: Facing left  - crystal flash ending - frame 4
; E9h: Facing left  - Samus drained - crouching/falling - frames 2..6
incbin "data/SamusTiles_Bottom_Set1_EntryD.bin" ; $100 bytes


;;; $B6E0: Samus bottom tiles - set 1 - entry Eh ;;;
SamusTiles_Bottom_Set1_EntryE:
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 1
; C7h: Facing right - vertical shinespark windup - frame 1
; F0h: Facing right - grabbed by Draygon - moving - frame 4
incbin "data/SamusTiles_Bottom_Set1_EntryE.bin" ; $100 bytes


;;; $B7E0: Samus bottom tiles - set 1 - entry Fh ;;;
SamusTiles_Bottom_Set1_EntryF:
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 1
; BEh: Facing left  - grabbed by Draygon - moving - frame 4
; C8h: Facing left  - vertical shinespark windup - frame 1
incbin "data/SamusTiles_Bottom_Set1_EntryF.bin" ; $100 bytes


;;; $B8E0: Samus bottom tiles - set 1 - entry 10h ;;;
SamusTiles_Bottom_Set1_Entry10:
; Unused
incbin "data/SamusTiles_Bottom_Set1_Entry10.bin" ; $20 bytes


;;; $B900: Samus bottom tiles - set 1 - entry 11h ;;;
SamusTiles_Bottom_Set1_Entry11:
; 17h: Facing right - normal jump - aiming down - frame 1
; 2Dh: Facing right - falling - aiming down - frame 1
; AEh: Unused. Facing right - grappling - in air - aiming down - frame 1
incbin "data/SamusTiles_Bottom_Set1_Entry11.bin" ; $120 bytes


;;; $BA20: Samus bottom tiles - set 1 - entry 12h ;;;
SamusTiles_Bottom_Set1_Entry12:
; 18h: Facing left  - normal jump - aiming down - frame 1
; 2Eh: Facing left  - falling - aiming down - frame 1
; AFh: Unused. Facing left  - grappling - in air - aiming down - frame 1
incbin "data/SamusTiles_Bottom_Set1_Entry12.bin" ; $120 bytes


;;; $BB40: Samus bottom tiles - set 1 - entry 13h ;;;
SamusTiles_Bottom_Set1_Entry13:
; 65h: Unused. Related to movement type Dh - frame 0
; 83h: Facing right - wall jump - frame 0
incbin "data/SamusTiles_Bottom_Set1_Entry13.bin" ; $140 bytes


;;; $BC80: Samus bottom tiles - set 1 - entry 14h ;;;
SamusTiles_Bottom_Set1_Entry14:
; 66h: Unused. Related to movement type Dh - frame 0
; 84h: Facing left  - wall jump - frame 0
incbin "data/SamusTiles_Bottom_Set1_Entry14.bin" ; $100 bytes


;;; $BD80: Samus bottom tiles - set 1 - entry 15h ;;;
SamusTiles_Bottom_Set1_Entry15:
; 49h: Facing left  - moonwalk - frame 2
; 63h: Unused. Related to movement type Dh - frame 0
incbin "data/SamusTiles_Bottom_Set1_Entry15.bin" ; $120 bytes


;;; $BEA0: Samus bottom tiles - set 1 - entry 16h ;;;
SamusTiles_Bottom_Set1_Entry16:
; 49h: Facing left  - moonwalk - frame 5
; 64h: Unused. Related to movement type Dh - frame 0
incbin "data/SamusTiles_Bottom_Set1_Entry16.bin" ; $120 bytes


;;; $BFC0: Samus bottom tiles - set 1 - entry 17h ;;;
SamusTiles_Bottom_Set1_Entry17:
; 4Ah: Facing right - moonwalk - frame 2
; 75h: Facing left  - moonwalk - aiming up-left - frame 2
; 76h: Facing right - moonwalk - aiming up-right - frame 2
; 77h: Facing left  - moonwalk - aiming down-left - frame 2
; 78h: Facing right - moonwalk - aiming down-right - frame 2
incbin "data/SamusTiles_Bottom_Set1_Entry17.bin" ; $120 bytes


;;; $C0E0: Samus bottom tiles - set 1 - entry 18h ;;;
SamusTiles_Bottom_Set1_Entry18:
; 4Ah: Facing right - moonwalk - frame 5
; 75h: Facing left  - moonwalk - aiming up-left - frame 5
; 76h: Facing right - moonwalk - aiming up-right - frame 5
; 77h: Facing left  - moonwalk - aiming down-left - frame 5
; 78h: Facing right - moonwalk - aiming down-right - frame 5
incbin "data/SamusTiles_Bottom_Set1_Entry18.bin" ; $120 bytes


;;; $C200: Samus bottom tiles - set 1 - entry 19h ;;;
SamusTiles_Bottom_Set1_Entry19:
; 13h: Facing right - normal jump - not aiming - not moving - gun extended - frame 1
; 19h: Facing right - spin jump - frame 0
; 1Bh: Facing right - space jump - frame 0
; 20h: Unused - frame 0
; 21h: Unused - frame 0
; 22h: Unused - frame 0
; 23h: Unused - frame 0
; 24h: Unused - frame 0
; 29h: Facing right - falling - frame 6
; 2Bh: Facing right - falling - aiming up - frame 2
; 33h: Unused - frame 0
; 34h: Unused - frame 0
; 39h: Unused - frame 0
; 3Ah: Unused - frame 0
; 42h: Unused - frame 0
; 50h: Facing right - damage boost - frame 9
; 51h: Facing right - normal jump - not aiming - moving forward - frame 1
; 67h: Facing right - falling - gun extended - frame 6
; 6Bh: Facing right - normal jump - aiming down-right - frame 1
; 6Dh: Facing right - falling - aiming up-right - frame 2
; 6Fh: Facing right - falling - aiming down-right - frame 2
; 81h: Facing right - screw attack - frame 0
; 83h: Facing right - wall jump - frame 1
; A6h: Facing right - landing from spin jump - frame 0
; ACh: Unused. Facing right - grappling - in air - frame 1
; B0h: Unused. Facing right - grappling - in air - aiming down-right - frame 1
; F0h: Facing right - grabbed by Draygon - moving - frame 2
incbin "data/SamusTiles_Bottom_Set1_Entry19.bin" ; $160 bytes


;;; $C360: Samus bottom tiles - set 1 - entry 1Ah ;;;
SamusTiles_Bottom_Set1_Entry1A:
; 14h: Facing left  - normal jump - not aiming - not moving - gun extended - frame 1
; 1Ah: Facing left  - spin jump - frame 0
; 1Ch: Facing left  - space jump - frame 0
; 2Ah: Facing left  - falling - frame 6
; 2Ch: Facing left  - falling - aiming up - frame 2
; 4Fh: Facing left  - damage boost - frame 9
; 52h: Facing left  - normal jump - not aiming - moving forward - frame 1
; 68h: Facing left  - falling - gun extended - frame 6
; 6Ch: Facing left  - normal jump - aiming down-left - frame 1
; 6Eh: Facing left  - falling - aiming up-left - frame 2
; 70h: Facing left  - falling - aiming down-left - frame 2
; 82h: Facing left  - screw attack - frame 0
; 84h: Facing left  - wall jump - frame 1
; A7h: Facing left  - landing from spin jump - frame 0
; ADh: Unused. Facing left  - grappling - in air - frame 1
; B1h: Unused. Facing left  - grappling - in air - aiming down-left - frame 1
; BEh: Facing left  - grabbed by Draygon - moving - frame 2
; E9h: Facing left  - Samus drained - crouching/falling - frame Eh
; E9h: Facing left  - Samus drained - crouching/falling - frame 13h
; E9h: Facing left  - Samus drained - crouching/falling - frame 17h
incbin "data/SamusTiles_Bottom_Set1_Entry1A.bin" ; $160 bytes


;;; $C4C0: Samus bottom tiles - set 1 - entry 1Bh ;;;
SamusTiles_Bottom_Set1_Entry1B:
; 53h: Facing right - knockback - frame 1
; D7h: Facing right - crystal flash ending - frame 5
; ECh: Facing right - grabbed by Draygon - not moving - not aiming - frame 0
; EDh: Facing right - grabbed by Draygon - not moving - aiming up-right - frame 0
; EEh: Facing right - grabbed by Draygon - firing - frame 0
; EFh: Facing right - grabbed by Draygon - not moving - aiming down-right - frame 0
; F0h: Facing right - grabbed by Draygon - moving - frame 1
incbin "data/SamusTiles_Bottom_Set1_Entry1B.bin" ; $140 bytes


;;; $C600: Samus bottom tiles - set 1 - entry 1Ch ;;;
SamusTiles_Bottom_Set1_Entry1C:
; 54h: Facing left  - knockback - frame 1
; BAh: Facing left  - grabbed by Draygon - not moving - not aiming - frame 0
; BBh: Facing left  - grabbed by Draygon - not moving - aiming up-left - frame 0
; BCh: Facing left  - grabbed by Draygon - firing - frame 0
; BDh: Facing left  - grabbed by Draygon - not moving - aiming down-left - frame 0
; BEh: Facing left  - grabbed by Draygon - moving - frame 1
; D8h: Facing left  - crystal flash ending - frame 5
incbin "data/SamusTiles_Bottom_Set1_Entry1C.bin" ; $140 bytes


;;; $C740: Samus bottom tiles - set 1 - entry 1Dh ;;;
SamusTiles_Bottom_Set1_Entry1D:
; Unused
incbin "data/SamusTiles_Bottom_Set1_Entry1D.bin" ; $100 bytes


;;; $C840: Samus bottom tiles - set 1 - entry 1Eh ;;;
SamusTiles_Bottom_Set1_Entry1E:
; E9h: Facing left  - Samus drained - crouching/falling - frames 8..Bh
; E9h: Facing left  - Samus drained - crouching/falling - frame 1Ah
; E9h: Facing left  - Samus drained - crouching/falling - frame 1Dh
; EBh: Facing left  - Samus drained - standing - frames 0..3
incbin "data/SamusTiles_Bottom_Set1_Entry1E.bin" ; $A0 bytes


;;; $C8E0: Samus bottom tiles - set 1 - entry 1Fh ;;;
SamusTiles_Bottom_Set1_Entry1F:
; E8h: Facing right - Samus drained - crouching/falling - frames 8..Bh
; EAh: Facing right - Samus drained - standing - frames 0..3
incbin "data/SamusTiles_Bottom_Set1_Entry1F.bin" ; $A0 bytes


;;; $C980: Samus top tiles - set 5 - entry 0 ;;;
SamusTiles_Top_Set5_Entry0:
; 5Dh: Unused - frame 8
; 5Dh: Unused - frame 28h
; 5Eh: Unused - frame 8
; 5Eh: Unused - frame 28h
; 5Fh: Unused - frame 8
; 5Fh: Unused - frame 28h
; 60h: Unused - frame 8
; 60h: Unused - frame 28h
; 61h: Unused - frame 8
; 61h: Unused - frame 28h
; B2h: Facing clockwise     - grapple - in air - frame 8
; B2h: Facing clockwise     - grapple - in air - frame 28h
incbin "data/SamusTiles_Top_Set5_Entry0.bin" ; $140 bytes


;;; $CAC0: Samus top tiles - set 5 - entry 1 ;;;
SamusTiles_Top_Set5_Entry1:
; 5Dh: Unused - frame 7
; 5Dh: Unused - frame 27h
; 5Eh: Unused - frame 7
; 5Eh: Unused - frame 27h
; 5Fh: Unused - frame 7
; 5Fh: Unused - frame 27h
; 60h: Unused - frame 7
; 60h: Unused - frame 27h
; 61h: Unused - frame 7
; 61h: Unused - frame 27h
; B2h: Facing clockwise     - grapple - in air - frame 7
; B2h: Facing clockwise     - grapple - in air - frame 27h
incbin "data/SamusTiles_Top_Set5_Entry1.bin" ; $140 bytes


;;; $CC00: Samus top tiles - set 5 - entry 2 ;;;
SamusTiles_Top_Set5_Entry2:
; 5Dh: Unused - frame 6
; 5Dh: Unused - frame 26h
; 5Eh: Unused - frame 6
; 5Eh: Unused - frame 26h
; 5Fh: Unused - frame 6
; 5Fh: Unused - frame 26h
; 60h: Unused - frame 6
; 60h: Unused - frame 26h
; 61h: Unused - frame 6
; 61h: Unused - frame 26h
; B2h: Facing clockwise     - grapple - in air - frame 6
; B2h: Facing clockwise     - grapple - in air - frame 26h
incbin "data/SamusTiles_Top_Set5_Entry2.bin" ; $180 bytes


;;; $CD80: Samus top tiles - set 5 - entry 3 ;;;
SamusTiles_Top_Set5_Entry3:
; 5Dh: Unused - frame 5
; 5Dh: Unused - frame 25h
; 5Eh: Unused - frame 5
; 5Eh: Unused - frame 25h
; 5Fh: Unused - frame 5
; 5Fh: Unused - frame 25h
; 60h: Unused - frame 5
; 60h: Unused - frame 25h
; 61h: Unused - frame 5
; 61h: Unused - frame 25h
; B2h: Facing clockwise     - grapple - in air - frame 5
; B2h: Facing clockwise     - grapple - in air - frame 25h
incbin "data/SamusTiles_Top_Set5_Entry3.bin" ; $180 bytes


;;; $CF00: Samus top tiles - set 5 - entry 4 ;;;
SamusTiles_Top_Set5_Entry4:
; 5Dh: Unused - frame 4
; 5Dh: Unused - frame 24h
; 5Eh: Unused - frame 4
; 5Eh: Unused - frame 24h
; 5Fh: Unused - frame 4
; 5Fh: Unused - frame 24h
; 60h: Unused - frame 4
; 60h: Unused - frame 24h
; 61h: Unused - frame 4
; 61h: Unused - frame 24h
; B2h: Facing clockwise     - grapple - in air - frame 4
; B2h: Facing clockwise     - grapple - in air - frame 24h
incbin "data/SamusTiles_Top_Set5_Entry4.bin" ; $180 bytes


;;; $D080: Samus top tiles - set 5 - entry 5 ;;;
SamusTiles_Top_Set5_Entry5:
; 5Dh: Unused - frame 3
; 5Dh: Unused - frame 23h
; 5Eh: Unused - frame 3
; 5Eh: Unused - frame 23h
; 5Fh: Unused - frame 3
; 5Fh: Unused - frame 23h
; 60h: Unused - frame 3
; 60h: Unused - frame 23h
; 61h: Unused - frame 3
; 61h: Unused - frame 23h
; B2h: Facing clockwise     - grapple - in air - frame 3
; B2h: Facing clockwise     - grapple - in air - frame 23h
incbin "data/SamusTiles_Top_Set5_Entry5.bin" ; $180 bytes


;;; $D200: Samus top tiles - set 5 - entry 6 ;;;
SamusTiles_Top_Set5_Entry6:
; 5Dh: Unused - frame 2
; 5Dh: Unused - frame 22h
; 5Eh: Unused - frame 2
; 5Eh: Unused - frame 22h
; 5Fh: Unused - frame 2
; 5Fh: Unused - frame 22h
; 60h: Unused - frame 2
; 60h: Unused - frame 22h
; 61h: Unused - frame 2
; 61h: Unused - frame 22h
; B2h: Facing clockwise     - grapple - in air - frame 2
; B2h: Facing clockwise     - grapple - in air - frame 22h
incbin "data/SamusTiles_Top_Set5_Entry6.bin" ; $180 bytes


;;; $D380: Samus top tiles - set 5 - entry 7 ;;;
SamusTiles_Top_Set5_Entry7:
; 5Dh: Unused - frame 1
; 5Dh: Unused - frame 21h
; 5Eh: Unused - frame 1
; 5Eh: Unused - frame 21h
; 5Fh: Unused - frame 1
; 5Fh: Unused - frame 21h
; 60h: Unused - frame 1
; 60h: Unused - frame 21h
; 61h: Unused - frame 1
; 61h: Unused - frame 21h
; B2h: Facing clockwise     - grapple - in air - frame 1
; B2h: Facing clockwise     - grapple - in air - frame 21h
incbin "data/SamusTiles_Top_Set5_Entry7.bin" ; $140 bytes


;;; $D4C0: Samus top tiles - set 5 - entry 8 ;;;
SamusTiles_Top_Set5_Entry8:
; 5Dh: Unused - frame 0
; 5Dh: Unused - frame 20h
; 5Eh: Unused - frame 0
; 5Eh: Unused - frame 20h
; 5Fh: Unused - frame 0
; 5Fh: Unused - frame 20h
; 60h: Unused - frame 0
; 60h: Unused - frame 20h
; 61h: Unused - frame 0
; 61h: Unused - frame 20h
; B2h: Facing clockwise     - grapple - in air - frame 0
; B2h: Facing clockwise     - grapple - in air - frame 20h
incbin "data/SamusTiles_Top_Set5_Entry8.bin" ; $140 bytes


;;; $D600: Samus top tiles - set 5 - entry 9 ;;;
SamusTiles_Top_Set5_Entry9:
; 5Dh: Unused - frame 1Fh
; 5Dh: Unused - frame 3Fh
; 5Eh: Unused - frame 1Fh
; 5Eh: Unused - frame 3Fh
; 5Fh: Unused - frame 1Fh
; 5Fh: Unused - frame 3Fh
; 60h: Unused - frame 1Fh
; 60h: Unused - frame 3Fh
; 61h: Unused - frame 1Fh
; 61h: Unused - frame 3Fh
; B2h: Facing clockwise     - grapple - in air - frame 1Fh
; B2h: Facing clockwise     - grapple - in air - frame 3Fh
incbin "data/SamusTiles_Top_Set5_Entry9.bin" ; $140 bytes


;;; $D740: Samus top tiles - set 5 - entry Ah ;;;
SamusTiles_Top_Set5_EntryA:
; 5Dh: Unused - frame 1Eh
; 5Dh: Unused - frame 3Eh
; 5Eh: Unused - frame 1Eh
; 5Eh: Unused - frame 3Eh
; 5Fh: Unused - frame 1Eh
; 5Fh: Unused - frame 3Eh
; 60h: Unused - frame 1Eh
; 60h: Unused - frame 3Eh
; 61h: Unused - frame 1Eh
; 61h: Unused - frame 3Eh
; B2h: Facing clockwise     - grapple - in air - frame 1Eh
; B2h: Facing clockwise     - grapple - in air - frame 3Eh
incbin "data/SamusTiles_Top_Set5_EntryA.bin" ; $180 bytes


;;; $D8C0: Samus top tiles - set 5 - entry Bh ;;;
SamusTiles_Top_Set5_EntryB:
; 5Dh: Unused - frame 1Dh
; 5Dh: Unused - frame 3Dh
; 5Eh: Unused - frame 1Dh
; 5Eh: Unused - frame 3Dh
; 5Fh: Unused - frame 1Dh
; 5Fh: Unused - frame 3Dh
; 60h: Unused - frame 1Dh
; 60h: Unused - frame 3Dh
; 61h: Unused - frame 1Dh
; 61h: Unused - frame 3Dh
; B2h: Facing clockwise     - grapple - in air - frame 1Dh
; B2h: Facing clockwise     - grapple - in air - frame 3Dh
incbin "data/SamusTiles_Top_Set5_EntryB.bin" ; $180 bytes


;;; $DA40: Samus top tiles - set 5 - entry Ch ;;;
SamusTiles_Top_Set5_EntryC:
; 5Dh: Unused - frame 1Ch
; 5Dh: Unused - frame 3Ch
; 5Eh: Unused - frame 1Ch
; 5Eh: Unused - frame 3Ch
; 5Fh: Unused - frame 1Ch
; 5Fh: Unused - frame 3Ch
; 60h: Unused - frame 1Ch
; 60h: Unused - frame 3Ch
; 61h: Unused - frame 1Ch
; 61h: Unused - frame 3Ch
; B2h: Facing clockwise     - grapple - in air - frame 1Ch
; B2h: Facing clockwise     - grapple - in air - frame 3Ch
incbin "data/SamusTiles_Top_Set5_EntryC.bin" ; $180 bytes


;;; $DBC0: Samus top tiles - set 5 - entry Dh ;;;
SamusTiles_Top_Set5_EntryD:
; 5Dh: Unused - frame 1Bh
; 5Dh: Unused - frame 3Bh
; 5Eh: Unused - frame 1Bh
; 5Eh: Unused - frame 3Bh
; 5Fh: Unused - frame 1Bh
; 5Fh: Unused - frame 3Bh
; 60h: Unused - frame 1Bh
; 60h: Unused - frame 3Bh
; 61h: Unused - frame 1Bh
; 61h: Unused - frame 3Bh
; B2h: Facing clockwise     - grapple - in air - frame 1Bh
; B2h: Facing clockwise     - grapple - in air - frame 3Bh
incbin "data/SamusTiles_Top_Set5_EntryD.bin" ; $180 bytes


;;; $DD40: Samus top tiles - set 5 - entry Eh ;;;
SamusTiles_Top_Set5_EntryE:
; 5Dh: Unused - frame 1Ah
; 5Dh: Unused - frame 3Ah
; 5Eh: Unused - frame 1Ah
; 5Eh: Unused - frame 3Ah
; 5Fh: Unused - frame 1Ah
; 5Fh: Unused - frame 3Ah
; 60h: Unused - frame 1Ah
; 60h: Unused - frame 3Ah
; 61h: Unused - frame 1Ah
; 61h: Unused - frame 3Ah
; B2h: Facing clockwise     - grapple - in air - frame 1Ah
; B2h: Facing clockwise     - grapple - in air - frame 3Ah
incbin "data/SamusTiles_Top_Set5_EntryE.bin" ; $180 bytes


;;; $DEC0: Samus top tiles - set 5 - entry Fh ;;;
SamusTiles_Top_Set5_EntryF:
; 5Dh: Unused - frame 19h
; 5Dh: Unused - frame 39h
; 5Eh: Unused - frame 19h
; 5Eh: Unused - frame 39h
; 5Fh: Unused - frame 19h
; 5Fh: Unused - frame 39h
; 60h: Unused - frame 19h
; 60h: Unused - frame 39h
; 61h: Unused - frame 19h
; 61h: Unused - frame 39h
; B2h: Facing clockwise     - grapple - in air - frame 19h
; B2h: Facing clockwise     - grapple - in air - frame 39h
incbin "data/SamusTiles_Top_Set5_EntryF.bin" ; $140 bytes


;;; $E000: Samus top tiles - set 5 - entry 10h ;;;
SamusTiles_Top_Set5_Entry10:
; Unused
incbin "data/SamusTiles_Top_Set5_Entry10.bin" ; $140 bytes


;;; $E140: Samus top tiles - set 6 - entry 0 ;;;
SamusTiles_Top_Set6_Entry0:
; 62h: Unused - frame 18h
; 62h: Unused - frame 38h
; B3h: Facing anticlockwise - grapple - in air - frame 18h
; B3h: Facing anticlockwise - grapple - in air - frame 38h
incbin "data/SamusTiles_Top_Set6_Entry0.bin" ; $1C0 bytes


;;; $E300: Samus top tiles - set 6 - entry 1 ;;;
SamusTiles_Top_Set6_Entry1:
; 62h: Unused - frame 19h
; 62h: Unused - frame 39h
; B3h: Facing anticlockwise - grapple - in air - frame 19h
; B3h: Facing anticlockwise - grapple - in air - frame 39h
incbin "data/SamusTiles_Top_Set6_Entry1.bin" ; $1C0 bytes


;;; $E4C0: Samus top tiles - set 6 - entry 2 ;;;
SamusTiles_Top_Set6_Entry2:
; 62h: Unused - frame 1Ah
; 62h: Unused - frame 3Ah
; B3h: Facing anticlockwise - grapple - in air - frame 1Ah
; B3h: Facing anticlockwise - grapple - in air - frame 3Ah
incbin "data/SamusTiles_Top_Set6_Entry2.bin" ; $200 bytes


;;; $E6C0: Samus top tiles - set 6 - entry 3 ;;;
SamusTiles_Top_Set6_Entry3:
; 62h: Unused - frame 1Bh
; 62h: Unused - frame 3Bh
; B3h: Facing anticlockwise - grapple - in air - frame 1Bh
; B3h: Facing anticlockwise - grapple - in air - frame 3Bh
incbin "data/SamusTiles_Top_Set6_Entry3.bin" ; $200 bytes


;;; $E8C0: Samus top tiles - set 6 - entry 4 ;;;
SamusTiles_Top_Set6_Entry4:
; 62h: Unused - frame 1Ch
; 62h: Unused - frame 3Ch
; B3h: Facing anticlockwise - grapple - in air - frame 1Ch
; B3h: Facing anticlockwise - grapple - in air - frame 3Ch
incbin "data/SamusTiles_Top_Set6_Entry4.bin" ; $1E0 bytes


;;; $EAA0: Samus top tiles - set 6 - entry 5 ;;;
SamusTiles_Top_Set6_Entry5:
; 62h: Unused - frame 1Dh
; 62h: Unused - frame 3Dh
; B3h: Facing anticlockwise - grapple - in air - frame 1Dh
; B3h: Facing anticlockwise - grapple - in air - frame 3Dh
incbin "data/SamusTiles_Top_Set6_Entry5.bin" ; $1E0 bytes


;;; $EC80: Samus top tiles - set 6 - entry 6 ;;;
SamusTiles_Top_Set6_Entry6:
; 62h: Unused - frame 1Eh
; 62h: Unused - frame 3Eh
; B3h: Facing anticlockwise - grapple - in air - frame 1Eh
; B3h: Facing anticlockwise - grapple - in air - frame 3Eh
incbin "data/SamusTiles_Top_Set6_Entry6.bin" ; $1E0 bytes


;;; $EE60: Samus top tiles - set 6 - entry 7 ;;;
SamusTiles_Top_Set6_Entry7:
; 62h: Unused - frame 1Fh
; 62h: Unused - frame 3Fh
; B3h: Facing anticlockwise - grapple - in air - frame 1Fh
; B3h: Facing anticlockwise - grapple - in air - frame 3Fh
incbin "data/SamusTiles_Top_Set6_Entry7.bin" ; $1C0 bytes


;;; $F020: Samus top tiles - set 6 - entry 8 ;;;
SamusTiles_Top_Set6_Entry8:
; 62h: Unused - frame 0
; 62h: Unused - frame 20h
; B3h: Facing anticlockwise - grapple - in air - frame 0
; B3h: Facing anticlockwise - grapple - in air - frame 20h
incbin "data/SamusTiles_Top_Set6_Entry8.bin" ; $1C0 bytes


;;; $F1E0: Samus top tiles - set 6 - entry 9 ;;;
SamusTiles_Top_Set6_Entry9:
; 62h: Unused - frame 1
; 62h: Unused - frame 21h
; B3h: Facing anticlockwise - grapple - in air - frame 1
; B3h: Facing anticlockwise - grapple - in air - frame 21h
incbin "data/SamusTiles_Top_Set6_Entry9.bin" ; $1C0 bytes


;;; $F3A0: Samus top tiles - set 6 - entry Ah ;;;
SamusTiles_Top_Set6_EntryA:
; 62h: Unused - frame 2
; 62h: Unused - frame 22h
; B3h: Facing anticlockwise - grapple - in air - frame 2
; B3h: Facing anticlockwise - grapple - in air - frame 22h
incbin "data/SamusTiles_Top_Set6_EntryA.bin" ; $1E0 bytes


;;; $F580: Samus top tiles - set 6 - entry Bh ;;;
SamusTiles_Top_Set6_EntryB:
; 62h: Unused - frame 3
; 62h: Unused - frame 23h
; B3h: Facing anticlockwise - grapple - in air - frame 3
; B3h: Facing anticlockwise - grapple - in air - frame 23h
incbin "data/SamusTiles_Top_Set6_EntryB.bin" ; $200 bytes


;;; $F080: Samus top tiles - set 9 - entry 3 ;;;
SamusTiles_Top_Set9_Entry3:
; Bh: Moving right - gun extended - frame 3
incbin "data/SamusTiles_Top_Set9_Entry3.bin" ; $100 bytes


;;; $F180: Samus top tiles - set 9 - entry 4 ;;;
SamusTiles_Top_Set9_Entry4:
; Bh: Moving right - gun extended - frame 6
; Bh: Moving right - gun extended - frame 9
incbin "data/SamusTiles_Top_Set9_Entry4.bin" ; $C0 bytes


;;; $F240: Samus top tiles - set 9 - entry 5 ;;;
SamusTiles_Top_Set9_Entry5:
; Bh: Moving right - gun extended - frame 7
incbin "data/SamusTiles_Top_Set9_Entry5.bin" ; $E0 bytes


;;; $F320: Samus top tiles - set 9 - entry 6 ;;;
SamusTiles_Top_Set9_Entry6:
; Ch: Moving left  - gun extended - frame 0
; Ch: Moving left  - gun extended - frame 5
incbin "data/SamusTiles_Top_Set9_Entry6.bin" ; $100 bytes


;;; $F420: Samus top tiles - set 9 - entry 7 ;;;
SamusTiles_Top_Set9_Entry7:
; Ch: Moving left  - gun extended - frame 4
incbin "data/SamusTiles_Top_Set9_Entry7.bin" ; $100 bytes


;;; $F520: Samus top tiles - set 9 - entry 8 ;;;
SamusTiles_Top_Set9_Entry8:
; Ch: Moving left  - gun extended - frame 3
incbin "data/SamusTiles_Top_Set9_Entry8.bin" ; $120 bytes


;;; $F640: Samus top tiles - set 9 - entry 9 ;;;
SamusTiles_Top_Set9_Entry9:
; Ch: Moving left  - gun extended - frame 2
incbin "data/SamusTiles_Top_Set9_Entry9.bin" ; $120 bytes


;;; $F760: Samus top tiles - set 9 - entry Ah ;;;
SamusTiles_Top_Set9_EntryA:
; Ch: Moving left  - gun extended - frame 6
; Ch: Moving left  - gun extended - frame 9
incbin "data/SamusTiles_Top_Set9_EntryA.bin" ; $100 bytes



org !SamusTilesBank2


;;; $8000: Samus top tiles - set 0 - entry 0 ;;;
SamusTiles_Top_Set0_Entry0:
; 9: Moving right - not aiming - frame 0
; 9: Moving right - not aiming - frame 5
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 3
; C7h: Facing right - vertical shinespark windup - frame 3
; F0h: Facing right - grabbed by Draygon - moving - frame 2
; F0h: Facing right - grabbed by Draygon - moving - frame 5
incbin "data/SamusTiles_Top_Set0_Entry0.bin" ; $100 bytes


;;; $8100: Samus top tiles - set 0 - entry 1 ;;;
SamusTiles_Top_Set0_Entry1:
; 9: Moving right - not aiming - frame 4
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 4
; C7h: Facing right - vertical shinespark windup - frame 4
; F0h: Facing right - grabbed by Draygon - moving - frame 0
incbin "data/SamusTiles_Top_Set0_Entry1.bin" ; $100 bytes


;;; $8200: Samus top tiles - set 0 - entry 2 ;;;
SamusTiles_Top_Set0_Entry2:
; 9: Moving right - not aiming - frame 2
; F0h: Facing right - grabbed by Draygon - moving - frame 1
incbin "data/SamusTiles_Top_Set0_Entry2.bin" ; $120 bytes


;;; $8320: Samus top tiles - set 0 - entry 3 ;;;
SamusTiles_Top_Set0_Entry3:
; 9: Moving right - not aiming - frame 3
incbin "data/SamusTiles_Top_Set0_Entry3.bin" ; $120 bytes


;;; $8440: Samus top tiles - set 0 - entry 4 ;;;
SamusTiles_Top_Set0_Entry4:
; 9: Moving right - not aiming - frame 9
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 0
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 2
; C7h: Facing right - vertical shinespark windup - frame 0
; C7h: Facing right - vertical shinespark windup - frame 2
; F0h: Facing right - grabbed by Draygon - moving - frame 3
incbin "data/SamusTiles_Top_Set0_Entry4.bin" ; $100 bytes


;;; $8540: Samus top tiles - set 0 - entry 5 ;;;
SamusTiles_Top_Set0_Entry5:
; 9: Moving right - not aiming - frame 7
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 1
; C7h: Facing right - vertical shinespark windup - frame 1
; F0h: Facing right - grabbed by Draygon - moving - frame 4
incbin "data/SamusTiles_Top_Set0_Entry5.bin" ; $120 bytes


;;; $86C0: Samus top tiles - set 0 - entry 6 ;;;
SamusTiles_Top_Set0_Entry6:
; Ah: Moving left  - not aiming - frame 0
; Ah: Moving left  - not aiming - frame 5
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 3
; BEh: Facing left  - grabbed by Draygon - moving - frame 2
; BEh: Facing left  - grabbed by Draygon - moving - frame 5
; C8h: Facing left  - vertical shinespark windup - frame 3
incbin "data/SamusTiles_Top_Set0_Entry6.bin" ; $100 bytes


;;; $87C0: Samus top tiles - set 0 - entry 7 ;;;
SamusTiles_Top_Set0_Entry7:
; Ah: Moving left  - not aiming - frame 4
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 4
; BEh: Facing left  - grabbed by Draygon - moving - frame 0
; C8h: Facing left  - vertical shinespark windup - frame 4
incbin "data/SamusTiles_Top_Set0_Entry7.bin" ; $100 bytes


;;; $88C0: Samus top tiles - set 0 - entry 8 ;;;
SamusTiles_Top_Set0_Entry8:
; Ah: Moving left  - not aiming - frame 2
; BEh: Facing left  - grabbed by Draygon - moving - frame 1
incbin "data/SamusTiles_Top_Set0_Entry8.bin" ; $180 bytes


;;; $8A40: Samus top tiles - set 0 - entry 9 ;;;
SamusTiles_Top_Set0_Entry9:
; Ah: Moving left  - not aiming - frame 3
incbin "data/SamusTiles_Top_Set0_Entry9.bin" ; $180 bytes


;;; $8BC0: Samus top tiles - set 0 - entry Ah ;;;
SamusTiles_Top_Set0_EntryA:
; Ah: Moving left  - not aiming - frame 9
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 0
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 2
; BEh: Facing left  - grabbed by Draygon - moving - frame 3
; C8h: Facing left  - vertical shinespark windup - frame 0
; C8h: Facing left  - vertical shinespark windup - frame 2
incbin "data/SamusTiles_Top_Set0_EntryA.bin" ; $100 bytes


;;; $8CC0: Samus top tiles - set 0 - entry Bh ;;;
SamusTiles_Top_Set0_EntryB:
; Ah: Moving left  - not aiming - frame 7
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 1
; BEh: Facing left  - grabbed by Draygon - moving - frame 4
; C8h: Facing left  - vertical shinespark windup - frame 1
incbin "data/SamusTiles_Top_Set0_EntryB.bin" ; $120 bytes


;;; $8DE0: Samus top tiles - set 0 - entry Ch ;;;
SamusTiles_Top_Set0_EntryC:
; 11h: Moving right - aiming down-right - frames 0..1
; 11h: Moving right - aiming down-right - frames 5..6
; 17h: Facing right - normal jump - aiming down - frame 0
; 2Dh: Facing right - falling - aiming down - frame 0
; 6Bh: Facing right - normal jump - aiming down-right - frames 0..1
; 6Fh: Facing right - falling - aiming down-right - frames 0..2
; 78h: Facing right - moonwalk - aiming down-right - frame 0
; 78h: Facing right - moonwalk - aiming down-right - frame 3
; AEh: Unused. Facing right - grappling - in air - aiming down - frame 0
; B0h: Unused. Facing right - grappling - in air - aiming down-right - frames 0..1
; EFh: Facing right - grabbed by Draygon - not moving - aiming down-right - frame 0
incbin "data/SamusTiles_Top_Set0_EntryC.bin" ; $120 bytes


;;; $8F00: Samus top tiles - set 0 - entry Dh ;;;
SamusTiles_Top_Set0_EntryD:
; 12h: Moving left  - aiming down-left - frames 0..1
; 12h: Moving left  - aiming down-left - frames 5..6
; 18h: Facing left  - normal jump - aiming down - frame 0
; 2Eh: Facing left  - falling - aiming down - frame 0
; 6Ch: Facing left  - normal jump - aiming down-left - frames 0..1
; 70h: Facing left  - falling - aiming down-left - frames 0..2
; 77h: Facing left  - moonwalk - aiming down-left - frame 0
; 77h: Facing left  - moonwalk - aiming down-left - frame 3
; AFh: Unused. Facing left  - grappling - in air - aiming down - frame 0
; B1h: Unused. Facing left  - grappling - in air - aiming down-left - frames 0..1
; BDh: Facing left  - grabbed by Draygon - not moving - aiming down-left - frame 0
incbin "data/SamusTiles_Top_Set0_EntryD.bin" ; $120 bytes


;;; $9020: Samus top tiles - set 0 - entry Eh ;;;
SamusTiles_Top_Set0_EntryE:
; 7: Facing right - aiming down-right - frame 0
; 59h: Facing right - normal jump transition - aiming down-right - frame 0
; 73h: Facing right - crouching - aiming down-right - frame 0
; AAh: Facing right - grappling - aiming down-right - frame 0
; B6h: Facing right - grappling - crouching - aiming down-right - frame 0
; D1h: Facing right - ran into a wall - aiming down-right - frame 0
; E4h: Facing right - landing from normal jump - aiming down-right - frames 0..1
; F5h: Facing right - crouching transition - aiming down-right - frame 0
; FBh: Facing right - standing transition - aiming down-right - frame 0
incbin "data/SamusTiles_Top_Set0_EntryE.bin" ; $160 bytes


;;; $9180: Samus top tiles - set 0 - entry Fh ;;;
SamusTiles_Top_Set0_EntryF:
; 8: Facing left  - aiming down-left - frame 0
; 5Ah: Facing left  - normal jump transition - aiming down-left - frame 0
; 74h: Facing left  - crouching - aiming down-left - frame 0
; ABh: Facing left  - grappling - aiming down-left - frame 0
; B7h: Facing left  - grappling - crouching - aiming down-left - frame 0
; D2h: Facing left  - ran into a wall - aiming down-left - frame 0
; E5h: Facing left  - landing from normal jump - aiming down-left - frames 0..1
; F6h: Facing left  - crouching transition - aiming down-left - frame 0
; FCh: Facing left  - standing transition - aiming down-left - frame 0
incbin "data/SamusTiles_Top_Set0_EntryF.bin" ; $160 bytes


;;; $92E0: Samus top tiles - set 0 - entry 10h ;;;
SamusTiles_Top_Set0_Entry10:
; 13h: Facing right - normal jump - not aiming - not moving - gun extended - frames 0..1
; 35h: Facing right - crouching transition - frame 0
; 3Bh: Facing right - standing transition - frame 0
; 4Ah: Facing right - moonwalk - frame 0
; 4Ah: Facing right - moonwalk - frame 3
; 51h: Facing right - normal jump - not aiming - moving forward - frames 0..1
; 67h: Facing right - falling - gun extended - frames 0..2
; 67h: Facing right - falling - gun extended - frames 5..6
; ACh: Unused. Facing right - grappling - in air - frames 0..1
; D3h: Facing right - crystal flash - frame Eh
; D5h: Facing right - x-ray - standing - frame 2
; D7h: Facing right - crystal flash ending - frame 3
; D9h: Facing right - x-ray - crouching - frame 2
; DBh: Unused - frame 0
; DDh: Unused - frame 2
; E6h: Facing right - landing from normal jump - firing - frames 0..1
; E8h: Facing right - Samus drained - crouching/falling - frame Eh
; EAh: Facing right - Samus drained - standing - frame 5
; EEh: Facing right - grabbed by Draygon - firing - frame 0
incbin "data/SamusTiles_Top_Set0_Entry10.bin" ; $100 bytes


;;; $93E0: Samus top tiles - set 0 - entry 11h ;;;
SamusTiles_Top_Set0_Entry11:
; 14h: Facing left  - normal jump - not aiming - not moving - gun extended - frames 0..1
; 36h: Facing left  - crouching transition - frame 0
; 3Ch: Facing left  - standing transition - frame 0
; 49h: Facing left  - moonwalk - frame 0
; 49h: Facing left  - moonwalk - frame 3
; 52h: Facing left  - normal jump - not aiming - moving forward - frames 0..1
; 68h: Facing left  - falling - gun extended - frames 0..2
; 68h: Facing left  - falling - gun extended - frames 5..6
; ADh: Unused. Facing left  - grappling - in air - frames 0..1
; BCh: Facing left  - grabbed by Draygon - firing - frame 0
; D4h: Facing left  - crystal flash - frame Eh
; D6h: Facing left  - x-ray - standing - frame 2
; D8h: Facing left  - crystal flash ending - frame 3
; DAh: Facing left  - x-ray - crouching - frame 2
; DCh: Unused - frame 0
; DEh: Unused - frame 2
; E7h: Facing left  - landing from normal jump - firing - frames 0..1
; EBh: Facing left  - Samus drained - standing - frame 5
incbin "data/SamusTiles_Top_Set0_Entry11.bin" ; $100 bytes


;;; $94E0: Samus top tiles - set 0 - entry 12h ;;;
SamusTiles_Top_Set0_Entry12:
; 3: Facing right - aiming up - frame 0
; 5: Facing right - aiming up-right - frame 0
; 15h: Facing right - normal jump - aiming up - frame 0
; 2Bh: Facing right - falling - aiming up - frame 0
; 57h: Facing right - normal jump transition - aiming up-right - frame 0
; 71h: Facing right - crouching - aiming up-right - frame 0
; 85h: Facing right - crouching - aiming up - frame 0
; CFh: Facing right - ran into a wall - aiming up-right - frame 0
; E2h: Facing right - landing from normal jump - aiming up-right - frames 0..1
; F3h: Facing right - crouching transition - aiming up-right - frame 0
; F9h: Facing right - standing transition - aiming up-right - frame 0
incbin "data/SamusTiles_Top_Set0_Entry12.bin" ; $140 bytes


;;; $9620: Samus top tiles - set 0 - entry 13h ;;;
SamusTiles_Top_Set0_Entry13:
; 4: Facing left  - aiming up - frame 0
; 6: Facing left  - aiming up-left - frame 0
; 16h: Facing left  - normal jump - aiming up - frame 0
; 2Ch: Facing left  - falling - aiming up - frame 0
; 58h: Facing left  - normal jump transition - aiming up-left - frame 0
; 72h: Facing left  - crouching - aiming up-left - frame 0
; 86h: Facing left  - crouching - aiming up - frame 0
; D0h: Facing left  - ran into a wall - aiming up-left - frame 0
; E3h: Facing left  - landing from normal jump - aiming up-left - frames 0..1
; F4h: Facing left  - crouching transition - aiming up-left - frame 0
; FAh: Facing left  - standing transition - aiming up-left - frame 0
incbin "data/SamusTiles_Top_Set0_Entry13.bin" ; $140 bytes


;;; $9760: Samus top tiles - set 0 - entry 14h ;;;
SamusTiles_Top_Set0_Entry14:
; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended - frame 5
; C7h: Facing right - vertical shinespark windup - frame 5
incbin "data/SamusTiles_Top_Set0_Entry14.bin" ; $120 bytes


;;; $9880: Samus top tiles - set 0 - entry 15h ;;;
SamusTiles_Top_Set0_Entry15:
; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended - frame 5
; C8h: Facing left  - vertical shinespark windup - frame 5
incbin "data/SamusTiles_Top_Set0_Entry15.bin" ; $120 bytes


;;; $9A00: Samus top tiles - set 0 - entry 16h ;;;
SamusTiles_Top_Set0_Entry16:
; 3: Facing right - aiming up - frame 1
; Dh: Moving right - aiming up (unused) - frames 0..1
; Dh: Moving right - aiming up (unused) - frames 5..6
; 15h: Facing right - normal jump - aiming up - frame 1
; 2Bh: Facing right - falling - aiming up - frames 1..2
; 55h: Facing right - normal jump transition - aiming up - frame 0
; 85h: Facing right - crouching - aiming up - frame 1
; E0h: Facing right - landing from normal jump - aiming up - frames 0..1
; F1h: Facing right - crouching transition - aiming up - frame 0
; F7h: Facing right - standing transition - aiming up - frame 0
incbin "data/SamusTiles_Top_Set0_Entry16.bin" ; $100 bytes


;;; $9B00: Samus top tiles - set 0 - entry 17h ;;;
SamusTiles_Top_Set0_Entry17:
; 4: Facing left  - aiming up - frame 1
; Eh: Moving left  - aiming up (unused) - frames 0..1
; Eh: Moving left  - aiming up (unused) - frames 5..6
; 16h: Facing left  - normal jump - aiming up - frame 1
; 2Ch: Facing left  - falling - aiming up - frames 1..2
; 56h: Facing left  - normal jump transition - aiming up - frame 0
; 86h: Facing left  - crouching - aiming up - frame 1
; E1h: Facing left  - landing from normal jump - aiming up - frames 0..1
; F2h: Facing left  - crouching transition - aiming up - frame 0
; F8h: Facing left  - standing transition - aiming up - frame 0
incbin "data/SamusTiles_Top_Set0_Entry17.bin" ; $100 bytes


;;; $9C00: Samus top tiles - set 0 - entry 18h ;;;
SamusTiles_Top_Set0_Entry18:
; 9: Moving right - not aiming - frame 8
incbin "data/SamusTiles_Top_Set0_Entry18.bin" ; $120 bytes


;;; $9D20: Samus top tiles - set 0 - entry 19h ;;;
SamusTiles_Top_Set0_Entry19:
; Ah: Moving left  - not aiming - frame 8
incbin "data/SamusTiles_Top_Set0_Entry19.bin" ; $120 bytes


;;; $9E40: Samus top tiles - set 0 - entry 1Ah ;;;
SamusTiles_Top_Set0_Entry1A:
; Fh: Moving right - aiming up-right - frames 0..1
; Fh: Moving right - aiming up-right - frames 5..6
; 69h: Facing right - normal jump - aiming up-right - frames 0..1
; 6Dh: Facing right - falling - aiming up-right - frames 0..2
; 76h: Facing right - moonwalk - aiming up-right - frame 0
; 76h: Facing right - moonwalk - aiming up-right - frame 3
; EDh: Facing right - grabbed by Draygon - not moving - aiming up-right - frame 0
incbin "data/SamusTiles_Top_Set0_Entry1A.bin" ; $100 bytes


;;; $9F40: Samus top tiles - set 0 - entry 1Bh ;;;
SamusTiles_Top_Set0_Entry1B:
; 10h: Moving left  - aiming up-left - frames 0..1
; 10h: Moving left  - aiming up-left - frames 5..6
; 6Ah: Facing left  - normal jump - aiming up-left - frames 0..1
; 6Eh: Facing left  - falling - aiming up-left - frames 0..2
; 75h: Facing left  - moonwalk - aiming up-left - frame 0
; 75h: Facing left  - moonwalk - aiming up-left - frame 3
; BBh: Facing left  - grabbed by Draygon - not moving - aiming up-left - frame 0
incbin "data/SamusTiles_Top_Set0_Entry1B.bin" ; $120 bytes


;;; $A060: Samus top tiles - set 0 - entry 1Ch ;;;
SamusTiles_Top_Set0_Entry1C:
; 54h: Facing left  - knockback - frames 0..1
; D8h: Facing left  - crystal flash ending - frames 4..5
; E9h: Facing left  - Samus drained - crouching/falling - frames 2..6
incbin "data/SamusTiles_Top_Set0_Entry1C.bin" ; $1C0 bytes


;;; $A220: Samus top tiles - set 0 - entry 1Dh ;;;
SamusTiles_Top_Set0_Entry1D:
; 53h: Facing right - knockback - frames 0..1
; D7h: Facing right - crystal flash ending - frames 4..5
; E8h: Facing right - Samus drained - crouching/falling - frames 3..7
incbin "data/SamusTiles_Top_Set0_Entry1D.bin" ; $1C0 bytes


;;; $A3E0: Samus top tiles - set 0 - entry 1Eh ;;;
SamusTiles_Top_Set0_Entry1E:
; Unused
incbin "data/SamusTiles_Top_Set0_Entry1E.bin" ; $140 bytes


;;; $A520: Samus top tiles - set 0 - entry 1Fh ;;;
SamusTiles_Top_Set0_Entry1F:
; Unused
incbin "data/SamusTiles_Top_Set0_Entry1F.bin" ; $140 bytes


;;; $A660..C81F: Samus top tiles - set 1 (general) ;;;
SamusTiles_Top_Set1_Entry0:
;;; $A660: Samus top tiles - set 1 - entry 0 ;;;
incbin "data/SamusTiles_Top_Set1_Entry0.bin" ; $140 bytes


;;; $A7A0: Samus top tiles - set 1 - entry 1 ;;;
SamusTiles_Top_Set1_Entry1:
; Unused
incbin "data/SamusTiles_Top_Set1_Entry1.bin" ; $140 bytes


;;; $A8E0: Samus top tiles - set 1 - entry 2 ;;;
SamusTiles_Top_Set1_Entry2:
; 8Bh: Facing right - turning - standing - aiming up - frame 1
; 8Ch: Facing left  - turning - standing - aiming up - frame 1
; 8Fh: Facing right - turning - in air - aiming up - frame 1
; 90h: Facing left  - turning - in air - aiming up - frame 1
; 93h: Facing right - turning - falling - aiming up - frame 1
; 94h: Facing left  - turning - falling - aiming up - frame 1
; 97h: Facing right - turning - crouching - aiming up - frame 1
; 98h: Facing left  - turning - crouching - aiming up - frame 1
; 9Ch: Facing right - turning - standing - aiming up-right - frame 1
; 9Dh: Facing left  - turning - standing - aiming up-left - frame 1
; 9Eh: Facing right - turning - in air - aiming up-right - frame 1
; 9Fh: Facing left  - turning - in air - aiming up-left - frame 1
; A0h: Facing right - turning - falling - aiming up-right - frame 1
; A1h: Facing left  - turning - falling - aiming up-left - frame 1
; A2h: Facing right - turning - crouching - aiming up-right - frame 1
; A3h: Facing left  - turning - crouching - aiming up-left - frame 1
; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right - frame 1
; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left - frame 1
incbin "data/SamusTiles_Top_Set1_Entry2.bin" ; $1A0 bytes


;;; $AA80: Samus top tiles - set 1 - entry 3 ;;;
SamusTiles_Top_Set1_Entry3:
; 8Dh: Facing right - turning - standing - aiming down-right - frame 1
; 8Eh: Facing left  - turning - standing - aiming down-left - frame 1
; 91h: Facing right - turning - in air - aiming down/down-right - frame 1
; 92h: Facing left  - turning - in air - aiming down/down-left - frame 1
; 95h: Facing right - turning - falling - aiming down/down-right - frame 1
; 96h: Facing left  - turning - falling - aiming down/down-left - frame 1
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 1
; 9Ah: Facing left  - turning - crouching - aiming down/down-left - frame 1
; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right - frame 1
; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left - frame 1
incbin "data/SamusTiles_Top_Set1_Entry3.bin" ; $1C0 bytes


;;; $AC40: Samus top tiles - set 1 - entry 4 ;;;
SamusTiles_Top_Set1_Entry4:
; Unused
incbin "data/SamusTiles_Top_Set1_Entry4.bin" ; $20 bytes


;;; $AC60: Samus top tiles - set 1 - entry 5 ;;;
SamusTiles_Top_Set1_Entry5:
; 9Bh: Facing forward - varia/gravity suit - frame 0
incbin "data/SamusTiles_Top_Set1_Entry5.bin" ; $80 bytes


;;; $ACE0: Samus top tiles - set 1 - entry 6 ;;;
SamusTiles_Top_Set1_Entry6:
; 25h: Facing right - turning - standing - frame 2
; 26h: Facing left  - turning - standing - frame 0
; 2Fh: Facing right - turning - jumping - frame 2
; 30h: Facing left  - turning - jumping - frame 0
; 43h: Facing right - turning - crouching - frame 2
; 44h: Facing left  - turning - crouching - frame 0
; 87h: Facing right - turning - falling - frame 2
; 88h: Facing left  - turning - falling - frame 0
; BFh: Facing right - moonwalking - turn/jump left - frame 2
; C0h: Facing left  - moonwalking - turn/jump right - frame 0
; C6h: Unused - frame 2
incbin "data/SamusTiles_Top_Set1_Entry6.bin" ; $140 bytes


;;; $AE20: Samus top tiles - set 1 - entry 7 ;;;
SamusTiles_Top_Set1_Entry7:
; 25h: Facing right - turning - standing - frame 0
; 26h: Facing left  - turning - standing - frame 2
; 2Fh: Facing right - turning - jumping - frame 0
; 30h: Facing left  - turning - jumping - frame 2
; 43h: Facing right - turning - crouching - frame 0
; 44h: Facing left  - turning - crouching - frame 2
; 87h: Facing right - turning - falling - frame 0
; 88h: Facing left  - turning - falling - frame 2
; BFh: Facing right - moonwalking - turn/jump left - frame 0
; C0h: Facing left  - moonwalking - turn/jump right - frame 2
; C6h: Unused - frame 0
incbin "data/SamusTiles_Top_Set1_Entry7.bin" ; $140 bytes


;;; $AF60: Samus top tiles - set 1 - entry 8 ;;;
SamusTiles_Top_Set1_Entry8:
; 8Bh: Facing right - turning - standing - aiming up - frame 2
; 8Ch: Facing left  - turning - standing - aiming up - frame 0
; 8Fh: Facing right - turning - in air - aiming up - frame 2
; 90h: Facing left  - turning - in air - aiming up - frame 0
; 93h: Facing right - turning - falling - aiming up - frame 2
; 94h: Facing left  - turning - falling - aiming up - frame 0
; 97h: Facing right - turning - crouching - aiming up - frame 2
; 98h: Facing left  - turning - crouching - aiming up - frame 0
; 9Ch: Facing right - turning - standing - aiming up-right - frame 2
; 9Dh: Facing left  - turning - standing - aiming up-left - frame 0
; 9Eh: Facing right - turning - in air - aiming up-right - frame 2
; 9Fh: Facing left  - turning - in air - aiming up-left - frame 0
; A0h: Facing right - turning - falling - aiming up-right - frame 2
; A1h: Facing left  - turning - falling - aiming up-left - frame 0
; A2h: Facing right - turning - crouching - aiming up-right - frame 2
; A3h: Facing left  - turning - crouching - aiming up-left - frame 0
; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right - frame 2
; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left - frame 0
incbin "data/SamusTiles_Top_Set1_Entry8.bin" ; $120 bytes


;;; $B080: Samus top tiles - set 1 - entry 9 ;;;
SamusTiles_Top_Set1_Entry9:
; 8Bh: Facing right - turning - standing - aiming up - frame 0
; 8Ch: Facing left  - turning - standing - aiming up - frame 2
; 8Fh: Facing right - turning - in air - aiming up - frame 0
; 90h: Facing left  - turning - in air - aiming up - frame 2
; 93h: Facing right - turning - falling - aiming up - frame 0
; 94h: Facing left  - turning - falling - aiming up - frame 2
; 97h: Facing right - turning - crouching - aiming up - frame 0
; 98h: Facing left  - turning - crouching - aiming up - frame 2
; 9Ch: Facing right - turning - standing - aiming up-right - frame 0
; 9Dh: Facing left  - turning - standing - aiming up-left - frame 2
; 9Eh: Facing right - turning - in air - aiming up-right - frame 0
; 9Fh: Facing left  - turning - in air - aiming up-left - frame 2
; A0h: Facing right - turning - falling - aiming up-right - frame 0
; A1h: Facing left  - turning - falling - aiming up-left - frame 2
; A2h: Facing right - turning - crouching - aiming up-right - frame 0
; A3h: Facing left  - turning - crouching - aiming up-left - frame 2
; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right - frame 0
; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left - frame 2
incbin "data/SamusTiles_Top_Set1_Entry9.bin" ; $140 bytes


;;; $B180: Samus top tiles - set 1 - entry Ah ;;;
SamusTiles_Top_Set1_EntryA:
; 25h: Facing right - turning - standing - frame 1
; 26h: Facing left  - turning - standing - frame 1
; 2Fh: Facing right - turning - jumping - frame 1
; 30h: Facing left  - turning - jumping - frame 1
; 43h: Facing right - turning - crouching - frame 1
; 44h: Facing left  - turning - crouching - frame 1
; 87h: Facing right - turning - falling - frame 1
; 88h: Facing left  - turning - falling - frame 1
; BFh: Facing right - moonwalking - turn/jump left - frame 1
; C0h: Facing left  - moonwalking - turn/jump right - frame 1
; C6h: Unused - frame 1
incbin "data/SamusTiles_Top_Set1_EntryA.bin" ; $1A0 bytes


;;; $B320: Samus top tiles - set 1 - entry Bh ;;;
SamusTiles_Top_Set1_EntryB:
; 5Ch: Unused - frame 0
; 64h: Unused. Related to movement type Dh - frame 1
; B9h: Facing right - grapple wall jump pose - frame 0
incbin "data/SamusTiles_Top_Set1_EntryB.bin" ; $180 bytes


;;; $B4A0: Samus top tiles - set 1 - entry Ch ;;;
SamusTiles_Top_Set1_EntryC:
; 45h: Unused - frame 0
; 46h: Unused - frame 0
; 5Bh: Unused - frame 0
; 63h: Unused. Related to movement type Dh - frame 1
; B8h: Facing left  - grapple wall jump pose - frame 0
incbin "data/SamusTiles_Top_Set1_EntryC.bin" ; $180 bytes


;;; $B620: Samus top tiles - set 1 - entry Dh ;;;
SamusTiles_Top_Set1_EntryD:
; 9: Moving right - not aiming - frame 1
incbin "data/SamusTiles_Top_Set1_EntryD.bin" ; $100 bytes


;;; $B720: Samus top tiles - set 1 - entry Eh ;;;
SamusTiles_Top_Set1_EntryE:
; 9: Moving right - not aiming - frame 6
incbin "data/SamusTiles_Top_Set1_EntryE.bin" ; $100 bytes


;;; $B820: Samus top tiles - set 1 - entry Fh ;;;
SamusTiles_Top_Set1_EntryF:
; Ah: Moving left  - not aiming - frame 1
incbin "data/SamusTiles_Top_Set1_EntryF.bin" ; $100 bytes


;;; $B920: Samus top tiles - set 1 - entry 10h ;;;
SamusTiles_Top_Set1_Entry10:
; Ah: Moving left  - not aiming - frame 6
incbin "data/SamusTiles_Top_Set1_Entry10.bin" ; $100 bytes


;;; $BA20: Samus top tiles - set 1 - entry 11h ;;;
SamusTiles_Top_Set1_Entry11:
; 0: Facing forward - power suit - frame 0
incbin "data/SamusTiles_Top_Set1_Entry11.bin" ; $100 bytes


;;; $BB20: Samus top tiles - set 1 - entry 12h ;;;
SamusTiles_Top_Set1_Entry12:
; 65h: Unused. Related to movement type Dh - frame 0
; 83h: Facing right - wall jump - frame 0
incbin "data/SamusTiles_Top_Set1_Entry12.bin" ; $100 bytes


;;; $BC20: Samus top tiles - set 1 - entry 13h ;;;
SamusTiles_Top_Set1_Entry13:
; 66h: Unused. Related to movement type Dh - frame 0
; 84h: Facing left  - wall jump - frame 0
incbin "data/SamusTiles_Top_Set1_Entry13.bin" ; $100 bytes


;;; $BD20: Samus top tiles - set 1 - entry 14h ;;;
SamusTiles_Top_Set1_Entry14:
; 63h: Unused. Related to movement type Dh - frame 0
; C9h: Facing right - shinespark - horizontal - frame 0
; CDh: Facing right - shinespark - diagonal - frame 0
incbin "data/SamusTiles_Top_Set1_Entry14.bin" ; $1C0 bytes


;;; $BEE0: Samus top tiles - set 1 - entry 15h ;;;
SamusTiles_Top_Set1_Entry15:
; 64h: Unused. Related to movement type Dh - frame 0
; CAh: Facing left  - shinespark - horizontal - frame 0
; CEh: Facing left  - shinespark - diagonal - frame 0
incbin "data/SamusTiles_Top_Set1_Entry15.bin" ; $1C0 bytes


;;; $C0A0: Samus top tiles - set 1 - entry 16h ;;;
SamusTiles_Top_Set1_Entry16:
; Unused
incbin "data/SamusTiles_Top_Set1_Entry16.bin" ; $20 bytes


;;; $C0C0: Samus top tiles - set 1 - entry 17h ;;;
SamusTiles_Top_Set1_Entry17:
; Unused
incbin "data/SamusTiles_Top_Set1_Entry17.bin" ; $20 bytes


;;; $C0E0: Samus top tiles - set 1 - entry 18h ;;;
SamusTiles_Top_Set1_Entry18:
; 8Dh: Facing right - turning - standing - aiming down-right - frame 2
; 8Eh: Facing left  - turning - standing - aiming down-left - frame 0
; 91h: Facing right - turning - in air - aiming down/down-right - frame 2
; 92h: Facing left  - turning - in air - aiming down/down-left - frame 0
; 95h: Facing right - turning - falling - aiming down/down-right - frame 2
; 96h: Facing left  - turning - falling - aiming down/down-left - frame 0
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 2
; 9Ah: Facing left  - turning - crouching - aiming down/down-left - frame 0
; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right - frame 2
; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left - frame 0
incbin "data/SamusTiles_Top_Set1_Entry18.bin" ; $120 bytes


;;; $C200: Samus top tiles - set 1 - entry 19h ;;;
SamusTiles_Top_Set1_Entry19:
; 8Dh: Facing right - turning - standing - aiming down-right - frame 0
; 8Eh: Facing left  - turning - standing - aiming down-left - frame 2
; 91h: Facing right - turning - in air - aiming down/down-right - frame 0
; 92h: Facing left  - turning - in air - aiming down/down-left - frame 2
; 95h: Facing right - turning - falling - aiming down/down-right - frame 0
; 96h: Facing left  - turning - falling - aiming down/down-left - frame 2
; 99h: Facing right - turning - crouching - aiming down/down-right - frame 0
; 9Ah: Facing left  - turning - crouching - aiming down/down-left - frame 2
; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right - frame 0
; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left - frame 2
incbin "data/SamusTiles_Top_Set1_Entry19.bin" ; $120 bytes


;;; $C320: Samus top tiles - set 1 - entry 1Ah ;;;
SamusTiles_Top_Set1_Entry1A:
; 17h: Facing right - normal jump - aiming down - frame 1
; 2Dh: Facing right - falling - aiming down - frame 1
; AEh: Unused. Facing right - grappling - in air - aiming down - frame 1
incbin "data/SamusTiles_Top_Set1_Entry1A.bin" ; $140 bytes


;;; $C460: Samus top tiles - set 1 - entry 1Bh ;;;
SamusTiles_Top_Set1_Entry1B:
; 18h: Facing left  - normal jump - aiming down - frame 1
; 2Eh: Facing left  - falling - aiming down - frame 1
; AFh: Unused. Facing left  - grappling - in air - aiming down - frame 1
incbin "data/SamusTiles_Top_Set1_Entry1B.bin" ; $140 bytes


;;; $C5A0: Samus top tiles - set 1 - entry 1Ch ;;;
SamusTiles_Top_Set1_Entry1C:
; 19h: Facing right - spin jump - frame Bh
; 1Bh: Facing right - space jump - frame Bh
; 20h: Unused - frame Bh
; 21h: Unused - frame Bh
; 22h: Unused - frame Bh
; 23h: Unused - frame Bh
; 24h: Unused - frame Bh
; 33h: Unused - frame Bh
; 34h: Unused - frame Bh
; 39h: Unused - frame Bh
; 3Ah: Unused - frame Bh
; 42h: Unused - frame Bh
; 81h: Facing right - screw attack - frame 1Bh
incbin "data/SamusTiles_Top_Set1_Entry1C.bin" ; $140 bytes


;;; $C6E0: Samus top tiles - set 1 - entry 1Dh ;;;
SamusTiles_Top_Set1_Entry1D:
; 1Ah: Facing left  - spin jump - frame Bh
; 1Ch: Facing left  - space jump - frame Bh
; 82h: Facing left  - screw attack - frame 1Bh
incbin "data/SamusTiles_Top_Set1_Entry1D.bin" ; $140 bytes


;;; $C820: Samus top tiles - set 2 - entry 0 ;;;
SamusTiles_Top_Set2_Entry0:
; 4Bh: Facing right - normal jump transition - frame 0
; A4h: Facing right - landing from normal jump - frame 0
; A6h: Facing right - landing from spin jump - frame 1
incbin "data/SamusTiles_Top_Set2_Entry0.bin" ; $C0 bytes


;;; $C8E0: Samus top tiles - set 2 - entry 1 ;;;
SamusTiles_Top_Set2_Entry1:
; 4Ch: Facing left  - normal jump transition - frame 0
; A5h: Facing left  - landing from normal jump - frame 0
; A7h: Facing left  - landing from spin jump - frame 1
incbin "data/SamusTiles_Top_Set2_Entry1.bin" ; $100 bytes


;;; $C9E0: Samus top tiles - set 2 - entry 2 ;;;
SamusTiles_Top_Set2_Entry2:
; Unused
incbin "data/SamusTiles_Top_Set2_Entry2.bin" ; $140 bytes


;;; $CB20: Samus top tiles - set 2 - entry 3 ;;;
SamusTiles_Top_Set2_Entry3:
; E9h: Facing left  - Samus drained - crouching/falling - frame 10h
; E9h: Facing left  - Samus drained - crouching/falling - frame 15h
incbin "data/SamusTiles_Top_Set2_Entry3.bin" ; $100 bytes


;;; $CC20: Samus top tiles - set 2 - entry 4 ;;;
SamusTiles_Top_Set2_Entry4:
; 19h: Facing right - spin jump - frame 0
; 1Bh: Facing right - space jump - frame 0
; 20h: Unused - frame 0
; 21h: Unused - frame 0
; 22h: Unused - frame 0
; 23h: Unused - frame 0
; 24h: Unused - frame 0
; 29h: Facing right - falling - frame 0
; 29h: Facing right - falling - frame 6
; 33h: Unused - frame 0
; 34h: Unused - frame 0
; 39h: Unused - frame 0
; 3Ah: Unused - frame 0
; 42h: Unused - frame 0
; 50h: Facing right - damage boost - frames 0..1
; 81h: Facing right - screw attack - frame 0
; 83h: Facing right - wall jump - frame 1
; A4h: Facing right - landing from normal jump - frame 1
; A6h: Facing right - landing from spin jump - frame 0
; A6h: Facing right - landing from spin jump - frame 2
; ECh: Facing right - grabbed by Draygon - not moving - not aiming - frame 0
incbin "data/SamusTiles_Top_Set2_Entry4.bin" ; $C0 bytes


;;; $CCE0: Samus top tiles - set 2 - entry 5 ;;;
SamusTiles_Top_Set2_Entry5:
; 1Ah: Facing left  - spin jump - frame 0
; 1Ch: Facing left  - space jump - frame 0
; 2Ah: Facing left  - falling - frame 0
; 2Ah: Facing left  - falling - frame 6
; 4Fh: Facing left  - damage boost - frames 0..1
; 82h: Facing left  - screw attack - frame 0
; 84h: Facing left  - wall jump - frame 1
; A5h: Facing left  - landing from normal jump - frame 1
; A7h: Facing left  - landing from spin jump - frame 0
; A7h: Facing left  - landing from spin jump - frame 2
; BAh: Facing left  - grabbed by Draygon - not moving - not aiming - frame 0
incbin "data/SamusTiles_Top_Set2_Entry5.bin" ; $100 bytes


;;; $CDE0: Samus top tiles - set 2 - entry 6 ;;;
SamusTiles_Top_Set2_Entry6:
; 11h: Moving right - aiming down-right - frame 2
; 11h: Moving right - aiming down-right - frame 4
; 11h: Moving right - aiming down-right - frame 7
; 11h: Moving right - aiming down-right - frame 9
; 78h: Facing right - moonwalk - aiming down-right - frames 1..2
; 78h: Facing right - moonwalk - aiming down-right - frames 4..5
incbin "data/SamusTiles_Top_Set2_Entry6.bin" ; $120 bytes


;;; $CF00: Samus top tiles - set 2 - entry 7 ;;;
SamusTiles_Top_Set2_Entry7:
; 12h: Moving left  - aiming down-left - frame 2
; 12h: Moving left  - aiming down-left - frame 4
; 12h: Moving left  - aiming down-left - frame 7
; 12h: Moving left  - aiming down-left - frame 9
; 77h: Facing left  - moonwalk - aiming down-left - frames 1..2
; 77h: Facing left  - moonwalk - aiming down-left - frames 4..5
incbin "data/SamusTiles_Top_Set2_Entry7.bin" ; $120 bytes


;;; $D020: Samus top tiles - set 2 - entry 8 ;;;
SamusTiles_Top_Set2_Entry8:
; D5h: Facing right - x-ray - standing - frame 1
; D9h: Facing right - x-ray - crouching - frame 1
incbin "data/SamusTiles_Top_Set2_Entry8.bin" ; $100 bytes


;;; $D120: Samus top tiles - set 2 - entry 9 ;;;
SamusTiles_Top_Set2_Entry9:
; D5h: Facing right - x-ray - standing - frame 0
; D9h: Facing right - x-ray - crouching - frame 0
incbin "data/SamusTiles_Top_Set2_Entry9.bin" ; $100 bytes


;;; $D220: Samus top tiles - set 2 - entry Ah ;;;
SamusTiles_Top_Set2_EntryA:
; D5h: Facing right - x-ray - standing - frame 3
; D9h: Facing right - x-ray - crouching - frame 3
incbin "data/SamusTiles_Top_Set2_EntryA.bin" ; $100 bytes


;;; $D320: Samus top tiles - set 2 - entry Bh ;;;
SamusTiles_Top_Set2_EntryB:
; D5h: Facing right - x-ray - standing - frame 4
; D9h: Facing right - x-ray - crouching - frame 4
incbin "data/SamusTiles_Top_Set2_EntryB.bin" ; $100 bytes


;;; $D420: Samus top tiles - set 2 - entry Ch ;;;
SamusTiles_Top_Set2_EntryC:
; D6h: Facing left  - x-ray - standing - frame 1
; DAh: Facing left  - x-ray - crouching - frame 1
incbin "data/SamusTiles_Top_Set2_EntryC.bin" ; $100 bytes


;;; $D520: Samus top tiles - set 2 - entry Dh ;;;
SamusTiles_Top_Set2_EntryD:
; D6h: Facing left  - x-ray - standing - frame 0
; DAh: Facing left  - x-ray - crouching - frame 0
incbin "data/SamusTiles_Top_Set2_EntryD.bin" ; $100 bytes


;;; $D620: Samus top tiles - set 2 - entry Eh ;;;
SamusTiles_Top_Set2_EntryE:
; Dh: Moving right - aiming up (unused) - frame 2
; Dh: Moving right - aiming up (unused) - frame 4
; Dh: Moving right - aiming up (unused) - frame 7
; Dh: Moving right - aiming up (unused) - frame 9
; D6h: Facing left  - x-ray - standing - frame 3
; DAh: Facing left  - x-ray - crouching - frame 3
incbin "data/SamusTiles_Top_Set2_EntryE.bin" ; $100 bytes


;;; $D720: Samus top tiles - set 2 - entry Fh ;;;
SamusTiles_Top_Set2_EntryF:
; Eh: Moving left  - aiming up (unused) - frame 2
; Eh: Moving left  - aiming up (unused) - frame 4
; Eh: Moving left  - aiming up (unused) - frame 7
; Eh: Moving left  - aiming up (unused) - frame 9
; D6h: Facing left  - x-ray - standing - frame 4
; DAh: Facing left  - x-ray - crouching - frame 4
incbin "data/SamusTiles_Top_Set2_EntryF.bin" ; $100 bytes


;;; $D820: Samus top tiles - set 2 - entry 10h ;;;
SamusTiles_Top_Set2_Entry10:
; Fh: Moving right - aiming up-right - frame 2
; Fh: Moving right - aiming up-right - frame 4
; Fh: Moving right - aiming up-right - frame 7
; Fh: Moving right - aiming up-right - frame 9
; 76h: Facing right - moonwalk - aiming up-right - frames 1..2
; 76h: Facing right - moonwalk - aiming up-right - frames 4..5
incbin "data/SamusTiles_Top_Set2_Entry10.bin" ; $100 bytes


;;; $D920: Samus top tiles - set 2 - entry 11h ;;;
SamusTiles_Top_Set2_Entry11:
; 10h: Moving left  - aiming up-left - frame 2
; 10h: Moving left  - aiming up-left - frame 4
; 10h: Moving left  - aiming up-left - frame 7
; 10h: Moving left  - aiming up-left - frame 9
; 75h: Facing left  - moonwalk - aiming up-left - frames 1..2
; 75h: Facing left  - moonwalk - aiming up-left - frames 4..5
incbin "data/SamusTiles_Top_Set2_Entry11.bin" ; $120 bytes


;;; $DA40: Samus top tiles - set 2 - entry 12h ;;;
SamusTiles_Top_Set2_Entry12:
; Unused
incbin "data/SamusTiles_Top_Set2_Entry12.bin" ; $140 bytes


;;; $DB80: Samus top tiles - set 2 - entry 13h ;;;
SamusTiles_Top_Set2_Entry13:
; Unused
incbin "data/SamusTiles_Top_Set2_Entry13.bin" ; $140 bytes


;;; $DCC0: Samus top tiles - set 2 - entry 14h ;;;
SamusTiles_Top_Set2_Entry14:
; Unused
incbin "data/SamusTiles_Top_Set2_Entry14.bin" ; $140 bytes


;;; $DE00: Samus top tiles - set 2 - entry 15h ;;;
SamusTiles_Top_Set2_Entry15:
; Unused
incbin "data/SamusTiles_Top_Set2_Entry15.bin" ; $140 bytes


;;; $DF40: Samus top tiles - set 2 - entry 16h ;;;
SamusTiles_Top_Set2_Entry16:
; Fh: Moving right - aiming up-right - frame 3
; Fh: Moving right - aiming up-right - frame 8
incbin "data/SamusTiles_Top_Set2_Entry16.bin" ; $100 bytes


;;; $E040: Samus top tiles - set 2 - entry 17h ;;;
SamusTiles_Top_Set2_Entry17:
; 10h: Moving left  - aiming up-left - frame 3
; 10h: Moving left  - aiming up-left - frame 8
incbin "data/SamusTiles_Top_Set2_Entry17.bin" ; $120 bytes


;;; $E160: Samus top tiles - set 2 - entry 18h ;;;
SamusTiles_Top_Set2_Entry18:
; 11h: Moving right - aiming down-right - frame 3
; 11h: Moving right - aiming down-right - frame 8
incbin "data/SamusTiles_Top_Set2_Entry18.bin" ; $120 bytes


;;; $E280: Samus top tiles - set 2 - entry 19h ;;;
SamusTiles_Top_Set2_Entry19:
; 12h: Moving left  - aiming down-left - frame 3
; 12h: Moving left  - aiming down-left - frame 8
incbin "data/SamusTiles_Top_Set2_Entry19.bin" ; $120 bytes


;;; $E3A0: Samus top tiles - set 2 - entry 1Ah ;;;
SamusTiles_Top_Set2_Entry1A:
; 4Ah: Facing right - moonwalk - frames 1..2
; 4Ah: Facing right - moonwalk - frames 4..5
incbin "data/SamusTiles_Top_Set2_Entry1A.bin" ; $100 bytes


;;; $E4A0: Samus top tiles - set 2 - entry 1Bh ;;;
SamusTiles_Top_Set2_Entry1B:
; 49h: Facing left  - moonwalk - frames 1..2
; 49h: Facing left  - moonwalk - frames 4..5
incbin "data/SamusTiles_Top_Set2_Entry1B.bin" ; $100 bytes


;;; $E5A0: Samus top tiles - set 2 - entry 1Ch ;;;
SamusTiles_Top_Set2_Entry1C:
; 29h: Facing right - falling - frame 1
; 29h: Facing right - falling - frame 5
incbin "data/SamusTiles_Top_Set2_Entry1C.bin" ; $120 bytes


;;; $E6C0: Samus top tiles - set 2 - entry 1Dh ;;;
SamusTiles_Top_Set2_Entry1D:
; 29h: Facing right - falling - frame 2
; 50h: Facing right - damage boost - frame 9
incbin "data/SamusTiles_Top_Set2_Entry1D.bin" ; $100 bytes


;;; $E7C0: Samus top tiles - set 2 - entry 1Eh ;;;
SamusTiles_Top_Set2_Entry1E:
; Dh: Moving right - aiming up (unused) - frame 3
; Dh: Moving right - aiming up (unused) - frame 8
; 2Ah: Facing left  - falling - frame 1
; 2Ah: Facing left  - falling - frame 5
incbin "data/SamusTiles_Top_Set2_Entry1E.bin" ; $100 bytes


;;; $E8C0: Samus top tiles - set 2 - entry 1Fh ;;;
SamusTiles_Top_Set2_Entry1F:
; Eh: Moving left  - aiming up (unused) - frame 3
; Eh: Moving left  - aiming up (unused) - frame 8
; 2Ah: Facing left  - falling - frame 2
; 4Fh: Facing left  - damage boost - frame 9
incbin "data/SamusTiles_Top_Set2_Entry1F.bin" ; $100 bytes


;;; $E9C0: Samus bottom tiles - set 3 - entry 0 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry0_9EE9C0:
; Unused
incbin "data/UNUSED_SamusTiles_Bottom_Set3_Entry0_9EE9C0.bin" ; $80 bytes



;;; $EA40: Samus bottom tiles - set 3 - entry 1 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry1_9EEA40:
; Unused
incbin "data/UNUSED_SamusTiles_Bottom_Set3_Entry1_9EEA40.bin" ; $100 bytes


;;; $EB40: Samus bottom tiles - set 3 - entry 2 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry2_9EEB40:
; Unused
incbin "data/UNUSED_SamusTiles_Bottom_Set3_Entry2_9EEB40.bin" ; $80 bytes


;;; $EBC0: Samus bottom tiles - set 3 - entry 3 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry3_9EEBC0:
; Unused
incbin "data/UNUSED_SamusTiles_Bottom_Set3_Entry3_9EEBC0.bin" ; $100 bytes


;;; $ECC0: Samus bottom tiles - set 3 - entry 4 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry4_9EECC0:
incbin "data/UNUSED_SamusTiles_Bottom_Set3_Entry4_9EECC0.bin" ; $80 bytes


;;; $ED40: Samus bottom tiles - set 3 - entry 5 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry5_9EED40:
; Unused
incbin "data/UNUSED_SamusTiles_Bottom_Set3_Entry5_9EED40.bin" ; $100 bytes


;;; $EE40: Samus bottom tiles - set 3 - entry 6 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry6_9EEE40:
; Unused
incbin "data/UNUSED_SamusTiles_Bottom_Set3_Entry6_9EEE40.bin" ; $80 bytes


;;; $EEC0: Samus bottom tiles - set 3 - entry 7 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry7_9EEEC0:
; Unused
incbin "data/UNUSED_SamusTiles_Bottom_Set3_Entry7_9EEEC0.bin" ; $100 bytes


;;; $EFC0: Samus bottom tiles - set 3 - entry 8 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry8_9EEFC0:
; Unused
incbin "data/UNUSED_SamusTiles_Bottom_Set3_Entry8_9EEFC0.bin" ; $80 bytes


;;; $F040: Samus bottom tiles - set 3 - entry 9 ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry9_9EF040:
; Unused
incbin "data/UNUSED_SamusTiles_Bottom_Set3_Entry9_9EF040.bin" ; $100 bytes


;;; $F140: Samus bottom tiles - set 3 - entry Ah ;;;
UNUSED_SamusTiles_Bottom_Set3_EntryA_9EF140:
; Unused
incbin "data/UNUSED_SamusTiles_Bottom_Set3_EntryA_9EF140.bin" ; $80 bytes


;;; $F1C0: Samus bottom tiles - set 3 - entry Bh ;;;
UNUSED_SamusTiles_Bottom_Set3_EntryB_9EF1C0:
; Unused
incbin "data/UNUSED_SamusTiles_Bottom_Set3_EntryB_9EF1C0.bin" ; $100 bytes


;;; $F2C0: Samus bottom tiles - set 3 - entry Ch ;;;
UNUSED_SamusTiles_Bottom_Set3_EntryC_9EF2C0:
; Unused
incbin "data/UNUSED_SamusTiles_Bottom_Set3_EntryC_9EF2C0.bin" ; $80 bytes


;;; $F340: Samus bottom tiles - set 3 - entry Dh ;;;
UNUSED_SamusTiles_Bottom_Set3_EntryD_9EF340:
; Unused
incbin "data/UNUSED_SamusTiles_Bottom_Set3_EntryD_9EF340.bin" ; $100 bytes


;;; $F440: Samus bottom tiles - set 3 - entry Eh ;;;
UNUSED_SamusTiles_Bottom_Set3_EntryE_9EF440:
; Unused
incbin "data/UNUSED_SamusTiles_Bottom_Set3_EntryE_9EF440.bin" ; $80 bytes


;;; $F4C0: Samus bottom tiles - set 3 - entry Fh ;;;
UNUSED_SamusTiles_Bottom_Set3_EntryF_9EF4C0:
; Unused
incbin "data/UNUSED_SamusTiles_Bottom_Set3_EntryF_9EF4C0.bin" ; $100 bytes


;;; $F5C0: Samus bottom tiles - set 3 - entry 10h ;;;
UNUSED_SamusTiles_Bottom_Set3_Entry10_9EF5C0:
; Unused
incbin "data/UNUSED_SamusTiles_Bottom_Set3_Entry10_9EF5C0.bin" ; $100 bytes



;;; $E7C0: Samus top tiles - set 8 - entry 8 ;;;
SamusTiles_Top_Set8_Entry8:
; 0: Facing forward - power suit - frame 56h
; 0: Facing forward - power suit - frame 5Ch
; 9Bh: Facing forward - varia/gravity suit - frame 56h
; 9Bh: Facing forward - varia/gravity suit - frame 5Ch
incbin "data/SamusTiles_Top_Set8_Entry8.bin" ; $160 bytes


;;; $E920: Samus top tiles - set 8 - entry 9 ;;;
SamusTiles_Top_Set8_Entry9:
; 0: Facing forward - power suit - frame 58h
; 0: Facing forward - power suit - frame 5Eh
; 9Bh: Facing forward - varia/gravity suit - frame 58h
; 9Bh: Facing forward - varia/gravity suit - frame 5Eh
incbin "data/SamusTiles_Top_Set8_Entry9.bin" ; $E0 bytes


;;; $EA00: Samus bottom tiles - set 8 - entry 0 ;;;
SamusTiles_Bottom_Set8_Entry0:
; 0: Facing forward - power suit - frames 2..5Fh
incbin "data/SamusTiles_Bottom_Set8_Entry0.bin" ; $200 bytes


;;; $EC00: Samus bottom tiles - set 8 - entry 1 ;;;
SamusTiles_Bottom_Set8_Entry1:
; 9Bh: Facing forward - varia/gravity suit - frames 2..5Fh
incbin "data/SamusTiles_Bottom_Set8_Entry1.bin" ; $200 bytes


;;; $EE00: Samus bottom tiles - set 8 - entry 2 ;;;
SamusTiles_Bottom_Set8_Entry2:
; Unused
incbin "data/SamusTiles_Bottom_Set8_Entry2.bin" ; $20 bytes


;;; $EE20: Samus top tiles - set 9 - entry 0 ;;;
SamusTiles_Top_Set9_Entry0:
; Bh: Moving right - gun extended - frame 0
; Bh: Moving right - gun extended - frame 5
incbin "data/SamusTiles_Top_Set9_Entry0.bin" ; $C0 bytes


;;; $EEE0: Samus top tiles - set 9 - entry 1 ;;;
SamusTiles_Top_Set9_Entry1:
; Bh: Moving right - gun extended - frame 4
incbin "data/SamusTiles_Top_Set9_Entry1.bin" ; $C0 bytes


;;; $EFA0: Samus top tiles - set 9 - entry 2 ;;;
SamusTiles_Top_Set9_Entry2:
; Bh: Moving right - gun extended - frame 2
incbin "data/SamusTiles_Top_Set9_Entry2.bin" ; $E0 bytes



org !SamusTilesBank3


;;; $8000: Samus bottom tiles - set 2 - entry 0 ;;;
SamusTiles_Bottom_Set2_Entry0:
; 5Dh: Unused - frames 17h..19h
; 5Eh: Unused - frames 17h..19h
; 5Fh: Unused - frames 17h..19h
; 60h: Unused - frames 17h..19h
; 61h: Unused - frames 17h..19h
; B2h: Facing clockwise     - grapple - in air - frames 17h..19h
incbin "data/SamusTiles_Bottom_Set2_Entry0.bin" ; $C0 bytes


;;; $80C0: Samus bottom tiles - set 2 - entry 1 ;;;
SamusTiles_Bottom_Set2_Entry1:
; 5Dh: Unused - frames 15h..16h
; 5Eh: Unused - frames 15h..16h
; 5Fh: Unused - frames 15h..16h
; 60h: Unused - frames 15h..16h
; 61h: Unused - frames 15h..16h
; B2h: Facing clockwise     - grapple - in air - frames 15h..16h
incbin "data/SamusTiles_Bottom_Set2_Entry1.bin" ; $120 bytes


;;; $81E0: Samus bottom tiles - set 2 - entry 2 ;;;
SamusTiles_Bottom_Set2_Entry2:
; 5Dh: Unused - frames 13h..14h
; 5Eh: Unused - frames 13h..14h
; 5Fh: Unused - frames 13h..14h
; 60h: Unused - frames 13h..14h
; 61h: Unused - frames 13h..14h
; B2h: Facing clockwise     - grapple - in air - frames 13h..14h
incbin "data/SamusTiles_Bottom_Set2_Entry2.bin" ; $120 bytes


;;; $8300: Samus bottom tiles - set 2 - entry 3 ;;;
SamusTiles_Bottom_Set2_Entry3:
; 5Dh: Unused - frame 12h
; 5Eh: Unused - frame 12h
; 5Fh: Unused - frame 12h
; 60h: Unused - frame 12h
; 61h: Unused - frame 12h
; B2h: Facing clockwise     - grapple - in air - frame 12h
incbin "data/SamusTiles_Bottom_Set2_Entry3.bin" ; $E0 bytes


;;; $83E0: Samus bottom tiles - set 2 - entry 4 ;;;
SamusTiles_Bottom_Set2_Entry4:
; 5Dh: Unused - frame 11h
; 5Eh: Unused - frame 11h
; 5Fh: Unused - frame 11h
; 60h: Unused - frame 11h
; 61h: Unused - frame 11h
; B2h: Facing clockwise     - grapple - in air - frame 11h
incbin "data/SamusTiles_Bottom_Set2_Entry4.bin" ; $100 bytes


;;; $84E0: Samus bottom tiles - set 2 - entry 5 ;;;
SamusTiles_Bottom_Set2_Entry5:
; 5Dh: Unused - frame 10h
; 5Eh: Unused - frame 10h
; 5Fh: Unused - frame 10h
; 60h: Unused - frame 10h
; 61h: Unused - frame 10h
; B2h: Facing clockwise     - grapple - in air - frame 10h
incbin "data/SamusTiles_Bottom_Set2_Entry5.bin" ; $100 bytes


;;; $85E0: Samus bottom tiles - set 2 - entry 6 ;;;
SamusTiles_Bottom_Set2_Entry6:
; 5Dh: Unused - frame Fh
; 5Eh: Unused - frame Fh
; 5Fh: Unused - frame Fh
; 60h: Unused - frame Fh
; 61h: Unused - frame Fh
; B2h: Facing clockwise     - grapple - in air - frame Fh
incbin "data/SamusTiles_Bottom_Set2_Entry6.bin" ; $C0 bytes


;;; $86A0: Samus bottom tiles - set 2 - entry 7 ;;;
SamusTiles_Bottom_Set2_Entry7:
; 5Dh: Unused - frame Eh
; 5Eh: Unused - frame Eh
; 5Fh: Unused - frame Eh
; 60h: Unused - frame Eh
; 61h: Unused - frame Eh
; B2h: Facing clockwise     - grapple - in air - frame Eh
incbin "data/SamusTiles_Bottom_Set2_Entry7.bin" ; $E0 bytes


;;; $8780: Samus bottom tiles - set 2 - entry 8 ;;;
SamusTiles_Bottom_Set2_Entry8:
; 5Dh: Unused - frames Ch..Dh
; 5Eh: Unused - frames Ch..Dh
; 5Fh: Unused - frames Ch..Dh
; 60h: Unused - frames Ch..Dh
; 61h: Unused - frames Ch..Dh
; B2h: Facing clockwise     - grapple - in air - frames Ch..Dh
incbin "data/SamusTiles_Bottom_Set2_Entry8.bin" ; $E0 bytes


;;; $8860: Samus bottom tiles - set 2 - entry 9 ;;;
SamusTiles_Bottom_Set2_Entry9:
; 5Dh: Unused - frames Ah..Bh
; 5Eh: Unused - frames Ah..Bh
; 5Fh: Unused - frames Ah..Bh
; 60h: Unused - frames Ah..Bh
; 61h: Unused - frames Ah..Bh
; B2h: Facing clockwise     - grapple - in air - frames Ah..Bh
incbin "data/SamusTiles_Bottom_Set2_Entry9.bin" ; $100 bytes


;;; $8960: Samus bottom tiles - set 2 - entry Ah ;;;
SamusTiles_Bottom_Set2_EntryA:
; Unused
incbin "data/SamusTiles_Bottom_Set2_EntryA.bin" ; $120 bytes


;;; $8A80: Samus bottom tiles - set 2 - entry Bh ;;;
SamusTiles_Bottom_Set2_EntryB:
; 5Dh: Unused - frame 40h
; 5Eh: Unused - frame 40h
; 5Fh: Unused - frame 40h
; 60h: Unused - frame 40h
; 61h: Unused - frame 40h
; B2h: Facing clockwise     - grapple - in air - frame 40h
incbin "data/SamusTiles_Bottom_Set2_EntryB.bin" ; $100 bytes


;;; $8B80: Samus bottom tiles - set 2 - entry Ch ;;;
SamusTiles_Bottom_Set2_EntryC:
; 5Dh: Unused - frame 41h
; 5Eh: Unused - frame 41h
; 5Fh: Unused - frame 41h
; 60h: Unused - frame 41h
; 61h: Unused - frame 41h
; B2h: Facing clockwise     - grapple - in air - frame 41h
incbin "data/SamusTiles_Bottom_Set2_EntryC.bin" ; $100 bytes


;;; $8C80: Samus bottom tiles - set 2 - entry Dh ;;;
SamusTiles_Bottom_Set2_EntryD:
; 5Dh: Unused - frames 37h..39h
; 5Eh: Unused - frames 37h..39h
; 5Fh: Unused - frames 37h..39h
; 60h: Unused - frames 37h..39h
; 61h: Unused - frames 37h..39h
; B2h: Facing clockwise     - grapple - in air - frames 37h..39h
incbin "data/SamusTiles_Bottom_Set2_EntryD.bin" ; $100 bytes


;;; $8D80: Samus bottom tiles - set 2 - entry Eh ;;;
SamusTiles_Bottom_Set2_EntryE:
; 5Dh: Unused - frames 35h..36h
; 5Eh: Unused - frames 35h..36h
; 5Fh: Unused - frames 35h..36h
; 60h: Unused - frames 35h..36h
; 61h: Unused - frames 35h..36h
; B2h: Facing clockwise     - grapple - in air - frames 35h..36h
incbin "data/SamusTiles_Bottom_Set2_EntryE.bin" ; $E0 bytes


;;; $8E60: Samus bottom tiles - set 2 - entry Fh ;;;
SamusTiles_Bottom_Set2_EntryF:
; 5Dh: Unused - frames 33h..34h
; 5Eh: Unused - frames 33h..34h
; 5Fh: Unused - frames 33h..34h
; 60h: Unused - frames 33h..34h
; 61h: Unused - frames 33h..34h
; B2h: Facing clockwise     - grapple - in air - frames 33h..34h
incbin "data/SamusTiles_Bottom_Set2_EntryF.bin" ; $100 bytes


;;; $8F60: Samus bottom tiles - set 2 - entry 10h ;;;
SamusTiles_Bottom_Set2_Entry10:
; 5Dh: Unused - frame 32h
; 5Eh: Unused - frame 32h
; 5Fh: Unused - frame 32h
; 60h: Unused - frame 32h
; 61h: Unused - frame 32h
; B2h: Facing clockwise     - grapple - in air - frame 32h
incbin "data/SamusTiles_Bottom_Set2_Entry10.bin" ; $100 bytes


;;; $9060: Samus bottom tiles - set 2 - entry 11h ;;;
SamusTiles_Bottom_Set2_Entry11:
; 5Dh: Unused - frame 31h
; 5Eh: Unused - frame 31h
; 5Fh: Unused - frame 31h
; 60h: Unused - frame 31h
; 61h: Unused - frame 31h
; B2h: Facing clockwise     - grapple - in air - frame 31h
incbin "data/SamusTiles_Bottom_Set2_Entry11.bin" ; $E0 bytes


;;; $9140: Samus bottom tiles - set 2 - entry 12h ;;;
SamusTiles_Bottom_Set2_Entry12:
; 5Dh: Unused - frame 30h
; 5Eh: Unused - frame 30h
; 5Fh: Unused - frame 30h
; 60h: Unused - frame 30h
; 61h: Unused - frame 30h
; B2h: Facing clockwise     - grapple - in air - frame 30h
incbin "data/SamusTiles_Bottom_Set2_Entry12.bin" ; $100 bytes


;;; $9240: Samus bottom tiles - set 2 - entry 13h ;;;
SamusTiles_Bottom_Set2_Entry13:
; 5Dh: Unused - frame 2Fh
; 5Eh: Unused - frame 2Fh
; 5Fh: Unused - frame 2Fh
; 60h: Unused - frame 2Fh
; 61h: Unused - frame 2Fh
; B2h: Facing clockwise     - grapple - in air - frame 2Fh
incbin "data/SamusTiles_Bottom_Set2_Entry13.bin" ; $100 bytes


;;; $9340: Samus bottom tiles - set 2 - entry 14h ;;;
SamusTiles_Bottom_Set2_Entry14:
; 5Dh: Unused - frame 2Eh
; 5Eh: Unused - frame 2Eh
; 5Fh: Unused - frame 2Eh
; 60h: Unused - frame 2Eh
; 61h: Unused - frame 2Eh
; B2h: Facing clockwise     - grapple - in air - frame 2Eh
incbin "data/SamusTiles_Bottom_Set2_Entry14.bin" ; $100 bytes


;;; $9440: Samus bottom tiles - set 2 - entry 15h ;;;
SamusTiles_Bottom_Set2_Entry15:
; 5Dh: Unused - frames 2Ch..2Dh
; 5Eh: Unused - frames 2Ch..2Dh
; 5Fh: Unused - frames 2Ch..2Dh
; 60h: Unused - frames 2Ch..2Dh
; 61h: Unused - frames 2Ch..2Dh
; B2h: Facing clockwise     - grapple - in air - frames 2Ch..2Dh
incbin "data/SamusTiles_Bottom_Set2_Entry15.bin" ; $140 bytes


;;; $9580: Samus bottom tiles - set 2 - entry 16h ;;;
SamusTiles_Bottom_Set2_Entry16:
; 5Dh: Unused - frames 2Ah..2Bh
; 5Eh: Unused - frames 2Ah..2Bh
; 5Fh: Unused - frames 2Ah..2Bh
; 60h: Unused - frames 2Ah..2Bh
; 61h: Unused - frames 2Ah..2Bh
; B2h: Facing clockwise     - grapple - in air - frames 2Ah..2Bh
incbin "data/SamusTiles_Bottom_Set2_Entry16.bin" ; $100 bytes


;;; $9680: Samus bottom tiles - set 2 - entry 17h ;;;
SamusTiles_Bottom_Set2_Entry17:
; Unused
incbin "data/SamusTiles_Bottom_Set2_Entry17.bin" ; $100 bytes


;;; $9780: Samus bottom tiles - set 4 - entry 0 ;;;
SamusTiles_Bottom_Set4_Entry0:
; 5Dh: Unused - frames 7..9
; 5Eh: Unused - frames 7..9
; 5Fh: Unused - frames 7..9
; 60h: Unused - frames 7..9
; 61h: Unused - frames 7..9
; B2h: Facing clockwise     - grapple - in air - frames 7..9
incbin "data/SamusTiles_Bottom_Set4_Entry0.bin" ; $C0 bytes


;;; $9840: Samus bottom tiles - set 4 - entry 1 ;;;
SamusTiles_Bottom_Set4_Entry1:
; 5Dh: Unused - frames 5..6
; 5Eh: Unused - frames 5..6
; 5Fh: Unused - frames 5..6
; 60h: Unused - frames 5..6
; 61h: Unused - frames 5..6
; B2h: Facing clockwise     - grapple - in air - frames 5..6
incbin "data/SamusTiles_Bottom_Set4_Entry1.bin" ; $120 bytes


;;; $9960: Samus bottom tiles - set 4 - entry 2 ;;;
SamusTiles_Bottom_Set4_Entry2:
; 5Dh: Unused - frames 3..4
; 5Eh: Unused - frames 3..4
; 5Fh: Unused - frames 3..4
; 60h: Unused - frames 3..4
; 61h: Unused - frames 3..4
; B2h: Facing clockwise     - grapple - in air - frames 3..4
incbin "data/SamusTiles_Bottom_Set4_Entry2.bin" ; $120 bytes


;;; $9A80: Samus bottom tiles - set 4 - entry 3 ;;;
SamusTiles_Bottom_Set4_Entry3:
; 5Dh: Unused - frame 2
; 5Eh: Unused - frame 2
; 5Fh: Unused - frame 2
; 60h: Unused - frame 2
; 61h: Unused - frame 2
; B2h: Facing clockwise     - grapple - in air - frame 2
incbin "data/SamusTiles_Bottom_Set4_Entry3.bin" ; $E0 bytes


;;; $9B60: Samus bottom tiles - set 4 - entry 4 ;;;
SamusTiles_Bottom_Set4_Entry4:
; 5Dh: Unused - frame 1
; 5Eh: Unused - frame 1
; 5Fh: Unused - frame 1
; 60h: Unused - frame 1
; 61h: Unused - frame 1
; B2h: Facing clockwise     - grapple - in air - frame 1
incbin "data/SamusTiles_Bottom_Set4_Entry4.bin" ; $100 bytes


;;; $9C60: Samus bottom tiles - set 4 - entry 5 ;;;
SamusTiles_Bottom_Set4_Entry5:
; 5Dh: Unused - frame 0
; 5Eh: Unused - frame 0
; 5Fh: Unused - frame 0
; 60h: Unused - frame 0
; 61h: Unused - frame 0
; B2h: Facing clockwise     - grapple - in air - frame 0
incbin "data/SamusTiles_Bottom_Set4_Entry5.bin" ; $100 bytes


;;; $9D60: Samus bottom tiles - set 4 - entry 6 ;;;
SamusTiles_Bottom_Set4_Entry6:
; 5Dh: Unused - frame 1Fh
; 5Eh: Unused - frame 1Fh
; 5Fh: Unused - frame 1Fh
; 60h: Unused - frame 1Fh
; 61h: Unused - frame 1Fh
; B2h: Facing clockwise     - grapple - in air - frame 1Fh
incbin "data/SamusTiles_Bottom_Set4_Entry6.bin" ; $C0 bytes


;;; $9E20: Samus bottom tiles - set 4 - entry 7 ;;;
SamusTiles_Bottom_Set4_Entry7:
; 5Dh: Unused - frame 1Eh
; 5Eh: Unused - frame 1Eh
; 5Fh: Unused - frame 1Eh
; 60h: Unused - frame 1Eh
; 61h: Unused - frame 1Eh
; B2h: Facing clockwise     - grapple - in air - frame 1Eh
incbin "data/SamusTiles_Bottom_Set4_Entry7.bin" ; $E0 bytes


;;; $9F00: Samus bottom tiles - set 4 - entry 8 ;;;
SamusTiles_Bottom_Set4_Entry8:
; 5Dh: Unused - frames 1Ch..1Dh
; 5Eh: Unused - frames 1Ch..1Dh
; 5Fh: Unused - frames 1Ch..1Dh
; 60h: Unused - frames 1Ch..1Dh
; 61h: Unused - frames 1Ch..1Dh
; B2h: Facing clockwise     - grapple - in air - frames 1Ch..1Dh
incbin "data/SamusTiles_Bottom_Set4_Entry8.bin" ; $E0 bytes


;;; $9FE0: Samus bottom tiles - set 4 - entry 9 ;;;
SamusTiles_Bottom_Set4_Entry9:
; 5Dh: Unused - frames 1Ah..1Bh
; 5Eh: Unused - frames 1Ah..1Bh
; 5Fh: Unused - frames 1Ah..1Bh
; 60h: Unused - frames 1Ah..1Bh
; 61h: Unused - frames 1Ah..1Bh
; B2h: Facing clockwise     - grapple - in air - frames 1Ah..1Bh
incbin "data/SamusTiles_Bottom_Set4_Entry9.bin" ; $100 bytes


;;; $A0E0: Samus bottom tiles - set 4 - entry Ah ;;;
SamusTiles_Bottom_Set4_EntryA:
; Unused
incbin "data/SamusTiles_Bottom_Set4_EntryA.bin" ; $120 bytes


;;; $A200: Samus bottom tiles - set 4 - entry Bh ;;;
SamusTiles_Bottom_Set4_EntryB:
; Unused
incbin "data/SamusTiles_Bottom_Set4_EntryB.bin" ; $100 bytes


;;; $A300: Samus bottom tiles - set 4 - entry Ch ;;;
SamusTiles_Bottom_Set4_EntryC:
; Unused
incbin "data/SamusTiles_Bottom_Set4_EntryC.bin" ; $100 bytes


;;; $A400: Samus bottom tiles - set 4 - entry Dh ;;;
SamusTiles_Bottom_Set4_EntryD:
; 5Dh: Unused - frames 27h..29h
; 5Eh: Unused - frames 27h..29h
; 5Fh: Unused - frames 27h..29h
; 60h: Unused - frames 27h..29h
; 61h: Unused - frames 27h..29h
; B2h: Facing clockwise     - grapple - in air - frames 27h..29h
incbin "data/SamusTiles_Bottom_Set4_EntryD.bin" ; $100 bytes


;;; $A500: Samus bottom tiles - set 4 - entry Eh ;;;
SamusTiles_Bottom_Set4_EntryE:
; 5Dh: Unused - frames 25h..26h
; 5Eh: Unused - frames 25h..26h
; 5Fh: Unused - frames 25h..26h
; 60h: Unused - frames 25h..26h
; 61h: Unused - frames 25h..26h
; B2h: Facing clockwise     - grapple - in air - frames 25h..26h
incbin "data/SamusTiles_Bottom_Set4_EntryE.bin" ; $E0 bytes


;;; $A5E0: Samus bottom tiles - set 4 - entry Fh ;;;
SamusTiles_Bottom_Set4_EntryF:
; 5Dh: Unused - frames 23h..24h
; 5Eh: Unused - frames 23h..24h
; 5Fh: Unused - frames 23h..24h
; 60h: Unused - frames 23h..24h
; 61h: Unused - frames 23h..24h
; B2h: Facing clockwise     - grapple - in air - frames 23h..24h
incbin "data/SamusTiles_Bottom_Set4_EntryF.bin" ; $100 bytes


;;; $A6E0: Samus bottom tiles - set 4 - entry 10h ;;;
SamusTiles_Bottom_Set4_Entry10:
; 5Dh: Unused - frame 22h
; 5Eh: Unused - frame 22h
; 5Fh: Unused - frame 22h
; 60h: Unused - frame 22h
; 61h: Unused - frame 22h
; B2h: Facing clockwise     - grapple - in air - frame 22h
incbin "data/SamusTiles_Bottom_Set4_Entry10.bin" ; $100 bytes


;;; $A7E0: Samus bottom tiles - set 4 - entry 11h ;;;
SamusTiles_Bottom_Set4_Entry11:
; 5Dh: Unused - frame 21h
; 5Eh: Unused - frame 21h
; 5Fh: Unused - frame 21h
; 60h: Unused - frame 21h
; 61h: Unused - frame 21h
; B2h: Facing clockwise     - grapple - in air - frame 21h
incbin "data/SamusTiles_Bottom_Set4_Entry11.bin" ; $E0 bytes


;;; $A8C0: Samus bottom tiles - set 4 - entry 12h ;;;
SamusTiles_Bottom_Set4_Entry12:
; 5Dh: Unused - frame 20h
; 5Dh: Unused - frame 3Fh
; 5Eh: Unused - frame 20h
; 5Eh: Unused - frame 3Fh
; 5Fh: Unused - frame 20h
; 5Fh: Unused - frame 3Fh
; 60h: Unused - frame 20h
; 60h: Unused - frame 3Fh
; 61h: Unused - frame 20h
; 61h: Unused - frame 3Fh
; B2h: Facing clockwise     - grapple - in air - frame 20h
; B2h: Facing clockwise     - grapple - in air - frame 3Fh
incbin "data/SamusTiles_Bottom_Set4_Entry12.bin" ; $100 bytes


;;; $A9C0: Samus bottom tiles - set 4 - entry 13h ;;;
SamusTiles_Bottom_Set4_Entry13:
; 5Dh: Unused - frame 3Eh
; 5Eh: Unused - frame 3Eh
; 5Fh: Unused - frame 3Eh
; 60h: Unused - frame 3Eh
; 61h: Unused - frame 3Eh
; B2h: Facing clockwise     - grapple - in air - frame 3Eh
incbin "data/SamusTiles_Bottom_Set4_Entry13.bin" ; $100 bytes


;;; $AAC0: Samus bottom tiles - set 4 - entry 14h ;;;
SamusTiles_Bottom_Set4_Entry14:
; 5Dh: Unused - frames 3Ch..3Dh
; 5Eh: Unused - frames 3Ch..3Dh
; 5Fh: Unused - frames 3Ch..3Dh
; 60h: Unused - frames 3Ch..3Dh
; 61h: Unused - frames 3Ch..3Dh
; B2h: Facing clockwise     - grapple - in air - frames 3Ch..3Dh
incbin "data/SamusTiles_Bottom_Set4_Entry14.bin" ; $100 bytes


;;; $ABC0: Samus bottom tiles - set 4 - entry 15h ;;;
SamusTiles_Bottom_Set4_Entry15:
; 5Dh: Unused - frames 3Ah..3Bh
; 5Eh: Unused - frames 3Ah..3Bh
; 5Fh: Unused - frames 3Ah..3Bh
; 60h: Unused - frames 3Ah..3Bh
; 61h: Unused - frames 3Ah..3Bh
; B2h: Facing clockwise     - grapple - in air - frames 3Ah..3Bh
incbin "data/SamusTiles_Bottom_Set4_Entry15.bin" ; $100 bytes


;;; $ACC0: Samus bottom tiles - set 4 - entry 16h ;;;
SamusTiles_Bottom_Set4_Entry16:
; Unused
incbin "data/SamusTiles_Bottom_Set4_Entry16.bin" ; $100 bytes


;;; $ADC0: Samus bottom tiles - set 5 - entry 0 ;;;
SamusTiles_Bottom_Set5_Entry0:
; 62h: Unused - frames 7..9
; B3h: Facing anticlockwise - grapple - in air - frames 7..9
incbin "data/SamusTiles_Bottom_Set5_Entry0.bin" ; $C0 bytes


;;; $AE80: Samus bottom tiles - set 5 - entry 1 ;;;
SamusTiles_Bottom_Set5_Entry1:
; 62h: Unused - frames Ah..Bh
; B3h: Facing anticlockwise - grapple - in air - frames Ah..Bh
incbin "data/SamusTiles_Bottom_Set5_Entry1.bin" ; $120 bytes


;;; $AFA0: Samus bottom tiles - set 5 - entry 2 ;;;
SamusTiles_Bottom_Set5_Entry2:
; 62h: Unused - frames Ch..Dh
; B3h: Facing anticlockwise - grapple - in air - frames Ch..Dh
incbin "data/SamusTiles_Bottom_Set5_Entry2.bin" ; $120 bytes


;;; $B0C0: Samus bottom tiles - set 5 - entry 3 ;;;
SamusTiles_Bottom_Set5_Entry3:
; 62h: Unused - frame Eh
; B3h: Facing anticlockwise - grapple - in air - frame Eh
incbin "data/SamusTiles_Bottom_Set5_Entry3.bin" ; $E0 bytes


;;; $B1A0: Samus bottom tiles - set 5 - entry 4 ;;;
SamusTiles_Bottom_Set5_Entry4:
; 62h: Unused - frame Fh
; B3h: Facing anticlockwise - grapple - in air - frame Fh
incbin "data/SamusTiles_Bottom_Set5_Entry4.bin" ; $100 bytes


;;; $B2A0: Samus bottom tiles - set 5 - entry 5 ;;;
SamusTiles_Bottom_Set5_Entry5:
; 62h: Unused - frame 10h
; B3h: Facing anticlockwise - grapple - in air - frame 10h
incbin "data/SamusTiles_Bottom_Set5_Entry5.bin" ; $100 bytes


;;; $B3A0: Samus bottom tiles - set 5 - entry 6 ;;;
SamusTiles_Bottom_Set5_Entry6:
; 62h: Unused - frame 11h
; B3h: Facing anticlockwise - grapple - in air - frame 11h
incbin "data/SamusTiles_Bottom_Set5_Entry6.bin" ; $C0 bytes


;;; $B460: Samus bottom tiles - set 5 - entry 7 ;;;
SamusTiles_Bottom_Set5_Entry7:
; 62h: Unused - frame 12h
; B3h: Facing anticlockwise - grapple - in air - frame 12h
incbin "data/SamusTiles_Bottom_Set5_Entry7.bin" ; $E0 bytes


;;; $B540: Samus bottom tiles - set 5 - entry 8 ;;;
SamusTiles_Bottom_Set5_Entry8:
; 62h: Unused - frames 13h..14h
; B3h: Facing anticlockwise - grapple - in air - frames 13h..14h
incbin "data/SamusTiles_Bottom_Set5_Entry8.bin" ; $E0 bytes


;;; $B620: Samus bottom tiles - set 5 - entry 9 ;;;
SamusTiles_Bottom_Set5_Entry9:
; 62h: Unused - frames 15h..16h
; B3h: Facing anticlockwise - grapple - in air - frames 15h..16h
incbin "data/SamusTiles_Bottom_Set5_Entry9.bin" ; $100 bytes


;;; $B720: Samus bottom tiles - set 5 - entry Ah ;;;
SamusTiles_Bottom_Set5_EntryA:
; Unused
incbin "data/SamusTiles_Bottom_Set5_EntryA.bin" ; $120 bytes


;;; $B840: Samus bottom tiles - set 5 - entry Bh ;;;
SamusTiles_Bottom_Set5_EntryB:
; 62h: Unused - frame 40h
; B3h: Facing anticlockwise - grapple - in air - frame 40h
incbin "data/SamusTiles_Bottom_Set5_EntryB.bin" ; $100 bytes


;;; $B940: Samus bottom tiles - set 5 - entry Ch ;;;
SamusTiles_Bottom_Set5_EntryC:
; 62h: Unused - frame 41h
; B3h: Facing anticlockwise - grapple - in air - frame 41h
incbin "data/SamusTiles_Bottom_Set5_EntryC.bin" ; $100 bytes


;;; $BA40: Samus bottom tiles - set 5 - entry Dh ;;;
SamusTiles_Bottom_Set5_EntryD:
; 62h: Unused - frames 27h..29h
; B3h: Facing anticlockwise - grapple - in air - frames 27h..29h
incbin "data/SamusTiles_Bottom_Set5_EntryD.bin" ; $100 bytes


;;; $BB40: Samus bottom tiles - set 5 - entry Eh ;;;
SamusTiles_Bottom_Set5_EntryE:
; 62h: Unused - frames 2Ah..2Bh
; B3h: Facing anticlockwise - grapple - in air - frames 2Ah..2Bh
incbin "data/SamusTiles_Bottom_Set5_EntryE.bin" ; $E0 bytes


;;; $BC20: Samus bottom tiles - set 5 - entry Fh ;;;
SamusTiles_Bottom_Set5_EntryF:
; 62h: Unused - frames 2Ch..2Dh
; B3h: Facing anticlockwise - grapple - in air - frames 2Ch..2Dh
incbin "data/SamusTiles_Bottom_Set5_EntryF.bin" ; $100 bytes


;;; $BD20: Samus bottom tiles - set 5 - entry 10h ;;;
SamusTiles_Bottom_Set5_Entry10:
; 62h: Unused - frame 2Eh
; B3h: Facing anticlockwise - grapple - in air - frame 2Eh
incbin "data/SamusTiles_Bottom_Set5_Entry10.bin" ; $100 bytes


;;; $BE20: Samus bottom tiles - set 5 - entry 11h ;;;
SamusTiles_Bottom_Set5_Entry11:
; 62h: Unused - frame 2Fh
; B3h: Facing anticlockwise - grapple - in air - frame 2Fh
incbin "data/SamusTiles_Bottom_Set5_Entry11.bin" ; $E0 bytes


;;; $BF00: Samus bottom tiles - set 5 - entry 12h ;;;
SamusTiles_Bottom_Set5_Entry12:
; 62h: Unused - frame 30h
; B3h: Facing anticlockwise - grapple - in air - frame 30h
incbin "data/SamusTiles_Bottom_Set5_Entry12.bin" ; $100 bytes


;;; $C000: Samus bottom tiles - set 5 - entry 13h ;;;
SamusTiles_Bottom_Set5_Entry13:
; 62h: Unused - frame 31h
; B3h: Facing anticlockwise - grapple - in air - frame 31h
incbin "data/SamusTiles_Bottom_Set5_Entry13.bin" ; $100 bytes


;;; $C100: Samus bottom tiles - set 5 - entry 14h ;;;
SamusTiles_Bottom_Set5_Entry14:
; 62h: Unused - frame 32h
; B3h: Facing anticlockwise - grapple - in air - frame 32h
incbin "data/SamusTiles_Bottom_Set5_Entry14.bin" ; $100 bytes


;;; $C200: Samus bottom tiles - set 5 - entry 15h ;;;
SamusTiles_Bottom_Set5_Entry15:
; 62h: Unused - frames 33h..34h
; B3h: Facing anticlockwise - grapple - in air - frames 33h..34h
incbin "data/SamusTiles_Bottom_Set5_Entry15.bin" ; $140 bytes


;;; $C340: Samus bottom tiles - set 5 - entry 16h ;;;
SamusTiles_Bottom_Set5_Entry16:
; 62h: Unused - frames 35h..36h
; B3h: Facing anticlockwise - grapple - in air - frames 35h..36h
incbin "data/SamusTiles_Bottom_Set5_Entry16.bin" ; $100 bytes


;;; $C440: Samus bottom tiles - set 5 - entry 17h ;;;
SamusTiles_Bottom_Set5_Entry17:
; Unused
incbin "data/SamusTiles_Bottom_Set5_Entry17.bin" ; $100 bytes


;;; $C540: Samus bottom tiles - set 6 - entry 0 ;;;
SamusTiles_Bottom_Set6_Entry0:
; 62h: Unused - frames 17h..19h
; B3h: Facing anticlockwise - grapple - in air - frames 17h..19h
incbin "data/SamusTiles_Bottom_Set6_Entry0.bin" ; $C0 bytes


;;; $C600: Samus bottom tiles - set 6 - entry 1 ;;;
SamusTiles_Bottom_Set6_Entry1:
; 62h: Unused - frames 1Ah..1Bh
; B3h: Facing anticlockwise - grapple - in air - frames 1Ah..1Bh
incbin "data/SamusTiles_Bottom_Set6_Entry1.bin" ; $120 bytes


;;; $C720: Samus bottom tiles - set 6 - entry 2 ;;;
SamusTiles_Bottom_Set6_Entry2:
; 62h: Unused - frames 1Ch..1Dh
; B3h: Facing anticlockwise - grapple - in air - frames 1Ch..1Dh
incbin "data/SamusTiles_Bottom_Set6_Entry2.bin" ; $120 bytes


;;; $C840: Samus bottom tiles - set 6 - entry 3 ;;;
SamusTiles_Bottom_Set6_Entry3:
; 62h: Unused - frame 1Eh
; B3h: Facing anticlockwise - grapple - in air - frame 1Eh
incbin "data/SamusTiles_Bottom_Set6_Entry3.bin" ; $E0 bytes


;;; $C920: Samus bottom tiles - set 6 - entry 4 ;;;
SamusTiles_Bottom_Set6_Entry4:
; 62h: Unused - frame 1Fh
; B3h: Facing anticlockwise - grapple - in air - frame 1Fh
incbin "data/SamusTiles_Bottom_Set6_Entry4.bin" ; $100 bytes


;;; $CA20: Samus bottom tiles - set 6 - entry 5 ;;;
SamusTiles_Bottom_Set6_Entry5:
; 62h: Unused - frame 0
; B3h: Facing anticlockwise - grapple - in air - frame 0
incbin "data/SamusTiles_Bottom_Set6_Entry5.bin" ; $100 bytes


;;; $CB20: Samus bottom tiles - set 6 - entry 6 ;;;
SamusTiles_Bottom_Set6_Entry6:
; 62h: Unused - frame 1
; B3h: Facing anticlockwise - grapple - in air - frame 1
incbin "data/SamusTiles_Bottom_Set6_Entry6.bin" ; $C0 bytes


;;; $CBE0: Samus bottom tiles - set 6 - entry 7 ;;;
SamusTiles_Bottom_Set6_Entry7:
; 62h: Unused - frame 2
; B3h: Facing anticlockwise - grapple - in air - frame 2
incbin "data/SamusTiles_Bottom_Set6_Entry7.bin" ; $E0 bytes


;;; $CCC0: Samus bottom tiles - set 6 - entry 8 ;;;
SamusTiles_Bottom_Set6_Entry8:
; 62h: Unused - frames 3..4
; B3h: Facing anticlockwise - grapple - in air - frames 3..4
incbin "data/SamusTiles_Bottom_Set6_Entry8.bin" ; $E0 bytes


;;; $CDA0: Samus bottom tiles - set 6 - entry 9 ;;;
SamusTiles_Bottom_Set6_Entry9:
; 62h: Unused - frames 5..6
; B3h: Facing anticlockwise - grapple - in air - frames 5..6
incbin "data/SamusTiles_Bottom_Set6_Entry9.bin" ; $100 bytes


;;; $CEA0: Samus bottom tiles - set 6 - entry Ah ;;;
SamusTiles_Bottom_Set6_EntryA:
; Unused
incbin "data/SamusTiles_Bottom_Set6_EntryA.bin" ; $120 bytes


;;; $CFC0: Samus bottom tiles - set 6 - entry Bh ;;;
SamusTiles_Bottom_Set6_EntryB:
; Unused
incbin "data/SamusTiles_Bottom_Set6_EntryB.bin" ; $100 bytes


;;; $D0C0: Samus bottom tiles - set 6 - entry Ch ;;;
SamusTiles_Bottom_Set6_EntryC:
; Unused
incbin "data/SamusTiles_Bottom_Set6_EntryC.bin" ; $100 bytes


;;; $D1C0: Samus bottom tiles - set 6 - entry Dh ;;;
SamusTiles_Bottom_Set6_EntryD:
; 62h: Unused - frames 37h..39h
; B3h: Facing anticlockwise - grapple - in air - frames 37h..39h
incbin "data/SamusTiles_Bottom_Set6_EntryD.bin" ; $100 bytes


;;; $D2C0: Samus bottom tiles - set 6 - entry Eh ;;;
SamusTiles_Bottom_Set6_EntryE:
; 62h: Unused - frames 3Ah..3Bh
; B3h: Facing anticlockwise - grapple - in air - frames 3Ah..3Bh
incbin "data/SamusTiles_Bottom_Set6_EntryE.bin" ; $E0 bytes


;;; $D3A0: Samus bottom tiles - set 6 - entry Fh ;;;
SamusTiles_Bottom_Set6_EntryF:
; 62h: Unused - frames 3Ch..3Dh
; B3h: Facing anticlockwise - grapple - in air - frames 3Ch..3Dh
incbin "data/SamusTiles_Bottom_Set6_EntryF.bin" ; $100 bytes


;;; $D4A0: Samus bottom tiles - set 6 - entry 10h ;;;
SamusTiles_Bottom_Set6_Entry10:
; 62h: Unused - frame 3Eh
; B3h: Facing anticlockwise - grapple - in air - frame 3Eh
incbin "data/SamusTiles_Bottom_Set6_Entry10.bin" ; $100 bytes


;;; $D5A0: Samus bottom tiles - set 6 - entry 11h ;;;
SamusTiles_Bottom_Set6_Entry11:
; 62h: Unused - frame 3Fh
; B3h: Facing anticlockwise - grapple - in air - frame 3Fh
incbin "data/SamusTiles_Bottom_Set6_Entry11.bin" ; $E0 bytes


;;; $D680: Samus bottom tiles - set 6 - entry 12h ;;;
SamusTiles_Bottom_Set6_Entry12:
; 62h: Unused - frame 20h
; B3h: Facing anticlockwise - grapple - in air - frame 20h
incbin "data/SamusTiles_Bottom_Set6_Entry12.bin" ; $100 bytes


;;; $D780: Samus bottom tiles - set 6 - entry 13h ;;;
SamusTiles_Bottom_Set6_Entry13:
; 62h: Unused - frame 21h
; B3h: Facing anticlockwise - grapple - in air - frame 21h
incbin "data/SamusTiles_Bottom_Set6_Entry13.bin" ; $100 bytes


;;; $D880: Samus bottom tiles - set 6 - entry 14h ;;;
SamusTiles_Bottom_Set6_Entry14:
; 62h: Unused - frame 22h
; B3h: Facing anticlockwise - grapple - in air - frame 22h
incbin "data/SamusTiles_Bottom_Set6_Entry14.bin" ; $100 bytes


;;; $D980: Samus bottom tiles - set 6 - entry 15h ;;;
SamusTiles_Bottom_Set6_Entry15:
; 62h: Unused - frames 23h..24h
; B3h: Facing anticlockwise - grapple - in air - frames 23h..24h
incbin "data/SamusTiles_Bottom_Set6_Entry15.bin" ; $100 bytes


;;; $DA80: Samus bottom tiles - set 6 - entry 16h ;;;
SamusTiles_Bottom_Set6_Entry16:
; 62h: Unused - frames 25h..26h
; B3h: Facing anticlockwise - grapple - in air - frames 25h..26h
incbin "data/SamusTiles_Bottom_Set6_Entry16.bin" ; $100 bytes


;;; $DB80: Samus top tiles - set Ch - entry 0 ;;;
SamusTiles_Top_SetC_Entry0:
; CBh: Facing right - shinespark - vertical - frame 0
incbin "data/SamusTiles_Top_SetC_Entry0.bin" ; $1C0 bytes


;;; $DD40: Samus top tiles - set Ch - entry 1 ;;;
SamusTiles_Top_SetC_Entry1:
; CCh: Facing left  - shinespark - vertical - frame 0
incbin "data/SamusTiles_Top_SetC_Entry1.bin" ; $1C0 bytes


;;; $DF00: Samus top tiles - set Ch - entry 2 ;;;
SamusTiles_Top_SetC_Entry2:
; D4h: Facing left  - crystal flash - frame 2
; D4h: Facing left  - crystal flash - frame 6
incbin "data/SamusTiles_Top_SetC_Entry2.bin" ; $140 bytes


;;; $E040: Samus top tiles - set Ch - entry 3 ;;;
SamusTiles_Top_SetC_Entry3:
; D4h: Facing left  - crystal flash - frame 7
; D4h: Facing left  - crystal flash - frame 9
incbin "data/SamusTiles_Top_SetC_Entry3.bin" ; $140 bytes


;;; $E180: Samus top tiles - set Ch - entry 4 ;;;
SamusTiles_Top_SetC_Entry4:
; D4h: Facing left  - crystal flash - frame 8
incbin "data/SamusTiles_Top_SetC_Entry4.bin" ; $140 bytes


;;; $E2C0: Samus top tiles - set Ch - entry 5 ;;;
SamusTiles_Top_SetC_Entry5:
; D3h: Facing right - crystal flash - frame 2
; D3h: Facing right - crystal flash - frame 6
incbin "data/SamusTiles_Top_SetC_Entry5.bin" ; $140 bytes


;;; $E400: Samus top tiles - set Ch - entry 6 ;;;
SamusTiles_Top_SetC_Entry6:
; D3h: Facing right - crystal flash - frame 7
; D3h: Facing right - crystal flash - frame 9
incbin "data/SamusTiles_Top_SetC_Entry6.bin" ; $140 bytes


;;; $E540: Samus top tiles - set Ch - entry 7 ;;;
SamusTiles_Top_SetC_Entry7:
; D3h: Facing right - crystal flash - frame 8
incbin "data/SamusTiles_Top_SetC_Entry7.bin" ; $140 bytes


;;; $E680: Samus bottom tiles - set 7 - entry 0 ;;;
SamusTiles_Bottom_Set7_Entry0:
; D3h: Facing right - crystal flash - frame 0
; D3h: Facing right - crystal flash - frame Dh
; D4h: Facing left  - crystal flash - frame 0
; D4h: Facing left  - crystal flash - frame Dh
incbin "data/SamusTiles_Bottom_Set7_Entry0.bin" ; $80 bytes


;;; $E700: Samus bottom tiles - set 7 - entry 1 ;;;
SamusTiles_Bottom_Set7_Entry1:
; D3h: Facing right - crystal flash - frame 1
; D3h: Facing right - crystal flash - frame Ch
; D4h: Facing left  - crystal flash - frame 1
; D4h: Facing left  - crystal flash - frame Ch
incbin "data/SamusTiles_Bottom_Set7_Entry1.bin" ; $200 bytes


;;; $E900: Samus bottom tiles - set 7 - entry 2 ;;;
SamusTiles_Bottom_Set7_Entry2:
; D3h: Facing right - crystal flash - frames 2..3
; D3h: Facing right - crystal flash - frames 6..9
; D4h: Facing left  - crystal flash - frames 2..3
; D4h: Facing left  - crystal flash - frames 6..9
incbin "data/SamusTiles_Bottom_Set7_Entry2.bin" ; $200 bytes


;;; $EB00: Samus bottom tiles - set Ah - entry 0 ;;;
SamusTiles_Bottom_SetA_Entry0:
; 3: Facing right - aiming up - frames 0..1
; 5: Facing right - aiming up-right - frame 0
; 7: Facing right - aiming down-right - frame 0
; AAh: Facing right - grappling - aiming down-right - frame 0
; CFh: Facing right - ran into a wall - aiming up-right - frame 0
; D1h: Facing right - ran into a wall - aiming down-right - frame 0
incbin "data/SamusTiles_Bottom_SetA_Entry0.bin" ; $140 bytes


;;; $EC40: Samus bottom tiles - set Ah - entry 1 ;;;
SamusTiles_Bottom_SetA_Entry1:
; 4: Facing left  - aiming up - frames 0..1
; 6: Facing left  - aiming up-left - frame 0
; 8: Facing left  - aiming down-left - frame 0
; ABh: Facing left  - grappling - aiming down-left - frame 0
; D0h: Facing left  - ran into a wall - aiming up-left - frame 0
; D2h: Facing left  - ran into a wall - aiming down-left - frame 0
; E9h: Facing left  - Samus drained - crouching/falling - frame 10h
; E9h: Facing left  - Samus drained - crouching/falling - frame 15h
incbin "data/SamusTiles_Bottom_SetA_Entry1.bin" ; $140 bytes


;;; $ED80: Samus top tiles - set 6 - entry Ch ;;;
SamusTiles_Top_Set6_EntryC:
; 62h: Unused - frame 4
; 62h: Unused - frame 24h
; B3h: Facing anticlockwise - grapple - in air - frame 4
; B3h: Facing anticlockwise - grapple - in air - frame 24h
incbin "data/SamusTiles_Top_Set6_EntryC.bin" ; $200 bytes


;;; $EF80: Samus top tiles - set 6 - entry Dh ;;;
SamusTiles_Top_Set6_EntryD:
; 62h: Unused - frame 5
; 62h: Unused - frame 25h
; B3h: Facing anticlockwise - grapple - in air - frame 5
; B3h: Facing anticlockwise - grapple - in air - frame 25h
incbin "data/SamusTiles_Top_Set6_EntryD.bin" ; $200 bytes


;;; $F180: Samus top tiles - set 6 - entry Eh ;;;
SamusTiles_Top_Set6_EntryE:
; 62h: Unused - frame 6
; 62h: Unused - frame 26h
; B3h: Facing anticlockwise - grapple - in air - frame 6
; B3h: Facing anticlockwise - grapple - in air - frame 26h
incbin "data/SamusTiles_Top_Set6_EntryE.bin" ; $200 bytes


;;; $F380: Samus top tiles - set 6 - entry Fh ;;;
SamusTiles_Top_Set6_EntryF:
; 62h: Unused - frame 7
; 62h: Unused - frame 27h
; B3h: Facing anticlockwise - grapple - in air - frame 7
; B3h: Facing anticlockwise - grapple - in air - frame 27h
incbin "data/SamusTiles_Top_Set6_EntryF.bin" ; $1E0 bytes


;;; $F560: Samus top tiles - set 6 - entry 10h ;;;
SamusTiles_Top_Set6_Entry10:
; Unused
incbin "data/SamusTiles_Top_Set6_Entry10.bin" ; $1E0 bytes


;;; $E000: Samus top tiles - set 8 - entry 0 ;;;
SamusTiles_Top_Set8_Entry0:
; 0: Facing forward - power suit - frame 3
; 0: Facing forward - power suit - frame 5
; 0: Facing forward - power suit - frame 7
; 0: Facing forward - power suit - frame 9
; 0: Facing forward - power suit - frame Bh
; 0: Facing forward - power suit - frame Dh
; 0: Facing forward - power suit - frame Fh
; 0: Facing forward - power suit - frame 11h
; 0: Facing forward - power suit - frame 13h
; 0: Facing forward - power suit - frame 15h
; 0: Facing forward - power suit - frame 17h
; 0: Facing forward - power suit - frame 19h
; 0: Facing forward - power suit - frame 1Bh
; 0: Facing forward - power suit - frame 1Dh
; 0: Facing forward - power suit - frame 1Fh
; 0: Facing forward - power suit - frame 21h
; 0: Facing forward - power suit - frame 23h
; 0: Facing forward - power suit - frame 25h
; 0: Facing forward - power suit - frame 27h
; 0: Facing forward - power suit - frame 29h
; 0: Facing forward - power suit - frame 2Bh
; 0: Facing forward - power suit - frame 2Dh
; 0: Facing forward - power suit - frame 2Fh
; 0: Facing forward - power suit - frame 31h
; 0: Facing forward - power suit - frame 33h
; 0: Facing forward - power suit - frame 35h
; 0: Facing forward - power suit - frame 37h
; 0: Facing forward - power suit - frame 39h
; 0: Facing forward - power suit - frame 3Bh
; 0: Facing forward - power suit - frame 3Dh
; 0: Facing forward - power suit - frame 3Fh
; 0: Facing forward - power suit - frame 41h
; 0: Facing forward - power suit - frame 43h
; 0: Facing forward - power suit - frame 45h
; 0: Facing forward - power suit - frame 47h
; 0: Facing forward - power suit - frame 49h
; 0: Facing forward - power suit - frame 4Bh
; 0: Facing forward - power suit - frame 4Dh
; 0: Facing forward - power suit - frame 4Fh
; 0: Facing forward - power suit - frame 51h
; 0: Facing forward - power suit - frame 53h
; 0: Facing forward - power suit - frame 55h
; 0: Facing forward - power suit - frame 57h
; 0: Facing forward - power suit - frame 59h
; 0: Facing forward - power suit - frame 5Bh
; 0: Facing forward - power suit - frame 5Dh
; 0: Facing forward - power suit - frame 5Fh
; 9Bh: Facing forward - varia/gravity suit - frame 3
; 9Bh: Facing forward - varia/gravity suit - frame 5
; 9Bh: Facing forward - varia/gravity suit - frame 7
; 9Bh: Facing forward - varia/gravity suit - frame 9
; 9Bh: Facing forward - varia/gravity suit - frame Bh
; 9Bh: Facing forward - varia/gravity suit - frame Dh
; 9Bh: Facing forward - varia/gravity suit - frame Fh
; 9Bh: Facing forward - varia/gravity suit - frame 11h
; 9Bh: Facing forward - varia/gravity suit - frame 13h
; 9Bh: Facing forward - varia/gravity suit - frame 15h
; 9Bh: Facing forward - varia/gravity suit - frame 17h
; 9Bh: Facing forward - varia/gravity suit - frame 19h
; 9Bh: Facing forward - varia/gravity suit - frame 1Bh
; 9Bh: Facing forward - varia/gravity suit - frame 1Dh
; 9Bh: Facing forward - varia/gravity suit - frame 1Fh
; 9Bh: Facing forward - varia/gravity suit - frame 21h
; 9Bh: Facing forward - varia/gravity suit - frame 23h
; 9Bh: Facing forward - varia/gravity suit - frame 25h
; 9Bh: Facing forward - varia/gravity suit - frame 27h
; 9Bh: Facing forward - varia/gravity suit - frame 29h
; 9Bh: Facing forward - varia/gravity suit - frame 2Bh
; 9Bh: Facing forward - varia/gravity suit - frame 2Dh
; 9Bh: Facing forward - varia/gravity suit - frame 2Fh
; 9Bh: Facing forward - varia/gravity suit - frame 31h
; 9Bh: Facing forward - varia/gravity suit - frame 33h
; 9Bh: Facing forward - varia/gravity suit - frame 35h
; 9Bh: Facing forward - varia/gravity suit - frame 37h
; 9Bh: Facing forward - varia/gravity suit - frame 39h
; 9Bh: Facing forward - varia/gravity suit - frame 3Bh
; 9Bh: Facing forward - varia/gravity suit - frame 3Dh
; 9Bh: Facing forward - varia/gravity suit - frame 3Fh
; 9Bh: Facing forward - varia/gravity suit - frame 41h
; 9Bh: Facing forward - varia/gravity suit - frame 43h
; 9Bh: Facing forward - varia/gravity suit - frame 45h
; 9Bh: Facing forward - varia/gravity suit - frame 47h
; 9Bh: Facing forward - varia/gravity suit - frame 49h
; 9Bh: Facing forward - varia/gravity suit - frame 4Bh
; 9Bh: Facing forward - varia/gravity suit - frame 4Dh
; 9Bh: Facing forward - varia/gravity suit - frame 4Fh
; 9Bh: Facing forward - varia/gravity suit - frame 51h
; 9Bh: Facing forward - varia/gravity suit - frame 53h
; 9Bh: Facing forward - varia/gravity suit - frame 55h
; 9Bh: Facing forward - varia/gravity suit - frame 57h
; 9Bh: Facing forward - varia/gravity suit - frame 59h
; 9Bh: Facing forward - varia/gravity suit - frame 5Bh
; 9Bh: Facing forward - varia/gravity suit - frame 5Dh
; 9Bh: Facing forward - varia/gravity suit - frame 5Fh
incbin "data/SamusTiles_Top_Set8_Entry0.bin" ; $20 bytes


;;; $E020: Samus top tiles - set 8 - entry 1 ;;;
SamusTiles_Top_Set8_Entry1:
; Unused
incbin "data/SamusTiles_Top_Set8_Entry1.bin" ; $20 bytes


;;; $E040: Samus top tiles - set 8 - entry 2 ;;;
SamusTiles_Top_Set8_Entry2:
; 0: Facing forward - power suit - frame 2
; 0: Facing forward - power suit - frame 8
; 0: Facing forward - power suit - frame Eh
; 0: Facing forward - power suit - frame 14h
; 0: Facing forward - power suit - frame 1Ah
; 0: Facing forward - power suit - frame 20h
; 0: Facing forward - power suit - frame 26h
; 0: Facing forward - power suit - frame 2Ch
; 0: Facing forward - power suit - frame 32h
; 0: Facing forward - power suit - frame 38h
; 0: Facing forward - power suit - frame 3Eh
; 0: Facing forward - power suit - frame 44h
; 0: Facing forward - power suit - frame 4Ah
; 9Bh: Facing forward - varia/gravity suit - frame 2
; 9Bh: Facing forward - varia/gravity suit - frame 8
; 9Bh: Facing forward - varia/gravity suit - frame Eh
; 9Bh: Facing forward - varia/gravity suit - frame 14h
; 9Bh: Facing forward - varia/gravity suit - frame 1Ah
; 9Bh: Facing forward - varia/gravity suit - frame 20h
; 9Bh: Facing forward - varia/gravity suit - frame 26h
; 9Bh: Facing forward - varia/gravity suit - frame 2Ch
; 9Bh: Facing forward - varia/gravity suit - frame 32h
; 9Bh: Facing forward - varia/gravity suit - frame 38h
; 9Bh: Facing forward - varia/gravity suit - frame 3Eh
; 9Bh: Facing forward - varia/gravity suit - frame 44h
; 9Bh: Facing forward - varia/gravity suit - frame 4Ah
incbin "data/SamusTiles_Top_Set8_Entry2.bin" ; $120 bytes


;;; $E160: Samus top tiles - set 8 - entry 3 ;;;
SamusTiles_Top_Set8_Entry3:
; 0: Facing forward - power suit - frame 4
; 0: Facing forward - power suit - frame Ah
; 0: Facing forward - power suit - frame 10h
; 0: Facing forward - power suit - frame 16h
; 0: Facing forward - power suit - frame 1Ch
; 0: Facing forward - power suit - frame 22h
; 0: Facing forward - power suit - frame 28h
; 0: Facing forward - power suit - frame 2Eh
; 0: Facing forward - power suit - frame 34h
; 0: Facing forward - power suit - frame 3Ah
; 0: Facing forward - power suit - frame 40h
; 0: Facing forward - power suit - frame 46h
; 0: Facing forward - power suit - frame 4Ch
; 9Bh: Facing forward - varia/gravity suit - frame 4
; 9Bh: Facing forward - varia/gravity suit - frame Ah
; 9Bh: Facing forward - varia/gravity suit - frame 10h
; 9Bh: Facing forward - varia/gravity suit - frame 16h
; 9Bh: Facing forward - varia/gravity suit - frame 1Ch
; 9Bh: Facing forward - varia/gravity suit - frame 22h
; 9Bh: Facing forward - varia/gravity suit - frame 28h
; 9Bh: Facing forward - varia/gravity suit - frame 2Eh
; 9Bh: Facing forward - varia/gravity suit - frame 34h
; 9Bh: Facing forward - varia/gravity suit - frame 3Ah
; 9Bh: Facing forward - varia/gravity suit - frame 40h
; 9Bh: Facing forward - varia/gravity suit - frame 46h
; 9Bh: Facing forward - varia/gravity suit - frame 4Ch
incbin "data/SamusTiles_Top_Set8_Entry3.bin" ; $E0 bytes


;;; $E240: Samus top tiles - set 8 - entry 4 ;;;
SamusTiles_Top_Set8_Entry4:
; 0: Facing forward - power suit - frame 6
; 0: Facing forward - power suit - frame Ch
; 0: Facing forward - power suit - frame 12h
; 0: Facing forward - power suit - frame 18h
; 0: Facing forward - power suit - frame 1Eh
; 0: Facing forward - power suit - frame 24h
; 0: Facing forward - power suit - frame 2Ah
; 0: Facing forward - power suit - frame 30h
; 0: Facing forward - power suit - frame 36h
; 0: Facing forward - power suit - frame 3Ch
; 0: Facing forward - power suit - frame 42h
; 0: Facing forward - power suit - frame 48h
; 0: Facing forward - power suit - frame 4Eh
; 9Bh: Facing forward - varia/gravity suit - frame 6
; 9Bh: Facing forward - varia/gravity suit - frame Ch
; 9Bh: Facing forward - varia/gravity suit - frame 12h
; 9Bh: Facing forward - varia/gravity suit - frame 18h
; 9Bh: Facing forward - varia/gravity suit - frame 1Eh
; 9Bh: Facing forward - varia/gravity suit - frame 24h
; 9Bh: Facing forward - varia/gravity suit - frame 2Ah
; 9Bh: Facing forward - varia/gravity suit - frame 30h
; 9Bh: Facing forward - varia/gravity suit - frame 36h
; 9Bh: Facing forward - varia/gravity suit - frame 3Ch
; 9Bh: Facing forward - varia/gravity suit - frame 42h
; 9Bh: Facing forward - varia/gravity suit - frame 48h
; 9Bh: Facing forward - varia/gravity suit - frame 4Eh
incbin "data/SamusTiles_Top_Set8_Entry4.bin" ; $160 bytes


;;; $E3A0: Samus top tiles - set 8 - entry 5 ;;;
SamusTiles_Top_Set8_Entry5:
; 0: Facing forward - power suit - frame 50h
; 9Bh: Facing forward - varia/gravity suit - frame 50h
incbin "data/SamusTiles_Top_Set8_Entry5.bin" ; $1E0 bytes


;;; $E580: Samus top tiles - set 8 - entry 6 ;;;
SamusTiles_Top_Set8_Entry6:
; 0: Facing forward - power suit - frame 52h
; 9Bh: Facing forward - varia/gravity suit - frame 52h
incbin "data/SamusTiles_Top_Set8_Entry6.bin" ; $100 bytes


;;; $E680: Samus top tiles - set 8 - entry 7 ;;;
SamusTiles_Top_Set8_Entry7:
; 0: Facing forward - power suit - frame 54h
; 0: Facing forward - power suit - frame 5Ah
; 9Bh: Facing forward - varia/gravity suit - frame 54h
; 9Bh: Facing forward - varia/gravity suit - frame 5Ah
incbin "data/SamusTiles_Top_Set8_Entry7.bin" ; $140 bytes



; This section writes $FF bytes over the old graphics, which is optional (at the top)
if !MARK_FREESPACE
fillbyte $FF

org $9BE000
fill $2000

org $9C8000
fill $8000

org $9D8000
fill $8000

org $9E8000
fill $8000

org $9F8000
fill $8000
endif


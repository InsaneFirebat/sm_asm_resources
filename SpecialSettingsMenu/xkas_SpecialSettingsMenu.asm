
; Special Settings Menu ASM
; Use this ASM to replace the Icon Cancel menu option with your own setting
; Intended for use with xkas assembler
; Thanks to P.JBoy's bank logs https://patrickjohnston.org/bank/82

lorom


org $82F0AE
SpecialSettingsAddressTable:
; Any two addresses in bank $7E    <------------------------ SET THE ADDRESS OF YOUR SETTINGS
; IconCancel, MoonWalk
    dw $09EA, $09E4
warnpc $82F0B2


org $82FD90 ;    <------------------------------------------ SET TO $C8 BYTES OF FREESPACE IN BANK $82
print "Bank $82 start ", pc

EditedTilemap:
; Setting name can be up to 13 characters long      ┌------- NAME YOUR SETTINGS
; Enabled and disabled text is 6 characters each    |
; The bracketed area represents which tiles will    |
; have their palettes adjusted when toggled         |
; Spaces are used at the end to overwrite tiles     V
  .opt0
  ..upper
table resources\LargeUpperChar.tbl
    db "ICON CANCEL  AUTO   MANUAL", $FF
;       [           ][    ] [    ]
  ..lower
table resources\LargeLowerChar.tbl
    db "ICON CANCEL  AUTO   MANUAL", $FF
;       [           ][    ] [    ]

  .opt1
  ..upper
table resources\LargeUpperChar.tbl
    db "MOON WALK     ON      OFF ", $FF
;       [           ][    ] [    ]
  ..lower
table resources\LargeLowerChar.tbl
    db "MOON WALK     ON      OFF ", $FF
;       [           ][    ] [    ]

EditSpecOptTilemap:
; This routine edits the tilemap after decompression

; Uncomment this code if you want to clear out the    <----- ARE YOU REPLACING MOON WALK?
; (SHOT HOLD+dpad) description text under Moon Walk
;    LDA #$000F
;    LDX #$03C4
;-   STA $7E3000,X
;    INX #2 : CPX #$0420 : BNE -
; ----- End of optional code -----

    SEP #$20
    LDX #$01C6
    LDY #$0000
-   LDA.w EditedTilemap_opt0_upper,Y : CMP #$FF : BEQ +
    STA $7E3000,X
    INX #2
    INY
    BRA -

+   LDX #$0206
    LDY #$0000
-   LDA.w EditedTilemap_opt0_lower,Y : CMP #$FF : BEQ +
    STA $7E3000,X
    INX #2
    INY
    BRA -

+   LDX #$0346
    LDY #$0000
-   LDA.w EditedTilemap_opt1_upper,Y : CMP #$FF : BEQ +
    STA $7E3000,X
    INX #2
    INY
    BRA -

+   LDX #$0386
    LDY #$0000
-   LDA.w EditedTilemap_opt1_lower,Y : CMP #$FF : BEQ +
    STA $7E3000,X
    INX #2
    INY
    BRA -

+   REP #$20
    RTS

print "Bank $82 end ", pc


org $82EFA6
; Slip in our hijack after freeing up 3 bytes
    JSR EditSpecOptTilemap
    STZ $099E
    JSR $F0B9
    INC $099E ; Replaces LDA #$0001 : STA $099E
warnpc $82EFB2

cleartable

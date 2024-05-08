.import Main

.segment "HEADER"
  .byte "NES", $1A              ; iNES header identifier
  .byte 2                       ; quantidade de PRGROM, em blocos de 16K
  .byte 1                       ; quantidade de CHRROM, em blocos de 8K
  .byte 1,0                     ; mapper 0, vertical mirroring

.segment "VECTORS"
  .addr nmi                     ; when an NMI (non-maskable interrupt) happens (once per frame if enabled) the label nmi
  .addr reset                   ; when the processor first turns on or is reset, it will jump to the label reset
  .addr 0                       ; external interrupt IRQ (unused)

.segment "STARTUP"

.segment "CHARS"

.segment "CODE"

.proc nmi
  bit $2002
  lda #0
  sta $2006
  sta $2006
  rti
.endproc

.proc ResetPalettes
  bit $2002
  lda #$3f
  sta $2006
  lda #$00
  sta $2006
  lda #$0F
  ldx #$20
  @paletteLoadLoop:
    sta $2007
    dex
    bne @paletteLoadLoop
    rts
.endproc

.proc reset
  sei
  cld
  ldx #%01000000
  stx $4017
  ldx #$ff
  txs
  ldx #0
  stx $2000
  stx $2001
  stx $4010
  bit $2002
  @vblankWait1:
    bit $2002
    bpl @vblankWait1
  @clearMemory:
    lda #$00
    sta $0000, x
    sta $0100, x
    sta $0200, x
    sta $0300, x
    sta $0400, x
    sta $0500, x
    sta $0600, x
    sta $0700, x
    inx
    bne @clearMemory
  @vblankWait2:
    bit $2002
    bpl @vblankWait2
    jsr ResetPalettes
  main:
    jsr Main
    lda #%00001000
    sta $2001
  endlessLoop:
    jmp endlessLoop
.endproc

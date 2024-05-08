.export Main
.segment "CODE"

.proc Main
  ldx #178                      ; carrega valor 178 em X
  stx $00                       ; guarda X em $00
  ldx #245                      ; carrega valor 245 em X
  stx $01                       ; guarda X em $01

  lda $00                       ; carrega valor de $00 em A
  clc                           ; limpa a carry flag (C)
  adc $01                       ; soma valor de A + $01 + carry flag

  sta $02                       ; guarda o primeiro byte da conta em $02

  lda #0                        ; carrega valor 0 em a
  adc #0                        ; soma valor de A + 0 + carry flag
  sta $03                       ; armazena o segundo byte da conta

  rts
.endproc

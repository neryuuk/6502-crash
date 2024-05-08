.export Main
.segment "CODE"

.proc Main
  lda #%00010000
  ora #%10000000

  lda #%01010101
  and #%11101110

  rts
.endproc

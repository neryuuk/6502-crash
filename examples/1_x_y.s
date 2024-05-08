.export Main
.segment "CODE"

.proc Main
  ldx #5                        ; carrega a constante 5 no registrador x
  ldy #5                        ; carrega a constante 5 no registrador x

  inx                           ; registrador x++
  inx
  dex                           ; registrador x--

  dey                           ; registrador y--
  dey
  iny                           ; registrador y++

  rts                           ; sair da subrotina atual
.endproc

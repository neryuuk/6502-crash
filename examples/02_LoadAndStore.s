.export Main
.segment "CODE"

.proc Main
  ldx #10                       ; armazena o valor 10 no registrador x
  stx $00                       ; armazena o valor de x no endereço $00
  stx $01                       ; armazena o valor de x no endereço $01

  inc $00                       ; valor dentro de $00 ++
  dec $01                       ; valor dentro de $01 --

  ldx $00                       ; carrega o valor de $00 no registrador x
  stx $0300                     ; armazena valor de x no endereço $0300
  ldx $01                       ; carrega o valor de $01 no registrador x
  stx $0301                     ; armazena valor de x no endereço $0301

  rts
.endproc

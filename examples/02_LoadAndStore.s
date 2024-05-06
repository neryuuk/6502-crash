.export Main
.segment "CODE"

.proc Main
  ; Inicialização de memória ZeroPage
  ; Os primeiros 256 bytes de memória do 6502 são chamados de ZeroPage
  ; Carrega o valor '10' no registrador X
  ; # significa uma constante ou valor imediato
  ; o valor sem $ ou % indica que é um valor decimal
  ldx #10
  ; Armazena o conteúdo do registrador X no endereço de memória $00
  ; $ indica que o número é hexadecimal
  ; % indica que o número é binário
  stx $00
  ; Immediate addressing
  ; Só funciona com endereços de 1 byte
  stx $01

  ; Incremento do valor armazenado no endereço de memória $00
  inc $00
  ; Decremento do valor armazenado no endereço de memória $01
  dec $01

  ; Carrega o valor armazenado no endereço de memória $00 dentro do registrador X
  ldx $00
  ; Armazena o conteúdo do registrador X no endereço de memória $0300
  stx $0300
  ; Carrega o valor armazenado no endereço de memória $01 dentro do registrador X
  ldx $01
  ; Armazena o conteúdo do registrador X no endereço de memória $0301
  stx $0301

  rts
.endproc

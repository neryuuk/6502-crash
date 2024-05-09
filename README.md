# 6502 AssemblyCrashCourse

Code-along Examples for the [6502 Assembly Crash Course Video](https://www.youtube.com/watch?v=yEiNs7pKNh8).

## Building the Examples

```shell
$ cl65 --verbose --target nes -o wrapper.nes wrapper.s examples/01_XandY.s
```

## License

MIT

## Value types

```asm
lda #35                         ;   representa números decimais
lda #%00010000                  ; % representa números binários
lda #$00FF                      ; $ representa números hexadecimais
lda #$0F                        ; # representa um valor constante / imediato
```

## Addressing modes

### Immediate addressing

- valores acompanhados de `#` são chamados de valores imediatos ou constantes.
  - estes valores tem tamanho máximo de 1 byte
  - `#10`

### ZeroPage addressing

- Endereçamento utilizando apenas 8 bits / 1 byte que indicam o uso da memória ZeroPage
  - `stx $01`

### Implicit addressing

- Endereçamento implícito (sem necessidade de utilizar um operando para apontar o endereço)
  - `inx ; incrementa 1 no registrador X`

## ZeroPage Memory

- O intervalo de memória `$0000-$00FF` (256 bytes) é chamado de ZeroPage memory
- Instruções presentes neste bloco de memória vão rodar mais rápido que instruções do resto da memória
- A utilização desse intervalo é feita através da utilização do endereço de memória com apenas 8 bits, chamado endereçamento imediato (immediate addressing)

```asm
stx $01                         ; Armazenando registrador X no endereço ZeroPage $01
ldx $00                         ; Carregando valor do endereço ZeroPage $00 no registrador X
```

## Realizando cálculos

- Somar dois números
  - Só é possível somar valores que totalizem 511 por vez
    - 255 do primeiro valor
    - 255 do segundo valor
    - 1 da flag de carry

### Inicializando a memória

```asm
ldx #172                        ; carregar a constante 172 no registrador X
stx $00                         ; armazenar valor de X no endereço de memória $00
ldx #245                        ; carregar a constante 245 no registrador X
stx $01                         ; armazenar valor de X no endereço de memória $01
```

### Realizando a operação

```asm
lda $00                         ; carregar valor do endereço $00 no acumulador (A)
clc                             ; limpar flag de carry
adc $01                         ; somar o valor de $01 + A + carry flag
sta $02                         ; armazenar o valor de A no endereço $02
```

### Guardando o valor da flag de carry

```asm
lda #0                          ; zerar o valor do acumulador (A)
adc #0                          ; somar 0 + A + carry flag
sta $03                         ; armazenar o valor de A no endereço $03
```

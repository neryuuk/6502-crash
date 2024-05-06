# 6502 AssemblyCrashCourse

Code-along Examples for the [6502 Assembly Crash Course Video](https://www.youtube.com/watch?v=yEiNs7pKNh8).

## Building the Examples

```shell
$ cl65 --verbose --target nes -o wrapper.nes wrapper.s examples/01_XandY.s
```

## License

MIT

## Value types

- `%` números binários
  - `%00010000`
- `$` números hexadecimais
  - `$00FF`
- números decimais
  - `35`

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

```s
; Armazenando registrador X no endereço ZeroPage $01
stx $01

; Carregando valor do endereço ZeroPage $00 no registrador X
ldx $00
```

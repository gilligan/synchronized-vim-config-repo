" Vim syntax file
" Language:	MOS 6502 assembler
" By: Oyd E. Leven <oyd11@softhome.net>
" Creation date: 29-Jan-2005
" Version 0.01

" Remove any old syntax stuff hanging about
syn clear
syn case ignore
"
" registers
syn keyword asm65Reg x y a

" opcodes:

syn keyword asm65Op  adc and asl bit brk clc cld cli clv cmp cpx cpy dec dex dey eor inc inx iny  lda ldx ldy lsr nop ora pha php pla plp rol ror rti rts sbc sec sed sei sta stx sty tax tay tsx txa txs tya txy tyx tcd tdc tcs tsc xba xce phx phy plx ply phb plb phk phd pld pea pei per mvn mvp stz bra brl rtl

syn keyword asm65Branch bcc bcs beq bmi bne bpl bvc bvs jmp jsr bge blt


syn match asmLabel		"^[a-z_][a-z0-9_]*"
syn match asmComment		";.*"hs=s+1 contains=asmTodo
syn keyword asmTodo	contained todo fixme xxx warning danger note notice bug
syn region asmString		start=+"+ skip=+\\"+ end=+"+
syn keyword asmSettings		opt org include global segment bank ifdef endif struct endstruct macro endmacro tag asciiz byte word incbin

syn match decNumber	"\<\d\+\>"
syn match hexNumber	"\$\x\+\>" " 'bug', but adding \< doesn't behave!
syn match binNumber	"%[01]\+\>" 
syn match asmImmediate	"#\$\x\+\>"
syn match asmImmediate	"#\d\+\>"
syn match asmImmediate	"<\$\x\+\>"
syn match asmImmediate	"<\d\+\>"
syn match asmImmediate	">\$\x\+\>"
syn match asmImmediate	">\d\+\>"
syn match asmImmediate	"#<\$\x\+\>"
syn match asmImmediate	"#<\d\+\>"
syn match asmImmediate	"#>\$\x\+\>"
syn match asmImmediate	"#>\d\+\>"

"
"syn case match
if !exists("did_asm65_syntax_inits")
  let did_rgb_asm_syntax_inits = 1

  " The default methods for highlighting.  Can be overridden later
  hi link asmLabel	Label
  hi link asmString	String
  hi link asmComment	Comment
  hi link asmSettings	Special
 hi link asm65Op Statement
 hi link asmSallyUndoc Special
 hi link asm65Reg Identifier
 hi link asm65Branch Conditional
 hi link asmTodo Debug

  hi link asmImmediate Special

  hi link hexNumber	Number
  hi link binNumber	Number
  hi link decNumber	Number

  " My default color overrides:
"  hi asmSpecialComment ctermfg=red
"  hi asmIdentifier ctermfg=lightcyan
"  hi asmType ctermbg=black ctermfg=brown

endif

let b:current_syntax = "rgbasm"


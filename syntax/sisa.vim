" Vim syntax file
" Language: SISA-F 
" Maintainer: Sergi Garcia Ibañez
" Latest Revision: 09 November 2020

if exists("b:current_syntax")
  finish
endif

" Sisa preprocesor labels starts with a dot. are like .data .text ...
syn match sisaPreLabels "\.[A-Za-z]\+"

" Sisa instructions uppercase 
syn keyword sisaInstructions AND OR XOR NOT ADD SUB SHA SHL CMPLT CMPLE CMPEQ CMPLTU CMPLEU ADDI LD ST MOVI MOVHI BZ BNZ IN OUT MUL MULH MULHU DIV DIVU ADDF MULF DIVF CMPLT CMPLEF CMPEQF JZ JNZ JMP JAL LDF STF LDB STB EI DI RETI GETIID RDS WRS

" Sisa instructionsin lowercase
syn keyword sisaInstructions and or xor not add sub sha shl cmplt cmple cmpeq cmpltu cmpleu addi ld st movi movhi bz bnz in out mul mulh mulhu div divu addf mulf divf cmplt cmplef cmpeqf jz jnz jmp jal ldf stf ldb stb ei di reti getiid rds wrs

syn keyword sisaHalt HALT

" Register in sisa-f are R0-7 F0-7 S0-7
syn keyword sisaRegisters R0 R1 R2 R3 R4 R5 R6 R7 F0 F1 F2 F3 F4 F5 F6 F7 S0 S1 S2 S3 S4 S5 S6 S7

" In sisa we can use + - / * on instant instruction (ADDI, ST...) an example ADDI R0, R1, 2*4-2 We want to highlight these operators
syn match InstantOperators "\*"
syn match InstantOperators "+"
syn match InstantOperators "-"
syn match InstantOperators "\/"


" sisa comments starts with ; and run until the end of line
syn match sisaComment ";.*$"

" include in sisa are like: .include "file"
syn match sisaString '".*"'
syn match sisaInclude "\.include" nextgroup=sisaString

" Macros in sisa are: $SOMETHING and stop when a space is detected
syn match sisaMacro "\$\S*"

" Labels in sisa are like: something:
syn match sisaLabel "^[A-Za-z ]*:"

" We want to highlight the constants, in sisa can be decimal and hex numbers
syn match sisaConstants "[0-9]\+"

" Hex should be detected after the check of a number to not override the regex
syn match sisaConstants "0[xX][0-9a-fA-F]\+"

" Sisa chars are: 'a 'b 'c
syn match sisaChars "'[A-Za-z]"

" Sisa types are .byte .word .float
syn match sisaTypes "\.word"
syn match sisaTypes "\.byte"
syn match sisaTypes "\.float"
syn match sisaTypes "\.ascii"

"----------------------------------------------------------------------------/
"  Setup syntax highlighting
"----------------------------------------------------------------------------/

hi def link sisaTypes           Identifier
hi def link sisaMacro           Identifier
hi def link InstantOperators    Identifier

hi def link sisaPreLabels       PreProc
hi def link sisaInclude         PreProc

hi def link sisaComment         Comment

hi def link sisaInstructions    Statement

hi def link sisaHalt            WarningMsg 

hi def link sisaLabel           Function

hi def link sisaRegisters       Constant
hi def link sisaConstants       Constant

hi def link sisaChars           String
hi def link sisaString          String  


if exists("b:current_syntax")
  finish
endif

syn match paren        /[\[\](){}]/
syn match parenCurly   /[{}]/

syn region yarnLineComment start='\v((\/)@<!\/{2}(\/)@!|\/{4,})' end='\v$' keepend

syn region yarnParenPair   start='(' end=')' transparent extend
syn region yarnCodeBlock   start='\v\{' end='\v\}' transparent extend fold
syn region yarnBracket     start='\v\[' end='\v\]' extend fold

hi def link yarnLineComment               String

hi def link yarnParenPair                 NonText
hi def link yarnCodeBlock                 NonText
hi def link yarnBracket                   NonText

let b:current_syntax = "yarn"

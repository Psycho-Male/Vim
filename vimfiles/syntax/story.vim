" Quit when a syntax file was already loaded.
if exists('b:current_syntax')
    finish  
endif

syn keyword storyDirection GOTO SEE 
syn keyword storyVariable health crowns relationship containedin=storyDialogue, storyRoute

syn region storyRoute start='{' end='}'
syn region storyDialogue start='"' end=','

" Comments
syn region storyTodo start='TODO' end='\.'  fold extend
syn region storyLineComment start='\v((\/)@<!\/{2}(\/)@!|\/{4,})' end='\v$' 
syn region storyDocComment start='\v(\/)@<!\/{3}(\/)@!' end='\v$' 
syn region storyBlockComment start='\v\/\*' end='\v\*\/'  fold extend

" Tag
syn match helpTag		"\t[* ]Tag\t\+[a-z].*"

" Group Name  Description
" Comment     Comments within a program
" Constant    Program constants, such as numbers, quoted strings, or true/false
" Identifier  Variable identifier names
" Statement   A programming language statement, usually a keyword like "if" or "while"
" PreProc     A preprocessor, such as "#include" in C
" Type        A variable datatype, such as "int"
" Special     A special symbol, usually used for special characters like "\n" in strings
" Underlined  Text that should be underlined
" Error       Text which contains a programming language error
hi def link storyValue                      String

hi def link storyDirection                  Constant

hi def link storyRoute                      Function

hi def link storyDialogue                   Special

hi def link storyVariable                   Statement

hi def link storyDocComment                 Comment
hi def link storyLineComment                Comment
hi def link storyBlockComment               Comment
hi def link storyTodo                       Comment

hi def link helpTag		            Tag

let b:current_syntax = 'story'

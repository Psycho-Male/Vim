"syn keyword loggerInfo    INFO      containedin=loggerLogLevel
"syn keyword loggerDebug   DEBUG     containedin=loggerLogLevel
"syn keyword loggerError   ERROR     containedin=loggerLogLevel   
"syn keyword loggerWarn    WARN      containedin=loggerLogLevel
"syn keyword loggerFatal   FATAL     containedin=loggerLogLevel
"syn keyword loggerTrace   TRACE     containedin=loggerLogLevel

syn match loggerInfo        "^.*INFO.*$"        
syn match loggerDEBUG       "^.*DEBUG.*$"
syn match loggerError       "^.*ERROR.*$"
syn match loggerWarn        "^.*WARN.*$"
syn match loggerFatal       "^.*FATAL.*$"
syn match loggerTrace       "^.*TRACE.*$"
syn match loggerExcep       "^.*EXCEP.*$"

"syn match number /\d/ containedin=loggerTimeStamp

"syn region loggerLogLevel matchgroup=extraInfo start='\[' end=']' concealends extend
"syn region loggerTimeStamp matchgroup=extraInfo start='{' end='}' concealends extend contains=number





hi def link loggerInfo              LogLevelInfo      
hi def link loggerDebug             LogLevelDebug     
hi def link loggerError             LogLevelError     
hi def link loggerWarn              LogLevelWarn      
hi def link loggerFatal             LogLevelFatal     
hi def link loggerExcep             LogLevelFatal     
hi def link loggerTrace             LogLevelTrace     

let b:current_syntax = 'logger'

if exists("b:current_syntax") && b:current_syntax == "logger"
  finish
endif

syn keyword info    INFO containedin=logLevel
syn keyword debug   DEBUG
syn keyword error   ERROR
syn keyword warn    WARN
syn keyword fatal   FATAL
syn keyword trace   TRACE

syn region logLevel matchgroup=extraInfo start='\[' end=']' concealends contains=info extend
syn region timeStamp matchgroup=extraInfo start='{' end='}' concealends

syn match number /^\d\+/




hi def link info            LoglevelInfo
hi def link debug           LoglevelDebug
hi def link error           LoglevelError
hi def link warn            LoglevelWarn
hi def link fatal           LoglevelFataal
hi def link trace           LoglevelTrace
hi def link timeStamp       LogTimeStamp
hi def link number          LogNumber

let b:current_syntax = 'logger'

"Vim color file
"color scheme name: Psycho
"author: Psycho-Male

highlight clear
if exists("syntax_on")
  syntax reset
endif

"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "psycho"

let s:fg            = {"gui": "#90A0B0", "cterm": "0"}
let s:bg            = {"gui": "#091114", "cterm": "1"}
let s:bg_l1         = {"gui": "#182e36", "cterm": "0"}
let s:dark          = {"gui": "#585878", "cterm": "0"}
let s:black         = {"gui": "#000000", "cterm": "1"}
let s:red           = {"gui": "#F00000", "cterm": "0"}
let s:green         = {"gui": "#00A000", "cterm": "0"}
let s:blue          = {"gui": "#4478c7", "cterm": "0"}
let s:blueish       = {"gui": "#ff00ea", "cterm": "0"}
let s:yellow        = {"gui": "#B0B060", "cterm": "0"}
let s:teal          = {"gui": "#00D0E0", "cterm": "0"}
let s:turqoise      = {"gui": "#00B090", "cterm": "0"}
let s:magenta       = {"gui": "#FF00FF", "cterm": "0"}
let s:brightyellow  = {"gui": "#e8fc03", "cterm": "0"}
let s:amber         = {"gui": "#C08000", "cterm": "0"}
let s:purple        = {"gui": "#B060FF", "cterm": "0"}
let s:orange        = {"gui": "#dba009", "cterm": "0"}
let s:darkpurple    = {"gui": "#80548a", "cterm": "0"}
let s:darkish       = {"gui": "#805b7c", "cterm": "0"}


let s:changethis = s:magenta

function! s:h(group, style)
    let s:ctermformat = "NONE"
    let s:guiformat = "NONE"
    if has_key(a:style, "format")

        let s:ctermformat = a:style.format
        let s:guiformat = a:style.format
    endif

    execute "highlight" a:group
        \ "guifg="   (has_key(a:style, "fg")      ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")      ? a:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")      ? a:style.sp.gui   : "NONE")
        \ "gui="     (!empty(s:guiformat) ? s:guiformat   : "NONE")
        \ "ctermfg=" (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
        \ "cterm="   (!empty(s:ctermformat) ? s:ctermformat   : "NONE")
endfunction

call s:h("Normal",      {"fg": s:fg             , "bg": s:bg          , "format": "none"})
call s:h("Cursor",      {"fg": s:bg             , "bg": s:fg          , "format": "none"})
call s:h("VertSplit",   {"fg": s:dark           , "bg": s:bg_l1       , "format": "none"})
call s:h("Folded",      {"fg": s:darkpurple     , "bg": s:bg          , "format": "none"})
call s:h("FoldColumn",  {"fg": s:teal           , "bg": s:black       , "format": "none"})
call s:h("ModeMsg",     {"fg": s:green          , "bg": s:black       , "format": "none"})
call s:h("MoreMsg",     {"fg": s:black          , "bg": s:green       , "format": "none"})
call s:h("Pmenu",       {"fg": s:teal           , "bg": s:bg          , "format": "none"})
call s:h("PmenuSel",    {"fg": s:teal           , "bg": s:bg          , "format": "reverse"})
call s:h("PmenuSbar",   {"fg": s:teal           , "bg": s:bg          , "format": "none"})
call s:h("PmenuThumb",  {"fg": s:bg             , "bg": s:teal        , "format": "none"})
call s:h("NonText",     {"fg": s:teal           , "bg": s:black       , "format": "none"})
call s:h("Question",    {"fg": s:black          , "bg": s:teal        , "format": "none"})
call s:h("IncSearch",   {"fg": s:green          , "bg": s:black       , "format": "none"})
call s:h("Search",      {"fg": s:magenta        , "bg": s:black       , "format": "none"})
call s:h("SpecialKey",  {"fg": s:purple                               , "format": "bold"})
call s:h("StatusLine",  {"fg": s:teal           , "bg": s:bg_l1       , "format": "none"})
call s:h("StatusLineNC",{"fg": s:blue           , "bg": s:bg_l1       , "format": "none"})
call s:h("Handler",     {"fg": s:green                                , "format": "none"})
call s:h("Visual",      {"fg": s:purple         , "bg": s:black       , "format": "none"})
call s:h("WarningMsg",  {"fg": s:black          , "bg": s:yellow      , "format": "none"})
call s:h("Identifier",  {"fg": s:green                                , "format": "none"})
call s:h("Include",     {"fg": s:green                                , "format": "none"})
call s:h("PreProc",     {"fg": s:green                                , "format": "none"})
call s:h("Operator",    {"fg": s:yellow                               , "format": "none"})
call s:h("Define",      {"fg": s:teal           , "bg": s:changethis  , "format": "none"})
call s:h("Function",    {"fg": s:blue                                 , "format": "none"})
call s:h("Structure",   {"fg": s:green                                , "format": "none"})
call s:h("LineNr",      {"fg": s:dark           , "bg": s:bg_l1       , "format": "none"})
call s:h("Ignore",      {"fg": s:teal           , "bg": s:changethis  , "format": "none"})
call s:h("Todo",        {"fg": s:teal                                 , "format": "bold"})
call s:h("Directory",   {"fg": s:teal                                 , "format": "none"})
call s:h("ErrorMsg",    {"fg": s:black          , "bg": s:red         , "format": "none"})
call s:h("VisualNOS",   {"fg": s:teal           , "bg": s:changethis  , "format": "none"})
call s:h("WildMenu",    {"fg": s:black          , "bg": s:teal        , "format": "none"})
call s:h("DiffAdd",     {"fg": s:green                                , "format": "none"})
call s:h("DiffChange",  {"fg": s:yellow                               , "format": "none"})
call s:h("DiffDelete",  {"fg": s:red                                  , "format": "none"})
call s:h("DiffText",    {"fg": s:fg             , "bg": s:bg          , "format": "none"})
call s:h("Underlined",  {"fg": s:fg             , "bg": s:bg          , "format": "underline"})
call s:h("Error",       {"fg": s:black          , "bg": s:red         , "format": "none"})
call s:h("SpellErrors", {"fg": s:red                                  , "format": "undercurl"})
call s:h("ColorColumn", {                         "bg": s:bg_l1       , "format": "none"})
call s:h("CursorLine",  {                         "bg": s:bg_l1       , "format": "none"})
call s:h("CursorLineNr",{"fg": s:teal           , "bg": s:bg_l1       , "format": "none"})
call s:h("CursorColumn",{                         "bg": s:bg_l1       , "format": "none"})
call s:h("Tabline",     {"fg": s:blue           , "bg": s:bg          , "format": "none"})
call s:h("TablineFill", {"fg": s:blue           , "bg": s:bg          , "format": "none"})
call s:h("TablineSel",  {"fg": s:teal           , "bg": s:blue        , "format": "none"})
call s:h("Comment",     {"fg": s:darkpurple                           , "format": "none"})
call s:h("Statement",   {"fg": s:purple                               , "format": "none"})
call s:h("Constant",    {"fg": s:turqoise                             , "format": "none"})
call s:h("Type",        {"fg": s:red                                  , "format": "none"})
call s:h("String",      {"fg": s:darkish                              , "format": "none"})
call s:h("Special",     {"fg": s:yellow                               , "format": "none"})
call s:h("TagListFileName",{"fg": s:black       , "bg": s:teal        , "format": "none"})
call s:h("LocalVar",    {"fg": s:blueish                              , "format": "none"})
call s:h("EndMacro",    {"fg": s:orange                               , "format": "italic"})

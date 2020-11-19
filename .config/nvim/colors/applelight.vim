if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "applelight"
set background=light

let s:apple0_gui = "0"
let s:apple1_gui = "8"
let s:apple2_gui = "#434C5E"
let s:apple3_gui = "#4C566A"
let s:apple3_gui_bright = "#616E88"
let s:apple4_gui = "#D8DEE9"
let s:apple5_gui = "#E5E9F0"
let s:apple6_gui = "#ECEFF4"
let s:apple7_gui = "#8FBCBB"
let s:apple8_gui = "#88C0D0"
let s:apple9_gui = "#81A1C1"
let s:apple10_gui = "#5E81AC"
let s:apple11_gui = "#BF616A"
let s:apple12_gui = "#D08770"
let s:apple13_gui = "#EBCB8B"
let s:apple14_gui = "#32d74b"
let s:apple15_gui = "#B48EAD"

let s:apple1_term = "0"
let s:apple3_term = "8"
let s:apple5_term = "7"
let s:apple6_term = "15"
let s:apple7_term = "14"
let s:apple8_term = "6"
let s:apple9_term = "4"
let s:apple10_term = "12"
let s:apple11_term = "1"
let s:apple12_term = "11"
let s:apple13_term = "3"
let s:apple14_term = "2"
let s:apple15_term = "5"

let s:apple3_gui_brightened = [
  \ s:apple3_gui,
  \ "#4e586d",
  \ "#505b70",
  \ "#525d73",
  \ "#556076",
  \ "#576279",
  \ "#59647c",
  \ "#5b677f",
  \ "#5d6982",
  \ "#5f6c85",
  \ "#616e88",
  \ "#63718b",
  \ "#66738e",
  \ "#687591",
  \ "#6a7894",
  \ "#6d7a96",
  \ "#6f7d98",
  \ "#72809a",
  \ "#75829c",
  \ "#78859e",
  \ "#7b88a1",
\ ]

if !exists("g:apple_bold")
  let g:apple_bold = 1
endif

let s:bold = "bold,"
if g:apple_bold == 0
  let s:bold = ""
endif

if !exists("g:apple_italic")
  if has("gui_running") || $TERM_ITALICS == "true"
    let g:apple_italic = 1
  else
    let g:apple_italic = 0
  endif
endif

let s:italic = "italic,"
if g:apple_italic == 0
  let s:italic = ""
endif

let s:underline = "underline,"
if ! get(g:, "apple_underline", 1)
  let s:underline = "NONE,"
endif

let s:italicize_comments = ""
if exists("g:apple_italic_comments")
  if g:apple_italic_comments == 1
    let s:italicize_comments = s:italic
  endif
endif

if !exists('g:apple_uniform_status_lines')
  let g:apple_uniform_status_lines = 0
endif

function! s:logWarning(msg)
  echohl WarningMsg
  echomsg 'apple: warning: ' . a:msg
  echohl None
endfunction

if exists("g:apple_comment_brightness")
  call s:logWarning('Variable g:apple_comment_brightness has been deprecated and will be removed in version 1.0.0!' .
                   \' The comment color brightness has been increased by 10% by default.' .
                   \' Please see https://github.com/arcticicestudio/apple-vim/issues/145 for more details.')
  let g:apple_comment_brightness = 10
endif

if !exists("g:apple_uniform_diff_background")
  let g:apple_uniform_diff_background = 0
endif

if !exists("g:apple_cursor_line_number_background")
  let g:apple_cursor_line_number_background = 0
endif

if !exists("g:apple_bold_vertical_split_line")
  let g:apple_bold_vertical_split_line = 0
endif

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", "", "", s:bold, "")
call s:hi("Italic", "", "", "", "", s:italic, "")
call s:hi("Underline", "", "", "", "", s:underline, "")

"+--- Editor ---+
call s:hi("ColorColumn", "", s:apple1_gui, "NONE", s:apple1_term, "", "")
call s:hi("Cursor", s:apple0_gui, s:apple4_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", s:apple1_gui, "NONE", s:apple1_term, "NONE", "")
call s:hi("Error", s:apple4_gui, s:apple11_gui, "", s:apple11_term, "", "")
call s:hi("iCursor", s:apple0_gui, s:apple4_gui, "", "NONE", "", "")
call s:hi("LineNr", s:apple3_gui, s:apple0_gui, s:apple3_term, "NONE", "", "")
call s:hi("MatchParen", s:apple8_gui, s:apple3_gui, s:apple8_term, s:apple3_term, "", "")
call s:hi("NonText", s:apple2_gui, "", s:apple3_term, "", "", "")
call s:hi("Normal", s:apple4_gui, s:apple0_gui, "NONE", "NONE", "", "")
call s:hi("PMenu", s:apple4_gui, s:apple2_gui, "NONE", s:apple1_term, "NONE", "")
call s:hi("PmenuSbar", s:apple4_gui, s:apple2_gui, "NONE", s:apple1_term, "", "")
call s:hi("PMenuSel", s:apple8_gui, s:apple3_gui, s:apple8_term, s:apple3_term, "", "")
call s:hi("PmenuThumb", s:apple8_gui, s:apple3_gui, "NONE", s:apple3_term, "", "")
call s:hi("SpecialKey", s:apple3_gui, "", s:apple3_term, "", "", "")
call s:hi("SpellBad", s:apple11_gui, s:apple0_gui, s:apple11_term, "NONE", "undercurl", s:apple11_gui)
call s:hi("SpellCap", s:apple13_gui, s:apple0_gui, s:apple13_term, "NONE", "undercurl", s:apple13_gui)
call s:hi("SpellLocal", s:apple5_gui, s:apple0_gui, s:apple5_term, "NONE", "undercurl", s:apple5_gui)
call s:hi("SpellRare", s:apple6_gui, s:apple0_gui, s:apple6_term, "NONE", "undercurl", s:apple6_gui)
call s:hi("Visual", "", s:apple2_gui, "", s:apple1_term, "", "")
call s:hi("VisualNOS", "", s:apple2_gui, "", s:apple1_term, "", "")
"+- Neovim Support -+
call s:hi("healthError", s:apple11_gui, s:apple1_gui, s:apple11_term, s:apple1_term, "", "")
call s:hi("healthSuccess", s:apple14_gui, s:apple1_gui, s:apple14_term, s:apple1_term, "", "")
call s:hi("healthWarning", s:apple13_gui, s:apple1_gui, s:apple13_term, s:apple1_term, "", "")
call s:hi("TermCursorNC", "", s:apple1_gui, "", s:apple1_term, "", "")

"+- Vim 8 Terminal Colors -+
if has('terminal')
  let g:terminal_ansi_colors = [s:apple1_gui, s:apple11_gui, s:apple14_gui, s:apple13_gui, s:apple9_gui, s:apple15_gui, s:apple8_gui, s:apple5_gui, s:apple3_gui, s:apple11_gui, s:apple14_gui, s:apple13_gui, s:apple9_gui, s:apple15_gui, s:apple7_gui, s:apple6_gui]
endif

"+- Neovim Terminal Colors -+
if has('nvim')
  let g:terminal_color_0 = s:apple1_gui
  let g:terminal_color_1 = s:apple11_gui
  let g:terminal_color_2 = s:apple14_gui
  let g:terminal_color_3 = s:apple13_gui
  let g:terminal_color_4 = s:apple9_gui
  let g:terminal_color_5 = s:apple15_gui
  let g:terminal_color_6 = s:apple8_gui
  let g:terminal_color_7 = s:apple5_gui
  let g:terminal_color_8 = s:apple3_gui
  let g:terminal_color_9 = s:apple11_gui
  let g:terminal_color_10 = s:apple14_gui
  let g:terminal_color_11 = s:apple13_gui
  let g:terminal_color_12 = s:apple9_gui
  let g:terminal_color_13 = s:apple15_gui
  let g:terminal_color_14 = s:apple7_gui
  let g:terminal_color_15 = s:apple6_gui
endif

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:apple1_gui, "NONE", s:apple1_term, "", "")
if g:apple_cursor_line_number_background == 0
  call s:hi("CursorLineNr", s:apple4_gui, s:apple0_gui, "NONE", "", "NONE", "")
else
  call s:hi("CursorLineNr", s:apple4_gui, s:apple1_gui, "NONE", s:apple1_term, "NONE", "")
endif
call s:hi("Folded", s:apple3_gui, s:apple1_gui, s:apple3_term, s:apple1_term, s:bold, "")
call s:hi("FoldColumn", s:apple3_gui, s:apple0_gui, s:apple3_term, "NONE", "", "")
call s:hi("SignColumn", s:apple1_gui, s:apple0_gui, s:apple1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:apple8_gui, "", s:apple8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:apple1_gui, "", s:apple1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:apple4_gui, s:apple11_gui, "NONE", s:apple11_term, "", "")
call s:hi("ModeMsg", s:apple4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:apple8_gui, "", s:apple8_term, "", "", "")
call s:hi("Question", s:apple4_gui, "", "NONE", "", "", "")
if g:apple_uniform_status_lines == 0
  call s:hi("StatusLine", s:apple8_gui, s:apple3_gui, s:apple8_term, s:apple3_term, "NONE", "")
  call s:hi("StatusLineNC", s:apple4_gui, s:apple1_gui, "NONE", s:apple1_term, "NONE", "")
  call s:hi("StatusLineTerm", s:apple8_gui, s:apple3_gui, s:apple8_term, s:apple3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:apple4_gui, s:apple1_gui, "NONE", s:apple1_term, "NONE", "")
else
  call s:hi("StatusLine", s:apple8_gui, s:apple3_gui, s:apple8_term, s:apple3_term, "NONE", "")
  call s:hi("StatusLineNC", s:apple4_gui, s:apple3_gui, "NONE", s:apple3_term, "NONE", "")
  call s:hi("StatusLineTerm", s:apple8_gui, s:apple3_gui, s:apple8_term, s:apple3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:apple4_gui, s:apple3_gui, "NONE", s:apple3_term, "NONE", "")
endif
call s:hi("WarningMsg", s:apple0_gui, s:apple13_gui, s:apple1_term, s:apple13_term, "", "")
call s:hi("WildMenu", s:apple8_gui, s:apple1_gui, s:apple8_term, s:apple1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:apple6_gui, s:apple10_gui, s:apple6_term, s:apple10_term, s:underline, "")
call s:hi("Search", s:apple1_gui, s:apple8_gui, s:apple1_term, s:apple8_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:apple4_gui, s:apple1_gui, "NONE", s:apple1_term, "NONE", "")
call s:hi("TabLineFill", s:apple4_gui, s:apple1_gui, "NONE", s:apple1_term, "NONE", "")
call s:hi("TabLineSel", s:apple8_gui, s:apple3_gui, s:apple8_term, s:apple3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:apple4_gui, "", "NONE", "", "NONE", "")

if g:apple_bold_vertical_split_line == 0
  call s:hi("VertSplit", s:apple2_gui, s:apple0_gui, s:apple3_term, "NONE", "NONE", "")
else
  call s:hi("VertSplit", s:apple2_gui, s:apple1_gui, s:apple3_term, s:apple1_term, "NONE", "")
endif

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:apple9_gui, "", s:apple9_term, "", "", "")
call s:hi("Character", s:apple14_gui, "", s:apple14_term, "", "", "")
call s:hi("Comment", s:apple3_gui_bright, "", s:apple3_term, "", s:italicize_comments, "")
call s:hi("Conditional", s:apple9_gui, "", s:apple9_term, "", "", "")
call s:hi("Constant", s:apple4_gui, "", "NONE", "", "", "")
call s:hi("Define", s:apple9_gui, "", s:apple9_term, "", "", "")
call s:hi("Delimiter", s:apple6_gui, "", s:apple6_term, "", "", "")
call s:hi("Exception", s:apple9_gui, "", s:apple9_term, "", "", "")
call s:hi("Float", s:apple15_gui, "", s:apple15_term, "", "", "")
call s:hi("Function", s:apple8_gui, "", s:apple8_term, "", "", "")
call s:hi("Identifier", s:apple4_gui, "", "NONE", "", "NONE", "")
call s:hi("Include", s:apple9_gui, "", s:apple9_term, "", "", "")
call s:hi("Keyword", s:apple9_gui, "", s:apple9_term, "", "", "")
call s:hi("Label", s:apple9_gui, "", s:apple9_term, "", "", "")
call s:hi("Number", s:apple15_gui, "", s:apple15_term, "", "", "")
call s:hi("Operator", s:apple9_gui, "", s:apple9_term, "", "NONE", "")
call s:hi("PreProc", s:apple9_gui, "", s:apple9_term, "", "NONE", "")
call s:hi("Repeat", s:apple9_gui, "", s:apple9_term, "", "", "")
call s:hi("Special", s:apple4_gui, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:apple13_gui, "", s:apple13_term, "", "", "")
call s:hi("SpecialComment", s:apple8_gui, "", s:apple8_term, "", s:italicize_comments, "")
call s:hi("Statement", s:apple9_gui, "", s:apple9_term, "", "", "")
call s:hi("StorageClass", s:apple9_gui, "", s:apple9_term, "", "", "")
call s:hi("String", s:apple14_gui, "", s:apple14_term, "", "", "")
call s:hi("Structure", s:apple9_gui, "", s:apple9_term, "", "", "")
call s:hi("Tag", s:apple4_gui, "", "", "", "", "")
call s:hi("Todo", s:apple13_gui, "NONE", s:apple13_term, "NONE", "", "")
call s:hi("Type", s:apple9_gui, "", s:apple9_term, "", "NONE", "")
call s:hi("Typedef", s:apple9_gui, "", s:apple9_term, "", "", "")
hi! link Macro Define
hi! link PreCondit PreProc

"+-----------+
"+ Languages +
"+-----------+
call s:hi("asciidocAttributeEntry", s:apple10_gui, "", s:apple10_term, "", "", "")
call s:hi("asciidocAttributeList", s:apple10_gui, "", s:apple10_term, "", "", "")
call s:hi("asciidocAttributeRef", s:apple10_gui, "", s:apple10_term, "", "", "")
call s:hi("asciidocHLabel", s:apple9_gui, "", s:apple9_term, "", "", "")
call s:hi("asciidocListingBlock", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("asciidocMacroAttributes", s:apple8_gui, "", s:apple8_term, "", "", "")
call s:hi("asciidocOneLineTitle", s:apple8_gui, "", s:apple8_term, "", "", "")
call s:hi("asciidocPassthroughBlock", s:apple9_gui, "", s:apple9_term, "", "", "")
call s:hi("asciidocQuotedMonospaced", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("asciidocTriplePlusPassthrough", s:apple7_gui, "", s:apple7_term, "", "", "")
hi! link asciidocAdmonition Keyword
hi! link asciidocAttributeRef markdownH1
hi! link asciidocBackslash Keyword
hi! link asciidocMacro Keyword
hi! link asciidocQuotedBold Bold
hi! link asciidocQuotedEmphasized Italic
hi! link asciidocQuotedMonospaced2 asciidocQuotedMonospaced
hi! link asciidocQuotedUnconstrainedBold asciidocQuotedBold
hi! link asciidocQuotedUnconstrainedEmphasized asciidocQuotedEmphasized
hi! link asciidocURL markdownLinkText

call s:hi("awkCharClass", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("awkPatterns", s:apple9_gui, "", s:apple9_term, "", s:bold, "")
hi! link awkArrayElement Identifier
hi! link awkBoolLogic Keyword
hi! link awkBrktRegExp SpecialChar
hi! link awkComma Delimiter
hi! link awkExpression Keyword
hi! link awkFieldVars Identifier
hi! link awkLineSkip Keyword
hi! link awkOperator Operator
hi! link awkRegExp SpecialChar
hi! link awkSearch Keyword
hi! link awkSemicolon Delimiter
hi! link awkSpecialCharacter SpecialChar
hi! link awkSpecialPrintf SpecialChar
hi! link awkVariables Identifier

call s:hi("cIncluded", s:apple7_gui, "", s:apple7_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit

call s:hi("cmakeGeneratorExpression", s:apple10_gui, "", s:apple10_term, "", "", "")

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("cssDefinition", s:apple7_gui, "", s:apple7_term, "", "NONE", "")
call s:hi("cssIdentifier", s:apple7_gui, "", s:apple7_term, "", s:underline, "")
call s:hi("cssStringQ", s:apple7_gui, "", s:apple7_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:apple8_gui, "", s:apple8_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("dtExecKey", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("dtLocaleKey", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("dtNumericKey", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("dtTypeKey", s:apple7_gui, "", s:apple7_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:apple_uniform_diff_background == 0
  call s:hi("DiffAdd", s:apple14_gui, s:apple0_gui, s:apple14_term, "NONE", "inverse", "")
  call s:hi("DiffChange", s:apple13_gui, s:apple0_gui, s:apple13_term, "NONE", "inverse", "")
  call s:hi("DiffDelete", s:apple11_gui, s:apple0_gui, s:apple11_term, "NONE", "inverse", "")
  call s:hi("DiffText", s:apple9_gui, s:apple0_gui, s:apple9_term, "NONE", "inverse", "")
else
  call s:hi("DiffAdd", s:apple14_gui, s:apple1_gui, s:apple14_term, s:apple1_term, "", "")
  call s:hi("DiffChange", s:apple13_gui, s:apple1_gui, s:apple13_term, s:apple1_term, "", "")
  call s:hi("DiffDelete", s:apple11_gui, s:apple1_gui, s:apple11_term, s:apple1_term, "", "")
  call s:hi("DiffText", s:apple9_gui, s:apple1_gui, s:apple9_term, s:apple1_term, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:apple7_gui, "", s:apple7_term, "", "", "")

call s:hi("goBuiltins", s:apple7_gui, "", s:apple7_term, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", s:apple3_gui, "", s:apple3_term, "", "", "")
call s:hi("helpHyperTextJump", s:apple8_gui, "", s:apple8_term, "", s:underline, "")

call s:hi("htmlArg", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("htmlLink", s:apple4_gui, "", "", "", "NONE", "NONE")
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi("javaDocTags", s:apple7_gui, "", s:apple7_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:apple7_gui, "", s:apple7_term, "", "", "")

call s:hi("lessClass", s:apple7_gui, "", s:apple7_term, "", "", "")
hi! link lessAmpersand Keyword
hi! link lessCssAttribute Delimiter
hi! link lessFunction Function
hi! link cssSelectorOp Keyword

hi! link lispAtomBarSymbol SpecialChar
hi! link lispAtomList SpecialChar
hi! link lispAtomMark Keyword
hi! link lispBarSymbol SpecialChar
hi! link lispFunc Function

hi! link luaFunc Function

call s:hi("markdownBlockquote", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("markdownCode", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("markdownFootnote", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("markdownId", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("markdownH1", s:apple8_gui, "", s:apple8_term, "", "", "")
call s:hi("markdownLinkText", s:apple8_gui, "", s:apple8_term, "", "", "")
call s:hi("markdownUrl", s:apple4_gui, "", "NONE", "", "NONE", "")
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

call s:hi("perlPackageDecl", s:apple7_gui, "", s:apple7_term, "", "", "")

call s:hi("phpClasses", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("phpDocTags", s:apple7_gui, "", s:apple7_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi("podCmdText", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("podVerbatimLine", s:apple4_gui, "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("rubySymbol", s:apple6_gui, "", s:apple6_term, "", s:bold, "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("rustAttribute", s:apple10_gui, "", s:apple10_term, "", "", "")
call s:hi("rustEnum", s:apple7_gui, "", s:apple7_term, "", s:bold, "")
call s:hi("rustMacro", s:apple8_gui, "", s:apple8_term, "", s:bold, "")
call s:hi("rustModPath", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("rustPanic", s:apple9_gui, "", s:apple9_term, "", s:bold, "")
call s:hi("rustTrait", s:apple7_gui, "", s:apple7_term, "", s:italic, "")
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

call s:hi("sassClass", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("sassId", s:apple7_gui, "", s:apple7_term, "", s:underline, "")
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude SpecialChar
hi! link sassMixinName Function
hi! link sassMixing SpecialChar
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

call s:hi("vimAugroup", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("vimMapRhs", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("vimNotation", s:apple7_gui, "", s:apple7_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("xmlCdataStart", s:apple3_gui_bright, "", s:apple3_term, "", s:bold, "")
call s:hi("xmlNamespace", s:apple7_gui, "", s:apple7_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:apple7_gui, "", s:apple7_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:apple13_gui, "", s:apple13_term, "", "", "")
call s:hi("ALEErrorSign" , s:apple11_gui, "", s:apple11_term, "", "", "")
call s:hi("ALEWarning" , s:apple13_gui, "", s:apple13_term, "", "undercurl", "")
call s:hi("ALEError" , s:apple11_gui, "", s:apple11_term, "", "undercurl", "")

" Coc
" > neoclide/coc
call s:hi("CocWarningSign", s:apple13_gui, "", s:apple13_term, "", "", "")
call s:hi("CocErrorSign" , s:apple11_gui, "", s:apple11_term, "", "", "")
call s:hi("CocInfoSign" , s:apple8_gui, "", s:apple8_term, "", "", "")
call s:hi("CocHintSign" , s:apple10_gui, "", s:apple10_term, "", "", "")

" Nvim LSP
" > neovim/nvim-lsp
call s:hi("LSPDiagnosticsWarning", s:apple13_gui, "", s:apple13_term, "", "", "")
call s:hi("LSPDiagnosticsError" , s:apple11_gui, "", s:apple11_term, "", "", "")
call s:hi("LSPDiagnosticsInformation" , s:apple8_gui, "", s:apple8_term, "", "", "")
call s:hi("LSPDiagnosticsHint" , s:apple10_gui, "", s:apple10_term, "", "", "")


" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:apple14_gui, "", s:apple14_term, "", "", "")
call s:hi("GitGutterChange", s:apple13_gui, "", s:apple13_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:apple11_gui, "", s:apple11_term, "", "", "")
call s:hi("GitGutterDelete", s:apple11_gui, "", s:apple11_term, "", "", "")

" Signify
" > mhinz/vim-signify
call s:hi("SignifySignAdd", s:apple14_gui, "", s:apple14_term, "", "", "")
call s:hi("SignifySignChange", s:apple13_gui, "", s:apple13_term, "", "", "")
call s:hi("SignifySignChangeDelete", s:apple11_gui, "", s:apple11_term, "", "", "")
call s:hi("SignifySignDelete", s:apple11_gui, "", s:apple11_term, "", "", "")

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:apple11_gui, "", s:apple11_term, "", "", "")
call s:hi("gitcommitUntrackedFile", s:apple11_gui, "", s:apple11_term, "", "", "")
call s:hi("gitcommitSelectedFile", s:apple14_gui, "", s:apple14_term, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", s:apple4_gui, s:apple3_gui, "", s:apple3_term, "", "")
call s:hi("jediFat", s:apple8_gui, s:apple3_gui, s:apple8_term, s:apple3_term, s:underline.s:bold, "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:apple7_gui, "", s:apple7_term, "", "", "")
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:apple11_gui, "", "", s:apple11_term, "", "")

" vim-signature
" > kshenoy/vim-signature
call s:hi("SignatureMarkText", s:apple8_gui, "", s:apple8_term, "", "", "")

" vim-startify
" > mhinz/vim-startify
call s:hi("StartifyFile", s:apple6_gui, "", s:apple6_term, "", "", "")
call s:hi("StartifyFooter", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("StartifyHeader", s:apple8_gui, "", s:apple8_term, "", "", "")
call s:hi("StartifyNumber", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("StartifyPath", s:apple8_gui, "", s:apple8_term, "", "", "")
hi! link StartifyBracket Delimiter
hi! link StartifySlash Normal
hi! link StartifySpecial Comment

"+--- Languages ---+
" Haskell
" > neovimhaskell/haskell-vim
call s:hi("haskellPreProc", s:apple10_gui, "", s:apple10_term, "", "", "")
call s:hi("haskellType", s:apple7_gui, "", s:apple7_term, "", "", "")
hi! link haskellPragma haskellPreProc

" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:apple8_gui, "", s:apple8_term, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" Markdown
" > plasticboy/vim-markdown
call s:hi("mkdCode", s:apple7_gui, "", s:apple7_term, "", "", "")
call s:hi("mkdFootnote", s:apple8_gui, "", s:apple8_term, "", "", "")
call s:hi("mkdRule", s:apple10_gui, "", s:apple10_term, "", "", "")
call s:hi("mkdLineBreak", s:apple9_gui, "", s:apple9_term, "", "", "")
hi! link mkdBold Bold
hi! link mkdItalic Italic
hi! link mkdString Keyword
hi! link mkdCodeStart mkdCode
hi! link mkdCodeEnd mkdCode
hi! link mkdBlockquote Comment
hi! link mkdListItem Keyword
hi! link mkdListItemLine Normal
hi! link mkdFootnotes mkdFootnote
hi! link mkdLink markdownLinkText
hi! link mkdURL markdownUrl
hi! link mkdInlineURL mkdURL
hi! link mkdID Identifier
hi! link mkdLinkDef mkdLink
hi! link mkdLinkDefTarget mkdURL
hi! link mkdLinkTitle mkdInlineURL
hi! link mkdDelimiter Keyword

" Vimwiki
" > vimwiki/vimwiki
if !exists("g:vimwiki_hl_headers") || g:vimwiki_hl_headers == 0
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:apple8_gui, "", s:apple8_term, "", s:bold, "")
  endfor
else
  let s:vimwiki_hcolor_guifg = [s:apple7_gui, s:apple8_gui, s:apple9_gui, s:apple10_gui, s:apple14_gui, s:apple15_gui]
  let s:vimwiki_hcolor_ctermfg = [s:apple7_term, s:apple8_term, s:apple9_term, s:apple10_term, s:apple14_term, s:apple15_term]
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:vimwiki_hcolor_guifg[s:i-1] , "", s:vimwiki_hcolor_ctermfg[s:i-1], "", s:bold, "")
  endfor
endif

call s:hi("VimwikiLink", s:apple8_gui, "", s:apple8_term, "", s:underline, "")
hi! link VimwikiHeaderChar markdownHeadingDelimiter
hi! link VimwikiHR Keyword
hi! link VimwikiList markdownListMarker

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", s:apple7_gui, "", s:apple7_term, "", "", "")

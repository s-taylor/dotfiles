" Vim color file
" Converted from Textmate theme Will using Coloration v0.2.5 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "oinutter"

hi Cursor  guifg=NONE guibg=#e0e2e4 ctermbg=7 ctermbg=7 ctermbg=7 gui=NONE
hi Visual  guifg=NONE guibg=#232c2d ctermbg=235 ctermbg=239 ctermbg=239 gui=NONE
hi CursorLine  guifg=NONE guibg=#232c2d ctermbg=235 ctermbg=239 ctermbg=239 gui=NONE
hi CursorColumn  guifg=NONE guibg=#232c2d ctermbg=235 ctermbg=239 ctermbg=239 gui=NONE
hi LineNr  guifg=#858a8c ctermfg=245 ctermfg=245 ctermfg=245 guibg=#293134 ctermbg=236 ctermbg=236 ctermbg=236 gui=NONE
hi VertSplit  guifg=#4c5355 ctermfg=239 ctermfg=239 ctermfg=239 guibg=#4c5355 ctermbg=239 ctermbg=239 ctermbg=239 gui=NONE
hi MatchParen  guifg=#93c763 ctermfg=113 ctermfg=113 ctermfg=113 guibg=NONE gui=NONE
hi StatusLine  guifg=#e0e2e4 ctermfg=7 ctermfg=7 ctermfg=7 guibg=#4c5355 ctermbg=239 ctermbg=239 ctermbg=239 gui=bold
hi StatusLineNC  guifg=#e0e2e4 ctermfg=7 ctermfg=7 ctermfg=7 guibg=#4c5355 ctermbg=239 ctermbg=239 ctermbg=239 gui=NONE
hi Pmenu  guifg=#8dcbe2 ctermfg=116 ctermfg=116 ctermfg=116 guibg=NONE gui=NONE
hi PmenuSel  guifg=NONE guibg=#232c2d ctermbg=235 ctermbg=239 ctermbg=239 gui=NONE
hi IncSearch  guifg=NONE guibg=#3d4f5d ctermbg=239 ctermbg=239 ctermbg=239 gui=NONE
hi Search  guifg=NONE guibg=#3d4f5d ctermbg=239 ctermbg=239 ctermbg=239 gui=NONE
hi Directory  guifg=#7f9fbf ctermfg=109 ctermfg=109 ctermfg=109 guibg=NONE gui=NONE
hi Folded  guifg=#c0c0c0 ctermfg=250 ctermfg=250 ctermfg=250 guibg=#293134 ctermbg=236 ctermbg=236 ctermbg=236 gui=NONE

hi Normal  guifg=#e0e2e4 ctermfg=7 ctermfg=7 ctermfg=7 guibg=#0e1011 ctermbg=233 ctermbg=233 ctermbg=236 gui=NONE
hi Boolean  guifg=#7f9fbf ctermfg=109 ctermfg=109 ctermfg=109 guibg=NONE gui=NONE
hi Character  guifg=#7f9fbf ctermfg=109 ctermfg=109 ctermfg=109 guibg=NONE gui=NONE
hi Comment  guifg=#c0c0c0 ctermfg=250 ctermfg=250 ctermfg=250 guibg=NONE gui=NONE
hi Conditional  guifg=#93c763 ctermfg=113 ctermfg=113 ctermfg=113 guibg=NONE gui=NONE
hi Constant  guifg=#7f9fbf ctermfg=109 ctermfg=109 ctermfg=109 guibg=NONE gui=NONE
hi Define  guifg=#93c763 ctermfg=113 ctermfg=113 ctermfg=113 guibg=NONE gui=NONE
hi ErrorMsg  guifg=NONE guibg=NONE gui=NONE
hi WarningMsg  guifg=NONE guibg=NONE gui=NONE
hi Float  guifg=#7f9fbf ctermfg=109 ctermfg=109 ctermfg=109 guibg=NONE gui=NONE
hi Function  guifg=#8dcbe2 ctermfg=116 ctermfg=116 ctermfg=116 guibg=NONE gui=NONE
hi Identifier  guifg=#93c763 ctermfg=113 ctermfg=113 ctermfg=113 guibg=NONE gui=NONE
hi Keyword  guifg=#93c763 ctermfg=113 ctermfg=113 ctermfg=113 guibg=NONE gui=NONE
hi Label  guifg=#ff8b09 ctermfg=208 ctermfg=208 ctermfg=208 guibg=NONE gui=NONE
hi NonText  guifg=#404040 ctermfg=238 ctermfg=238 ctermfg=238 guibg=#232c2d ctermbg=235 ctermbg=239 ctermbg=239 gui=NONE
hi Number  guifg=#7f9fbf ctermfg=109 ctermfg=109 ctermfg=109 guibg=NONE gui=NONE
hi Operator  guifg=#28b8d7 ctermfg=38 ctermfg=38 ctermfg=38 guibg=NONE gui=NONE
hi PreProc  guifg=#93c763 ctermfg=113 ctermfg=113 ctermfg=113 guibg=NONE gui=NONE
hi Special  guifg=#e0e2e4 ctermfg=7 ctermfg=7 ctermfg=7 guibg=NONE gui=NONE
hi SpecialKey  guifg=#404040 ctermfg=238 ctermfg=238 ctermfg=238 guibg=#232c2d ctermbg=235 ctermbg=239 ctermbg=239 gui=NONE
hi Statement  guifg=#93c763 ctermfg=113 ctermfg=113 ctermfg=113 guibg=NONE gui=NONE
hi StorageClass  guifg=#93c763 ctermfg=113 ctermfg=113 ctermfg=113 guibg=NONE gui=NONE
hi String  guifg=#ff8b09 ctermfg=208 ctermfg=208 ctermfg=208 guibg=NONE gui=NONE
hi Tag  guifg=#8dcbe2 ctermfg=116 ctermfg=116 ctermfg=116 guibg=NONE gui=NONE
hi Title  guifg=#e0e2e4 ctermfg=7 ctermfg=7 ctermfg=7 guibg=NONE gui=bold
hi Todo  guifg=#c0c0c0 ctermfg=250 ctermfg=250 ctermfg=250 guibg=NONE gui=inverse,bold
hi Type  guifg=#8dcbe2 ctermfg=116 ctermfg=116 ctermfg=116 guibg=NONE gui=NONE
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#93c763 ctermfg=113 ctermfg=113 ctermfg=113 guibg=NONE gui=NONE
hi rubyFunction  guifg=#8dcbe2 ctermfg=116 ctermfg=116 ctermfg=116 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=#7f9fbf ctermfg=109 ctermfg=109 ctermfg=109 guibg=NONE gui=NONE
hi rubyConstant  guifg=#28b8d7 ctermfg=38 ctermfg=38 ctermfg=38 guibg=NONE gui=italic
hi rubyStringDelimiter  guifg=#ff8b09 ctermfg=208 ctermfg=208 ctermfg=208 guibg=NONE gui=NONE
hi rubyBlockParameter  guifg=#0080ff ctermfg=33 ctermfg=33 ctermfg=33 guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=#93c763 ctermfg=113 ctermfg=113 ctermfg=113 guibg=NONE gui=NONE
hi rubyInclude  guifg=#93c763 ctermfg=113 ctermfg=113 ctermfg=113 guibg=NONE gui=NONE
hi rubyGlobalVariable  guifg=#678cb1 ctermfg=67 ctermfg=67 ctermfg=67 guibg=NONE gui=NONE
hi rubyRegexp  guifg=#ffff00 ctermfg=11 ctermfg=11 ctermfg=11 guibg=NONE gui=NONE
hi rubyRegexpDelimiter  guifg=#ffff00 ctermfg=11 ctermfg=11 ctermfg=11 guibg=NONE gui=NONE
hi rubyEscape  guifg=#7f9fbf ctermfg=109 ctermfg=109 ctermfg=109 guibg=NONE gui=NONE
hi rubyControl  guifg=#93c763 ctermfg=113 ctermfg=113 ctermfg=113 guibg=NONE gui=NONE
hi rubyClassVariable  guifg=#678cb1 ctermfg=67 ctermfg=67 ctermfg=67 guibg=NONE gui=NONE
hi rubyOperator  guifg=#28b8d7 ctermfg=38 ctermfg=38 ctermfg=38 guibg=NONE gui=NONE
hi rubyException  guifg=#93c763 ctermfg=113 ctermfg=113 ctermfg=113 guibg=NONE gui=NONE
hi rubyPseudoVariable  guifg=#93c763 ctermfg=113 ctermfg=113 ctermfg=113 guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=#28b8d7 ctermfg=38 ctermfg=38 ctermfg=38 guibg=NONE gui=italic
hi rubyRailsARAssociationMethod  guifg=#28b8d7 ctermfg=38 ctermfg=38 ctermfg=38 guibg=NONE gui=italic
hi rubyRailsARMethod  guifg=#28b8d7 ctermfg=38 ctermfg=38 ctermfg=38 guibg=NONE gui=italic
hi rubyRailsRenderMethod  guifg=#28b8d7 ctermfg=38 ctermfg=38 ctermfg=38 guibg=NONE gui=italic
hi rubyRailsMethod  guifg=#28b8d7 ctermfg=38 ctermfg=38 ctermfg=38 guibg=NONE gui=italic
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=#c0c0c0 ctermfg=250 ctermfg=250 ctermfg=250 guibg=NONE gui=NONE
hi erubyRailsMethod  guifg=#28b8d7 ctermfg=38 ctermfg=38 ctermfg=38 guibg=NONE gui=italic
hi htmlTag  guifg=#8dcbe2 ctermfg=116 ctermfg=116 ctermfg=116 guibg=NONE gui=NONE
hi htmlEndTag  guifg=#8dcbe2 ctermfg=116 ctermfg=116 ctermfg=116 guibg=NONE gui=NONE
hi htmlTagName  guifg=#8dcbe2 ctermfg=116 ctermfg=116 ctermfg=116 guibg=NONE gui=NONE
hi htmlArg  guifg=#8dcbe2 ctermfg=116 ctermfg=116 ctermfg=116 guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#7f9fbf ctermfg=109 ctermfg=109 ctermfg=109 guibg=NONE gui=NONE
hi javaScriptFunction  guifg=#93c763 ctermfg=113 ctermfg=113 ctermfg=113 guibg=NONE gui=NONE
hi javaScriptRailsFunction  guifg=#28b8d7 ctermfg=38 ctermfg=38 ctermfg=38 guibg=NONE gui=italic
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=#8dcbe2 ctermfg=116 ctermfg=116 ctermfg=116 guibg=NONE gui=NONE
hi yamlAnchor  guifg=#678cb1 ctermfg=67 ctermfg=67 ctermfg=67 guibg=NONE gui=NONE
hi yamlAlias  guifg=#678cb1 ctermfg=67 ctermfg=67 ctermfg=67 guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#ff8b09 ctermfg=208 ctermfg=208 ctermfg=208 guibg=NONE gui=NONE
hi cssURL  guifg=#0080ff ctermfg=33 ctermfg=33 ctermfg=33 guibg=NONE gui=NONE
hi cssFunctionName  guifg=#28b8d7 ctermfg=38 ctermfg=38 ctermfg=38 guibg=NONE gui=italic
hi cssColor  guifg=#7f9fbf ctermfg=109 ctermfg=109 ctermfg=109 guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=#8dcbe2 ctermfg=116 ctermfg=116 ctermfg=116 guibg=NONE gui=NONE
hi cssClassName  guifg=#8dcbe2 ctermfg=116 ctermfg=116 ctermfg=116 guibg=NONE gui=NONE
hi cssValueLength  guifg=#7f9fbf ctermfg=109 ctermfg=109 ctermfg=109 guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#28b8d7 ctermfg=38 ctermfg=38 ctermfg=38 guibg=NONE gui=italic
hi cssBraces  guifg=NONE guibg=NONE gui=NONE

--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
-- local hsl = lush.hsl
local g = vim.g -- necessary because lush is executed in a bare environment

local p = {
	base = '#232136',
	surface = '#2a273f',
	overlay = '#393552',
	inactive = '#59546d',
	subtle = '#817c9c',
	text = '#e0def4',
	love = '#eb6f92',
	gold = '#f6c177',
	rose = '#ea9a97',
	pine = '#3e8fb0',
	foam = '#9ccfd8',
	iris = '#c4a7e7',
	highlight = '#312f44',
	highlight_inactive = '#2a283d',
	highlight_overlay = '#3f3c53',
}

-- black
g.terminal_color_0 = p.overlay
g.terminal_color_8 = p.subtle

-- red
g.terminal_color_4 = p.love
g.terminal_color_12 = p.love

-- green
g.terminal_color_2 = p.pine
g.terminal_color_10 = p.pine

-- yellow
g.terminal_color_6 = p.gold
g.terminal_color_14 = p.gold

-- blue
g.terminal_color_1 = p.foam
g.terminal_color_9 = p.foam

-- magenta
g.terminal_color_5 = p.iris
g.terminal_color_13 = p.iris

-- cyan
g.terminal_color_3 = p.rose
g.terminal_color_11 = p.rose

-- white
g.terminal_color_7 = p.text
g.terminal_color_15 = p.text

local theme = lush(function()
	return {
		-- The following are all the Neovim default highlight groups from the docs
		-- as of 0.5.0-nightly-446, to aid your theme creation. Your themes should
		-- probably style all of these at a bare minimum.
		--
		-- Referenced/linked groups must come before being referenced/lined,
		-- so the order shown ((mostly) alphabetical) is likely
		-- not the order you will end up with.
		--
		-- You can uncomment these and leave them empty to disable any
		-- styling for that group (meaning they mostly get styled as Normal)
		-- or leave them commented to apply vims default colouring or linking.

		Comment({ fg = p.inactive }), -- any comment
		-- ColorColumn  { }, -- used for the columns set with 'colorcolumn'
		-- Conceal      { }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		-- Cursor       { }, -- character under the cursor
		-- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
		-- CursorColumn { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		-- CursorLine   { }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory({ fg = p.foam }), -- directory names (and other special names in listings)
		-- DiffAdd      { }, -- diff mode: Added line |diff.txt|
		-- DiffChange   { }, -- diff mode: Changed line |diff.txt|
		-- DiffDelete   { }, -- diff mode: Deleted line |diff.txt|
		-- DiffText     { }, -- diff mode: Changed text within a changed line |diff.txt|
		-- EndOfBuffer  { }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		-- TermCursor   { }, -- cursor in a focused terminal
		-- TermCursorNC { }, -- cursor in an unfocused terminal
		ErrorMsg({ fg = p.love, gui = 'bold' }), -- error messages on the command line
		VertSplit({ fg = p.overlay }), -- the column separating vertically split windows
		-- Folded       { }, -- line used for closed folds
		-- FoldColumn   { }, -- 'foldcolumn'
		SignColumn({}), -- column where |signs| are displayed
		IncSearch({ bg = p.highlight }), -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		-- Substitute   { }, -- |:substitute| replacement text highlighting
		LineNr({ fg = p.inactive }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr({ fg = p.text }), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen({ fg = p.text, bg = p.overlay }), -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea      { }, -- Area for messages and cmdline
		-- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg({ fg = p.iris }), -- |more-prompt|
		NonText({ fg = p.inactive }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal({ fg = p.text }), -- normal text
		-- NormalFloat  { }, -- Normal text in floating windows.
		-- NormalNC     { }, -- normal text in non-current windows
		Pmenu({ fg = p.subtle, bg = p.surface }), -- Popup menu: normal item.
		PmenuSel({ fg = p.text, bg = p.overlay }), -- Popup menu: selected item.
		PmenuSbar({ bg = p.overlay }), -- Popup menu: scrollbar.
		PmenuThumb({ bg = p.inactive }), -- Popup menu: Thumb of the scrollbar.
		Question({ fg = p.gold }), -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search({ fg = p.iris, bg = p.highlight_overlay }), -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		SpecialKey({ fg = p.foam }), -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		-- StatusLine   { }, -- status line of current window
		-- StatusLineNC { }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		-- TabLine      { }, -- tab pages line, not active tab page label
		-- TabLineFill  { }, -- tab pages line, where there are no labels
		-- TabLineSel   { }, -- tab pages line, active tab page label
		Title({ fg = p.rose }), -- titles for output from ":set all", ":autocmd" etc.
		Visual({ bg = p.highlight }), -- Visual mode selection
		-- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg({ fg = p.love }), -- warning messages
		-- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- WildMenu     { }, -- current match in 'wildmenu' completion

		-- These groups are not listed as default vim groups,
		-- but they are defacto standard group names for syntax highlighting.
		-- commented out groups should chain up to their "preferred" group by
		-- default,
		-- Uncomment and edit if you want more specific syntax highlighting.

		Constant({ fg = p.gold }), -- (preferred) any constant
		-- String         { }, --   a string constant: "this is a string"
		-- Character      { }, --  a character constant: 'c', '\n'
		-- Number         { }, --   a number constant: 234, 0xff
		-- Boolean        { }, --  a boolean constant: TRUE, false
		-- Float          { }, --    a floating point constant: 2.3e10

		Identifier({ fg = p.rose }), -- (preferred) any variable name
		-- Function       { }, -- function name (also: methods for classes)

		Statement({ fg = p.pine }), -- (preferred) any statement
		-- Conditional    { }, --  if, then, else, endif, switch, etc.
		-- Repeat         { }, --   for, do, while, etc.
		-- Label          { }, --    case, default, etc.
		-- Operator       { }, -- "sizeof", "+", "*", etc.
		-- Keyword        { }, --  any other keyword
		-- Exception      { }, --  try, catch, throw

		PreProc({ fg = p.iris }), -- (preferred) generic Preprocessor
		-- Include        { }, --  preprocessor #include
		-- Define         { }, --   preprocessor #define
		-- Macro          { }, --    same as Define
		-- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

		Type({ fg = p.foam }), -- (preferred) int, long, char, etc.
		-- StorageClass   { }, -- static, register, volatile, etc.
		-- Structure      { }, --  struct, union, enum, etc.
		-- Typedef        { }, --  A typedef

		Special({ fg = p.rose }), -- (preferred) any special symbol
		-- SpecialChar    { }, --  special character in a constant
		-- Tag            { }, --    you can use CTRL-] on this
		-- Delimiter      { }, --  character that needs attention
		-- SpecialComment { }, -- special things inside a comment
		-- Debug          { }, --    debugging statements

		Underlined({ fg = p.foam, gui = 'underline' }), -- (preferred) text that stands out, HTML links
		-- Bold       { gui = "bold" },
		-- Italic     { gui = "italic" },

		-- ("Ignore", below, may be invisible...)
		-- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

		Error({ fg = p.love }), -- (preferred) any erroneous construct
		Todo({ fg = p.iris }), -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client. Some other LSP clients may
		-- use these groups, or use their own. Consult your LSP client's
		-- documentation.

		-- LspReferenceText                     { }, -- used for highlighting "text" references
		-- LspReferenceRead                     { }, -- used for highlighting "read" references
		-- LspReferenceWrite                    { }, -- used for highlighting "write" references

		-- LspDiagnosticsDefaultError           { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		-- LspDiagnosticsDefaultWarning         { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		-- LspDiagnosticsDefaultInformation     { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		-- LspDiagnosticsDefaultHint            { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

		-- LspDiagnosticsVirtualTextError       { }, -- Used for "Error" diagnostic virtual text
		-- LspDiagnosticsVirtualTextWarning     { }, -- Used for "Warning" diagnostic virtual text
		-- LspDiagnosticsVirtualTextInformation { }, -- Used for "Information" diagnostic virtual text
		-- LspDiagnosticsVirtualTextHint        { }, -- Used for "Hint" diagnostic virtual text

		-- LspDiagnosticsUnderlineError         { }, -- Used to underline "Error" diagnostics
		-- LspDiagnosticsUnderlineWarning       { }, -- Used to underline "Warning" diagnostics
		-- LspDiagnosticsUnderlineInformation   { }, -- Used to underline "Information" diagnostics
		-- LspDiagnosticsUnderlineHint          { }, -- Used to underline "Hint" diagnostics

		-- LspDiagnosticsFloatingError          { }, -- Used to color "Error" diagnostic messages in diagnostics float
		-- LspDiagnosticsFloatingWarning        { }, -- Used to color "Warning" diagnostic messages in diagnostics float
		-- LspDiagnosticsFloatingInformation    { }, -- Used to color "Information" diagnostic messages in diagnostics float
		-- LspDiagnosticsFloatingHint           { }, -- Used to color "Hint" diagnostic messages in diagnostics float

		-- LspDiagnosticsSignError              { }, -- Used for "Error" signs in sign column
		-- LspDiagnosticsSignWarning            { }, -- Used for "Warning" signs in sign column
		-- LspDiagnosticsSignInformation        { }, -- Used for "Information" signs in sign column
		-- LspDiagnosticsSignHint               { }, -- Used for "Hint" signs in sign column

		-- These groups are for the neovim tree-sitter highlights.
		-- As of writing, tree-sitter support is a WIP, group names may change.
		-- By default, most of these groups link to an appropriate Vim group,
		-- TSError -> Error for example, so you do not have to define these unless
		-- you explicitly want to support Treesitter's improved syntax awareness.

		-- TSAnnotation         { },    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		-- TSAttribute          { },    -- (unstable) TODO: docs
		-- TSBoolean            { },    -- For booleans.
		-- TSCharacter          { },    -- For characters.
		TSComment({ fg = p.inactive }), -- For comment blocks.
		TSConstructor({ fg = p.text }), -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
		-- TSConditional        { },    -- For keywords related to conditionnals.
		-- TSConstant           { },    -- For constants
		TSConstBuiltin({ fg = p.love }), -- For constant that are built in the language: `nil` in Lua.
		-- TSConstMacro         { },    -- For constants that are defined by macros: `NULL` in C.
		-- TSError              { },    -- For syntax/parser errors.
		-- TSException          { },    -- For exception related keywords.
		-- TSField              { },    -- For fields.
		-- TSFloat              { },    -- For floats.
		-- TSFunction           { },    -- For function (calls and definitions).
		TSFuncBuiltin({ fg = p.love }), -- For builtin functions: `table.insert` in Lua.
		-- TSFuncMacro          { },    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		-- TSInclude            { },    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		-- TSKeyword            { },    -- For keywords that don't fall in previous categories.
		-- TSKeywordFunction    { },    -- For keywords used to define a fuction.
		-- TSLabel              { },    -- For labels: `label:` in C and `:label:` in Lua.
		-- TSMethod             { },    -- For method calls and definitions.
		-- TSNamespace          { },    -- For identifiers referring to modules and namespaces.
		-- TSNone               { },    -- TODO: docs
		-- TSNumber             { },    -- For all numbers
		-- TSOperator           { },    -- For any operator: `+`, but also `->` and `*` in C.
		-- TSParameter          { },    -- For parameters of a function.
		-- TSParameterReference { },    -- For references to parameters of a function.
		-- TSProperty           { },    -- Same as `TSField`.
		TSPunctDelimiter({ fg = p.subtle }), -- For delimiters ie: `.`
		TSPunctBracket({ fg = p.subtle }), -- For brackets and parens.
		TSPunctSpecial({ fg = p.subtle }), -- For special punctutation that does not fall in the catagories before.
		-- TSRepeat             { },    -- For keywords related to loops.
		-- TSString             { },    -- For strings.
		-- TSStringRegex        { },    -- For regexes.
		TSStringEscape({ fg = p.pine }), -- For escape characters within a string.
		-- TSSymbol             { },    -- For identifiers referring to symbols or atoms.
		-- TSType               { },    -- For types.
		-- TSTypeBuiltin        { },    -- For builtin types.
		-- TSVariable           { },    -- Any variable name that does not have another highlight.
		TSVariableBuiltin({ fg = p.love }), -- Variable names that are defined by the languages, like `this` or `self`.

		TSTag({ fg = p.foam }), -- Tags like html tag names.
		TSTagDelimiter({ fg = p.subtle }), -- Tag delimiter like `<` `>` `/`
		-- TSText               { },    -- For strings considered text in a markup language.
		-- TSEmphasis           { },    -- For text to be represented with emphasis.
		-- TSUnderline          { },    -- For text to be represented with an underline.
		-- TSStrike             { },    -- For strikethrough text.
		-- TSTitle              { },    -- Text that is part of a title.
		-- TSLiteral            { },    -- Literal text.
		-- TSURI                { },    -- Any URI like a link or email.

		-- PLUGINS

		-- barbar
		BufferTabpageFill({}),
		BufferCurrent({ fg = p.text, bg = p.overlay }),
		BufferCurrentMod({ fg = p.foam, bg = p.overlay }),
		BufferCurrentSign({ fg = p.text, bg = p.overlay }),
		BufferInactive({ fg = p.subtle }),
		BufferInactiveMod({ fg = p.foam }),
		BufferInactiveSign({ fg = p.subtle }),
		BufferVisible({ fg = p.subtle }),
		BufferVisibleMod({ fg = p.foam }),
		BufferVisibleSign({ fg = p.subtle }),
	}
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap

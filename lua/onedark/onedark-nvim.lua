local lush = require('lush')

local colors = {
  black = "#282c34",
  black_dark = "#22262e",
  red = "#e06c75",
  green = "#98c379",
  yellow = "#e5c07b",
  yellow_dark = "#d19a66",
  blue = "#61afef",
  magenta = "#c678dd",
  cyan = "#56b6c2",
  white = "#c0c0c0",
  gray = "#4c4f55",
  comment_gray = "#5c6370",
  selection_gray = "#3e4451",
  cursor_gray = "#2c323c"
}

local red = colors.red
local green = colors.green
local yellow = colors.yellow
local blue = colors.blue
local magenta = colors.magenta
local cyan = colors.cyan
local black = colors.black
local white = colors.white
local gray = colors.gray
local comment_gray = colors.comment_gray
local selection_gray = colors.selection_gray
local cursor_gray = colors.cursor_gray
local black_dark = colors.black_dark
local yellow_dark = colors.yellow_dark

-- Set the terminal colors
vim.g.terminal_color_0 = black
vim.g.terminal_color_1 = red
vim.g.terminal_color_2 = green
vim.g.terminal_color_3 = yellow
vim.g.terminal_color_4 = blue
vim.g.terminal_color_5 = magenta
vim.g.terminal_color_6 = cyan
vim.g.terminal_color_7 = gray
vim.g.terminal_color_8 = comment_gray
vim.g.terminal_color_9 = red
vim.g.terminal_color_10 = green
vim.g.terminal_color_11 = yellow
vim.g.terminal_color_12 = blue
vim.g.terminal_color_13 = magenta
vim.g.terminal_color_14 = cyan
vim.g.terminal_color_15 = white
vim.g.terminal_color_background = black
vim.g.terminal_color_foreground = white

local styles = {
  bold = "bold",
  italic = "italic",
  underline = "underline",
  bold_italic = "bold italic",
  bold_underline = "bold underline",
  italic_underline = "italic underline"
}

local bold_strings = styles.bold
local italic_strings = styles.italic
local underline_strings = styles.underline
local bold_italic_strings = styles.bold_italic
local bold_underline_strings = styles.bold_underline
local italic_underline_strings = styles.italic_underline

local theme = lush(function()
  return {
    Comment      { fg = comment_gray, gui = italic_strings }, -- any comment
    ColorColumn  { bg = cursor_gray }, -- used for the columns set with 'colorcolumn'
    -- Conceal      { }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor       { fg = black, bg = blue }, -- character under the cursor
    CursorColumn { bg = cursor_gray }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg = cursor_gray }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg = blue }, -- directory names (and other special names in listings)
    DiffAdd      { bg = green, fg = black }, -- diff mode: Added line |diff.txt|
    DiffChange   { fg = yellow, gui = underline_strings }, -- diff mode: Changed line |diff.txt|
    DiffDelete   { bg = red, fg = black }, -- diff mode: Deleted line |diff.txt|
    DiffText     { bg = yellow, fg = black }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer  { fg = black }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- cursor in a focused terminal
    -- TermCursorNC { }, -- cursor in an unfocused terminal
    ErrorMsg     { fg = red, gui = bold_strings }, -- error messages on the command line
    VertSplit    { fg = comment_gray }, -- the column separating vertically split windows
    Folded       { fg = comment_gray }, -- line used for closed folds
    -- FoldColumn   { }, -- 'foldcolumn'
    -- SignColumn   { }, -- column where |signs| are displayed
    IncSearch    { fg = blue, bg = comment_gray }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    LineNr       { fg = comment_gray }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = white }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { fg = red, bg = comment_gray }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg      { }, -- |more-prompt|
    NonText      { fg = white }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { fg = white, bg= black }, -- normal text
    NormalFloat  { bg = black}, -- Normal text in floating windows.
	FloatBorder  { fg = blue },
    -- NormalNC     { }, -- normal text in non-current windows
    Pmenu        { fg = white, bg = black }, -- Popup menu: normal item.
    PmenuSel     { fg = black, bg = blue }, -- Popup menu: selected item.
    -- PmenuSbar    { }, -- Popup menu: scrollbar.
    -- PmenuThumb   { }, -- Popup menu: Thumb of the scrollbar.
    Question     { fg = white, gui = bold_strings }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { fg = black, bg = yellow }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { fg = black, bg = green }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad     { gui = underline_strings }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. 
    -- SpellCap     { gui = yellow }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine   { fg = white, bg = black }, -- status line of current window
    -- StatusLineNC { }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine      { fg = white, bg = black_dark }, -- tab pages line, not active tab page label
    TabLineFill  { bg = black_dark }, -- tab pages line, where there are no labels
    TabLineSel   { fg = white, bg = black }, -- tab pages line, active tab page label
    Title        { fg = blue, guid = bold_strings }, -- titles for output from ":set all", ":autocmd" etc.
    Visual       { bg = selection_gray, gui = bold_strings }, -- Visual mode selection
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = red }, -- warning messages
    -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu     { fg = black, bg = blue }, -- current match in 'wildmenu' completion

    Constant       { fg = cyan }, -- (preferred) any constant
    String         { fg = green }, --   a string constant: "this is a string"
    Character      { fg = green }, --  a character constant: 'c', '\n'
    Number         { fg = yellow_dark }, --   a number constant: 234, 0xff
    Boolean        { fg = yellow_dark }, --  a boolean constant: TRUE, false
    Float          { fg = yellow_dark }, --    a floating point constant: 2.3e10

    Identifier     { fg = white }, -- (preferred) any variable name
    Function       { fg = blue }, -- function name (also: methods for classes)

    Statement      { fg = magenta }, -- (preferred) any statement
    Conditional    { fg = magenta }, --  if, then, else, endif, switch, etc.
    Repeat         { fg = magenta }, --   for, do, while, etc.
    Label          { fg = yellow_dark }, --    case, default, etc.
    Operator       { fg = magenta }, -- "sizeof", "+", "*", etc.
    Keyword        { fg = red }, --  any other keyword -- TODO: what's this
    Exception      { fg = magenta }, --  try, catch, throw

    PreProc        { fg = yellow }, -- (preferred) generic Preprocessor TODO: check later
    Include        { fg = magenta }, --  preprocessor #include
    Define         { fg = magenta }, --   preprocessor #define
    Macro          { fg = magenta }, --    same as Define
    PreCondit      { fg = magenta }, --  preprocessor #if, #else, #endif, etc.

    Type           { fg = cyan }, -- (preferred) int, long, char, etc.
    StorageClass   { fg = magenta }, -- static, register, volatile, etc.
    Structure      { fg = magenta }, --  struct, union, enum, etc.
    Typedef        { fg = magenta }, --  A typedef

    Special        { fg = blue }, -- (preferred) any special symbol
    SpecialChar    { fg = green }, --  special character in a constant
    Tag            { fg = red }, --    you can use CTRL-] on this
    Delimiter      { fg = comment_gray }, --  character that needs attention
    SpecialComment { fg = comment_gray, gui = italic_strings }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

    -- Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    -- Bold       { gui = "bold" },
    -- Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error          { bg = black }, -- (preferred) any erroneous construct

    Todo           { fg = magenta }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- Nvim LSP
    LspReferenceText                     { fg = selection_gray}, -- used for highlighting "text" references
    LspReferenceRead                     { LspReferenceText }, -- used for highlighting "read" references
    LspReferenceWrite                    { LspReferenceText }, -- used for highlighting "write" references

    LspDiagnosticsDefaultError           { fg = red}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultWarning         { fg = yellow}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultInformation     { fg = blue }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultHint            { fg = cyan}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

    LspDiagnosticsVirtualTextError       { fg = red, bg = selection_gray }, -- Used for "Error" diagnostic virtual text
    LspDiagnosticsVirtualTextWarning     { fg = yellow, bg = selection_gray }, -- Used for "Warning" diagnostic virtual text
    LspDiagnosticsVirtualTextInformation { fg = blue, bg = selection_gray }, -- Used for "Information" diagnostic virtual text
    LspDiagnosticsVirtualTextHint        { fg = cyan, bg = selection_gray }, -- Used for "Hint" diagnostic virtual text

    LspDiagnosticsUnderlineError         { fg = red, gui = underline_strings }, -- Used to underline "Error" diagnostics
    LspDiagnosticsUnderlineWarning       { fg = yellow, gui = underline_strings }, -- Used to underline "Warning" diagnostics
    LspDiagnosticsUnderlineInformation   { fg = blue, gui = underline_strings }, -- Used to underline "Information" diagnostics
    LspDiagnosticsUnderlineHint          { fg = cyan, gui = underline_strings }, -- Used to underline "Hint" diagnostics

    LspDiagnosticsFloatingError          { fg = red, gui = underline_strings }, -- Used to color "Error" diagnostic messages in diagnostics float
    LspDiagnosticsFloatingWarning        { fg = yellow, gui = underline_strings }, -- Used to color "Warning" diagnostic messages in diagnostics float
    LspDiagnosticsFloatingInformation    { fg = blue, gui = underline_strings }, -- Used to color "Information" diagnostic messages in diagnostics float
    LspDiagnosticsFloatingHint           { fg = cyan, gui = underline_strings }, -- Used to color "Hint" diagnostic messages in diagnostics float

    LspDiagnosticsSignError              { fg = red }, -- Used for "Error" signs in sign column
    LspDiagnosticsSignWarning            { fg = yellow }, -- Used for "Warning" signs in sign column
    LspDiagnosticsSignInformation        { fg = blue }, -- Used for "Information" signs in sign column
    LspDiagnosticsSignHint               { fg = cyan }, -- Used for "Hint" signs in sign column

	-- Treesitter
    TSAnnotation         { fg = yellow };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    TSAttribute          { fg = magenta };    -- (unstable) TODO: docs
    TSBoolean            { fg = yellow_dark };    -- For booleans.
    TSCharacter          { fg = green };    -- For characters.
    TSComment            { fg = comment_gray, gui = italic_strings };    -- For comment blocks.
    TSConstructor        { fg = blue };    -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
    TSConditional        { fg = magenta };    -- For keywords related to conditionnals.
    TSConstant           { fg = white };    -- For constants
    TSConstBuiltin       { fg = yellow_dark };    -- For constant that are built in the language: `nil` in Lua.
    TSConstMacro         { fg = red };    -- For constants that are defined by macros: `NULL` in C.
    TSError              { fg = red };    -- For syntax/parser errors.
    TSException          { fg = magenta };    -- For exception related keywords.
    TSField              { fg = white };    -- For fields.
    TSFloat              { fg = yellow_dark };    -- For floats.
    TSFunction           { fg = blue };    -- For function (calls and definitions). //TODO
    TSFuncBuiltin        { fg = blue };    -- For builtin functions: `table.insert` in Lua.
    TSFuncMacro          { fg = magenta };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSInclude            { fg = magenta };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSKeyword            { fg = cyan };    -- For keywords that don't fall in previous categories.
    TSKeywordReturn      { fg = magenta };
    TSKeywordFunction    { fg = red };    -- For keywords used to define a fuction.
    TSLabel              { fg = red };    -- For labels: `label:` in C and `:label:` in Lua.
    TSMethod             { fg = blue };    -- For method calls and definitions.
    -- TSNamespace          { };    -- For identifiers referring to modules and namespaces. //TODO
    -- TSNone               { };    -- TODO: docs
    TSNumber             { fg = yellow_dark };    -- For all numbers
    TSOperator           { fg = magenta };    -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter          { fg = white };    -- For parameters of a function. //TODO
    TSParameterReference { fg = yellow };    -- For references to parameters of a function.
    TSProperty           { fg = red };    -- Same as `TSField`.
    TSPunctDelimiter     { fg = white };    -- For delimiters ie: `.`
    TSPunctBracket       { fg = comment_gray };    -- For brackets and parens.
    -- TSPunctSpecial       { };    -- For special punctutation that does not fall in the catagories before.
    TSRepeat             { fg = magenta };    -- For keywords related to loops.
    TSString             { fg = green };    -- For strings.
    TSStringRegex        { fg = green };    -- For regexes.
    TSStringEscape       { fg = yellow };    -- For escape characters within a string.
    TSSymbol             { gui = underline_strings };    -- For identifiers referring to symbols or atoms.
    TSType               { fg = cyan };    -- For types.
    TSTypeBuiltin        { fg = cyan };    -- For builtin types.
    TSVariable           { fg = white };    -- Any variable name that does not have another highlight.
    TSVariableBuiltin    { fg = white };    -- Variable names that are defined by the languages, like `this` or `self`.

    TSTag                { fg = red };    -- Tags like html tag names.
    TSTagDelimiter       { fg = white };    -- Tag delimiter like `<` `>` `/`
    TSText               { fg = green };    -- For strings considered text in a markup language.
    TSEmphasis           { fg = blue };    -- For text to be represented with emphasis.
    TSUnderline          { gui = underline_strings };    -- For text to be represented with an underline.
    -- TSStrike             { };    -- For strikethrough text.
    TSTitle              { fg = blue, gui = bold_strings };    -- Text that is part of a title.
    -- TSLiteral            { };    -- Literal text.
    TSURI                { gui = underline_strings };    -- Any URI like a link or email.

    -- Telescope
    TelescopeBorder      { fg = blue };

	-- Dashboard
	DashboardHeader       { fg = blue };
	DashboardCenter       { fg = comment_gray };
	DashboardShortcut     { fg = comment_gray };
	DashboardFooter       { fg = white };

	-- VimWiki
	VimwikiHeader1        { fg = blue, gui = bold_strings };
	VimwikiHeader2        { fg = green };
	VimwikiHeader3        { fg = yellow };
	VimwikiHeader4        { fg = red };

  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap

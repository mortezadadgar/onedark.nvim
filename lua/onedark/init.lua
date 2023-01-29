local M = {}

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
	gray1 = "#5c6370",
	gray2 = "#3e4451",
	gray3 = "#2c323c"
}

local styles = {
	bold = "bold",
	italic = "italic",
	underline = "underline",
	bold_italic = "bold italic",
	bold_underline = "bold underline",
	italic_underline = "italic underline"
}

local highlights = {
	{ hg = "Comment",      fg = colors.gray1, gui = styles.italic }, -- any comment
	{ hg = "ColorColumn",  bg = colors.gray3 }, -- used for the columns set with 'colorcolumn'
	{ hg = "Cursor",       fg = colors.black, bg = colors.blue }, -- character under the cursor
	{ hg = "CursorColumn", bg = colors.gray3 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
	{ hg = "CursorLine",   bg = colors.gray3 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
	{ hg = "Directory",    fg = colors.blue }, -- directory names (and other special names in listings)
	{ hg = "DiffAdd",      bg = colors.green, fg = colors.black }, -- diff mode: Added line |diff.txt|
	{ hg = "DiffChange",   fg = colors.yellow, gui = styles.underline }, -- diff mode: Changed line |diff.txt|
	{ hg = "DiffDelete",   bg = colors.red, fg = colors.black }, -- diff mode: Deleted line |diff.txt|
	{ hg = "DiffText",     bg = colors.yellow, fg = colors.black }, -- diff mode: Changed text within a changed line |diff.txt|
	{ hg = "EndOfBuffer",  fg = colors.black }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
	{ hg = "ErrorMsg",     fg = colors.red, gui = styles.bold }, -- error messages on the command line
	{ hg = "VertSplit",    fg = colors.gray1 }, -- the column separating vertically split windows
	{ hg = "Folded",       fg = colors.gray1 }, -- line used for closed folds
	{ hg = "IncSearch",    fg = colors.blue, bg = colors.gray1 }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
	{ hg = "LineNr",       fg = colors.gray1 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
	{ hg = "CursorLineNr", fg = colors.white }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
	{ hg = "MatchParen",   fg = colors.blue, bg = colors.gray1 }, -- The character under the cursor or just before it, if it is a paicolors.red bracket, and its match. |pi_paren.txt|
	{ hg = "NonText",      fg = colors.white }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
	{ hg = "Normal",       fg = colors.white, bg= colors.black }, -- normal text
	{ hg = "NormalFloat",  bg = colors.black }, -- Normal text in floating windows.
	{ hg = "FloatBorder",  fg = colors.blue },
	{ hg = "Pmenu",        fg = colors.white, bg = colors.black }, -- Popup menu: normal item.
	{ hg = "PmenuSel",     fg = colors.black, bg = colors.blue }, -- Popup menu: selected item.
	{ hg = "Question",     fg = colors.white, gui = styles.bold }, -- |hit-enter| prompt and yes/no questions
	{ hg = "QuickFixLine", fg = colors.white, bg = colors.gray2 }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
	{ hg = "Search",       fg = colors.black, bg = colors.green }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
	{ hg = "SpellBad",     gui = styles.underline }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
	{ hg = "StatusLine",   fg = colors.white, bg = colors.black }, -- status line of current window
	{ hg = "StatusLineNC", },
	{ hg = "TabLine",      fg = colors.white, bg = colors.black_dark }, -- tab pages line, not active tab page label
	{ hg = "TabLineFill",  bg = colors.black_dark }, -- tab pages line, where there are no labels
	{ hg = "TabLineSel",   fg = colors.white, bg = colors.black }, -- tab pages line, active tab page label
	{ hg = "Title",        fg = colors.white }, -- titles for output from ":set all", ":autocmd" etc.
	{ hg = "Visual",       bg = colors.gray2, gui = styles.bold }, -- Visual mode selection
	{ hg = "WarningMsg",   fg = colors.red }, -- warning messages
	{ hg = "WildMenu",     fg = colors.black, bg = colors.blue }, -- current match in 'wildmenu' completion
	{ hg = "Constant",     fg = colors.cyan }, -- (prefercolors.red) any constant
	{ hg = "String",       fg = colors.green }, --   a string constant: "this is a string"
	{ hg = "Character",    fg = colors.green }, --  a character constant: 'c', '\n'
	{ hg = "Number",       fg = colors.yellow_dark }, --   a number constant: 234, 0xff
	{ hg = "Boolean",      fg = colors.yellow_dark }, --  a boolean constant: TRUE, false
	{ hg = "Float",        fg = colors.yellow_dark }, --    a floating point constant: 2.3e10
	{ hg = "Identifier",   fg = colors.white }, -- (prefercolors.red) any variable name
	{ hg = "Function",     fg = colors.blue }, -- function name (also: methods for classes)

	{ hg = "Statement",      fg = colors.magenta }, -- (prefercolors.red) any statement
	{ hg = "Conditional",    fg = colors.magenta }, --  if, then, else, endif, switch, etc.
	{ hg = "Repeat",         fg = colors.magenta }, --   for, do, while, etc.
	{ hg = "Label",          fg = colors.red }, --    case, default, etc. TODO: check this
	{ hg = "Operator",       fg = colors.magenta }, -- "sizeof", "+", "*", etc.
	{ hg = "Keyword",        fg = colors.red }, --  any other keyword -- TODO: what's this
	{ hg = "Exception",      fg = colors.magenta }, --  try, catch, throw

	{ hg = "PreProc",        fg = colors.yellow }, -- (prefercolors.red) generic Preprocessor
	{ hg = "Include",        fg = colors.magenta }, --  preprocessor #include
	{ hg = "Define",         fg = colors.red }, --   preprocessor #define
	{ hg = "Macro",          fg = colors.magenta }, --    same as Define
	{ hg = "PreCondit",      fg = colors.magenta }, --  preprocessor #if, #else, #endif, etc.

	{ hg = "Type",           fg = colors.cyan }, -- (prefercolors.red) int, long, char, etc.
	{ hg = "StorageClass",   fg = colors.magenta }, -- static, register, volatile, etc.
	{ hg = "Structure",      fg = colors.magenta }, --  struct, union, enum, etc.
	{ hg = "Typedef",        fg = colors.magenta }, --  A typedef

	{ hg = "Special",        fg = colors.blue }, -- (prefercolors.red) any special symbol
	{ hg = "SpecialChar",    fg = colors.green }, --  special character in a constant
	{ hg = "Tag",            fg = colors.red }, --    you can use CTRL-] on this
	{ hg = "Delimiter",      fg = colors.white }, --  character that needs attention
	{ hg = "SpecialComment", fg = colors.gray1, gui = styles.italic }, -- special things inside a comment

	{ hg = "Error",          bg = colors.black }, -- (prefercolors.red) any erroneous construct
	{ hg = "Todo",           fg = colors.magenta }, -- (prefercolors.red) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- Nvim LSP
	{ hg = "LspReferenceText",                     fg = colors.black, bg = colors.blue }, -- used for highlighting "text" references
	{ hg = "LspReferenceRead",                     link = "LspReferenceText" }, -- used for highlighting "read" references
	{ hg = "LspReferenceWrite",                    link = "LspReferenceText" }, -- used for highlighting "write" references

	{ hg = "DiagnosticError",                      fg = colors.red }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
	{ hg = "DiagnosticWarn",                       fg = colors.yellow }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
	{ hg = "DiagnosticInfo",                       fg = colors.blue }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
	{ hg = "DiagnosticHint",                       fg = colors.cyan }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

	{ hg = "DiagnosticVirtualTextError",           fg = colors.red, bg = colors.gray2 }, -- Used for "Error" diagnostic virtual text
	{ hg = "DiagnosticVirtualTextWarn",            fg = colors.yellow, bg = colors.gray2 }, -- Used for "Warn" diagnostic virtual text
	{ hg = "DiagnosticVirtualTextInfo",            fg = colors.blue, bg = colors.gray2 }, -- Used for "Information" diagnostic virtual text
	{ hg = "DiagnosticVirtualTextHint",            fg = colors.cyan, bg = colors.gray2 }, -- Used for "Hint" diagnostic virtual text

	{ hg = "DiagnosticUnderlineError",             fg = colors.red, gui = styles.underline }, -- Used to underline "Error" diagnostics
	{ hg = "DiagnosticUnderlineWarn",              fg = colors.yellow, gui = styles.underline }, -- Used to underline "Warn" diagnostics
	{ hg = "DiagnosticUnderlineInfo",              fg = colors.blue, gui = styles.underline }, -- Used to underline "Information" diagnostics
	{ hg = "DiagnosticUnderlineHint",              fg = colors.cyan, gui = styles.underline }, -- Used to underline "Hint" diagnostics

	{ hg = "DiagnosticFloatingError",              fg = colors.red, gui = styles.underline }, -- Used to color "Error" diagnostic messages in diagnostics float
	{ hg = "DiagnosticFloatingWarn",               fg = colors.yellow, gui = styles.underline }, -- Used to color "Warn" diagnostic messages in diagnostics float
	{ hg = "DiagnosticFloatingInfo",               fg = colors.blue, gui = styles.underline }, -- Used to color "Information" diagnostic messages in diagnostics float
	{ hg = "DiagnosticFloatingHint",               fg = colors.cyan, gui = styles.underline }, -- Used to color "Hint" diagnostic messages in diagnostics float

	{ hg = "DiagnosticSignError",                  fg = colors.red }, -- Used for "Error" signs in sign column
	{ hg = "DiagnosticSignWarn",                   fg = colors.yellow }, -- Used for "Warn" signs in sign column
	{ hg = "DiagnosticSignInfo",                   fg = colors.blue }, -- Used for "Information" signs in sign column
	{ hg = "DiagnosticSignHint",                   fg = colors.cyan }, -- Used for "Hint" signs in sign column

	-- Treesitter
	{ hg = "@text.reference",      fg = colors.yellow }, -- For references to parameters of a function.
	{ hg = "@property",            fg = colors.red }, -- Same as `TSField`.
	{ hg = "@keyword",             fg = colors.magenta };    -- For keywords that don't fall in previous categories.
	{ hg = "@constant",            fg = colors.white };    -- For constants
	{ hg = "@constant.builtin",    fg = colors.yellow_dark },    -- For constant that are built in the language: `nil` in Lua.
	{ hg = "@text.uri",            fg = colors.green },
	{ hg = "@function.builtin",    fg = colors.cyan };    -- For builtin functions: `table.insert` in Lua.

	-- TSmarkdown
	{ hg = "@text.title.markdown", fg = colors.blue };

	-- TSCss
	{ hg = "@type.css",            fg = colors.red },

	-- TSHtml
	{ hg = "@operator.html",       fg = colors.white },

	-- TSGo
	{ hg = "@namespace.go",        fg = colors.white },

	-- TSC
	{ hg = "@constant.macro.c",    fg = colors.magenta },

    -- Telescope
	{ hg = "TelescopeBorder",      fg = colors.blue },

	-- VimWiki
	{ hg = "VimwikiHeader1",       fg = colors.blue, gui = styles.bold },
	{ hg = "VimwikiHeader2",       fg = colors.magenta, gui = styles.bold },
	{ hg = "VimwikiHeader3",       fg = colors.cyan, gui = styles.bold },
	{ hg = "VimwikiHeader4",       fg = colors.cyan, gui = styles.bold },

	-- Gitsings
	{ hg = "GitSignsAdd",          fg = colors.yellow },
	{ hg = "GitSignsChange",       fg = colors.blue },
	{ hg = "GitSignsDelete",       fg = colors.red },

	-- Nvim-cmp
	{ hg = "CmpItemAbbrDefault",       fg = colors.gray1 },
	{ hg = "CmpItemKindText",          fg = colors.magenta },
	{ hg = "CmpItemKindMethod",        fg = colors.blue },
	{ hg = "CmpItemKindFunction",      fg = colors.blue },
	{ hg = "CmpItemKindConstructor",   fg = colors.yellow },
	{ hg = "CmpItemKindField",         fg = colors.blue },
	{ hg = "CmpItemKindClass",         fg = colors.yellow },
	{ hg = "CmpItemKindInterface",     fg = colors.yellow },
	{ hg = "CmpItemKindModule",        fg = colors.cyan },
	{ hg = "CmpItemKindProperty",      fg = colors.blue },
	{ hg = "CmpItemKindValue",         fg = colors.yellow },
	{ hg = "CmpItemKindEnum",          fg = colors.yellow },
	{ hg = "CmpItemKindKeyword",       fg = colors.red },
	{ hg = "CmpItemKindSnippet",       fg = colors.green },
	{ hg = "CmpItemKindFile",          fg = colors.blue },
	{ hg = "CmpItemKindEnumMember",    fg = colors.cyan },
	{ hg = "CmpItemKindConstant",      fg = colors.green },
	{ hg = "CmpItemKindStruct",        fg = colors.yellow },
	{ hg = "CmpItemKindTypeParameter", fg = colors.yellow },

	-- TSComments
	{ hg = "@text.note",               fg = colors.blue },
	{ hg = "@text.warning",            fg = colors.yellow },
	{ hg = "@text.danger",             fg = colors.red },

	-- LspSignature
	{ hg = "LspSignatureActiveParameter", fg = colors.white, bg = colors.gray2 },

	-- NvimTree
	{ hg = "NvimTreeNormal",           fg = colors.white, bg = colors.black_dark },
	{ hg = "NvimTreeFolderIcon",       fg = colors.yellow };
	{ hg = "NvimTreeOpenedFolderName", fg = colors.white },
	{ hg = "NvimTreeEmptyFolderName",  fg = colors.white };
	{ hg = "NvimTreeFolderName",       fg = colors.white };
	{ hg = "NvimTreeVertSplit",        fg = colors.black };
	{ hg = "NvimTreeIndentMarker",     fg = colors.comment_gray };
	{ hg = "NvimTreeSpecialFile",      fg = colors.yellow };
	{ hg = "NvimTreeRootFolder",       fg = colors.blue };
	{ hg = "NvimTreeSignColumn",       link = "NvimTreeNormal" };
}

M.colorscheme = function()
	local highlight_cmds = {}
	for idx = 1, #highlights do
		local highlight = highlights[idx]
		if highlight.link then
			highlight_cmds[idx] = string.format(
			'highlight link %s %s',
			highlight.hg,
			highlight.link
			)
			goto continue
		end
		highlight_cmds[idx] = string.format(
		'highlight %s guifg=%s guibg=%s gui=%s guisp=%s',
		highlight.hg,
		highlight.fg or 'NONE',
		highlight.bg or 'NONE',
		highlight.gui or 'NONE',
		highlight.guisp or 'NONE'
		)
		::continue::
	end
	vim.cmd(table.concat(highlight_cmds, '\n'))
end

return M

-- vi:nowrap

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
	{ hg = "Comment",        fg = colors.gray1, gui = styles.italic },
	{ hg = "ColorColumn",    bg = colors.gray3 },
	{ hg = "Cursor",         fg = colors.black, bg = colors.blue },
	{ hg = "CursorColumn",   bg = colors.gray3 },
	{ hg = "CursorLine",     bg = colors.gray3 },
	{ hg = "Directory",      fg = colors.blue },
	{ hg = "DiffAdd",        bg = colors.green, fg = colors.black },
	{ hg = "DiffChange",     },
	{ hg = "DiffDelete",     bg = colors.red, fg = colors.black },
	{ hg = "DiffText",       bg = colors.blue, fg = colors.black },
	{ hg = "EndOfBuffer",    fg = colors.black },
	{ hg = "ErrorMsg",       fg = colors.red, gui = styles.bold },
	{ hg = "VertSplit",      fg = colors.gray1 },
	{ hg = "Folded",         fg = colors.gray1 },
	{ hg = "IncSearch",      fg = colors.blue, bg = colors.gray1 },
	{ hg = "LineNr",         fg = colors.gray1 },
	{ hg = "CursorLineNr",   fg = colors.white },
	{ hg = "MatchParen",     fg = colors.blue, bg = colors.gray1 },
	{ hg = "NonText",        fg = colors.white },
	{ hg = "Normal",         fg = colors.white, bg= colors.black },
	{ hg = "NormalFloat",    bg = colors.black },
	{ hg = "FloatBorder",    fg = colors.blue },
	{ hg = "Pmenu",          fg = colors.white, bg = colors.black },
	{ hg = "PmenuSel",       fg = colors.black, bg = colors.blue },
	{ hg = "Question",       fg = colors.white, gui = styles.bold },
	{ hg = "QuickFixLine",   fg = colors.white, bg = colors.gray2 },
	{ hg = "Search",         fg = colors.black, bg = colors.green },
	{ hg = "SpellBad",       gui = styles.underline },
	{ hg = "StatusLine",     fg = colors.white, bg = colors.black },
	{ hg = "StatusLineNC",   },
	{ hg = "TabLine",        fg = colors.white, bg = colors.black_dark },
	{ hg = "TabLineFill",    bg = colors.black_dark },
	{ hg = "TabLineSel",     fg = colors.white, bg = colors.black },
	{ hg = "Title",          fg = colors.white },
	{ hg = "Visual",         bg = colors.gray2, gui = styles.bold },
	{ hg = "WarningMsg",     fg = colors.red },
	{ hg = "WildMenu",       fg = colors.black, bg = colors.blue },
	{ hg = "Constant",       fg = colors.cyan },
	{ hg = "String",         fg = colors.green },
	{ hg = "Character",      fg = colors.green },
	{ hg = "Number",         fg = colors.yellow_dark },
	{ hg = "Boolean",        fg = colors.yellow_dark },
	{ hg = "Float",          fg = colors.yellow_dark },
	{ hg = "Identifier",     fg = colors.white },
	{ hg = "Function",       fg = colors.blue },

	{ hg = "Statement",      fg = colors.magenta },
	{ hg = "Conditional",    fg = colors.magenta },
	{ hg = "Repeat",         fg = colors.magenta },
	{ hg = "Label",          fg = colors.red },
	{ hg = "Operator",       fg = colors.magenta },
	{ hg = "Keyword",        fg = colors.red },
	{ hg = "Exception",      fg = colors.magenta },

	{ hg = "PreProc",        fg = colors.yellow },
	{ hg = "Include",        fg = colors.magenta },
	{ hg = "Define",         fg = colors.red },
	{ hg = "Macro",          fg = colors.magenta },
	{ hg = "PreCondit",      fg = colors.magenta },

	{ hg = "Type",           fg = colors.cyan },
	{ hg = "StorageClass",   fg = colors.magenta },
	{ hg = "Structure",      fg = colors.magenta },
	{ hg = "Typedef",        fg = colors.magenta },

	{ hg = "Special",        fg = colors.blue },
	{ hg = "SpecialChar",    fg = colors.green },
	{ hg = "Tag",            fg = colors.red },
	{ hg = "Delimiter",      fg = colors.white },
	{ hg = "SpecialComment", fg = colors.gray1, gui = styles.italic },

	{ hg = "Error",          bg = colors.black },
	{ hg = "Todo",           fg = colors.magenta },

    -- Nvim LSP
	{ hg = "LspReferenceText",           fg = colors.black, bg = colors.blue },
	{ hg = "LspReferenceRead",           link = "LspReferenceText" },
	{ hg = "LspReferenceWrite",          link = "LspReferenceText" },

	{ hg = "DiagnosticError",            fg = colors.red },
	{ hg = "DiagnosticWarn",             fg = colors.yellow },
	{ hg = "DiagnosticInfo",             fg = colors.blue },
	{ hg = "DiagnosticHint",             fg = colors.cyan },

	{ hg = "DiagnosticVirtualTextError", fg = colors.red, bg = colors.gray2 },
	{ hg = "DiagnosticVirtualTextWarn",  fg = colors.yellow, bg = colors.gray2 },
	{ hg = "DiagnosticVirtualTextInfo",  fg = colors.blue, bg = colors.gray2 },
	{ hg = "DiagnosticVirtualTextHint",  fg = colors.cyan, bg = colors.gray2 },

	{ hg = "DiagnosticUnderlineError",   fg = colors.red, gui = styles.underline },
	{ hg = "DiagnosticUnderlineWarn",    fg = colors.yellow, gui = styles.underline },
	{ hg = "DiagnosticUnderlineInfo",    fg = colors.blue, gui = styles.underline },
	{ hg = "DiagnosticUnderlineHint",    fg = colors.cyan, gui = styles.underline },

	{ hg = "DiagnosticFloatingError",    fg = colors.red, gui = styles.underline },
	{ hg = "DiagnosticFloatingWarn",     fg = colors.yellow, gui = styles.underline },
	{ hg = "DiagnosticFloatingInfo",     fg = colors.blue, gui = styles.underline },
	{ hg = "DiagnosticFloatingHint",     fg = colors.cyan, gui = styles.underline },

	{ hg = "DiagnosticSignError",        fg = colors.red },
	{ hg = "DiagnosticSignWarn",         fg = colors.yellow },
	{ hg = "DiagnosticSignInfo",         fg = colors.blue },
	{ hg = "DiagnosticSignHint",         fg = colors.cyan },

	-- Treesitter
	{ hg = "variable",             fg = colors.white },
	{ hg = "@text.reference",      fg = colors.yellow },
	{ hg = "@property",            fg = colors.red },
	{ hg = "@keyword",             fg = colors.magenta },
	{ hg = "@constant",            fg = colors.white },
	{ hg = "@constant.builtin",    fg = colors.yellow_dark },
	{ hg = "@text.uri",            fg = colors.green },
	{ hg = "@function.builtin",    fg = colors.cyan },
	{ hg = "@lsp.type.property",   fg = "@property" },
	{ hg = "@lsp.type.variable",   fg = "@variable" },

	-- TSmarkdown
	{ hg = "@text.title.markdown", fg = colors.blue },

	-- TSCss
	{ hg = "@type.css",            fg = colors.red },
	{ hg = "@property.class.css",  fg = colors.yellow_dark },
	{ hg = "@property.id.css",     fg = colors.blue },
	{ hg = "@property.css",        fg = colors.white },
	{ hg = "@string.plain.css",    fg = colors.white },
	{ hg = "@type.tag.css",        fg = colors.red },
	{ hg = "@type.definition.css", fg = colors.red },
	{ hg = "@type.qualifier",      fg = colors.magenta },

	-- TSHtml
	{ hg = "@tag.delimiter.html",  fg = colors.white },

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
	{ hg = "NvimTreeFolderIcon",       fg = colors.yellow },
	{ hg = "NvimTreeOpenedFolderName", fg = colors.white },
	{ hg = "NvimTreeEmptyFolderName",  fg = colors.white },
	{ hg = "NvimTreeFolderName",       fg = colors.white },
	{ hg = "NvimTreeVertSplit",        fg = colors.black },
	{ hg = "NvimTreeIndentMarker",     fg = colors.comment_gray },
	{ hg = "NvimTreeSpecialFile",      fg = colors.yellow },
	{ hg = "NvimTreeRootFolder",       fg = colors.blue },
	{ hg = "NvimTreeSignColumn",       link = "NvimTreeNormal" },

	-- Orgmode
	{ hg = "OrgTODO",             fg = colors.blue, gui = styles.bold_strings },
	{ hg = "OrgDONE",             fg = colors.green, gui = styles.italic_strings },
	{ hg = "OrgTSHeadlineLevel1", fg = colors.blue, gui = styles.bold_strings },
	{ hg = "OrgTSHeadlineLevel2", fg = colors.magenta, gui = styles.bold_strings },
	{ hg = "OrgTSHeadlineLevel3", fg = colors.cyan, gui = styles.bold_strings },
	{ hg = "OrgTSHeadlineLevel4", fg = colors.cyan, gui = styles.bold_strings },

	-- Mini.files
	{ hg = "MiniFilesBorderModified", fg = colors.red },
}

M.colorscheme = function()
	local highlight_cmds = {}
	for idx = 1, #highlights do
		local highlight = highlights[idx]
		highlight_cmds[idx] = string.format(
			'highlight %s guifg=%s guibg=%s gui=%s',
			highlight.hg,
			highlight.fg or 'NONE',
			highlight.bg or 'NONE',
			highlight.gui or 'NONE'
		)
	end
	vim.cmd(table.concat(highlight_cmds, '\n'))
end

return M

-- vi:nowrap

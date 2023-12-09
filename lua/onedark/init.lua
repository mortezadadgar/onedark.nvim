local M = {}

local colors = {
	white = "#c0c0c0",
	black = "#282c34",
	black_dark = "#22262e",
	red = "#e06c75",
	red_dark = "#4F343A",
	green = "#98c379",
	green_dark = "#3E493D",
	yellow = "#e5c07b",
	yellow_dark = "#d19a66",
	blue = "#61afef",
	blue_dark = "#0b416d",
	magenta = "#c678dd",
	cyan = "#56b6c2",
	gray1 = "#5c6370",
	gray2 = "#3e4451",
	gray3 = "#333842",
	gray4 = "#2c323c",
}

local highlights = {
	{ "Comment", { fg = colors.gray1, italic = true } },
	{ "ColorColumn", { bg = colors.gray4 } },
	{ "Cursor", { fg = colors.black, bg = colors.blue } },
	{ "Conceal", { bg = colors.gray4 } },
	{ "CursorColumn", { bg = colors.gray4 } },
	{ "CursorLine", { bg = colors.gray4 } },
	{ "Directory", { fg = colors.blue } },
	{ "DiffAdd", { bg = colors.green_dark } },
	{ "DiffChange", { bg = colors.green_dark } },
	{ "DiffDelete", { fg = colors.gray2 } },
	{ "DiffText", { bg = colors.green, fg = colors.black } },
	{ "EndOfBuffer", { fg = colors.gray1 } },
	{ "ErrorMsg", { fg = colors.red, bold = true } },
	{ "MoreMsg", { fg = colors.green } },
	{ "MsgSeparator", { bg = colors.black, fg = colors.gray1 } },
	{ "WinSeparator", { link = "MsgSeparator" } },
	{ "ModeMsg", { fg = colors.white } },
	{ "Folded", { fg = colors.gray1 } },
	{ "FoldColumn", { fg = colors.white, bg = colors.black } },
	{ "IncSearch", { fg = colors.blue, bg = colors.gray1 } },
	{ "LineNr", { fg = colors.gray1 } },
	{ "Whitespace", { fg = colors.gray2 } },
	{ "CursorLineNr", { fg = colors.white } },
	{ "SignColumn", { bg = colors.black } },
	{ "MatchParen", { fg = colors.blue, bg = colors.gray1 } },
	{ "NonText", { fg = colors.white } },
	{ "Normal", { fg = colors.white, bg = colors.black } },
	{ "NormalFloat", { bg = colors.gray3 } },
	{ "FloatBorder", { bg = colors.gray3, fg = colors.blue } },
	{ "Pmenu", { fg = colors.white, bg = colors.gray3 } },
	{ "PmenuSel", { fg = colors.black, bg = colors.blue } },
	{ "Question", { fg = colors.white, bold = true } },
	{ "QuickFixLine", { fg = colors.white, bg = colors.gray2 } },
	{ "Search", { fg = colors.blue, bg = colors.gray1 } },
	{ "CurSearch", { link = "Search" } }, -- hlsearch = false
	{ "SpecialKey", { fg = colors.gray1 } },
	{ "SpellBad", { underline = true } },
	{ "StatusLine", { fg = colors.white, bg = colors.gray3 } },
	{ "StatusLineNC", {} },
	{ "TabLine", { fg = colors.white, bg = colors.black_dark } },
	{ "TabLineFill", { bg = colors.black_dark } },
	{ "TabLineSel", { fg = colors.white, bg = colors.black } },
	{ "Title", { fg = colors.blue } },
	{ "Visual", { bg = colors.gray2, bold = true } },
	{ "WarningMsg", { fg = colors.red } },
	{ "WildMenu", { fg = colors.black, bg = colors.blue } },

	{ "Constant", { fg = colors.white } },
	{ "String", { fg = colors.green } },
	{ "Character", { fg = colors.green } },
	{ "Float", { fg = colors.yellow_dark } },
	{ "Number", { fg = colors.yellow_dark } },
	{ "Boolean", { fg = colors.yellow_dark } },
	{ "Identifier", { fg = colors.white } },
	{ "Function", { fg = colors.blue } },

	{ "Statement", { fg = colors.magenta } },
	{ "Conditional", { fg = colors.magenta } },
	{ "Repeat", { fg = colors.magenta } },
	{ "Label", { fg = colors.red } },
	{ "Operator", { fg = colors.magenta } },
	{ "Keyword", { fg = colors.magenta } },
	{ "Exception", { fg = colors.magenta } },

	{ "PreProc", { fg = colors.yellow } },
	{ "Include", { fg = colors.magenta } },
	{ "Define", { fg = colors.red } },
	{ "Macro", { fg = colors.magenta } },
	{ "PreCondit", { fg = colors.magenta } },

	{ "Type", { fg = colors.cyan } },
	{ "StorageClass", { fg = colors.magenta } },
	{ "Structure", { fg = colors.magenta } },
	{ "Typedef", { fg = colors.magenta } },

	{ "Special", { fg = colors.blue } },
	{ "SpecialChar", { fg = colors.green } },
	{ "Tag", { fg = colors.red } },
	{ "Delimiter", { fg = colors.white } },
	{ "SpecialComment", { fg = colors.gray1, italic = true } },

	{ "Error", { fg = colors.black, bg = colors.red } },
	{ "Todo", { fg = colors.blue } },
	{ "Bold", { bold = true } },
	{ "Italic", { italic = true } },
	{ "Underlined", { underline = true } },

	-- Nvim LSP
	{ "LspReferenceText", { fg = colors.black, bg = colors.blue } },
	{ "LspReferenceRead", { link = "LspReferenceText" } },
	{ "LspReferenceWrite", { link = "LspReferenceText" } },

	{ "DiagnosticError", { fg = colors.red } },
	{ "DiagnosticWarn", { fg = colors.yellow } },
	{ "DiagnosticInfo", { fg = colors.blue } },
	{ "DiagnosticHint", { fg = colors.cyan } },

	{ "DiagnosticVirtualTextError", { fg = colors.red, bg = colors.gray2 } },
	{ "DiagnosticVirtualTextWarn", { fg = colors.yellow, bg = colors.gray2 } },
	{ "DiagnosticVirtualTextInfo", { fg = colors.blue, bg = colors.gray2 } },
	{ "DiagnosticVirtualTextHint", { fg = colors.cyan, bg = colors.gray2 } },

	{ "DiagnosticUnderlineError", { fg = colors.red, underline = true } },
	{ "DiagnosticUnderlineWarn", { fg = colors.yellow, underline = true } },
	{ "DiagnosticUnderlineInfo", { fg = colors.blue, underline = true } },
	{ "DiagnosticUnderlineHint", { fg = colors.cyan, underline = true } },

	{ "DiagnosticFloatingError", { fg = colors.red, underline = true } },
	{ "DiagnosticFloatingWarn", { fg = colors.yellow, underline = true } },
	{ "DiagnosticFloatingInfo", { fg = colors.blue, underline = true } },
	{ "DiagnosticFloatingHint", { fg = colors.cyan, underline = true } },

	{ "DiagnosticSignError", { fg = colors.red } },
	{ "DiagnosticSignWarn", { fg = colors.yellow } },
	{ "DiagnosticSignInfo", { fg = colors.blue } },
	{ "DiagnosticSignHint", { fg = colors.cyan } },

	-- Treesitter
	{ "@text.reference", { fg = colors.yellow } },
	{ "@property", { fg = colors.red } },
	{ "@variable", { fg = colors.white } },
	{ "@constant.builtin", { fg = colors.yellow_dark } },
	{ "@function.builtin", { fg = colors.cyan } },

	-- Markdown
	{ "@text.title.1.marker.markdown", { fg = colors.blue, bold = true } },
	{ "@text.title.2.marker.markdown", { fg = colors.magenta, bold = true } },
	{ "@text.title.3.marker.markdown", { fg = colors.cyan, bold = true } },
	{ "@text.title.4.marker.markdown", { fg = colors.cyan, bold = true } },
	{ "@punctuation.special.markdown", { fg = colors.blue } },
	{ "@text.literal.markdown_inline", { fg = colors.yellow } },
	{ "@text.strike.markdown_inline", { strikethrough = true } },
	{ "@text.strong.markdown_inline", { bold = true } },
	{ "@text.emphasis.markdown_inline", { italic = true } },

	-- Css
	{ "@type.css", { fg = colors.red } },
	{ "@property.class.css", { fg = colors.yellow_dark } },
	{ "@property.id.css", { fg = colors.blue } },
	{ "@property.css", { fg = colors.white } },
	{ "@string.plain.css", { fg = colors.white } },
	{ "@type.tag.css", { fg = colors.red } },
	{ "@type.definition.css", { fg = colors.red } },
	{ "@type.qualifier", { fg = colors.magenta } },

	-- Scss
	{ "@type.scss", { fg = colors.red } },
	{ "@property.class.scss", { fg = colors.yellow_dark } },
	{ "@property.id.scss", { fg = colors.blue } },
	{ "@property.scss", { fg = colors.white } },
	{ "@string.plain.scss", { fg = colors.white } },
	{ "@type.tag.scss", { fg = colors.red } },
	{ "@type.definition.scss", { fg = colors.red } },
	{ "@type.qualifier", { fg = colors.magenta } },

	-- vimdoc
	{ "@parameter.vimdoc", { fg = colors.blue } },

	-- Html
	{ "@tag.delimiter.html", { fg = colors.white } },

	-- Go
	{ "@namespace.go", { fg = colors.white } },

	-- C
	{ "@constant.macro.c", { fg = colors.magenta } },

	-- Telescope
	{ "TelescopeBorder", { fg = colors.blue, bg = colors.gray3 } },
	{ "TelescopeNormal", { fg = colors.white, bg = colors.gray3 } },

	-- VimWiki
	{ "VimwikiHeader1", { fg = colors.blue, bold = true } },
	{ "VimwikiHeader2", { fg = colors.magenta, bold = true } },
	{ "VimwikiHeader3", { fg = colors.cyan, bold = true } },
	{ "VimwikiHeader4", { fg = colors.cyan, bold = true } },

	-- Gitsings
	{ "GitSignsAdd", { fg = colors.yellow } },
	{ "GitSignsChange", { fg = colors.blue } },
	{ "GitSignsDelete", { fg = colors.red } },
	{ "GitSignsDeletePreview", { bg = colors.red_dark } },

	-- Nvim-cmp
	{ "CmpItemAbbr", { fg = colors.gray1 } },
	{ "CmpItemKindText", { fg = colors.magenta } },
	{ "CmpItemKindMethod", { fg = colors.blue } },
	{ "CmpItemKindFunction", { fg = colors.blue } },
	{ "CmpItemKindConstructor", { fg = colors.yellow } },
	{ "CmpItemKindField", { fg = colors.blue } },
	{ "CmpItemKindClass", { fg = colors.yellow } },
	{ "CmpItemKindInterface", { fg = colors.yellow } },
	{ "CmpItemKindModule", { fg = colors.cyan } },
	{ "CmpItemKindProperty", { fg = colors.blue } },
	{ "CmpItemKindValue", { fg = colors.yellow } },
	{ "CmpItemKindEnum", { fg = colors.yellow } },
	{ "CmpItemKindKeyword", { fg = colors.red } },
	{ "CmpItemKindSnippet", { fg = colors.green } },
	{ "CmpItemKindFile", { fg = colors.blue } },
	{ "CmpItemKindEnumMember", { fg = colors.cyan } },
	{ "CmpItemKindConstant", { fg = colors.green } },
	{ "CmpItemKindStruct", { fg = colors.yellow } },
	{ "CmpItemKindTypeParameter", { fg = colors.yellow } },

	-- TSComments
	{ "@text.note", { fg = colors.blue } },
	{ "@text.warning", { fg = colors.yellow } },
	{ "@text.danger", { fg = colors.red } },

	-- LspSignature
	{ "LspSignatureActiveParameter", { fg = colors.white, bg = colors.gray2 } },

	-- NvimTree
	{ "NvimTreeNormal", { fg = colors.white, bg = colors.black_dark } },
	{ "NvimTreeFolderIcon", { fg = colors.yellow } },
	{ "NvimTreeOpenedFolderName", { fg = colors.white } },
	{ "NvimTreeEmptyFolderName", { fg = colors.white } },
	{ "NvimTreeFolderName", { fg = colors.white } },
	{ "NvimTreeVertSplit", { fg = colors.black } },
	{ "NvimTreeIndentMarker", { fg = colors.comment_gray } },
	{ "NvimTreeSpecialFile", { fg = colors.yellow } },
	{ "NvimTreeRootFolder", { fg = colors.blue } },
	{ "NvimTreeSignColumn", { link = "NvimTreeNormal" } },

	-- Orgmode
	{ "OrgTODO", { fg = colors.blue, bold = true } },
	{ "OrgDONE", { fg = colors.green, italic = true } },
	{ "OrgTSHeadlineLevel1", { fg = colors.blue, bold = true } },
	{ "OrgTSHeadlineLevel2", { fg = colors.magenta, bold = true } },
	{ "OrgTSHeadlineLevel3", { fg = colors.cyan, bold = true } },
	{ "OrgTSHeadlineLevel4", { fg = colors.cyan, bold = true } },

	-- Mini.files
	{ "MiniFilesBorderModified", { fg = colors.red } },

	-- nextrw
	{ "netrwMarkFile", { bg = colors.gray2 } },

	-- neogit
	{ "NeogitDiffAddHighlight", { fg = colors.green, bg = colors.green_dark, bold = true } },
	{ "NeogitDiffDeleteHighlight", { fg = colors.red, bg = colors.red_dark, bold = true } },

	--- nnn
	{ "NnnNormal", { fg = colors.white, bg = colors.gray3 } },

	-- treesitter-context
	{ "TreesitterContext", { fg = colors.white, bg = colors.black } },

	-- workaround vim bug #11277
	{ "markdownError", { fg = colors.white } },
	{ "luaParenError", { fg = colors.white } },
	{ "luaError", { fg = colors.white } },
}

M.colorscheme = function()
	for _, highlight in pairs(highlights) do
		vim.api.nvim_set_hl(0, highlight[1], highlight[2])
	end
end

return M

-- vi:nowrap

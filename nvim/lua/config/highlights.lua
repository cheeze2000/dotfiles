local function hl(name, link)
	vim.api.nvim_set_hl(0, name, { link = link })
end

hl("DapUIBreakpointsCurrentLine", "WarningMsg")
hl("DapUIBreakpointsLine", "Comment")
hl("DapUIBreakpointsPath", "MoreMsg")
hl("DapUIDecoration", "WarningMsg")
hl("DapUIScope", "MoreMsg")
hl("DapUIFloatBorder", "Comment")

hl("GitSignsAddPreview", "DiffAdded")
hl("GitSignsDeletePreview", "DiffRemoved")

hl("HopNextKey", "ErrorMsg")
hl("HopNextKey1", "ErrorMsg")
hl("HopNextKey2", "ErrorMsg")

hl("FloatBorder", "Comment")

hl("NormalFloat", "Normal")

hl("NvimTreeIndentMarker", "Comment")

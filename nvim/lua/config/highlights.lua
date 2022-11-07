local function hl(name, opts)
	vim.api.nvim_set_hl(0, name, opts)
end

hl("FloatBorder", {
	link = "Comment",
})

hl("GitSignsAddPreview", {
	link = "DiffAdded",
})

hl("GitSignsDeletePreview", {
	link = "DiffRemoved",
})

hl("HopNextKey", {
	link = "ErrorMsg",
})

hl("HopNextKey1", {
	link = "ErrorMsg",
})

hl("HopNextKey2", {
	link = "ErrorMsg",
})

hl("NormalFloat", {
	link = "Normal",
})

hl("NvimTreeIndentMarker", {
	link = "Comment",
})

vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")
-- Remove annoying white bar at the statusline, it might be a gruvbox thing idk.
-- this miight be a hacky way of doing this but idgaf
vim.cmd("hi StatusLine cterm=bold ctermbg=none ctermfg=red")

-- See source of virtual text

vim.diagnostic.config({
	virtual_text = {
		source = true,
	},
})

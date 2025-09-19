vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.ignorecase = true
vim.o.wrap = false
vim.o.smartindent = true
vim.o.swapfile = false
vim.o.undofile = true
vim.o.termguicolors = true
vim.o.winborder = "rounded" -- For CTRL+X commands in insert mode
vim.o.incsearch = true
vim.o.signcolumn = "yes"

local map = vim.keymap.set -- shorten mapping command

vim.g.mapleader = " "
map('n', '<leader>o', ':update<CR>: source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')

map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>') -- copy to clipboard
map({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>') -- cut to clipboard

vim.pack.add({
	{ src = "https://github.com/EdenEast/nightfox.nvim" }, 		-- theme
	{ src = "https://github.com/stevearc/oil.nvim" },					-- file explorer
	{ src = "https://github.com/echasnovski/mini.pick" },			-- pop-up selector
	{ src = "https://github.com/mason-org/mason.nvim" },			-- lsp manager
	{ src = "https://github.com/ThePrimeagen/vim-be-good" },	-- vim practice
})

require "mason".setup()
require "mini.pick".setup()
require "oil".setup()

-- Autocomplete (I think)
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")

map('n', '<leader>f', ":Pick files<CR>")
map('n', '<leader>h', ":Pick help<CR>")
map('n', '<leader>e', ":Oil<CR>")
map('n', '<leader>lf', vim.lsp.buf.format)

vim.lsp.enable({ "lua_ls" })

-- colors 
require('nightfox').setup({
	options = {
		transparent = true,
		terminal_colors = true,
		module_default = true,
	}
})
vim.cmd("colorscheme nightfox")
vim.cmd(":hi statusline guibg=NONE")

-- Options
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.ignorecase = true
vim.o.wrap = false
vim.o.smartindent = true
vim.o.swapfile = false
vim.o.undofile = true
vim.o.termguicolors = true
vim.o.winborder = "rounded"
vim.o.incsearch = true
vim.o.signcolumn = "yes"


-- Plugins
vim.pack.add({
	{ src = "https://github.com/EdenEast/nightfox.nvim" },       -- theme
	{ src = "https://github.com/stevearc/oil.nvim" },            -- file explorer
	{ src = "https://github.com/echasnovski/mini.pick" },        -- pop-up selector
	{ src = "https://github.com/mason-org/mason.nvim" },         -- lsp manager
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }, -- lsp manager
	{ src = "https://github.com/ThePrimeagen/vim-be-good" },     -- vim practice
})
require "mini.pick".setup()
require "oil".setup()


-- LSP
local lsp_servers = {
	"lua_ls",
	"tsserver",
	"pyright",
	"html",
	"cssls",
}
require "nvim-treesitter.configs".setup({
	ensure_installed = { "lua", "typescript", "javascript" },
	highlight = { enable = true },
})
require "mason".setup({
	ensure_installed = lsp_servers,
})
vim.lsp.enable(lsp_servers)

-- autocompletion
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


-- Keymaps
vim.g.mapleader = " "                      -- Set leader key

local map = vim.keymap.set                 -- shorten mapping command
map('n', '<leader>lf', vim.lsp.buf.format) -- autoformat

map('n', '<leader>f', ":Pick files<CR>")   -- File tree picker
map('n', '<leader>h', ":Pick help<CR>")    -- Help manuals
map('n', '<leader>e', ":Oil<CR>")          -- File explorer
map('n', '<leader>s', ":e #<CR>")          -- Open last file
map('n', '<leader>S', ":sf #<CR>")         -- Open last file horizontally

map('n', '<leader>o', ':update<CR>: source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>') -- copy to clipboard
map({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>') -- cut to clipboard


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

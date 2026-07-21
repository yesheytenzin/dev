----
require("config.lazy")
require("config.keybinds")
require("config.options")
require("config.diagnostic")

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Muted, deep blue/green selection highlight (Kanagawa Wave standard)
vim.api.nvim_set_hl(0, "Visual", { bg = "#4c4f69" }) 

-- Alternative: If you want a brighter, more visible selection color
-- vim.api.nvim_set_hl(0, "Visual", { bg = "#2D4F67", fg = "#DCD7BA" })
-- The modern Lua equivalent:
vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1F1F28", fg = "#DCD7BA" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#4c4f69", fg = "#DCD7BA", bold = true })

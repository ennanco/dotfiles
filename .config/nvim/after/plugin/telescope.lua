--- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = '[S]earch in [G]it' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })




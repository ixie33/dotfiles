require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        }
    },
    pickers = {
        find_files = {
            theme = "dropdown",
        }
    },
    defaults = {
        layout_config = {
            vertical = { width = 0.5 }
        },
    }
}
require('telescope').load_extension('fzf')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    -- ensure ripgrep is installed for this to work!
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

local map = vim.api.nvim_set_keymap
local opts = { noremap=false, silent=true }

map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
map("n", "<leader>fw", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opts)

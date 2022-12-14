-- lua/keymaps.lua

-- Modes
--   normal_mode       = "n",
--   insert_mode       = "i",
--   visual_mode       = "v",
--   visual_block_mode = "x",
--   term_mode         = "t",
--   command_mode      = "c",

-- Some shortcuts to make the conf file more clean
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local expr = { noremap = true, silent = true, expr = true }

-- Map leader key to space
map("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Don't jump when using *
map("n", "*", "*<C-o>zz", opts)

-- Keep search matches in the middle of the window
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)


-- Clear matches with Ctrl+l
map("n", "<C-l>", ":noh<Cr>", opts)

-- Reselect visual block after indent/outdent
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- YY/XX Copy/Cut into the system clipboard
vim.cmd([[
noremap YY "+y<CR>
noremap XX "+x<CR>
]])

-- Doble ESC or <C-s> to go to normal mode in terminal
map("t", "<C-s>", "<C-\\><C-n>", opts)
map("t", "<Esc><Esc>", "<C-\\><C-n>", opts)

-- Resize windows with Shift+<arrow>
map("n", "<S-Up>", ":resize +2<CR>", opts)
map("n", "<S-Down>", ":resize -2<CR>", opts)
map("n", "<S-Left>", ":vertical resize -2<CR>", opts)
map("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Move line up and down with J/K
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Modify j and k when a line is wrapped. Jump to next VISUAL line
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr)

-- Diagnostics
-- map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
map("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Toggle NetRW (Lexplore)
map("n", "<Leader>le", ":Lexplore<Cr>", opts)

-- Trouble
map("n", "<leader>dd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
map("n", "<leader>da", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)

-- Telescope
map("", "<leader>kp", "<cmd>lua require(\"telescope.builtin\").find_files()<cr>", opts)
map("i", "<leader>kp", "<cmd>lua require(\"telescope.builtin\").find_files()<cr>", opts)
map("", "<leader>kl", "<cmd>lua require(\"telescope.builtin\").buffers()<cr>", opts)
map("i", "<leader>kl", "<cmd>lua require(\"telescope.builtin\").buffers()<cr>", opts)
map("", "<leader>ko", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", opts)
map("i", "<leader>ko", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", opts)
map("", "<leader>kg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", opts)
map("i", "<leader>kg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", opts)

-- Nvim-Tree
map("", "<leader>nk", "<cmd>NvimTreeToggle<cr>", opts)
map("n", "<leader>nf", "<cmd>NvimTreeFindFile<cr>", opts)

-- Diffview
map("n", "<leader>do", "<cmd>DiffviewOpen<cr>", opts)
map("n", "<leader>dc", "<cmd>DiffviewClose<cr>", opts)

-- Ripgrep
map("n", "<leader>rg", "<cmd>lua require'nvim-ripgrep'.grep()<cr>", opts)

-- Null-ls
map("n", "<leader>ff", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)


map("n", "<leader>cr", "<cmd>!./%<cr>", opts)

-- Deployment
map("n", "<leader>pdf", "DRemoteUploadFile<cr>", opts)
map("n", "<leader>pdF", "DRemoteDownloadFile<cr>", opts)

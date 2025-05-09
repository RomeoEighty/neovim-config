local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "<ESC><ESC>", ":noh<CR>", opts)

keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- File Explorer
-- <leader>e to toggle Snacks.picker (settings in plugins.lua)

-- Resize with arrows
keymap("n", "<A-Up>",    ":resize +2<CR>", opts)
keymap("n", "<A-Down>",  ":resize -2<CR>", opts)
keymap("n", "<A-Left>",  ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<A-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<A-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<A-L>", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<A-H>", ":BufferLineMovePrev<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
-- keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>o", "<cmd>Telescope oldfiles<cr>", opts)

--keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
-- keymap("n", "<leader>g", "<cmd>Telescope find_files<cr>", opts)

-- Bbye
keymap("n", "<leader>q", "<cmd>Bdelete<cr>", opts)

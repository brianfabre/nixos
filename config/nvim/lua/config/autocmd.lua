vim.cmd([[
" no relative line number in insert mode
autocmd InsertEnter,WinLeave * if &number | set nornu | endif
autocmd InsertLeave,WinEnter * if &number | set rnu | endif
" run lua code
autocmd FileType lua map <buffer> <leader>pp :w<CR>:luafile %<CR>

" hide buffer if terminal
augroup TerminalSettings
    autocmd!
    autocmd TermOpen * setlocal nobuflisted
augroup END

" autocmd FileType stata setlocal commentstring=//\ %s
]])

-- highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 700 })
    end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'open file at the last position it was edited earlier',
  group = misc_augroup,
  pattern = '*',
  command = 'silent! normal! g`"zv'
})

-- sway filetypes
-- HACK
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "config-t480", "config-base" },
    command = "setfiletype swayconfig",
})

-- set iskeyword+=-
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "Filetype" }, {
    pattern = { "*" },
    command = "set iskeyword+=-",
})

-- hide cursorline when in insert
local cursorGrp = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd(
    { "InsertLeave", "WinEnter" },
    { pattern = "*", command = "set cursorline", group = cursorGrp }
)
vim.api.nvim_create_autocmd(
    { "InsertEnter", "WinLeave" },
    { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- delete all marks on enter
-- vim.api.nvim_create_autocmd({ "BufRead" }, {
--     command = ":delm a-zA-Z0-9",
-- })

-- deletes trailing whitespaces on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})

local group = vim.api.nvim_create_augroup("codegroup", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "python" },
    callback = function()
        vim.keymap.set("n", "<leader>pp", ":lua require('config/utils').RunCode()<CR>", { silent = true })
        -- vim.opt.foldmethod = "indent"
        -- vim.opt.foldmethod = "expr"
        -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end,
    group = group,
})
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--     pattern = { "c" },
--     callback = function()
--         vim.keymap.set("n", "<leader>pp", ":!gcc -o %:r % && %:r<CR>", { silent = true })
--         -- vim.opt.foldmethod = "indent"
--         -- vim.opt.foldmethod = "expr"
--         -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--     end,
--     group = group,
-- })

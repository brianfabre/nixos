return {
    "airblade/vim-rooter",
    config = function()
        vim.cmd([[
            let g:rooter_patterns = ['main.tex', '.git', 'Makefile']
        ]])
    end,
}

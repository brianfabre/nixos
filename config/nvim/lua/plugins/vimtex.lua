return {
    "lervag/vimtex",
    ft = "tex",
    config = function()
        vim.g.vimtex_quickfix_mode = 0
        vim.g.vimtex_view_forward_search_on_start = 0

        -- --------------
        -- use with macos
        -- --------------
        -- vim.cmd([[let g:tex_flavor='latex']])
        -- vim.cmd([[let g:vimtex_view_method ='skim']])
        -- vim.cmd([[let g:vimtex_view_skim_sync = 1]])
        -- vim.cmd([[let g:vimtex_view_skim_activate = 1]])

        -- --------------
        -- use with linux
        -- --------------
        vim.cmd([[let g:vimtex_view_method = 'zathura']])
        vim.cmd([[
                let g:vimtex_compiler_latexmk_engines = {
                \ '_'                : '-pdf',
                \ 'pdfdvi'           : '-pdfdvi',
                \ 'pdfps'            : '-pdfps',
                \ 'pdflatex'         : '-pdf',
                \ 'luatex'           : '-lualatex',
                \ 'lualatex'         : '-lualatex',
                \ 'xelatex'          : '-xelatex',
                \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
                \ 'context (luatex)' : '-pdf -pdflatex=context',
                \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
                \}
            ]])
    end,
}

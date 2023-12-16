return {
    {
        "lervag/wiki.vim",
        dependencies = {
            { "preservim/vim-markdown", branch = "master" },
            "godlygeek/tabular",
        },
        init = function()
            vim.cmd([[
                let g:wiki_link_creation = {
                  \ 'md': { 'url_transform': { _ -> strftime('%Y%m%d%H%M%S') },
                  \ },
                  \}
                let g:wiki_templates = [
                  \ { 'match_func': {x -> v:true},
                  \   'source_filename': '~/Documents/wiki/template.tpl'},
                  \]
            ]])
        end,
        config = function()
            -- lervag/wiki.vim
            vim.g.wiki_root = "~/Documents/wiki"

            -- preservim/vim-markdown
            vim.opt.conceallevel = 2
            vim.g.vim_markdown_folding_disabled = 1
            vim.g.vim_markdown_new_list_item_indent = 0 -- no indent when pressing 'o'
            vim.g.vim_markdown_frontmatter = 1 -- highlights yaml frontmatter

            -- -- WIP changes tag parsing regex
            -- vim.g.wiki_tag_scan_num_lines = -1
            -- vim.cmd([[
            --     let g:wiki_tag_parsers = [
            --     \ g:wiki#tags#default_parser,
            --     \ { 'match': {x -> x =~# '^tags: '},
            --     \   'parse': {x -> split(matchstr(x, '^tags:\zs\[[^][ ]*\]'), '[ ,]\+')},
            --     \   'make':  {t, x -> 'tags: ' . empty(t) ? '' : join(t, ', ')}}
            --     \]
            -- ]])
        end,
    },
    {
        "dhruvasagar/vim-table-mode",
        config = function()
            require("which-key").register({
                t = { name = "table-mode", _ = "which_key_ignore" },
            }, { prefix = "<leader>" })
        end,
    },
}

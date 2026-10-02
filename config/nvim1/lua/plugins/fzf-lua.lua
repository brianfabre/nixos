return {
    {
        "ibhagwan/fzf-lua",
        cmd = "FzfLua",
        opts = {
            grep = {
                cmd = "rg --color=always --smart-case --no-heading --column --line-number --glob '!repos/*' --glob '!Library/*'",
            },
        },
        -- `keys` instead of event = "BufReadPre" + keymaps inside config: the
        -- maps didn't exist on the dashboard until a file had been opened.
        keys = {
            { "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", desc = "search files" },
            { "<leader>ss", "<cmd>lua require('fzf-lua').buffers()<CR>", desc = "search open buffer" },
            { "<leader>sb", "<cmd>lua require('fzf-lua').blines()<CR>", desc = "search buffer lines" },
            { "<leader>sr", "<cmd>lua require('fzf-lua').oldfiles()<CR>", desc = "search recent files" },
            { "<leader>sg", "<cmd>lua require('fzf-lua').live_grep()<CR>", desc = "live grep" },
            { "<leader>sc", "<cmd>lua require('fzf-lua').command_history()<CR>", desc = "search command history" },
            { "<leader>sh", "<cmd>lua require('fzf-lua').highlights()<CR>", desc = "search highlights" },
            -- moved from keymaps.lua; replaces `fd | fzf` run through system(),
            -- which gave fzf no proper terminal
            {
                "<C-x><C-p>",
                function()
                    require("fzf-lua").complete_path()
                end,
                mode = "i",
                desc = "fuzzy path",
            },
        },
    },
}

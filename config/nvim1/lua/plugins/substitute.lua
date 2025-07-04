return {
    "gbprod/substitute.nvim",
    event = "TextYankPost",
    config = function()
        require("substitute").setup({})
        vim.keymap.set("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
        vim.keymap.set("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
        vim.keymap.set("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })
    end,
}

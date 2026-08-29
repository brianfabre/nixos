-- ~/.config/nvim/after/ftplugin/tex.lua

local exts = {
    input = { "tex" },
    include = { "tex" },
    subfile = { "tex" },
    includegraphics = { "pdf", "png", "jpg", "jpeg", "eps" },
    bibliography = { "bib" },
    addbibresource = { "bib" },
}

local function root()
    return vim.fs.root(0, { "main.tex", ".latexmkrc", ".git" }) or vim.fn.expand("%:p:h")
end

-- returns cmd name + byte position of the opening brace, if the cursor is inside one
local function context()
    local before = vim.api.nvim_get_current_line():sub(1, vim.fn.col(".") - 1)
    local open = before:match(".*()%{")
    if not open or before:find("}", open, true) then
        return nil
    end
    local head = before:sub(1, open - 1):gsub("%b[]%s*$", "") -- drop [width=...]
    local cmd = head:match("\\(%a+)%*?$")
    if cmd and exts[cmd] then
        return cmd, open
    end
end

function _G.tex_path_complete(findstart, base)
    local cmd, open = context()
    if findstart == 1 then
        return cmd and open or -3
    end
    local dir, items = root(), {}
    for _, path in ipairs(vim.fn.glob(dir .. "/" .. base .. "*", false, true)) do
        local rel = path:sub(#dir + 2)
        if vim.fn.isdirectory(path) == 1 then
            table.insert(items, { word = rel .. "/", menu = "dir" })
        else
            local ext = rel:match("%.(%w+)$")
            if ext and vim.tbl_contains(exts[cmd], ext:lower()) then
                local word = exts[cmd][1] == "tex" and rel:gsub("%.tex$", "") or rel
                table.insert(items, { word = word, menu = ext })
            end
        end
    end
    return items
end

vim.bo.completefunc = "v:lua.tex_path_complete"
vim.opt_local.completeopt = { "menu", "menuone", "noinsert", "noselect" }

vim.api.nvim_create_autocmd("TextChangedI", {
    buffer = 0,
    callback = function()
        if vim.fn.pumvisible() == 0 and context() then
            vim.api.nvim_feedkeys(vim.keycode("<C-x><C-u>"), "n", false)
        end
    end,
})

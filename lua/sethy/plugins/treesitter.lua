local treesitter = require("nvim-treesitter")

local ensure_installed = {
    "json", "javascript", "typescript", "tsx", "go", "yaml", "html", "css", "python", "http",
    "prisma", "markdown", "markdown_inline", "svelte", "graphql", "bash", "lua", "vim",
    "dockerfile", "gitignore", "toml", "query", "vimdoc", "c", "java", "rust", "ron",
}

treesitter.install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)

        if not lang then
            return
        end

        -- load parser safely
        local ok_add = pcall(vim.treesitter.language.add, lang)
        if not ok_add then
            return
        end

        -- start treesitter safely
        pcall(vim.treesitter.start, buf, lang)

        -- enable indentation only for real languages
        if ft ~= "yaml" and ft ~= "markdown" then
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            vim.bo[buf].smartindent = false
            vim.bo[buf].cindent = false
        end
    end,
})

-- force treesitter indentation
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "*",
--     callback = function()
--         -- only set if the language has a parser
--         local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
--         if lang and vim.treesitter.get_parser(0, lang, { error = false }) then
--             vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
--             -- disable old indents that may conflict
--             vim.bo.smartindent = false
--             vim.bo.cindent = false
--         end
--     end,
-- })

-- -- NOTE: js,ts,jsx,tsx Auto Close Tags
-- -- Independent nvim-ts-autotag setup
require("nvim-ts-autotag").setup({
    opts = {
        enable_close = true,           -- Auto-close tags
        enable_rename = true,          -- Auto-rename pairs
        enable_close_on_slash = false, -- Disable auto-close on trailing `</`
    },
    per_filetype = {
        ["html"] = {
            enable_close = true, -- Disable auto-closing for HTML
        },
        ["typescriptreact"] = {
            enable_close = true, -- Explicitly enable auto-closing (optional, defaults to `true`)
        },
    },
})

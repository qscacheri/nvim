local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'lua_ls',
    'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.configure("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})


lsp.configure('tsserver', {
    init_options = {
        preferences = {
            importModuleSpecifierPreference = 'relative',
        }
    }
})

lsp.configure('groovyls', {
    filetypes = {
        "groovy",
        "nextflow",
        "nf"
    },
})
-- lsp.on_attach(function(client, bufnr)
--     local opts = { buffer = bufnr, remap = false }
--
--     if client.name == "eslint" then
--         vim.cmd.LspStop('eslint')
--         return
--     end
--
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--     vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
--     vim.keymap.set("n", "<leader>lo", vim.diagnostic.open_float, opts)
--     vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
--     vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
--     vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
--     vim.keymap.set("n", "<leader>lf", vim.lsp.buf.references, opts)
--     vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
--     vim.keymap.set("n", "<leader>ll", vim.lsp.buf.format, opts)
--     -- vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
-- end)

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol)
vim.keymap.set("n", "<leader>lo", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ll", vim.lsp.buf.format)

lsp.setup()

require 'lspconfig'.sourcekit.setup {}

vim.diagnostic.config({
    virtual_text = true,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format { async = false }
    end
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

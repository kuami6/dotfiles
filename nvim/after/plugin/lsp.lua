local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.set_preferences({
    sign_icons = { }
})

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
    enabled = true,
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),

    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
        },
    sources = {
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
        {name = 'path'},
        {name = 'nvim_lua'},
        {name = 'buffer'},
    },

    preselect = cmp.PreselectMode.Item,
        
})

require("mason").setup()
require("mason-lspconfig").setup()
require'lspconfig'.gopls.setup{}
require'lspconfig'.dartls.setup{}
require'lspconfig'.html.setup{}


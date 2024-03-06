local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.set_preferences({
    sign_icons = { }
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
local cmp_action = lsp.cmp_action()

local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    enabled = true,
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        -- confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),

        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),

        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        ['<C-Space>'] = cmp.mapping.complete(),
 
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
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


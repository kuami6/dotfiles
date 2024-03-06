local lsp = require('lsp-zero')


local htmlCapabilities = vim.lsp.protocol.make_client_capabilities()
htmlCapabilities.textDocument.completion.completionItem.snippetSupport = true

require('mason-lspconfig').setup({
  handlers = {
    lsp.default_setup,
    tsserver = function()
      require('lspconfig').tsserver.setup({
        single_file_support = false,
        on_attach = function(client, bufnr)

        end
      })
    end,
    lua_ls = function()
        local lua_opts = lsp.nvim_lua_ls()
        require('lspconfig').lua_ls.setup(lua_opts)
    end,
    html = function()
        require('lspconfig').html.setup({
            capabilities = htmlCapabilities,
        })
    end,
  }
    })

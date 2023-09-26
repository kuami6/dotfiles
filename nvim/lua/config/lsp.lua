local M= {}

local cmp = require('cmp')

function M.setup()
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  	['<cr>'] = cmp.mapping.confirm({ select = true }),
  	["<C-Space>"] = cmp.mapping.complete(),
end

return M

-- All the plugins that need to use lua to be configured.

-- compe
vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = false;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- nvim-treesitter

-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
--   highlight = {
--     enable = true,              -- false will disable the whole extension
--   },
-- }

-- require "nvim-treesitter.configs".setup {
--   playground = {
--     enable = true,
--     disable = {},
--     updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
--     persist_queries = false -- Whether the query persists across vim sessions
--   }
-- }


-- python-ls `npm i -g pyright`
require'lspconfig'.pyright.setup{}

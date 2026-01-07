
-- init.lua ---------------------------------------------------------
vim.g.mapleader       = " "
vim.o.number          = true
vim.o.relativenumber  = true
vim.o.termguicolors   = true
vim.o.mouse           = 'a'
vim.o.clipboard       = 'unnamedplus'

-- 1️⃣ Install lazy.nvim if it isn’t already present
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2️⃣ Plugin specification (only orgmode)
require('lazy').setup({
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      require('orgmode').setup({
        org_agenda_files = '~/org/**.*',
        org_default_notes_file = '~/org/inbox.org',
      })
    end,
  },
})

-- 4️⃣ Optional convenient keymaps for orgmode
vim.keymap.set('n', '<leader>oa', ':OrgAgenda<CR>', { desc = 'Open Org agenda' })
vim.keymap.set('n', '<leader>oc', ':OrgCapture<CR>', { desc = 'Capture Org note' })

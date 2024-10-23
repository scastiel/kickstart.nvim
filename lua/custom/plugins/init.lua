-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'kdheepak/monochrome.nvim' },

  { 'shaunsingh/nord.nvim' },
  { 'datsfilipe/vesper.nvim' },
  { 'olimorris/onedarkpro.nvim', priority = 1000 },
  -- { 'nyoom-engineering/oxocarbon.nvim' },
  -- { 'eldritch-theme/eldritch.nvim' },
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd 'colorscheme catppuccin'
  --     require('catppuccin').setup {
  --       flavour = 'frappe',
  --     }
  --   end,
  -- },
  { 'voldikss/vim-floaterm', keys = {
    { '<c-t>', mode = 'n', ':FloatermToggle<cr>' },
    { '<c-t>', mode = 't', '<C-\\><C-n>:FloatermToggle<cr>' },
  } },
  {
    'Isrothy/neominimap.nvim',
    version = 'v3.*.*',
    enabled = true,
    lazy = false,
  },
  {
    'ghillb/cybu.nvim',
    branch = 'main', -- timely updates
    -- branch = "v1.x", -- won't receive breaking changes
    requires = { 'nvim-tree/nvim-web-devicons', 'nvim-lua/plenary.nvim' }, -- optional for icon support
    config = function()
      local ok, cybu = pcall(require, 'cybu')
      if not ok then
        return
      end
      cybu.setup()
      -- vim.keymap.set('n', 'K', '<Plug>(CybuPrev)')
      -- vim.keymap.set('n', 'J', '<Plug>(CybuNext)')
      -- vim.keymap.set({ 'n', 'v' }, '<c-s-tab>', '<plug>(CybuLastusedPrev)')
      -- vim.keymap.set({ 'n', 'v' }, '<c-tab>', '<plug>(CybuLastusedNext)')
      -- vim.keymap.set('n', 'K', ':b#<cr>')

      require('cybu').setup {
        position = {
          max_win_height = 20,
        },
        behavior = {
          mode = {
            default = {
              switch = 'on_close',
              -- switch = 'immediate',
              view = 'paging',
            },
          },
        },
        display_time = 75000,
      }
    end,
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
      vim.keymap.set({ 'n', 'v' }, '<c-s-tab>', '<Cmd>BufferPrevious<CR>')
      vim.keymap.set({ 'n', 'v' }, '<c-tab>', '<Cmd>BufferNext<CR>')
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
    'rmagatti/auto-session',
    lazy = false,

    opts = {},
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  {
    'jake-stewart/multicursor.nvim',
    branch = '1.0',
    config = function()
      local mc = require 'multicursor-nvim'

      mc.setup()

      -- vim.keymap.set({ 'n', 'v' }, '<c-d>', function()
      --   mc.matchAddCursor(1)
      -- end)
      -- vim.keymap.set('n', '<esc>', function()
      --   if not mc.cursorsEnabled() then
      --     mc.enableCursors()
      --   elseif mc.hasCursors() then
      --     mc.clearCursors()
      --   else
      --     -- Default <esc> handler.
      --   end
      -- end)
    end,
  },
}

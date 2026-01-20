-- return {
  -- {
    -- "nvim-telescope/telescope.nvim",
    -- dependencies = { "nvim-lua/plenary.nvim" },
    -- config = function()
      -- local builtin = require('telescope.builtin')
      -- vim.keymap.set('n', '<Leader>ff', builtin.find_files)
      -- vim.keymap.set('n', '<Leader>fg', builtin.git_files)
      -- vim.keymap.set('n', '<Leader>fb', builtin.buffers)
      -- vim.keymap.set('n', '<Leader>fs', builtin.live_grep)
    -- end
  -- }
-- }

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'debugloop/telescope-undo.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local ts = require('telescope')
    local actions = require('telescope.actions')
    local actions_layout = require('telescope.actions.layout')
    local ts_undo = require('telescope-undo.actions')

    -- Fullscreen layout config
    local h_pct, w_pct = 0.95, 0.95  -- nearly full screen
    local fullscreen_setup = {
      borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      preview = { hide_on_startup = false },
      layout_strategy = 'flex',
      layout_config = {
        flex = { flip_columns = 100 },
        horizontal = {
          mirror = false,
          prompt_position = 'top',
          width = function(_, cols, _) return math.floor(cols * w_pct) end,
          height = function(_, _, rows) return math.floor(rows * h_pct) end,
          preview_cutoff = 10,
          preview_width = 0.5,
        },
        vertical = {
          mirror = true,
          prompt_position = 'top',
          width = function(_, cols, _) return math.floor(cols * w_pct) end,
          height = function(_, _, rows) return math.floor(rows * h_pct) end,
          preview_cutoff = 10,
          preview_height = 0.5,
        },
      },
    }

    -- Telescope setup
    ts.setup {
      defaults = vim.tbl_extend('error', fullscreen_setup, {
        sorting_strategy = 'ascending',
        path_display = { "filename_first" },
        mappings = {
          n = {
            ['o'] = actions_layout.toggle_preview,
            ['<C-c>'] = actions.close,
          },
          i = {
            ['<C-o>'] = actions_layout.toggle_preview,
          },
        },
      }),
      pickers = {
        find_files = {
          find_command = { 'fd', '--type', 'f', '-H', '--strip-cwd-prefix' },
          layout_strategy = 'flex',
          layout_config = fullscreen_setup.layout_config,
        },
        git_files = {
          layout_strategy = 'flex',
          layout_config = fullscreen_setup.layout_config,
        },
        buffers = {
          layout_strategy = 'flex',
          layout_config = fullscreen_setup.layout_config,
        },
        live_grep = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '--glob', '!.git/',
            '--glob', '!node_modules/',
          },
          layout_strategy = 'flex',
          layout_config = fullscreen_setup.layout_config,
        },
      },
      extensions = {
        undo = vim.tbl_extend('error', fullscreen_setup, {
          vim_diff_opts = { ctxlen = 4 },
          preview_title = "Diff",
          mappings = {
            i = {
              ['<cr>'] = ts_undo.restore,
              ['<C-cr>'] = ts_undo.restore,
              ['<C-y>d'] = ts_undo.yank_deletions,
              ['<C-y>a'] = ts_undo.yank_additions,
            },
            n = {
              ['<cr>'] = ts_undo.restore,
              ['ya'] = ts_undo.yank_additions,
              ['yd'] = ts_undo.yank_deletions,
            },
          },
        }),
      },
    }

    -- Load extensions
    ts.load_extension('fzf')
    ts.load_extension('undo')

    -- Keymaps
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<Leader>ff', function()
      builtin.find_files({ layout_strategy = 'flex', layout_config = fullscreen_setup.layout_config })
    end)
    vim.keymap.set('n', '<Leader>fg', function()
      builtin.git_files({ layout_strategy = 'flex', layout_config = fullscreen_setup.layout_config })
    end)
    vim.keymap.set('n', '<Leader>fb', function()
      builtin.buffers({ layout_strategy = 'flex', layout_config = fullscreen_setup.layout_config })
    end)
    vim.keymap.set('n', '<Leader>fs', function()
      builtin.live_grep({
        layout_strategy = 'flex',
        layout_config = fullscreen_setup.layout_config
      })
    end)
    vim.keymap.set('n', '<Leader>fu', function()
      ts.extensions.undo.undo({ layout_strategy = 'flex', layout_config = fullscreen_setup.layout_config })
    end)
  end,
}




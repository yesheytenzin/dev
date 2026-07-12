return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false, -- CRITICAL: Docs state this plugin does not support lazy-loading
    build = ":TSUpdate",
    
    config = function()
      -- 1. Initialize treesitter
      require('nvim-treesitter').setup({
        install_dir = vim.fn.stdpath('data') .. '/site'
      })

      -- 2. Install your languages
      require('nvim-treesitter').install({
        "lua",
        "vim",
        "vimdoc",
        "ruby",
        "html",
        "embedded_template",
        "c",
        "cpp",
        "bash",
        "json",
        "yaml",
        "toml",
        "sql",
        "markdown",
        "markdown_inline",
      })

      -- 3. AUTO SYNTAX HIGHLIGHTING WITH ERROR CATCHING
      vim.api.nvim_create_autocmd('FileType', {
        pattern = "*",
        callback = function()
          local lang = vim.bo.filetype
          -- Only start treesitter if a parser is installed for this filetype
          if pcall(vim.treesitter.language.add, lang) then
            pcall(vim.treesitter.start)
          end
        end,
      })

      -- 4. AUTO INDENTATION WITH ERROR CATCHING
      vim.api.nvim_create_autocmd('FileType', {
        pattern = "*",
        callback = function()
          local lang = vim.bo.filetype
          -- Only apply indentation if a parser is safely available
          if pcall(vim.treesitter.language.add, lang) then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}

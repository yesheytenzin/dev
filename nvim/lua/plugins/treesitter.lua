return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local languages = {
        "html", "css", "scss", "javascript", "typescript", "tsx",
        "json", "yaml", "toml", "ruby", "go", "gomod",
        "gowork", "gosum", "c", "cpp", "bash", "lua", "vim",
        "vimdoc", "markdown", "markdown_inline", "dockerfile", "embedded_template",
        "gitignore", "sql", "query",
      }
      require("nvim-treesitter").setup({})
      vim.api.nvim_create_autocmd("FileType", {
        pattern = languages,
        callback = function(event)
          pcall(vim.treesitter.start, event.buf)
          vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "eruby",
        callback = function(event)
          pcall(vim.treesitter.start, event.buf, "embedded_template")
        end,
      })
    end,
  },
}

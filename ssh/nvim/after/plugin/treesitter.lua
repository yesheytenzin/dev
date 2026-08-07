local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then return end

treesitter.setup {
  ensure_installed = {
    "html", "css", "scss", "javascript", "typescript", "tsx",
    "json", "yaml", "toml", "ruby", "erb", "go", "gomod",
    "gowork", "gosum", "c", "cpp", "bash", "lua", "vim",
    "vimdoc", "markdown", "markdown_inline", "dockerfile",
    "gitignore", "sql", "query",
  },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  indent = { enable = true },
}

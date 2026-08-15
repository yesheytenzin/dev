local function switch_source_header(bufnr, client)
  local method = "textDocument/switchSourceHeader"
  if not client or not client:supports_method(method) then
    vim.notify("clangd source/header switching is unavailable", vim.log.levels.WARN)
    return
  end

  local params = vim.lsp.util.make_text_document_params(bufnr)
  client:request(method, params, function(err, result)
    if err then
      vim.notify(tostring(err), vim.log.levels.ERROR)
      return
    end
    if not result then
      vim.notify("No corresponding source or header file found", vim.log.levels.INFO)
      return
    end
    vim.cmd.edit(vim.uri_to_fname(result))
  end, bufnr)
end

return {
  cmd = { "clangd" },
  filetypes = { "c", "c.doxygen", "cpp", "cpp.doxygen", "objc", "objcpp", "cuda" },
  root_markers = {
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "compile_flags.txt",
    "CMakeLists.txt",
    "configure.ac",
    ".git",
  },
  capabilities = {
    textDocument = {
      completion = { editsNearCursor = true },
    },
    offsetEncoding = { "utf-8", "utf-16" },
  },
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, "LspClangdSwitchSourceHeader", function()
      switch_source_header(bufnr, client)
    end, { desc = "Switch between C/C++ source and header" })
  end,
}

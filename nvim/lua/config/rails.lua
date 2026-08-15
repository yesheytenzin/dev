local M = {}

local function project_root()
  return vim.fs.root(0, { "bin/rails", "config/application.rb", "Gemfile" })
end

local function rails_command(root)
  if vim.fn.executable(root .. "/bin/rails") == 1 then
    return "bin/rails"
  end
  return "bundle exec rails"
end

local function run(command)
  local root = project_root()
  if not root then
    vim.notify("Not inside a Rails project", vim.log.levels.WARN)
    return
  end

  vim.cmd("botright split")
  vim.cmd("enew")
  vim.fn.termopen({ "sh", "-lc", command }, { cwd = root })
  vim.cmd("startinsert")
end

function M.server()
  local root = project_root()
  if root then
    run(rails_command(root) .. " server")
  end
end

function M.console()
  local root = project_root()
  if root then
    run(rails_command(root) .. " console")
  end
end

function M.routes()
  local root = project_root()
  if root then
    run(rails_command(root) .. " routes")
  end
end

function M.migrate()
  local root = project_root()
  if root then
    run(rails_command(root) .. " db:migrate")
  end
end

function M.test_current()
  local root = project_root()
  if not root then
    vim.notify("Not inside a Rails project", vim.log.levels.WARN)
    return
  end

  local file = vim.fn.expand("%:p")
  local relative = vim.fs.relpath(root, file) or vim.fn.fnamemodify(file, ":.")
  local command
  if relative:match("^spec/") then
    command = "bundle exec rspec " .. vim.fn.shellescape(relative)
  else
    local line = vim.fn.line(".")
    command = rails_command(root) .. " test " .. vim.fn.shellescape(relative .. ":" .. line)
  end
  run(command)
end

function M.refresh_lsp()
  if vim.fn.exists(":LspRestart") ~= 2 then
    vim.notify("LspRestart is unavailable", vim.log.levels.ERROR)
    return
  end
  vim.cmd("LspRestart ruby_lsp")
  vim.notify("Ruby LSP is restarting and re-indexing the Rails project", vim.log.levels.INFO)
end

vim.api.nvim_create_user_command("RailsServer", M.server, { desc = "Start Rails server" })
vim.api.nvim_create_user_command("RailsConsole", M.console, { desc = "Open Rails console" })
vim.api.nvim_create_user_command("RailsRoutes", M.routes, { desc = "List Rails routes" })
vim.api.nvim_create_user_command("RailsMigrate", M.migrate, { desc = "Run Rails migrations" })
vim.api.nvim_create_user_command("RailsTestCurrent", M.test_current, { desc = "Run the current Rails test" })
vim.api.nvim_create_user_command("RailsLspRefresh", M.refresh_lsp, { desc = "Restart and refresh Ruby LSP" })

return M

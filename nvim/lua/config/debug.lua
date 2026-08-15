local dap = require("dap")

local function project_root()
  return vim.fs.root(0, { "CMakeLists.txt", ".git" }) or vim.fn.getcwd()
end

local function executable()
  local root = project_root()
  local default = root .. "/build/" .. vim.fn.fnamemodify(root, ":t")
  return vim.fn.input("Executable: ", default, "file")
end

dap.adapters.lldb = {
  type = "executable",
  command = "lldb-dap",
  name = "lldb",
}

local configuration = {
  name = "Launch C/C++",
  type = "lldb",
  request = "launch",
  program = executable,
  cwd = project_root,
  stopOnEntry = false,
  args = {},
  runInTerminal = true,
}

dap.configurations.c = { configuration }
dap.configurations.cpp = { configuration }

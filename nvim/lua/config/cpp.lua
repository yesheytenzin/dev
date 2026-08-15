local M = {}

local function project_root()
  return vim.fs.root(0, { "CMakeLists.txt", ".git" })
end

local function run(command)
  local root = project_root()
  if not root then
    vim.notify("Not inside a CMake project", vim.log.levels.WARN)
    return
  end

  vim.cmd("botright split")
  vim.cmd("enew")
  vim.fn.termopen({ "sh", "-lc", command }, { cwd = root })
  vim.cmd("startinsert")
end

local function target_path()
  local root = project_root()
  if not root then
    return nil
  end
  local default = root .. "/build/" .. vim.fn.fnamemodify(root, ":t")
  return vim.fn.input("Executable: ", default, "file")
end

function M.configure()
  run("cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON")
end

function M.build()
  run("cmake --build build -j")
end

function M.run()
  local executable = target_path()
  if executable and executable ~= "" then
    run(vim.fn.shellescape(executable))
  end
end

function M.debug()
  require("dap").continue()
end

vim.api.nvim_create_user_command("CMakeConfigure", M.configure, { desc = "Configure CMake Debug build" })
vim.api.nvim_create_user_command("CMakeBuild", M.build, { desc = "Build CMake project" })
vim.api.nvim_create_user_command("CMakeRun", M.run, { desc = "Run CMake executable" })
vim.api.nvim_create_user_command("CMakeDebug", M.debug, { desc = "Debug CMake executable" })

return M

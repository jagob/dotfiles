require('dap-python').setup()
require("dapui").setup()
require("mason-nvim-dap").setup({ ensure_installed = { "python" } })

local dap = require("dap")
local dapui = require("dapui")

vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
-- vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', { text='▶️', texthl='DapStopped', linehl='DapStopped', numhl='DapStopped' })

-- automatic open dap
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

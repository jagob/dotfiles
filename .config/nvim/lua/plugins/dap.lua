return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
      "jay-babu/mason-nvim-dap.nvim",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      require("dapui").setup()
      require("nvim-dap-virtual-text").setup({
        commented = true,
      })

      -- -- dap gdb
      -- dap.adapters.gdb = {
      --   type = "executable",
      --   command = "gdb",
      --   args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
      -- }
      -- dap.configurations.cpp = {
      --   {
      --     name = "Launch",
      --     type = "gdb",
      --     request = "launch",
      --     program = function()
      --       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      --     end,
      --     -- args = {}, -- provide arguments if needed
      --     cwd = "${workspaceFolder}",
      --     -- stopAtBeginningOfMainSubprogram = true,
      --     -- stopOnEntry = false,
      --   },
      --   -- {
      --   --   name = "Select and attach to process",
      --   --   type = "gdb",
      --   --   request = "attach",
      --   --   program = function()
      --   --     return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      --   --   end,
      --   --   pid = function()
      --   --     local name = vim.fn.input("Executable name (filter): ")
      --   --     return require("dap.utils").pick_process({ filter = name })
      --   --   end,
      --   --   cwd = "${workspaceFolder}",
      --   -- },
      --   -- {
      --   --   name = "Attach to gdbserver :1234",
      --   --   type = "gdb",
      --   --   request = "attach",
      --   --   target = "localhost:1234",
      --   --   program = function()
      --   --     return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      --   --   end,
      --   --   cwd = "${workspaceFolder}",
      --   -- },
      -- }

      -- dap gdb via vscode-cpptools
      -- cd .local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin
      -- cp cppdbg.ad7Engine.json nvim-dap.ad7Engine.json
      dap.adapters.cppdbg = {
        name = "cppdbg",
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
      }
      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "cppdbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = true,
          -- stopOnEntry = false,
          -- args = {},
          -- runInTerminal = true,
        },
        -- {
        --   name = 'Attach to gdbserver :1234',
        --   type = 'cppdbg',
        --   request = 'launch',
        --   MIMode = 'gdb',
        --   miDebuggerServerAddress = 'localhost:1234',
        --   miDebuggerPath = '/usr/bin/gdb',
        --   cwd = '${workspaceFolder}',
        --   program = function()
        --     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        --   end,
        -- },
      }

      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp

      vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

      -- -- Eval var under cursor
      -- vim.keymap.set("n", "<space>?", function()
      --   require("dapui").eval(nil, { enter = true })
      -- end)

      vim.keymap.set("n", "<F1>", dap.continue)
      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<F11>", dap.restart)
      vim.keymap.set("n", "<F12>", dap.run_last)
      vim.keymap.set("n", "<F6>", dap.terminate)

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}

-- local dap = require("dap")
-- local dapui = require("dapui")
-- vim.keymap.set("n", "<leader>da", dapui.toggle)
-- vim.keymap.set("n", "<leader>dd", dap.toggle_breakpoint)
-- vim.keymap.set("n", "<leader>dc", dap.continue)
-- vim.keymap.set("n", "<leader>dn", dap.step_over)
-- vim.keymap.set("n", "<leader>ds", dap.step_into)
-- vim.keymap.set("n", "<leader>dx", dap.terminate)
-- -- vim.keymap.set("n", "<leader>bk", dap.step_out)
-- -- vim.keymap.set("n", "<leader>bh", dap.step_back)
-- vim.keymap.set("n", "<leader>d.", dap.run_last)
-- vim.keymap.set("n", "<leader>dk", require("dap-python").test_method)
-- vim.keymap.set("n", "<leader>dm", require("dap-python").test_class)
-- -- vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>
-- -- vim.keymap.set("n", "<leader>br", dapui.open({ reset = true }))
-- -- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)

-- --- Keymaps
-- -- stylua: ignore start
-- util.keymap("[f", dap.up, "DAP Up")
-- util.keymap("]f", dap.down, "DAP Down")
-- util.keymap("<F5>", dap.continue, "DAP Continue")
-- util.keymap("<F7>", dap.focus_frame, "DAP Focus Frame")
-- util.keymap("<F8>", function()
--     vim.ui.input({ prompt = "Log point message: " }, function(input) dap.set_breakpoint(nil, nil, input) end)
-- end, "Toggle Logpoint")
-- util.keymap("<F9>", dap.toggle_breakpoint, "Toggle Breakpoint")
-- util.keymap("<F10>", dap.step_over, "Step Over")
-- util.keymap("<F11>", dap.step_into, "Step Into")
-- util.keymap("<F16>", function() dap.terminate({ hierarchy = true }) end, "DAP Terminate")
-- util.keymap("<F18>", dap.run_to_cursor, "Run to Cursor")
-- util.keymap("<F21>", function()
--     vim.ui.input({ prompt = "Breakpoint condition: " }, function(input) dap.set_breakpoint(input) end)
-- end, "Conditional Breakpoint")
-- util.keymap("<F23>", dap.step_out, "Step Out")
-- -- stylua: ignore end
--
-- -- Signs
-- for _, group in pairs({
--     "DapBreakpoint",
--     "DapBreakpointCondition",
--     "DapBreakpointRejected",
--     "DapLogPoint",
-- }) do
--     vim.fn.sign_define(group, { text = "●" })
-- end

-- vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

-- vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='DapBreakpoint', linehl='', numhl=''}),
-- vim.fn.sign_define('DapStopped', {text='➡️', texthl='DapStopped', linehl='DebugLineHL', numhl=''}),
-- vim.fn.sign_define('DapBreakpointCondition', {text='🔶', texthl='DapBreakpoint', linehl='', numhl=''}),
-- vim.fn.sign_define('DapBreakpointRejected', {text='⚠️', texthl='DapBreakpoint', linehl='', numhl=''})

-- {"<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = desc("Breakpoint Condition")},
-- {"<leader>db", function() require("dap").toggle_breakpoint() end, desc = desc("Toggle Breakpoint")},
-- {"<leader>dc", function() require("dap").continue() end, desc = desc("Continue")},
-- {"<leader>da", function() require("dap").continue({before = get_args}) end, desc = desc("Run with Args")},
-- {"<leader>dC", function() require("dap").run_to_cursor() end, desc = desc("Run to Cursor")},
-- {"<leader>dg", function() require("dap").goto_() end, desc = desc("Go to line (no execute)")},
-- {"<leader>dj", function() require("dap").down() end, desc = desc("Down")},
-- {"<leader>dk", function() require("dap").up() end, desc = desc("Up")},
-- {"<leader>dl", function() require("dap").run_last() end, desc = desc("Run Last")},
-- {"<leader>di", function() require("dap").step_into() end, desc = desc("Step Into")},
-- {"<leader>dO", function() require("dap").step_out() end, desc = desc("Step Out")},
-- {"<leader>do", function() require("dap").step_over() end, desc = desc("Step Over")},
-- {"<leader>dp", function() require("dap").pause() end, desc = desc("Pause")},
-- {"<leader>dr", function() require("dap").repl.toggle() end, desc = desc("Toggle REPL")},
-- {"<leader>ds", function() require("dap").session() end, desc = desc("Session")},
-- {"<leader>dt", function() require("dap").terminate() end, desc = desc("Terminate")},
-- {"<leader>Td", function() require("neotest").run.run({strategy = "dap"}) end, desc = desc("Debug Nearest")},

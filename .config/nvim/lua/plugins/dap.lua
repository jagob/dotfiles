return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      -- "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      require("dapui").setup()
      -- require("dap-go").setup()

      -- require("nvim-dap-virtual-text").setup {
      --   -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
      --   display_callback = function(variable)
      --     local name = string.lower(variable.name)
      --     local value = string.lower(variable.value)
      --     if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
      --       return "*****"
      --     end

      --     if #variable.value > 15 then
      --       return " " .. string.sub(variable.value, 1, 15) .. "... "
      --     end

      --     return " " .. variable.value
      --   end,
      -- }

      -- Handled by nvim-dap-go
      -- dap.adapters.go = {
      --   type = "server",
      --   port = "${port}",
      --   executable = {
      --     command = "dlv",
      --     args = { "dap", "-l", "127.0.0.1:${port}" },
      --   },
      -- }

      -- local elixir_ls_debugger = vim.fn.exepath "elixir-ls-debugger"
      -- if elixir_ls_debugger ~= "" then
      --   dap.adapters.mix_task = {
      --     type = "executable",
      --     command = elixir_ls_debugger,
      --   }

      --   dap.configurations.elixir = {
      --     {
      --       type = "mix_task",
      --       name = "phoenix server",
      --       task = "phx.server",
      --       request = "launch",
      --       projectDir = "${workspaceFolder}",
      --       exitAfterTaskReturns = false,
      --       debugAutoInterpretAllModules = false,
      --     },
      --   }
      -- end

      -- local dap = require("dap")
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
      }

      -- local dap = require("dap")
      dap.configurations.c = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          args = {}, -- provide arguments if needed
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        },
        -- {
        --   name = "Select and attach to process",
        --   type = "gdb",
        --   request = "attach",
        --   program = function()
        --     return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        --   end,
        --   pid = function()
        --     local name = vim.fn.input("Executable name (filter): ")
        --     return require("dap.utils").pick_process({ filter = name })
        --   end,
        --   cwd = "${workspaceFolder}",
        -- },
        -- {
        --   name = "Attach to gdbserver :1234",
        --   type = "gdb",
        --   request = "attach",
        --   target = "localhost:1234",
        --   program = function()
        --     return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        --   end,
        --   cwd = "${workspaceFolder}",
        -- },
      }

      dap.configurations.cpp = dap.configurations.c

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
      vim.keymap.set("n", "<F13>", dap.restart)

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

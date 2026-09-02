return {
    'mfussenegger/nvim-dap-python',
    ft = 'python',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    config = function()
        local path = require('mason-registry').get_package('debugpy'):get_install_path()

        require('dap-python').setup(path .. '/venv/bin/python')

        require('dap-python').resolve_python = function()
            ---@type string
            local venv_path = vim.fs.find({ '.venv' }, {
              upward = true,
              stop = vim.uv.os_homedir(),
              type = 'directory',
              limit = 1,
            })[1]

            return venv_path .. '/bin/python'
        end
    end
}

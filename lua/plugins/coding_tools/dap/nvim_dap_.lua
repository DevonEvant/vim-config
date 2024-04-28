local dap = require("dap")
local dapui = require("dapui")
local neodev = require("neodev")

-- dap config

vim.api.nvim_set_hl(0, 'DapBreakpoint', {
    ctermbg = 0,
    fg = '#993939',
    bg = '#31353f',
})
vim.api.nvim_set_hl(0, 'DapLogPoint', {
    ctermbg = 0,
    fg = '#61afef',
    bg = '#31353f',
})
vim.api.nvim_set_hl(0, 'DapStopped', {
    ctermbg = 0,
    fg = '#98c379',
    bg = '#31353f'
})
vim.fn.sign_define('DapBreakpoint', {
    text = "",
    texthl = "DapBreakpoint",
    linehl = "DapBreakpoint",
    numhl = "DapBreakpoint",
})
vim.fn.sign_define('DapBreakpointCondition', {
    text = 'ﳁ',
    texthl = 'DapBreakpoint',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint',
})
vim.fn.sign_define('DapBreakpointRejected', {
    text = "",
    texthl = "DapBreakpint",
    linehl = "DapBreakpoint",
    numhl = "DapBreakpoint",
})
vim.fn.sign_define('DapLogPoint', {
    text = '',
    texthl = 'DapLogPoint',
    linehl = 'DapLogPoint',
    numhl = 'DapLogPoint',
})
vim.fn.sign_define('DapStopped', {
    text = '',
    texthl = 'DapStopped',
    linehl = 'DapStopped',
    numhl = 'DapStopped',
})

-- lang config
dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" }
}
dap.configurations.c = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
    },
}

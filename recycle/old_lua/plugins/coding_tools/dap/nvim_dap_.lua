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
dap.configurations.rust = {
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

dap.configurations.c = dap.configurations.rust
dap.configurations.cpp = dap.configurations.rust

dap.adapters.kotlin = {
    type = "executable",
    command = "kotlin-debug-adapter",
    options = { auto_continue_if_many_stopped = false },
}

dap.configurations.kotlin = {
    {
        type = "kotlin",
        request = "launch",
        name = "This file",
        -- may differ, when in doubt, whatever your project structure may be,
        -- it has to correspond to the class file located at `build/classes/`
        -- and of course you have to build before you debug
        mainClass = function()
            local root = vim.fs.find("src", { path = vim.uv.cwd(), upward = true, stop = vim.env.HOME })[1] or ""
            local fname = vim.api.nvim_buf_get_name(0)
            -- src/main/kotlin/websearch/Main.kt -> websearch.MainKt
            return fname:gsub(root, ""):gsub("main/kotlin/", ""):gsub(".kt", "Kt"):gsub("/", "."):sub(2, -1)
        end,
        projectRoot = "${workspaceFolder}",
        jsonLogFile = "",
        enableJsonLogging = false,
    },
    {
        -- Use this for unit tests
        -- First, run 
        -- ./gradlew --info cleanTest test --debug-jvm
        -- then attach the debugger to it
        type = "kotlin",
        request = "attach",
        name = "Attach to debugging session",
        port = 5005,
        args = {},
        projectRoot = vim.fn.getcwd,
        hostName = "localhost",
        timeout = 2000,
    },

}

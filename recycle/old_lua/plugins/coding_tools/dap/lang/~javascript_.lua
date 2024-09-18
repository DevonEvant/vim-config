local dap = require('dap')

dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
}
dap.configurations.javascript = {
    {
        name = 'Launch',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
    {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = 'Attach to process',
        type = 'node2',
        request = 'attach',
        processId = require 'dap.utils'.pick_process,
    },
}

require("dap").adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
        command = "node",
        -- 💀 Make sure to update this path to point to your installation
        args = { "/path/to/js-debug/src/dapDebugServer.js", "${port}" },
    }
}

dap.configurations.typescript = {
    {
        type = 'pwa-node',
        request = 'launch',
        name = "Launch file",
        runtimeExecutable = "deno",
        runtimeArgs = {
            "run",
            "--inspect-wait",
            "--allow-all"
        },
        program = "${file}",
        cwd = "${workspaceFolder}",
        attachSimplePort = 9229,
    },
}

dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = { os.getenv("HOME") .. "/path/to/vscode-chrome-debug/out/src/chromeDebug.js" } -- TODO adjust
}

dap.configurations.javascriptreact = { -- change this to javascript if needed
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}

dap.configurations.typescriptreact = { -- change to typescript if needed
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}

local dap = require('dap')
dap.adapters.firefox = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/path/to/vscode-firefox-debug/dist/adapter.bundle.js' },
}

dap.configurations.typescript = {
    {
        name = 'Debug with Firefox',
        type = 'firefox',
        request = 'launch',
        reAttach = true,
        url = 'http://localhost:3000',
        webRoot = '${workspaceFolder}',
        firefoxExecutable = '/usr/bin/firefox'
    }


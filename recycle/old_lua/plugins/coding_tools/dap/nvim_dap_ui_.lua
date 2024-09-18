local dap = require("dap")
local dapui = require("dapui")
local neodev = require("neodev")

dapui.setup()
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

-- require("dapui").open()
-- require("dapui").close()
-- require("dapui").toggle()

-- require("dapui").eval(<expression>)
-- require("dapui").float_element(<element ID>, <optional settings>)




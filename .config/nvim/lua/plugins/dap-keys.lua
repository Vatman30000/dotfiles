return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      -- F5  - continue
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "DAP Continue",
      },
      -- F6  - terminate (остановить)
      {
        "<F6>",
        function()
          require("dap").terminate()
        end,
        desc = "DAP Terminate",
      },
      -- F7  - restart (перезапустить)
      {
        "<F7>",
        function()
          require("dap").restart()
        end,
        desc = "DAP Restart",
      },
      -- F9  - toggle breakpoint
      {
        "<F9>",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "DAP Toggle Breakpoint",
      },
      -- F10 - step over
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "DAP Step Over",
      },
      -- F11 - step into
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "DAP Step Into",
      },
      -- F12 - step out
      {
        "<F12>",
        function()
          require("dap").step_out()
        end,
        desc = "DAP Step Out",
      },
    },
  },
}

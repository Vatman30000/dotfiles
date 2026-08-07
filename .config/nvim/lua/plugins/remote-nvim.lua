return {
  {
    "amitds1997/remote-nvim.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("remote-nvim").setup({
        client_callback = function(port, _)
          vim.fn.jobstart({ "nvim", "--server", "localhost:" .. port, "--remote-ui" }, { detach = true })
        end,
      })
    end,
  },
}

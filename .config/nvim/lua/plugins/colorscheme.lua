return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "macchiato",
      transparent_background = true,
      term_colors = true,
      integrations = {
        cmp = true,
        telescope = true,
        treesitter = true,
        bufferline = true, -- Убедитесь, что интеграция с bufferline включена
        -- ... другие интеграции
      },
    },
    -- config = function(_, opts)
    --   require("catppuccin").setup(opts)
    --   vim.cmd.colorscheme("catppuccin")
    -- end,
  },
  -- {
  --   "akinsho/bufferline.nvim",
  --   optional = true,
  --   opts = function()
  --     -- Проверяем, что активная тема - Catppuccin
  --     if (vim.g.colors_name or ""):find("catppuccin") then
  --       -- Используем новый метод get_theme() :cite[1]:cite[3]
  --       return {
  --         highlights = require("catppuccin.groups.integrations.bufferline").get_theme(),
  --       }
  --     end
  --   end,
  -- },
}

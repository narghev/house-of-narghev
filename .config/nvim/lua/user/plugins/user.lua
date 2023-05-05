return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "github/copilot.vim",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "f-person/git-blame.nvim",
    event = "BufEnter",
    init = function()
      vim.g.gitblame_delay = 1000
    end
  },
  {
    "Shatur/neovim-ayu",
    name = "ayu",
    config = function()
      require("ayu").setup({
        
      })
    end,
  }
}

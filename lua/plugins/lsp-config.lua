return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local telescope_builtin = require("telescope.builtin")
      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- Opens a popup that displays documentation about the word under your cursor
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

      -- Jump to the definition of the word under your cursor.
      vim.keymap.set("n", "<leader>gd", function()
        telescope_builtin.lsp_definitions()
      end, { noremap = true, silent = true })

      -- Find references for the word under your cursor.
      vim.keymap.set("n", "<leader>gr", function()
        telescope_builtin.lsp_references()
      end, { noremap = true, silent = true })

       -- Jump to the implementation of the word under your cursor.
      vim.keymap.set("n", "<leader>gi", function()
        telescope_builtin.lsp_implementations()
      end, { noremap = true, silent = true })

      -- Fuzzy find all the symbols in your current document
      vim.keymap.set("n", "<leader>ds", function()
        telescope_builtin.lsp_document_symbol()
      end, { noremap = true, silent = true })

      -- Rename the variable under your cursor.
      vim.keymap.set("n", "<leader>rn", function()
        vim.lsp.buf.rename()
      end, { noremap = true, silent = true })

      -- Execute a code action, usually your cursor needs to be on top of an error
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

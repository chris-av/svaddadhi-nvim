local opts = { noremap = true, silent = true, }
local extend = function(tbl, desc)
  return vim.tbl_extend("error", tbl, desc)
end

return function(_, bufnr)
  local buf = vim.lsp.buf
  vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })

  -- handlers
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single", color = "red" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

  vim.keymap.set('n', 'gD', buf.declaration, extend(opts, { desc = "Buffer declarations" }))
  vim.keymap.set('n', 'gd', buf.definition, extend(opts, { desc = "Go to definition" }))
  vim.keymap.set('n', 'K', buf.hover, extend(opts, { desc = "View definition" }))
  vim.keymap.set('n', 'gi', buf.implementation, extend(opts, { desc = "Get implementation" }))
  vim.keymap.set('n', 'SH', buf.signature_help, extend(opts, { desc = "Signature help" }))
  vim.keymap.set('n', '<space>wa', buf.add_workspace_folder, extend(opts, { desc = "Add workspace to folder" }))
  vim.keymap.set('n', '<space>wr', buf.remove_workspace_folder, extend(opts, { desc = "remove workspace from folder" }))
  vim.keymap.set('n', '<space>wl', buf.list_workspace_folders, extend(opts, { desc = "List workspace folders" }))
  vim.keymap.set('n', '<space>D', buf.type_definition, extend(opts, { desc = "Type definition" }))
  vim.keymap.set('n', '<space>rn', buf.rename, extend(opts, { desc = "Rename" }))
  vim.keymap.set('n', '<space>ca', buf.code_action, extend(opts, { desc = "Code action" }))
  vim.keymap.set('n', 'gr', buf.references, extend(opts, { desc = "Get references" }))
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, extend(opts, { desc = "Open diagnostic on current line" }))
  vim.keymap.set('n', '[d', vim.diagnostic.goto_next, extend(opts, { desc = "Jump to next diagnostic" }))
  vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, extend(opts, { desc = "Jump to previous diagnostic" }))
  vim.keymap.set('n', '<space>f', buf.format, extend(opts, { desc = "Format file" }))

  -- -- set keybinds
  -- opts.desc = "Show LSP references"
  -- keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
  --
  -- opts.desc = "Go to declaration"
  -- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
  --
  -- opts.desc = "Show LSP definitions"
  -- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
  --
  -- opts.desc = "Show LSP implementations"
  -- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
  --
  -- opts.desc = "Show LSP type definitions"
  -- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
  --
  -- opts.desc = "See available code actions"
  -- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
  --
  -- opts.desc = "Smart rename"
  -- keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
  --
  -- opts.desc = "Show buffer diagnostics"
  -- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
  --
  -- opts.desc = "Show line diagnostics"
  -- keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
  --
  -- opts.desc = "Go to previous diagnostic"
  -- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
  --
  -- opts.desc = "Go to next diagnostic"
  -- keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
  --
  -- opts.desc = "Show documentation for what is under cursor"
  -- keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
  --
  -- opts.desc = "Restart LSP"
  -- keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

end


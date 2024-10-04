local lsp = require('lsp-zero')

-- Configure gopls with specific settings
lsp.configure('gopls', {
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        }
    }
})

-- Ensure other language servers are installed
lsp.ensure_installed({
    'pyright',  -- Python
    'tsserver', -- TypeScript/JavaScript
    'gopls',    -- Go
    -- Add other language servers as needed
})

-- Attach keybindings when LSP is attached
lsp.on_attach(function(client, bufnr)
    local opts = { noremap=true, silent=true }
    -- Keybindings for LSP functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end)

-- Setup lsp-zero
lsp.setup()

if vim.g.neovide then
    vim.o.guifont = "CaskaydiaCove Nerd Font Mono"

    if vim.fn.has("macos") then
        vim.g.neovide_scale_factor = 1.0
    else
        vim.g.neovide_scale_factor = 0.7
    end

    vim.g.neovide_floating_blur_amount_x = 9.0
    vim.g.neovide_floating_blur_amount_y = 9.0

    vim.keymap.set( 'n', '<leader>V', function() vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1 end, { desc = 'Increase Neovide scale' })
    vim.keymap.set( 'n', '<leader>v', function() vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1 end, { desc = 'Decrease Neovide scale' })
    
    vim.g.neovide_transparency = 1.0
end


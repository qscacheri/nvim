require('rose-pine').setup({
    -- transparent_background_level = 2,
})

function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
    vim.o.background = "light"
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()

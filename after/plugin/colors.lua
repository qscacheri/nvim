function ColorMyPencils(color)
    color = color or "nord"
    vim.cmd.colorscheme(color)
    vim.o.background = "light"
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- set line number color
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#5e81ac" })

end

ColorMyPencils()

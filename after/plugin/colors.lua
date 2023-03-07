function RosePine()
    require("rose-pine").setup({
        variant = "dawn",
        dark_variant = 'dawn',
    })
    vim.o.background = "light"
    vim.cmd.colorscheme("rose-pine")
end

function Nord()
    vim.cmd.colorscheme("nord")
end

RosePine()
-- Nord()

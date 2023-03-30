local bufferline = require("bufferline")

bufferline.setup({
    options = {
        close_command = "Bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = "Bdelete! %d",
        right_mouse_command = "buffer %d",
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        offsets = { { filetype = "NvimTree", text = "", padding = 0 } },
    },
})

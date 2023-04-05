local telescope = require("telescope")

telescope.setup({
    file_ignore_patterns = {
        -- python
        "__pycache__",
        "venv",
        "_build",
        ".ipynb_checkpoints",
        ".mypy_cache",
    },
})

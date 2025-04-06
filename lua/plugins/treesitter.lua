require("nvim-treesitter.configs").setup({
          ensure_installed = { 
            "javascript", "html", "typescript",
            "json", "jsdoc", "json5", "tsx", 
            "css", "bash", "gitignore", "xml",
            "markdown", "markdown_inline","lua",
            "regex", "ini",
          },
          sync_install = false,
          auto_install = true,
          highlight = { enable = true },
          indent = { enable = true },  
        })

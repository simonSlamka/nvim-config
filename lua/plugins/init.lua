return {
    {
        "coder/claudecode.nvim",
        lazy = false,
        config = function()
            require("claudecode").setup()
        end,
    },
    {
        "carlos-rodrigo/claude-code.nvim",
        lazy = false,
        config = function()
            require("claude-code").setup()
        end,
    },
    {
        "stevearc/conform.nvim",
        lazy = false,
        config = function()
            require("configs.conform")
        end,
    },
    {
        "echasnovski/mini.icons",
        version = false, -- always use latest
        config = function()
            require("mini.icons").setup()
        end,
    },
    {
        "danglingptr0x0/nibbler",
        config = function()
            require('nibbler').setup ({
                display_enabled = true
            })
        end,
        lazy = false
    },
    {
        "lewis6991/satellite.nvim",
        config = function()
            require("satellite").setup({
                current_only = false,
                winblend = 0,
                handlers = {
                    ale = { enable = true },
                    diagnostic = { enable = true },
                },
            })
        end,
        lazy = false,
    },
    {
        "saxon1964/neovim-tips",
     version = "*",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "MeanderingProgrammer/render-markdown.nvim"
        },
        lazy = false
    },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    },
    {
        "windwp/nvim-autopairs",
        enabled = false,
        lazy = false,
        priority = 1000,
    },
    -- {
    --     dir = "~/.config/nvim/lua",
    --     name = "codejacker",
    --     lazy = false,
    --     config = function()
    --         require("codejacker")
    --     end,
    -- },
    {
        "jedrzejboczar/possession.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("possession").setup({
                autosave = true,
                autoload = true,
                silent = false,
                session_dir = vim.fn.stdpath("data") .. "/sessions/",
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },
    {
        "farmergreg/vim-lastplace",
    },
    {
        "mbbill/undotree",
        lazy = false,
    },
    {
        "danarth/sonarlint.nvim"
    },
    {
        "m4xshen/hardtime.nvim",
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            disabled_keys = {
                ["<Up>"] = {},
                ["<Down>"] = {},
                ["<Left>"] = {},
                ["<Right>"] = {},
            },
            disable_mouse = true
        }
    },
    {
        "antonk52/bad-practices.nvim",
        config = function()
            require("bad_practices.nvim").setup({
                most_splits = 3,
                most_tabs = 3,
                max_hjkl = 10,
            })
        end,
    },
    {
        "RRethy/vim-illuminate",
        lazy = false,
        config = function()
            require("illuminate").configure({
                providers = { "lsp", "treesitter" },
                delay = 120,
                under_cursor = true
            })
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("telescope").load_extension("fzf")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("gitsigns").setup {
                diff_opts               = { internal = true },
                word_diff               = true,
                signs                   = {
                    add          = { text = "┃" },
                    change       = { text = "┃" },
                    delete       = { text = "_" },
                    topdelete    = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked    = { text = "┆" },
                },
                signcolumn              = true,
                numhl                   = true,
                linehl                  = false,
                current_line_blame      = true,
                current_line_blame_opts = {
                    delay         = 100,
                    virt_text_pos = "eol",
                },
                watch_gitdir            = { follow_files = true },
                attach_to_untracked     = true,
            }

            local hl = vim.api.nvim_set_hl

            hl(0, "GitSignsAdd", { fg = "#FF00FF", bg = "NONE" })
            hl(0, "GitSignsChange", { fg = "#FFFF00", bg = "NONE" })
            hl(0, "GitSignsDelete", { fg = "#FF0000", bg = "NONE" })

            hl(0, "GitSignsAddNr", { fg = "#FF00FF", bg = "NONE" })
            hl(0, "GitSignsChangeNr", { fg = "#FFFF00", bg = "NONE" })
            hl(0, "GitSignsDeleteNr", { fg = "#FF0000", bg = "NONE" })
            --
            -- hl(0, "GitSignsAddLn",    { bg = "#FF00FF" })
            -- hl(0, "GitSignsChangeLn", { bg = "#FFFF00" })
            -- hl(0, "GitSignsDeleteLn", { bg = "#FF0000" })

            hl(0, "GitSignsAddInline", { fg = "#FF00FF", bg = "NONE" })
            hl(0, "GitSignsChangeInline", { fg = "#FFFF00", bg = "NONE" })
            hl(0, "GitSignsDeleteInline", { fg = "#FF0000", bg = "NONE" })

            hl(0, "GitSignsAddLnInline", { fg = "#FF00FF", bg = "NONE" })
            hl(0, "GitSignsChangeLnInline", { fg = "#FFFF00", bg = "NONE" })
            hl(0, "GitSignsDeleteLnInline", { fg = "#FF0000", bg = "NONE" })

            hl(0, "GitSignsAddVirtLnInline", { fg = "#FF00FF", bg = "NONE" })
            hl(0, "GitSignsChangeVirtLnInline", { fg = "#FFFF00", bg = "NONE" })
            hl(0, "GitSignsDeleteVirtLnInline", { fg = "#FF0000", bg = "NONE" })
        end,
    },
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup()
        end,
        lazy = false
    },
    {
        "echasnovski/mini.animate",
        version = "*",
        lazy = false,
    },
    {
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup({
                app = "browser"
            })
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end,
    },
    {
        "vyfor/cord.nvim",
        build = ":Cord update",
        lazy = false,
        opts = {
            text = {
                editing = function(opts)
                    local mode = vim.api.nvim_get_mode().mode
                    local mode_label = ({
                        i = "INS",
                        v = "VIS",
                        V = "V-LN",
                        ["\22"] = "V-BLK",
                        n = "NORM",
                    })[mode] or "OTHER"

                    return string.format("[%s] %s:%s of %s", mode_label, opts.cursor_char, opts.cursor_line,
                        opts.filename)
                end,

                workspace = function()
                    local bufnr = 0
                    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
                    local todos, fixmes = 0, 0

                    for _, line in ipairs(lines) do
                        if line:match("TODO") then todos = todos + 1 end
                        if line:match("FIXME") then fixmes = fixmes + 1 end
                    end

                    local err  = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR })
                    local warn = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.WARN })

                    return string.format("todo: %d; fixme: %d | err: %d; warn: %d", todos, fixmes, err, warn)
                end,
            }
        },
    },
    {
        "nvim-pack/nvim-spectre",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = false,
    },
    {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup({})
        end,
        lazy = false
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        lazy = false,
    },
    {
        "ggandor/leap.nvim",
        lazy = false,
        config = function()
            vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward)')
            vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap-backward)')
            vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
        end,
    },
    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("diffview").setup()
        end,
        lazy = false,
    },
    {
        "szw/vim-maximizer",
        lazy = false,
    },
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("fzf-lua").setup({ fzf_colors = true })
        end
    },
    {
        "dense-analysis/ale",
        config = function()
            local g = vim.g

            g.ale_ruby_rubocop_auto_correct_all = 1

            g.ale_virtualtext_cursor = 0
            -- g.ale_virtualtext_prefix = '> '
            g.ale_virtualtext = 0

            g.ale_fixers = {
                cpp = { 'uncrustify', 'trim_whitespace' },
                c = { 'uncrustify', 'trim_whitespace' }
            }

            g.ale_linters = {
                lua = { 'lua_language_server' },
                cpp = { 'cppcheck', 'clangtidy', 'flawfinder', 'iwyu', 'clangcheck', 'cpplint', 'clangd', 'sonarlint' },
                c = { 'cppcheck', 'clangtidy', 'flawfinder', 'iwyu', 'clangcheck', 'cpplint', 'clangd', 'sonarlint' },
                markdown = { 'vale', 'languagetool' },
                text = { 'vale', 'languagetool' },
                rst = { 'vale' },
                asciidoc = { 'vale' },
                help = { 'vale' },
            }

            g.ale_vale_executable = 'vale'
            g.ale_vale_options = '--config=' .. vim.fn.expand('~/.config/vale/.vale.ini')

            g.ale_languagetool_executable = 'languagetool'
            g.ale_languagetool_options = '--language en-US'

            g.ale_lint_on_save = 1
            g.ale_lint_on_enter = 1
            g.ale_lint_on_insert_leave = 1

            g.ale_sign_error = 'X'
            g.ale_sign_warning = '!'

            g.ale_hover_cursor = 0
            g.ale_echo_cursor = 0
            g.ale_cursor_detail = 0

            g.ale_cpp_uncrustify_config = '/usr/share/uncrustify/uncrustify.cfg'

            g.ale_cpp_cppcheck_options =
            '--enable=all --check-level=exhaustive --inconclusive --force --std=c99 --suppress=missingIncludeSystem'
            g.ale_cpp_clangtidy_options = '-I include'

            vim.api.nvim_create_user_command('Cppcheck', function()
                vim.cmd(
                    '!cppcheck --check-level=exhaustive --force --std=c99 --suppress=missingIncludeSystem --enable=all --inconclusive *')
            end, {})

            vim.api.nvim_create_user_command('ClangTidy', function()
                vim.cmd('!clang-tidy *.cpp -- -I include/')
            end, {})

            vim.api.nvim_create_user_command('Flawfinder', function()
                vim.cmd('!flawfinder *')
            end, {})

            vim.api.nvim_create_user_command('RunStaticChecks', function()
                vim.cmd('Cppcheck')
                vim.cmd('ClangTidy')
                vim.cmd('Flawfinder')
            end, {})
        end,
        lazy = false,
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
        lazy = false,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        lazy = false,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                -- vim
                "vim",
                "lua",
                "vimdoc",
                "json",
                -- low-level
                "c",
                "cpp",
                "cmake",
                "make",
                "asm",
                "gdscript",
                "cuda",
                "glsl",
                "hlsl",
                "vhdl",
                "verilog",
                "bash",
                "llvm",
                -- system,
                "bash",
                -- other
                "markdown",
            },
        },
        config = function(_, opts)
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.dangc = {
                install_info = {
                    url = vim.fn.expand("~/git/dangc/tree-sitter-dangc"),
                    files = { "src/parser.c" },
                    generate_requires_npm = false,
                    requires_generate_from_grammar = false,
                },
                filetype = "dangc",
            }
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration

            "nvim-telescope/telescope.nvim", -- optional
        },
        lazy = false,
        config = true,
    },
    {
        "kdheepak/lazygit.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = false
    },
    {
        "pocco81/auto-save.nvim",
        lazy = false,
        config = function()
            require("auto-save").setup({
                trigger_events = { "InsertLeave"},
                debounce_delay = 10000,
            })
        end,
    },
    {
        "wakatime/vim-wakatime",
        lazy = false,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                    ["vim.lsp.util.stylize_markdown"] = false,
                    ["cmp.entry.get_documentation"] = false,
                },
                signature = {
                    enabled = false,
                },
                hover = {
                    enabled = false,
                },
                documentation = {
                    enabled = false,
                },
                message = {
                    enabled = false,
                },
                progress = {
                    enabled = true,
                },
            },
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    {
        "ThePrimeagen/vim-be-good",
        lazy = false,
    },
    {
        "smolck/command-completion.nvim",
        lazy = false,
    },
    {
        "ldelossa/gh.nvim",
        dependencies = {
            {
                "ldelossa/litee.nvim",
                config = function()
                    require("litee.lib").setup()
                end,
            },
        },
        config = function()
            require("litee.gh").setup()
        end,
        lazy = false
    },
    {
        "coffebar/neovim-project",
        opts = {
            projects = {
                "~/git/*",
                "~/git/work/*/*",
            },
        },
        init = function()
            -- enable saving the state of plugins in the session
            vim.opt.sessionoptions:append "globals" -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
        end,
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
            { "Shatur/neovim-session-manager" },
        },
        lazy = false,
        priority = 100,
    },
    ---@module "neominimap.config.meta"
    {
        "Isrothy/neominimap.nvim",
        version = "v3.x.x",
        lazy = false, -- NOTE: NO NEED to Lazy load
        -- Optional. You can alse set your own keybindings
        -- keys = {
        --   -- Global Minimap Controls
        --   { "<leader>nm", "<cmd>Neominimap toggle<cr>", desc = "Toggle global minimap" },
        --   { "<leader>no", "<cmd>Neominimap on<cr>", desc = "Enable global minimap" },
        --   { "<leader>nc", "<cmd>Neominimap off<cr>", desc = "Disable global minimap" },
        --   { "<leader>nr", "<cmd>Neominimap refresh<cr>", desc = "Refresh global minimap" },
        --
        --   -- Window-Specific Minimap Controls
        --   { "<leader>nwt", "<cmd>Neominimap winToggle<cr>", desc = "Toggle minimap for current window" },
        --   { "<leader>nwr", "<cmd>Neominimap winRefresh<cr>", desc = "Refresh minimap for current window" },
        --   { "<leader>nwo", "<cmd>Neominimap winOn<cr>", desc = "Enable minimap for current window" },
        --   { "<leader>nwc", "<cmd>Neominimap winOff<cr>", desc = "Disable minimap for current window" },
        --
        --   -- Tab-Specific Minimap Controls
        --   { "<leader>ntt", "<cmd>Neominimap tabToggle<cr>", desc = "Toggle minimap for current tab" },
        --   { "<leader>ntr", "<cmd>Neominimap tabRefresh<cr>", desc = "Refresh minimap for current tab" },
        --   { "<leader>nto", "<cmd>Neominimap tabOn<cr>", desc = "Enable minimap for current tab" },
        --   { "<leader>ntc", "<cmd>Neominimap tabOff<cr>", desc = "Disable minimap for current tab" },
        --
        --   -- Buffer-Specific Minimap Controls
        --   { "<leader>nbt", "<cmd>Neominimap bufToggle<cr>", desc = "Toggle minimap for current buffer" },
        --   { "<leader>nbr", "<cmd>Neominimap bufRefresh<cr>", desc = "Refresh minimap for current buffer" },
        --   { "<leader>nbo", "<cmd>Neominimap bufOn<cr>", desc = "Enable minimap for current buffer" },
        --   { "<leader>nbc", "<cmd>Neominimap bufOff<cr>", desc = "Disable minimap for current buffer" },
        --
        --   ---Focus Controls
        --   { "<leader>nf", "<cmd>Neominimap focus<cr>", desc = "Focus on minimap" },
        --   { "<leader>nu", "<cmd>Neominimap unfocus<cr>", desc = "Unfocus minimap" },
        --   { "<leader>ns", "<cmd>Neominimap toggleFocus<cr>", desc = "Switch focus on minimap" },
        -- },
        init = function()
            -- The following options are recommended when layout == "float"
            vim.opt.wrap = false
            vim.opt.sidescrolloff = 36 -- Set a large value

            ---@type Neominimap.UserConfig
            vim.g.neominimap = {
                auto_enable = true,
                diagnostic = {
                    enabled = true,
                },
            }
        end,
    },
    {
        "Zeioth/makeit.nvim",
        cmd = { "MakeitOpen", "MakeitToggleResults", "MakeitRedo" },
        dependencies = { "stevearc/overseer.nvim" },
        opts = {},
    },
    {
        "danymat/neogen",
        config = true,
        lazy = false,
    },
    { -- The task runner we use
        "stevearc/overseer.nvim",
        commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
        cmd = { "MakeitOpen", "MakeitToggleResults", "MakeitRedo" },
        opts = {
            task_list = {
                direction = "bottom",
                min_height = 25,
                max_height = 25,
                default_detail = 1,
            },
        },
        lazy = false,
    },
    {
        "Zeioth/dooku.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "ldelossa/gh.nvim",
        dependencies = {
            {
                "ldelossa/litee.nvim",
                config = function()
                    require("litee.lib").setup()
                end,
            },
        },
        config = function()
            require("litee.gh").setup()
        end,
    },
    {
        "folke/trouble.nvim",
        opts = {
            -- position = "right",
            -- width = 50,
            -- auto_open = false,
            -- auto_close = false,
            -- auto_preview = true,
            -- focus = false,
        }, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
        lazy = false,
    },
    {
        "FabijanZulj/blame.nvim",
        lazy = false,
        opts = {
            blame_options = nil,
            views = {
                virtual = virtual_view,
                default = virtual_view
            },
            merge_consecutive = false,
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        --- @module "ibl"
        --- @type ibl.config
        opts = {},
    },
    -- {
    --     "y3owk1n/undo-glow.nvim",
    --     version = "*",
    --     lazy = false
    -- },
    -- {
    --     "tris203/precognition.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         startVisible = true,
    --         showBlankVirtLine = false,
    --         highlightColor = { link = "Comment" },
    --         hints = {
    --             Caret = { text = "^", prio = 2 },
    --             Dollar = { text = "$", prio = 1 },
    --             MatchingPair = { text = "%", prio = 5 },
    --             Zero = { text = "0", prio = 1 },
    --             w = { text = "w", prio = 10 },
    --             b = { text = "b", prio = 9 },
    --             e = { text = "e", prio = 8 },
    --             W = { text = "W", prio = 7 },
    --             B = { text = "B", prio = 6 },
    --             E = { text = "E", prio = 5 },
    --         },
    --         gutterHints = {
    --             G = { text = "G", prio = 10 },
    --             gg = { text = "gg", prio = 9 },
    --             PrevParagraph = { text = "{", prio = 8 },
    --             NextParagraph = { text = "}", prio = 8 },
    --         },
    --         -- disabled_fts = {
    --         --     "startify",
    --         -- },
    --     }
    -- },
    {
        "TobinPalmer/Tip.nvim",
        event = "VimEnter",
        init = function()
            --- @type Tip.config
            require("tip").setup({
                seconds = 2,
                title = "Tip!",
                url = "https://vtip.43z.one", -- Or https://vimiscool.tech/neotip
            })
        end,
        lazy = false,
    },
    {
        "pwntester/octo.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("octo").setup()
        end,
        lazy = false,
    },
    {
        "roobert/tabtree.nvim",
        config = function()
            require("tabtree").setup()
        end,
    },
    -- {
    --     "iamcco/markdown-preview.nvim",
    --     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    --     ft = { "markdown" },
    --     build = function() vim.fn["mkdp#util#install"]() end,
    -- },
    --   'dense-analysis/ale',
    --   lazy = false,
    --   config = function()
    --       -- Configuration goes here.
    --       local g = vim.g
    --
    --       g.ale_linters = {
    --           lua = {'lua_language_server'},
    --           javascript = {'eslint'},
    --           typescript = {'eslint'}
    --       }
    --
    --   end
    -- }
}

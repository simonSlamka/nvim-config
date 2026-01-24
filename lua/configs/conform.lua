local conform = require("conform")

conform.setup({
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = false,
    },
    formatters_by_ft = {
        c = { "uncrustify" },
        cpp = { "uncrustify" },
    },
    formatters = {
        uncrustify = {
            command = "uncrustify",
            args = function(ctx)
                local cfg = vim.fs.find({ ".uncrustify.cfg", "uncrustify.cfg", ".uncrustify" }, {
                    upward = true,
                    type = "file",
                    path = vim.fs.dirname(ctx.filename),
                    stop = vim.fn.expand("~")
                })[1]

                if not cfg then
                    cfg = vim.fn.expand("~/.uncrustify.cfg")
                    if vim.fn.filereadable(cfg) == 0 then
                        return { "-l", "C", "--no-backup" }
                    end
                end

                local lang = "C"
                if ctx.filename and (ctx.filename:match("%.cpp$") or ctx.filename:match("%.cc$") or ctx.filename:match("%.cxx$")) then
                    lang = "CPP"
                end

                return { "-c", cfg, "-l", lang, "--no-backup" }
            end,
            stdin = true,
        },
    },
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
    require("conform").format({
        async = false,
        lsp_fallback = false,
        timeout_ms = 500,
    })
end, { desc = "Format with Conform" })

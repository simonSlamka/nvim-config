require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", ":wq", ":lua vim.defer_fn(function() vim.api.nvim_exec('qa!', false) end, 50)<CR>",
    { desc = "Quit without extra newline" })
map("n", "<leader>t", ":FloatermToggle<CR>", { desc = "Toggle floating terminal" })
map("n", "<leader>g", ":LazyGit<CR>", { desc = "Open LazyGit" })
map("n", "<leader>z", ":ZenMode<CR>", { desc = "Toggle Zen Mode" })
map("n", "<leader>sr", ":Spectre<CR>", { desc = "Search and replace" })
map("n", "<leader>gd", function()
    local lib = require("diffview.lib")
    local view = lib.get_current_view()
    if view then
        vim.cmd("DiffviewClose")
    else
        vim.cmd("DiffviewOpen")
    end
end, { desc = "Toggle Git diff" })
map("n", "<leader>k", ":Telescope keymaps<CR>", { desc = "Show all keymaps in a searchable list" })
map("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Toggle undo tree" })

local keymaps = {
    { key = "H",          cmd = "^",                             desc = "Move to beginning of line" },
    { key = "L",          cmd = "g_",                            desc = "Move to end of line (excluding newline)" },
    { key = "J",          cmd = "5j",                            desc = "Move down 5 lines" },
    { key = "W",          cmd = "w",                             desc = "Move to next word" },
    { key = "B",          cmd = "b",                             desc = "Move to previous word" },
    { key = "<C-d>",      cmd = "<C-d>zz",                       desc = "Scroll down half a page & center" },
    { key = "<C-u>",      cmd = "<C-u>zz",                       desc = "Scroll up half a page & center" },
    { key = "n",          cmd = "nzzzv",                         desc = "Next search result (centered)" },
    { key = "N",          cmd = "Nzzzv",                         desc = "Previous search result (centered)" },

    { key = "U",          cmd = "<C-r>",                         desc = "Redo" },
    { key = "Y",          cmd = "y$",                            desc = "Yank to end of line" },
    { key = "x",          cmd = "x",                             desc = "Delete character (copies)" },
    { key = "X",          cmd = "dd",                            desc = "Delete line (copies)" },
    { key = "dd",         cmd = "dd",                            desc = "Delete line (copies)" },
    { key = "<leader>p",  cmd = '"0p',                           desc = "Paste last yanked text" },
    { key = "<leader>P",  cmd = '"0P',                           desc = "Paste last yanked text (before cursor)" },

    { key = "viw",        cmd = "viw",                           desc = "Select current word" },
    { key = "vaW",        cmd = "vaW",                           desc = "Select current WORD (includes punctuation)" },
    { key = "vif",        cmd = "<cmd>lua local p=vim.lsp.util.make_position_params(); local ns=vim.api.nvim_create_namespace('VIF_TSSYM'); vim.api.nvim_buf_clear_namespace(0, ns, 0, -1); vim.lsp.buf_request(0,'textDocument/documentHighlight',p,function(_,res) if res and #res>0 then vim.lsp.buf.document_highlight(); return end; local ok,ts=pcall(require,'vim.treesitter'); if not ok then return end; local node=(vim.treesitter.get_node and vim.treesitter.get_node()) or nil; if not node then return end; local t=node:type(); while node and not (t=='identifier' or t=='field_identifier') do node=node:parent(); t=node and node:type() or nil end; if not node then return end; local srow,scol,erow,ecol=node:range(); vim.api.nvim_buf_add_highlight(0, ns, 'LspReferenceText', srow, scol, ecol); end)<CR>", desc = "Highlight symbol: LSP refs else TS node" },
    { key = "vic",        cmd = "<cmd>lua local ns=vim.api.nvim_create_namespace('VIF_TSSYM'); vim.api.nvim_buf_clear_namespace(0, ns, 0, -1); vim.lsp.buf.clear_references()<CR>", desc = "Clear symbol highlights" },
    { key = "<leader>rr", cmd = "<cmd>lua local c=vim.lsp.get_clients{bufnr=0,name='clangd'}[1]; local enc=c and c.offset_encoding or 'utf-8'; local p=vim.lsp.util.make_position_params(0, enc); p.context={includeDeclaration=true}; vim.lsp.buf_request(0,'textDocument/references',p,function(_,res) if not res or vim.tbl_isempty(res) then print('0 refs'); return end; local uri=vim.uri_from_bufnr(0); local pats={} for _,loc in ipairs(res) do local u=loc.uri or loc.targetUri; local r=loc.range or loc.targetRange; if u==uri and r then local l=r.start.line+1; local c0=r.start.character+1; pats[#pats+1]=('\\\\%%%dl\\\\%%%dc'):format(l,c0) end end; if #pats==0 then print('0 in file'); return end; vim.fn.setreg('/', table.concat(pats,'\\\\|')); vim.o.hlsearch=true end)<CR>", desc = "Set / to semantic refs (use n/N)" },
    { key = "V",          cmd = "V",                             desc = "Select entire line" },
    { key = "vip",        cmd = "vip",                           desc = "Select inside paragraph" },
    { key = "vis",        cmd = "vi{",                           desc = "Select inside braces `{}`" },
    { key = "vas",        cmd = "va{",                           desc = "Select inside braces `{}`, plus the braces" },
    { key = "viv",        cmd = "vi(",                           desc = "Select inside parentheses `()`" },
    { key = "viq",        cmd = 'vi"',                           desc = "Select inside double quotes `\"`" },
    { key = "<leader>sw", cmd = "*N",                            desc = "Search for current word" },

    { key = "<",          cmd = "<<",                            desc = "Indent left" },
    { key = ">",          cmd = ">>",                            desc = "Indent right" },

    { key = "<leader>bn", cmd = ":bnext<CR>",                    desc = "Next buffer" },
    { key = "<leader>bp", cmd = ":bprevious<CR>",                desc = "Previous buffer" },
    { key = "<leader>bd", cmd = ":bdelete<CR>",                  desc = "Close current buffer" },

    { key = "<leader>gd", cmd = ":DiffviewOpen<CR>",             desc = "Toggle Git diff view" },
    { key = "<leader>gb", cmd = ":Git blame<CR>",                desc = "Show Git blame" },

    { key = "<leader>e",  cmd = ":NvimTreeToggle<CR>",           desc = "Toggle file explorer" },
    { key = "<leader>km", cmd = ":Telescope keymaps<CR>",        desc = "Search keymaps" },
    { key = "<leader>sr", cmd = ":Spectre<CR>",                  desc = "Search and replace" },
}

for _, m in ipairs(keymaps) do
    map("n", m.key, m.cmd, { noremap = true, silent = true, desc = m.desc })
end

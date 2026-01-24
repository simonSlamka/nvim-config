-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "hiberbee",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },

    hl_override = {
        LspReferenceText  = { fg = "#000000", bg = "#3fff00", bold = true },
        LspReferenceRead  = { fg = "#000000", bg = "#3fff00", bold = true },
        LspReferenceWrite = { fg = "#000000", bg = "#3fff00", bold = true },

        IlluminatedWordText  = { underline = true, sp = "#3fff00" },
        IlluminatedWordRead  = { underline = true, sp = "#3fff00" },
        IlluminatedWordWrite = { underline = true, sp = "#3fff00" },
    },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M

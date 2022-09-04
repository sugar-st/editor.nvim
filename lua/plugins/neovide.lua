local map = require 'tools'.map

if vim.g.neovide then
    vim.g.gui_font_default_size = 11
    vim.g.gui_font_size = vim.g.gui_font_default_size
    -- vim.g.gui_font_face = "JetBrains Mono NL"
    vim.g.gui_font_face = "Iosevka Nerd Font"
    -- vim.g.gui_font_face = "VictorMono Nerd Font"

    RefreshGuiFont = function()
        vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
    end

    ResizeGuiFont = function(delta)
        vim.g.gui_font_size = vim.g.gui_font_size + delta
        RefreshGuiFont()
    end

    ResetGuiFont = function()
        vim.g.gui_font_size = vim.g.gui_font_default_size
        RefreshGuiFont()
    end

    -- Call function on startup to set default value
    ResetGuiFont()

    map({ 'n', 'i' }, "<D-=>", function() ResizeGuiFont(1) end)
    map({ 'n', 'i' }, "<D-->", function() ResizeGuiFont(-1) end)
end

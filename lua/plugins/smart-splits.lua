require 'smart-splits'.setup {
    -- Ignored filetypes (only while resizing)
    ignored_filetypes = { 'nofile', 'quickfix', 'prompt' },
    -- Ignored buffer types (only while resizing)
    ignored_buftypes = { 'NvimTree' },
    -- when moving cursor between splits left or right,
    -- place the cursor on the same row of the *screen*
    -- regardless of line numbers. False by default.
    -- Can be overridden via function parameter, see Usage.
    move_cursor_same_row = false
}

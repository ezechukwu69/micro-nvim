return {
    {
        "Exafunction/codeium.vim",
        event = "BufEnter",
        init = function ()
            vim.keymap.set('i', '<C-]>', function() return vim.fn['codeium#Accept']() end, { expr = true, desc = "Accept codeium suggestion"})
        end
     }
}

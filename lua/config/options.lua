vim.wo.number = true
-- vim.cmd.colorscheme "catppuccin-mocha"
vim.cmd('colorscheme tokyonight-night')
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set expandtab')
vim.cmd('set relativenumber')
vim.cmd('set numberwidth=2')
vim.cmd(":hi NonText guifg=bg")
--Lua:
vim.g.material_style = "deep ocean"
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.inccommand = "split"
vim.opt.wrap = true

vim.opt.list = true
vim.opt.listchars = { tab = "▸ ", trail = "·", nbsp = "␣" }
vim.opt.cursorline = true
vim.opt.hlsearch = true

vim.cmd [[
    nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>
     " Jump to definition
    nnoremap gd <Cmd>lua vim.lsp.buf.definition()<CR>
     " Open code actions using the default lsp UI, if you want to change this please see the plugins above
    nnoremap <F4> <Cmd>lua vim.lsp.buf.code_action()<CR>
     " Open code actions for the selected visual range
    xnoremap <F4> <Cmd>lua vim.lsp.buf.range_code_action()<CR>

     " All other keybiding
    nnoremap <F2> <Cmd>lua vim.lsp.buf.rename()<CR>
    nnoremap gr <Cmd>lua vim.lsp.buf.references()<CR>
    nnoremap ga <Cmd>lua vim.lsp.buf.code_action()<CR>
    nnoremap gs <Cmd>lua vim.lsp.buf.signature_help()<CR>
    nnoremap gD <Cmd>lua vim.lsp.buf.type_definition()<CR>
    nnoremap gI <Cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap <F3> <Cmd>lua vim.lsp.buf.format()<CR>
    nnoremap ]d <Cmd>lua vim.diagnostic.goto_next()<CR>
    nnoremap [d <Cmd>lua vim.diagnostic.goto_prev()<CR>
    nnoremap gl <Cmd>lua vim.diagnostic.open_float()<CR>
    nnoremap gh <Cmd>lua vim.lsp.buf.signature_help()<CR>
]]

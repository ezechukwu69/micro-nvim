return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        enabled = false,
        config = function()
            local lualine = require('lualine')
            -- Color table for highlights
            -- stylua: ignore
            local colors = {
                bg       = '#202328',
                fg       = '#bbc2cf',
                yellow   = '#ECBE7B',
                cyan     = '#008080',
                darkblue = '#081633',
                green    = '#98be65',
                orange   = '#FF8800',
                violet   = '#a9a1e1',
                magenta  = '#c678dd',
                blue     = '#51afef',
                red      = '#ec5f67',
            }

            local conditions = {
                buffer_not_empty = function()
                    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
                end,
                hide_in_width = function()
                    return vim.fn.winwidth(0) > 80
                end,
                check_git_workspace = function()
                    local filepath = vim.fn.expand('%:p:h')
                    local gitdir = vim.fn.finddir('.git', filepath .. ';')
                    return gitdir and #gitdir > 0 and #gitdir < #filepath
                end,
            }

            -- Config
            local theme = require("lualine.themes.catppuccin-macchiato")
            local config = {
                options = {
                    icons_enabled = true,
                    theme = theme,
                    -- component_separators = { left = '  ', right = '  ' },
                    -- section_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    component_separators = { left = ' ', right = ' ' },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = true,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = {
                        -- 'buffers'
                        {
                            'filename',
                            path = 1
                        },
                    },
                    lualine_x = { 'tabs', {

                        function()
                            local msg = 'No Active Lsp'
                            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                            local clients = vim.lsp.get_active_clients()
                            if next(clients) == nil then
                                return msg
                            end
                            for _, client in ipairs(clients) do
                                local filetypes = client.config.filetypes
                                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                    return client.name
                                end
                            end
                            return msg
                        end,
                        icon = ' LSP:',
                        color = { fg = '#ffffff', gui = 'bold' },
                    }, 'encoding', 'fileformat', 'filetype', },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }

            -- Inserts a component in lualine_c at left section
            local function ins_left(component)
                table.insert(config.sections.lualine_b, component)
            end

            -- Inserts a component in lualine_x at right section
            local function ins_right(component)
                table.insert(config.sections.lualine_x, component)
            end

            -- ins_left {
            --     function()
            --         return '▊'
            --     end,
            --     color = { fg = colors.blue },      -- Sets highlighting of component
            --     padding = { left = 0, right = 1 }, -- We don't need space before this
            -- }

            -- ins_left {
            --     -- mode component
            --     function()
            --         return ''
            --     end,
            --     color = function()
            --         -- auto change color according to neovims mode
            --         local mode_color = {
            --             n = colors.red,
            --             i = colors.green,
            --             v = colors.blue,
            --             [''] = colors.blue,
            --             V = colors.blue,
            --             c = colors.magenta,
            --             no = colors.red,
            --             s = colors.orange,
            --             S = colors.orange,
            --             [''] = colors.orange,
            --             ic = colors.yellow,
            --             R = colors.violet,
            --             Rv = colors.violet,
            --             cv = colors.red,
            --             ce = colors.red,
            --             r = colors.cyan,
            --             rm = colors.cyan,
            --             ['r?'] = colors.cyan,
            --             ['!'] = colors.red,
            --             t = colors.red,
            --         }
            --         return { fg = mode_color[vim.fn.mode()] }
            --     end,
            --     padding = { right = 1 },
            -- }

            -- ins_left {
            --     -- filesize component
            --     'filesize',
            --     cond = conditions.buffer_not_empty,
            -- }

            -- ins_left {
            --     'filename',
            --     cond = conditions.buffer_not_empty,
            --     color = { fg = colors.magenta, gui = 'bold' },
            -- }

            -- ins_left { 'location' }

            -- ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

            -- ins_left {
            --     'diagnostics',
            --     sources = { 'nvim_diagnostic' },
            --     symbols = { error = ' ', warn = ' ', info = ' ' },
            --     diagnostics_color = {
            --         color_error = { fg = colors.red },
            --         color_warn = { fg = colors.yellow },
            --         color_info = { fg = colors.cyan },
            --     },
            -- }

            -- -- Insert mid section. You can make any number of sections in neovim :)
            -- -- for lualine it's any number greater then 2
            -- ins_left {
            --     function()
            --         return '%='
            --     end,
            -- }

            -- ins_left {
            --     "tabs"
            -- }

            -- ins_right {
            --     -- Lsp server name .
            --     function()
            --         local msg = 'No Active Lsp'
            --         local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
            --         local clients = vim.lsp.get_active_clients()
            --         if next(clients) == nil then
            --             return msg
            --         end
            --         for _, client in ipairs(clients) do
            --             local filetypes = client.config.filetypes
            --             if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            --                 return client.name
            --             end
            --         end
            --         return msg
            --     end,
            --     icon = ' LSP:',
            --     color = { fg = '#ffffff', gui = 'bold' },
            -- }

            -- -- Add components to right sections
            -- ins_right {
            --     'o:encoding',       -- option component same as &encoding in viml
            --     fmt = string.upper, -- I'm not sure why it's upper case either ;)
            --     cond = conditions.hide_in_width,
            --     color = { fg = colors.green, gui = 'bold' },
            -- }

            -- ins_right {
            --     'fileformat',
            --     fmt = string.upper,
            --     icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
            --     color = { fg = colors.green, gui = 'bold' },
            -- }

            -- ins_right {
            --     'branch',
            --     icon = '',
            --     color = { fg = colors.violet, gui = 'bold' },
            -- }

            -- ins_right {
            --     'diff',
            --     -- Is it me or the symbol for modified us really weird
            --     symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
            --     diff_color = {
            --         added = { fg = colors.green },
            --         modified = { fg = colors.orange },
            --         removed = { fg = colors.red },
            --     },
            --     cond = conditions.hide_in_width,
            -- }

            -- ins_right {
            --     function()
            --         return '▊'
            --     end,
            --     color = { fg = colors.blue },
            --     padding = { left = 1 },
            -- }

            -- Now don't forget to initialize lualine
            lualine.setup(config)
        end
    },
    {
        'windwp/windline.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            -- source provider function
            local windline = require('windline')
            local helper = require('windline.helpers')
            local sep = helper.separators
            local vim_components = require('windline.components.vim')

            local b_components = require('windline.components.basic')
            local state = _G.WindLine.state

            local lsp_comps = require('windline.components.lsp')
            local lsp_comps_prog = require('windline.components.lsp_progress')
            local git_comps = require('windline.components.git')

            local hl_list = {
                Black = { 'white', 'black' },
                White = { 'black', 'white' },
                Inactive = { 'InactiveFg', 'InactiveBg' },
                Active = { 'ActiveFg', 'ActiveBg' },
            }
            local basic = {}

            basic.divider = { b_components.divider, '' }
            basic.space = { ' ', '' }
            basic.bg = { ' ', 'StatusLine' }
            basic.file_name_inactive = { b_components.full_file_name, hl_list.Inactive }
            basic.line_col_inactive = { b_components.line_col, hl_list.Inactive }
            basic.progress_inactive = { b_components.progress, hl_list.Inactive }

            basic.vi_mode = {
                hl_colors = {
                    Normal = { 'black', 'red', 'bold' },
                    Insert = { 'black', 'green', 'bold' },
                    Visual = { 'black', 'yellow', 'bold' },
                    Replace = { 'black', 'blue_light', 'bold' },
                    Command = { 'black', 'magenta', 'bold' },
                    NormalBefore = { 'red', 'black' },
                    InsertBefore = { 'green', 'black' },
                    VisualBefore = { 'yellow', 'black' },
                    ReplaceBefore = { 'blue_light', 'black' },
                    CommandBefore = { 'magenta', 'black' },
                    NormalAfter = { 'white', 'red' },
                    InsertAfter = { 'white', 'green' },
                    VisualAfter = { 'white', 'yellow' },
                    ReplaceAfter = { 'white', 'blue_light' },
                    CommandAfter = { 'white', 'magenta' },
                },
                text = function()
                    return {
                        { sep.left_rounded,     state.mode[2] .. 'Before' },
                        { state.mode[1] .. ' ', state.mode[2] },
                    }
                end,
            }

            basic.macro_recording = {
                hl_colors = {
                    default = { 'black', 'red' },
                    defaultAfter = { 'red', 'black' },
                },
                text = function()
                    if vim.fn.reg_recording() ~= '' then
                        return {
                            { sep.left_rounded,                       'defaultAfter' },
                            { 'Macro @' .. vim.fn.reg_recording(), 'default' },
                            { sep.right_rounded,                      'defaultAfter' },
                        }
                    end
                    return ""
                end,
            }

            basic.lsp_name = {
                hl_colors = {
                    sep_before = { 'black_light', 'white_light' },
                    sep_after = { 'black_light', 'black' },
                    default = { 'yellow', 'black_light' },
                },
                text = function(bufnr)
                    if lsp_comps.check_lsp(bufnr) then
                        return {
                            { sep.left_rounded,                      'sep_after' },
                            { ' ',                                   'default' },
                            { lsp_comps.lsp_name({ format = '%s' }), 'default' },
                            { ' ',                                   'default' },
                            { lsp_comps_prog.lsp_progress(),         'default' },
                            { ' ',                                   'default' },
                            { sep.right_rounded,                     'sep_after' },
                        }
                    end
                    return ''
                end,
            }

            basic.lsp_diagnos = {
                width = 90,
                hl_colors = {
                    red = { 'red', 'black' },
                    yellow = { 'yellow', 'black' },
                    blue = { 'blue', 'black' },
                },
                text = function(bufnr)
                    if lsp_comps.check_lsp(bufnr) then
                        return {
                            { lsp_comps.lsp_error({ format = '  %s' }), 'red' },
                            { lsp_comps.lsp_warning({ format = '  %s' }), 'yellow' },
                            { lsp_comps.lsp_hint({ format = '  %s' }), 'blue' },
                        }
                    end
                    return ''
                end,
            }


            local icon_comp = b_components.cache_file_icon({ default = '', hl_colors = { 'white', 'black_light' } })

            basic.file = {
                hl_colors = {
                    default = { 'white', 'black_light' },
                },
                text = function(bufnr)
                    return {
                        { ' ', 'default' },
                        icon_comp(bufnr),
                        { ' ', 'default' },
                        { b_components.cache_file_name('[No Name]', ''), '' },
                        { b_components.file_modified(' '), '' },
                        { b_components.cache_file_size(), '' },
                    }
                end,
            }
            basic.right = {
                hl_colors = {
                    sep_before = { 'black_light', 'white_light' },
                    sep_after = { 'white_light', 'black' },
                    text = { 'black', 'white_light' },
                },
                text = function()
                    return {
                        { b_components.line_col_lua, 'text' },
                        { sep.right_rounded,         'sep_after' },
                    }
                end,
            }
            basic.git = {
                width = 90,
                hl_colors = {
                    green = { 'green', 'black' },
                    red = { 'red', 'black' },
                    blue = { 'blue', 'black' },
                },
                text = function(bufnr)
                    if git_comps.is_git(bufnr) then
                        return {
                            { ' ', '' },
                            { git_comps.diff_added({ format = ' %s' }), 'green' },
                            { git_comps.diff_removed({ format = '  %s' }), 'red' },
                            { git_comps.diff_changed({ format = '  %s' }), 'blue' },
                        }
                    end
                    return ''
                end,
            }
            basic.logo = {
                hl_colors = {
                    sep_before = { 'blue', 'black' },
                    default = { 'black', 'blue' },
                },
                text = function()
                    return {
                        { sep.left_rounded, 'sep_before' },
                        { ' ', 'default' },
                    }
                end,
            }

            local default = {
                filetypes = { 'default' },
                active = {
                    { ' ',                           hl_list.Black },
                    basic.logo,
                    basic.file,
                    { vim_components.search_count(), { 'red', 'black_light' } },
                    { sep.right_rounded,             { 'black_light', 'black' } },
                    basic.lsp_diagnos,
                    basic.git,
                    basic.divider,
                    { git_comps.git_branch({ icon = '  ' }), { 'blue', 'black' }, 90 },
                    { ' ', hl_list.Black },
                    { git_comps.git_changes(), { 'green', 'black' }, 90 },
                    { ' ', hl_list.Black },
                    basic.lsp_name,
                    { ' ', hl_list.Black },
                    basic.macro_recording,
                    { ' ', hl_list.Black },
                    basic.vi_mode,
                    basic.right,
                    { ' ', hl_list.Black },
                },
                inactive = {
                    basic.file_name_inactive,
                    basic.divider,
                    basic.divider,
                    basic.line_col_inactive,
                    { '', { 'white', 'InactiveBg' } },
                    basic.progress_inactive,
                },
            }

            local quickfix = {
                filetypes = { 'qf', 'Trouble' },
                active = {
                    { '🚦 Quickfix ', { 'white', 'black' } },
                    { helper.separators.slant_right, { 'black', 'black_light' } },
                    {
                        function()
                            return vim.fn.getqflist({ title = 0 }).title
                        end,
                        { 'cyan', 'black_light' },
                    },
                    { ' Total : %L ',                { 'cyan', 'black_light' } },
                    { helper.separators.slant_right, { 'black_light', 'InactiveBg' } },
                    { ' ',                           { 'InactiveFg', 'InactiveBg' } },
                    basic.divider,
                    { helper.separators.slant_right, { 'InactiveBg', 'black' } },
                    { '🧛 ', { 'white', 'black' } },
                },
                always_active = true,
                show_last_status = true
            }

            local explorer = {
                filetypes = { 'fern', 'NvimTree', 'lir' },
                active = {
                    { '  ', { 'white', 'black' } },
                    { helper.separators.slant_right, { 'black', 'black_light' } },
                    { b_components.divider, '' },
                    { b_components.file_name(' '), { 'white', 'black_light' } },
                },
                always_active = true,
                show_last_status = true
            }
            windline.setup({
                colors_name = function(colors)
                    -- ADD MORE COLOR HERE ----
                    return colors
                end,
                statuslines = {
                    default,
                    quickfix,
                    explorer,
                },
            })
        end
    }
}

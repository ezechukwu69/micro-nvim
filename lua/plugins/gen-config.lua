local utils = require("utils")

return {
    {
        "David-Kunz/gen.nvim",
        config = function()
            -- recieve url as a prompt
            local gen = require("gen")
            if utils.read_dotenv()['GEN_URL'] then
                gen.setup({
                    show_prompt = true, -- Shows the Prompt submitted to Ollama.
                    show_model = true,
                    command = "curl --silent --no-buffer -X POST " .. utils.read_dotenv()['GEN_URL'] .. "api/generate -d $body"
                })
                vim.keymap.set({ 'n', 'v' }, '<leader>g', ':Gen<CR>')
            else
                vim.ui.input({ prompt = "Gen url: " }, function(url)
                    if url == nil then
                        vim.notify("Gen url not set, defaults to localhost", vim.log.levels.WARN)
                        gen.setup({
                            show_prompt = true, -- Shows the Prompt submitted to Ollama.
                            show_model = true,
                            command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body"
                        })
                        vim.keymap.set({ 'n', 'v' }, '<leader>g', ':Gen<CR>')
                    else
                        print("curl --silent --no-buffer -X POST " .. url .. "api/generate -d $body")
                        gen.setup({
                            show_prompt = true, -- Shows the Prompt submitted to Ollama.
                            show_model = true,
                            command = "curl --silent --no-buffer -X POST " .. url .. "api/generate -d $body"
                        })
                        vim.keymap.set({ 'n', 'v' }, '<leader>g', ':Gen<CR>')
                        utils.set_dotenv('GEN_URL', url)
                    end
                end)
            end
        end
    },
}

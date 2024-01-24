local utils = require("utils")

return {
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        config = function()
            local result = utils.read_dotenv()
            print(vim.inspect(result))
            if result['OPENAI_API_KEY'] == nil then
                return
            end
            require("chatgpt").setup({
                api_key_cmd = "echo " .. result['OPENAI_API_KEY'],
            })
        end,
        -- init = function()
        -- end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    }
}

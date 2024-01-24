-- create a function to read all variables in a .env file and return them as a table
M = {}
local function read_dotenv()
    local file = io.open(vim.api.nvim_list_runtime_paths()[1] .. '/.env', 'r')
    if file then
        local result = {}
        for line in file:lines() do
            local key, value = line:match('([^=]+)=([^=]+)')
            if key and value then
                result[key] = value
            end
        end
        file:close()
        return result
    end
    return {}
end

-- create a function that takes a key and value that sets the variables in a .env file and updates the value if it exists
local function set_dotenv(key, value)
    local file = io.open(vim.api.nvim_list_runtime_paths()[1] .. '/.env', 'r')
    if file then
        print("File gotten")
        local result = {}
        for line in file:lines() do
            local line_key, line_value = line:match('([^=]+)=([^=]+)')
            if line_key and line_value then
                if line_key == key then
                    result[key] = value
                else
                    result[line_key] = line_value
                end
            end
        end
        if not result[key] then
            result[key] = value
        end
        file:close()
        local new_file = io.open(vim.api.nvim_list_runtime_paths()[1] .. '/.env', 'w')
        if new_file then
            for k, v in pairs(result) do
                new_file:write(k .. '=' .. v .. '\n')
            end
            new_file:close()
        end
    else
        print(".env file not found")
    end
end

M.set_genurl = function (url)
    print("Setting url")
    set_dotenv('GEN_URL', url)
end



M.read_dotenv = read_dotenv
M.set_dotenv = set_dotenv

return M



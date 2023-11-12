-- lua/utils.lua

vim.api.nvim_create_user_command("UpdateAll", function()
    vim.cmd([[PackerSync]])
    vim.cmd([[TSUpdateSync]])
end, {})

local path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(path) then
    local output = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable",
        "https://github.com/folke/lazy.nvim.git", path })
    if vim.v.shell_error ~= 0 then error("Cannot install lazy.nvim: " .. output) end
end
vim.opt.rtp:prepend(path)
require("lazy").setup({ { import = "specs" } }, {
    change_detection = { notify = false },
    checker = { enabled = false },
    rocks = { enabled = false },
})

local M = {}

function M.setup()
    if M.watcher then
        M.watcher:stop()
    end
    M.watcher = vim.loop.new_fs_poll()
    local init_path = vim.fn.stdpath('config')..'/init.lua'
    M.watcher:start(init_path, 1500, vim.schedule_wrap(function()
        dofile(init_path)
        print('Reloaded init.lua')
    end))
    vim.cmd('augroup nvim_sourcerer')
    vim.cmd('  autocmd!')
    vim.cmd('  autocmd VimLeave * lua require("sourcerer").watcher:stop()')
    vim.cmd('augroup END')
end

return M

return {
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
        local wk = require('which-key')
        wk.setup()

        -- Document existing key chains (which-key v3 API)
        wk.add {
            { '<leader>c', group = '[C]ode' },
            { '<leader>d', group = '[D]ocument' },
            { '<leader>r', group = '[R]ename' },
            { '<leader>s', group = '[S]earch' },
            { '<leader>w', group = '[W]orkspace' },
            { '<leader>t', group = '[T]oggle' },
            { '<leader>h', group = 'Git [H]unk' },
            { '<leader>h', desc = 'Git [H]unk', mode = 'v' },
        }
    end,
}

return {
  {
    'folke/which-key.nvim',
    opts = {},
    config = function ()
      require('which-key').add {
        { '<leader>c', name = '[C]ode'},
        { '<leader>d', name = '[D]ocument'},
        { '<leader>g', name = '[G]it'},
        { '<leader>H', name = 'Git [H]unk'},
        { '<leader>r', name = '[R]ename'},
        { '<leader>s', name = '[S]earch'},
        { '<leader>t', name = '[T]ree'},
        { '<leader>w', name = '[W]orkspace'},
      }
      -- register which-key VISUAL mode
      -- required for visual <leader>hs (hunk stage) to work
      require('which-key').add {
        mode = 'v',
        { '<leader>', name = 'VISUAL <leader>' },
        { '<leader>H', 'Git [H]unk' },
      }
    end
  },
}

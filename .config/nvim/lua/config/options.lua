-- no deprecation warnings
vim.g.deprecation_warnings = false

-- big file size
vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB

local opt = vim.opt

-- no highlight search
opt.hlsearch = false

-- mouse mode
opt.mouse = 'a'

-- line numbers
opt.relativenumber = true
opt.number = true

-- indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
opt.smartindent = true

-- line options
opt.wrap = true
opt.cursorline = false
opt.smoothscroll = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- save undo history
opt.undofile = true

-- decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- appearance
opt.termguicolors = true

-- backspace
opt.backspace = "indent,eol,start"

-- sign column
opt.signcolumn = 'yes'

-- complete options
opt.completeopt = 'menuone,noselect'

-- clipboard
-- opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.clipboard = "unnamedplus"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- keyword characters
opt.iskeyword:append("-")

-- hide markup characters
opt.conceallevel = 2


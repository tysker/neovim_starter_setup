local opt = vim.opt
local wo = vim.wo -- only for window-local options
local bo = vim.bo -- only for buffer-local options

-------------------------------------------------------------------
-- Basic UI settings
-------------------------------------------------------------------
wo.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers for easier movement
opt.cursorline = true -- Highlight the current line
-- guicursor is a setting that describes cursor style per Vim mode
opt.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50'

wo.signcolumn = 'yes' -- Always show the sign column (LSP, git, errors)
opt.numberwidth = 4 -- Width of the number column

opt.wrap = false -- Do not wrap long lines
opt.linebreak = true -- If wrap is on, don’t split words (safe default)

opt.mouse = 'a' -- Enable mouse support everywhere
opt.termguicolors = true -- Enable true colors

opt.cmdheight = 1 -- Height of the command line at the bottom

-------------------------------------------------------------------
-- Clipboard
-------------------------------------------------------------------
opt.clipboard = 'unnamedplus' -- Use the system clipboard for all yanks/pastes
-------------------------------------------------------------------
-- Search behavior
-------------------------------------------------------------------
opt.ignorecase = true -- Search is case-insensiteve...
opt.smartcase = true -- ...unless the search has capital letters
opt.hlsearch = false -- Don’t highlight matches after searching

-------------------------------------------------------------------
-- Tabs, spaces, indentation
-------------------------------------------------------------------
opt.expandtab = true -- Convert tabs to spaces
opt.shiftwidth = 4 -- Number of spaces for each indentation level
opt.tabstop = 4 -- How many spaces a <Tab> counts for
opt.softtabstop = 4 -- Editing operations treat tabs as this many spaces

opt.autoindent = true -- Copy indent from previous line
opt.smartindent = true -- Smarter automatic indentation
opt.breakindent = true -- Preserve indentation on wrapped lines

-------------------------------------------------------------------
-- Window splits
-------------------------------------------------------------------
opt.splitbelow = true -- New horizontal splits open below
opt.splitright = true -- New vertical splits open to the right

-------------------------------------------------------------------
-- Scrolling
-------------------------------------------------------------------
opt.scrolloff = 4 -- Keep at least 4 lines above/below cursor
opt.sidescrolloff = 8 -- Same but for horizontal scrolling

-------------------------------------------------------------------
-- Performance
-------------------------------------------------------------------
opt.updatetime = 250 -- Faster updates (default is too slow)
opt.timeoutlen = 300 -- Faster key sequence timeout

-------------------------------------------------------------------
-- Files, backups, undo
-------------------------------------------------------------------
opt.swapfile = false -- Don’t create swap files
opt.backup = false -- Don’t keep unnecessary backup files
opt.writebackup = false -- Don’t block editing of open files
opt.undofile = true -- Persistent undo (super useful)
opt.fileencoding = 'utf-8' -- Save files using UTF-8

-------------------------------------------------------------------
-- Completion menu
-------------------------------------------------------------------
opt.completeopt = { 'menuone', 'noselect', 'noinsert' } -- Better completion menu behavior
opt.pumheight = 10 -- Max items in completion popup

-------------------------------------------------------------------
-- Formatting / text behavior
-------------------------------------------------------------------
opt.conceallevel = 0 -- Show characters normally in markdown
opt.backspace = 'indent,eol,start' -- Make backspace behave naturally

opt.shortmess:append 'c' -- Don't show completion menu messages
opt.iskeyword:append '-' -- Let searches treat "foo-bar" as one word

opt.formatoptions:remove { 'c', 'r', 'o' }
-- Removes auto-comment insertion when pressing Enter or 'o'

-------------------------------------------------------------------
-- Cleanup (safe)
-------------------------------------------------------------------
opt.runtimepath:remove '/usr/share/vim/vimfiles'
-- Only needed if you have Vim installed. Safe to keep/remove.

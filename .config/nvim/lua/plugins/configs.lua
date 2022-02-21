local exec  = vim.api.nvim_exec -- execute Vimscript
local set   = vim.opt           -- global options
local cmd   = vim.cmd           -- execute Vim commands
-- local fn    = vim.fn            -- call Vim functions
-- local g     = vim.g             -- global variables
-- local b     = vim.bo            -- buffer-scoped options
-- local w     = vim.wo            -- windows-scoped options

-- set leader
vim.mapleader = " "

vim.api.nvim_set_keymap( 'n', 'sf', ':NvimTreeToggle<CR>', {noremap = true}) -- toggle nerd tree with space + e
-- vim controls
vim.api.nvim_set_keymap('n', 'ss', ':split<CR>', {noremap = true}) -- split vertically
vim.api.nvim_set_keymap('n', 'sv', ':vsplit<CR>', {noremap = true}) -- split horizontally

vim.api.nvim_set_keymap('n', 'sh', '<c-w>h', {noremap = true}) -- move to window left
vim.api.nvim_set_keymap('n', 'sk', '<c-w>k', {noremap = true}) -- move to window up
vim.api.nvim_set_keymap('n', 'sj', '<c-w>j', {noremap = true}) -- move to window down
vim.api.nvim_set_keymap('n', 'sl', '<c-w>l', {noremap = true}) -- move to window right

vim.api.nvim_set_keymap('n', '<Tab>', ':tabnext<CR>', {noremap = true}) -- switch to next tab
vim.api.nvim_set_keymap('n', '<S-Tab>', ':tabprev<CR>', {noremap = true}) -- switch to previous tab

vim.api.nvim_set_keymap('n', 'te<Return>', ':tabnew<CR>', {noremap = true}) -- open new tab
-- Go configuration --
-- let g:go_list_type = "quickfix"
vim.g.go_list_type = 'quickfix'
vim.g.go_fmt_command = "goimports"
vim.go_textobj_include_function_doc = 1
vim.g.go_highlight_types = 1
vim.g.go_metalinter_enabled = [['vet', 'golint', 'errcheck']]
vim.g.go_metalinter_autosave = 1
vim.g.go_auto_sameids = 1

-- other
cmd('autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=grey') --to Show whitespace, MUST be inserted BEFORE the colorscheme command
vim.cmd[[colorscheme dracula]]
-- cmd('colorscheme rvcs')
set.guifont		      = 'FiraCode Nerd Font Mono'
set.termguicolors   = true      -- Enable GUI colors for the terminal to get truecolor
set.list            = false      -- show whitespace
set.listchars = {
         nbsp       = '⦸',      -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
         extends    = '»',      -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
         precedes   = '«',      -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
         tab        = '▷─',     -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
         trail      = '•',      -- BULLET (U+2022, UTF-8: E2 80 A2)
         space      = ' ',
}
set.fillchars = {
        diff        = '∙',      -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
        eob         = ' ',      -- NO-BREAK SPACE (U+00A0, UTF-8: C2 A0) to suppress ~ at EndOfBuffer
        fold        = '·',      -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
        vert        = ' ',      -- remove ugly vertical lines on window division
}
set.clipboard       = set.clipboard + "unnamedplus" --copy & paste
set.wrap            = false         -- don't automatically wrap on load
set.showmatch       = true 	        -- show the matching part of the pair for [] {} and ()
set.cursorline      = true 	        -- highlight current line
set.number          = true          -- show line numbers
set.relativenumber  = true	        -- show relative line number
set.incsearch       = true 	        -- incremental search
set.hlsearch        = true 	        -- highlighted search results
set.ignorecase      = true 	        -- ignore case sensetive while searching
set.smartcase       = true
set.scrolloff       = 1             -- when scrolling, keep cursor 1 lines away from screen border
set.sidescrolloff   = 2             -- keep 30 columns visible left and right of the cursor at all times
set.backspace       = 'indent,start,eol' -- make backspace behave like normal again
--set.mouse = "a"  		-- turn on mouse interaction
set.updatetime      = 500              -- CursorHold interval
set.softtabstop     = 2
set.shiftwidth      = 2             -- spaces per tab (when shifting), when using the >> or << commands, shift lines by 4 spaces
set.tabstop         = 2             -- spaces per tab
set.smarttab        = true          -- <tab>/<BS> indent/dedent in leading whitespace
set.autoindent      = true          -- maintain indent of current line
set.expandtab       = false         -- don't expand tabs into spaces
set.shiftround      = true
set.splitbelow      = true      -- open horizontal splits below current window
set.splitright      = true      -- open vertical splits to the right of the current window
set.laststatus      = 2         -- always show status line
--set.colorcolumn = "79"        -- vertical word limit line


set.hidden          = true      -- allows you to hide buffers with unsaved changes without being prompted
set.inccommand      = 'split'   -- live preview of :s results
set.shell           = 'fish'     -- shell to use for `!`, `:!`, `system()` etc.
-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500, on_visual=true}
  augroup end
]], false)

-- jump to the last position when reopening a file
cmd([[
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
]])

-- patterns to ignore during file-navigation
set.wildignore  = set.wildignore + '*.o,*.rej,*.so'
-- remove whitespace on save
cmd([[au BufWritePre * :%s/\s\+$//e]])
-- faster scrolling
set.lazyredraw = true
-- don't auto commenting new lines
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])
-- completion options
set.completeopt = 'menuone,noselect,noinsert'


-- 2 spaces for selected filetypes
cmd([[ autocmd FileType xml,html,xhtml,css,scssjavascript,lua,dart,go,yml setlocal shiftwidth=2 tabstop=2 ]])
-- json
cmd([[ au BufEnter *.json set ai expandtab shiftwidth=2 tabstop=2 sta fo=croql ]])

-- airline
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#buffer_nr_show'] = 1

-- airline theme
vim.g.airline_theme='base16_dracula'

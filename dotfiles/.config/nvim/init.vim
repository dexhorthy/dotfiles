" Set leader key to comma - more ergonomic than default
let mapleader =","

" Auto-install vim-plug if not present
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Template system - jump to next placeholder with ,, (DISABLED FOR LAG TESTING)
" map ,, :keepp /<++><CR>ca<
" imap ,, <esc>:keepp /<++><CR>ca<

" Plugin management
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'supermaven-inc/supermaven-nvim'
Plug 'junegunn/goyo.vim'
call plug#end()

" Essential settings
set title                    " Set window title
set mouse=a                  " Enable mouse support
set clipboard+=unnamedplus   " Use system clipboard
set encoding=utf-8           " UTF-8 encoding
set number                   " Static line numbers

" Clean interface
set noshowmode              " Don't show mode (airline handles this)
set noruler                 " Don't show ruler
set laststatus=2            " Always show status line
set noshowcmd               " Don't show commands

" Basic vim improvements
filetype plugin on          " Enable filetype plugins
syntax on                   " Enable syntax highlighting
set nohlsearch              " Don't highlight search results persistently

" Better splits - open below and right
set splitbelow splitright

" Split navigation shortcuts - save a keypress
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" NERDTree modern sleek configuration
map <leader>n :NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowLineNumbers = 0
let NERDTreeWinSize = 35
let NERDTreeIgnore = ['\.DS_Store$', '\.git$', 'node_modules$', '\.pyc$']
let NERDTreeStatusline = ""
let NERDTreeHighlightCursorline = 1

" NERDTree colors for Catppuccin theme
hi NERDTreeDir guifg=#89b4fa
hi NERDTreeDirSlash guifg=#585b70
hi NERDTreeFile guifg=#cdd6f4
hi NERDTreeExecFile guifg=#a6e3a1
hi NERDTreeOpenable guifg=#fab387
hi NERDTreeClosable guifg=#f38ba8

" Enable autocompletion
set wildmode=longest,list,full

" Text editing improvements
nnoremap c "_c
vnoremap . :normal .<CR>            " Perform dot commands over visual blocks
nnoremap S :%s//g<Left><Left>
map Q gq                            " Replace ex mode with gq

" Disable automatic commenting on newline (DISABLED FOR LAG TESTING)
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Template abbreviations - type and hit space/enter to expand (DISABLED FOR LAG TESTING)
" iabbrev iff if (<++>) { <++> } else { <++> }
" iabbrev forr for (let i = 0; i < <++>; i++) { <++> }
" iabbrev tryy try { <++> } catch (<++>) { <++> }
" iabbrev funcc function <++>(<++>) { <++> }
" iabbrev logg console.log(<++>);

" Indentation settings - spaces by default, tabs for Go
set expandtab                " Use spaces instead of tabs
set tabstop=4                " Tab width
set shiftwidth=2             " Indent width
set softtabstop=2            " Backspace deletes indent

" File type specific indentation (DISABLED FOR LAG TESTING)
" autocmd FileType javascript,typescript,json,html,css,vue setlocal shiftwidth=2 softtabstop=2
" autocmd FileType python setlocal shiftwidth=4 softtabstop=4
" autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
" autocmd FileType yaml,yml setlocal shiftwidth=2 softtabstop=2

" Disable airline completely - use built-in statusline
let g:loaded_airline = 1

" Simple clean statusline
set statusline=%f\ %m%r%h%w%=%y\ %l:%c\ %p%%

" Catppuccin-inspired statusline colors - light blues and violets
hi StatusLine ctermbg=6 ctermfg=0 guibg=#89b4fa guifg=#1e1e2e
hi StatusLineNC ctermbg=5 ctermfg=15 guibg=#cba6f7 guifg=#313244

" Additional Catppuccin colors for editor
hi Normal guibg=#1e1e2e guifg=#cdd6f4
hi LineNr guibg=#1e1e2e guifg=#585b70
hi CursorLine guibg=#313244
hi Visual guibg=#585b70
hi Search guibg=#f9e2af guifg=#1e1e2e
hi IncSearch guibg=#fab387 guifg=#1e1e2e

" Supermaven AI completion setup
lua << EOF
if not vim.g.supermaven_loaded then
  require("supermaven-nvim").setup({})
  vim.g.supermaven_loaded = true
end
EOF

" Spell checking toggle - 'o' for 'orthography'
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Goyo distraction-free writing mode
map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" Save file as sudo when needed
cabbrev w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Auto-cleanup on save - removes trailing whitespace and extra newlines
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" Function for toggling UI elements
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>

" Quick config reload
nnoremap <leader>R :source ~/.config/nvim/init.vim<CR>:echo "Config reloaded!"<CR>

" Execute selected text in floating terminal
vnoremap <leader>x :call ExecuteSelection()<CR>
nnoremap <leader>x :call ExecuteCurrentLine()<CR>

function! ExecuteSelection()
    let selected = GetVisualSelection()
    call OpenFloatingTerminal(selected)
endfunction

function! ExecuteCurrentLine()
    let current_line = getline('.')
    call OpenFloatingTerminal(current_line)
endfunction

function! GetVisualSelection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

function! OpenFloatingTerminal(command)
    let buf = nvim_create_buf(v:false, v:true)
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.6)
    let col = float2nr((&columns - width) / 2)
    let row = float2nr((&lines - height) / 2)
    
    let opts = {
        \ 'relative': 'editor',
        \ 'width': width,
        \ 'height': height,
        \ 'col': col,
        \ 'row': row,
        \ 'style': 'minimal',
        \ 'border': 'rounded'
        \ }
    
    let win = nvim_open_win(buf, v:true, opts)
    
    " Execute command and capture output
    let output = system('nu -c ' . shellescape(a:command))
    let lines = split(output, '\n')
    
    " Add command header and output
    let first_line = split(a:command, '\n')[0]
    call nvim_buf_set_lines(buf, 0, -1, v:false, ['> ' . first_line, ''] + lines)
    
    " Set buffer options for easy navigation
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal noswapfile
    setlocal readonly
    setlocal filetype=nushell
    
endfunction
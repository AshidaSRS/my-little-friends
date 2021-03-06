"Numbered lines"
set number

"Update the window bar"
set title

"Highlight searc hits and make the search case insensitive"
set hlsearch ignorecase

"Turn on syntax highlighting"
syntax on

"Replace TABs with spaces and use 2 spaces for one level of indentation"
set expandtab
set tabstop=2
set shiftwidth=2

"Highlight trailing white space"
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

"Strip trailing white space on save"
function! TrimWhiteSpace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction
autocmd BufWritePre *.* :call TrimWhiteSpace()

"Spelling"
"  set spell
"  set spelllang=en

"Text wrapping"
set formatoptions=t
set textwidth=72

"fancy vim status line"
set laststatus=2
set t_Co=256

"This is to get vim-airline working"
set laststatus=2

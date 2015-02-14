"" vimrc
syntax on
set nowrap
set nobackup
set number
set list
set listchars=tab:>-,trail:-,
hi SpecialKey guibg=NONE guifg=DarkGreen

" matchit.vim
source $VIMRUNTIME/macros/matchit.vim
let b:match_words = 'if:endif,(:),[:],{:}'

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=/Users/naoya.yamaguchi/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/naoya.yamaguchi/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" NeoBundle 'Shougo/neosnippet.vim'
" NeoBundle 'Shougo/neosnippet-snippets'
" NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'python_match.vim'
NeoBundle 'glidenote/memolist.vim'
" NeoBundleLazy 'klen/python-mode'
" autocmd FileType python,htmldjango NeoBundleSource python-mode
NeoBundleLazy 'kevinw/pyflakes-vim.git'
autocmd FileType python,htmldjango NeoBundleSource pyflakes-vim
" NeoBundleLazy 'hdima/python-syntax'
" autocmd FileType python,htmldjango NeoBundleSource python-syntax
"
NeoBundleLazy 'kana/vim-textobj-user'
autocmd FileType htmldjango NeoBundleSource vim-textobj-user
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'mjbrownie/django-template-textobjects'
NeoBundleLazy 'mjbrownie/django-template-textobjects'

NeoBundle 'alfredodeza/khuno.vim'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

call neobundle#end()

filetype plugin indent on
filetype plugin indent on

NeoBundleCheck


"=================================================================
"                           unite
"=================================================================
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>

"" Unite Bookmark
"bookmarkだけホームディレクトリに保存
let g:unite_source_bookmark_directory = $HOME . '/.unite/bookmark'

"  unite-grep
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200
vnoremap /g y:Unite grep::-iHRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>

" unite-grepのキーマップ
" 選択した文字列をunite-grep
" https://github.com/shingokatsushima/dotfiles/blob/master/.vimrc
vnoremap /g y:Unite grep::-iHRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>
" }}}


"=================================================================
"                           VimFiler
"=================================================================
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
" Edit file by tabedit.
let g:vimfiler_edit_action = 'edit'
" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
nmap <F2>  :VimFiler -split -horizontal -project -toggle -quit<CR>
autocmd FileType vimfiler nnoremap <buffer><silent>/  :<C-u>Unite file -default-action=vimfiler<CR>
autocmd FileType vimfiler nnoremap <silent><buffer> e :call <SID>vimfiler_tree_edit('open')<CR>


"=================================================================
"                           python
"=================================================================
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python let g:pydiction_location = '~/.vim/pydiction/complete-dict'
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
" let g:syntastic_check_on_open=1
" let g:syntastic_python_checker="flake8"
" "autocmd BufWritePost *.py call Flake8()

"" "" python-mode
"" let g:pymode_lint= 1
"" let g:pymode_lint_on_write = 0
"" let g:pymode_folding= 0
"" let g:pymode_lint_on_fly= 1
"" "Values may be chosen from: `pylint`, `pep8`, `mccabe`, `pep257`, `pyflakes`.
"" let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
"" 
"" let g:pymode_syntax = 1
"" let g:pymode_syntax_slow_sync = 1
"" let g:pymode_syntax_all = 1
"" let g:pymode_syntax_highlight_self = g:pymode_syntax_all
"" let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"" let g:pymode_syntax_space_errors = g:pymode_syntax_all


"=================================================================
"                       memolist.vim
"=================================================================
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>

let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_memo_date = "epoch"
let g:memolist_memo_date = "%D %T"
let g:memolist_vimfiler = 1

"=================================================================
"                       other
"=================================================================
set tags=TAGS;~
nmap <C-]> g<C-]>
filetype on

"" vim <--> mac 間のクリップボードコピー
set clipboard=unnamed
set clipboard=autoselect

" Ctrl-hでヘルプ
nnoremap <C-h>  :<C-u>help<Space>

" " カーソル下のキーワードをヘルプでひく
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>

"" .un~ ファイル作成しない
set noundofile

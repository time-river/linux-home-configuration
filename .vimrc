set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'
Plugin 'preservim/tagbar'
"Plugin 'Yggdroot/LeaderF'
"Plugin 'ronakg/quickr-cscope.vim'
Plugin 'vim-scripts/LargeFile'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/gutentags_plus'

Plugin 'vivien/vim-linux-coding-style'

call vundle#end()            " required
filetype plugin indent on    " required

"======编码设置======"
set termencoding=utf-8       "tenc是用于告知VIM说终端是使用何种文本编码方式来作文本输入和显示，默认enc
set encoding=utf-8           "enc是VIM的内部编码表示方式，默认为local
set fileencoding =utf-8      "fenc设置为当前缓冲区内的文件的文本编码
set fileencodings=utf-8,ucs-bom,gb18030,big5,gbk,,cp936,gb2312,shift-jis    "简写为fencs，fencs是vim确定fenc的值的来源之一

"======制表符策略======"
set expandtab                "用空格代替制表符 noexpantab不用空格代替
set smarttab                 "在行首按TAB使用shiftwidth个空格，否则加入tabstop个空格
set tabstop=4            "Tab键的宽度
set softtabstop=4        "统一缩进为4
set shiftwidth=4         "使用每层缩进的空格数

"======语言设置======"
set helplang=cn,en           "使用中文帮助,英文次之 
"language name               "当前的语言设置称name
language messages C          "消息语言
"language ctype name         "字符编码的语言
language time C              "时间和日期消息的语言

"======filetype设置======"
filetype on                  "侦测文件类型
filetype plugin on           "为特定的文件类型允许插件文件的载入
filetype indent on     "为特定的文件类型载入缩进文件

set backspace=indent,eol,start "https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode

syntax on

let mapleader = '\'

"https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
noremap <F2> :NERDTreeToggle<CR>
noremap <F8> :TagbarToggle<CR>

" 窗口切换
noremap <C-Left> <C-w>h
noremap <C-Right> <C-w>l
noremap <C-Up> <C-w>k
noremap <C-Down> <C-w>j

" Linux coding style
nnoremap <silent> <leader>l :LinuxCodingStyle<cr>

" GTAGS设置
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/etc/gtags.conf'

" gutentags / gutentags_plus
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project'] " 工程目录标志
let g:gutentags_ctags_tagfile = '.tags' "所生成的数据文件名称
let g:gutentags_modules = ['ctags', 'gtags_cscope'] " 使用ctags / gtags_cscope
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags " tags文件放置目录
let g:gutentags_plus_switch = 0 " change focus to quickfix window after search (optional)

" 配置ctags参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif

nnoremap <C-]> <C-w>]

" airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

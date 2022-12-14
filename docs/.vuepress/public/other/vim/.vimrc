" set foldmethod=marker
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => basic {{{
let mapleader = ","
colorscheme desert
" 允许加载文件类型插件
filetype plugin on
filetype indent on
" 外部程序更改时自动读取
set autoread
au FocusGained,BufEnter * checktime
" ------
let $PWD=getcwd() " 增加变量为 vim 的当前目录
set scrolloff=3 " 设置屏幕滚动时始终显示的行数
set ruler " 启用标尺，显示光标位置
set hidden " 切换缓冲区但未保存时不提示
set wrapscan " 搜索到最后时回到顶部搜索
set ignorecase smartcase " 搜索词全小写不区分大小写，有大写字母时区分
set clipboard=unnamed,unnamedplus " 可直接粘贴外部程序的文本
set hlsearch " 搜索高亮
set incsearch " 递增的突出所有模式匹配
set relativenumber number " 设置行号
set nrformats+=alpha " 可递增字母（CTRL-A/CTRL-X）
set lazyredraw " 不要在执行宏时重画，良好的性能
set magic " 对于正则，打开 magic
set showmatch " 显示匹配的括号
set foldcolumn=1 " 折叠时加一点空白
set expandtab " 使用空格而不是制表符
set smarttab " 聪明的使用标签
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置不同模式下的光标颜色 {{{
if &term =~ "xterm"
    " INSERT mode
    let &t_SI = "\<Esc>[6 q" . "\<Esc>]12;green\x7"
    " REPLACE mode
    let &t_SR = "\<Esc>[3 q" . "\<Esc>]12;green\x7"
    " NORMAL mode
    let &t_EI = "\<Esc>[2 q" . "\<Esc>]12;green\x7"
endif
" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => map {{{
nnoremap H ^
nnoremap L $
" 两下 <esc> 取消搜索高亮
nnoremap <esc><esc> :noh<return><esc>
" 删除时记录断点方便 u 恢复
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
" 窗口移动直接 Ctrl-hjkl
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" Close all the buffers
map <leader>ba :bufdo bd<cr>
" 自动保存折叠信息
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plug {{{
call plug#begin('~/.vim/plugged')
    " 搜索
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'Leiyi548/vim-im-select' " 输入法切换
    Plug 'preservim/nerdtree' " 目录浏览
    " 工具栏
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()
" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plug.setting {{{
" fzf search
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>h :History<CR>
" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

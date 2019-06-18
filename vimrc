call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-scripts/a.vim'
Plug 'yggdroot/indentline'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'qw8880000/DoxygenToolkit.vim'
Plug 'qw8880000/c.vim'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/vim-easy-align'
Plug '/home/wangweiqiong/.fzf/bin/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'Shougo/neocomplcache.vim'
Plug 'Shougo/context_filetype.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/grep.vim'
Plug 'terryma/vim-expand-region'
Plug 'mbriggs/mark.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'scrooloose/syntastic'
Plug 'chun-yang/auto-pairs'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-scripts/cSyntaxAfter'
Plug 'bubujka/emmet-vim'
Plug 'wesleyche/srcexpl'
Plug 'anyakichi/vim-surround'
Plug 'vim-scripts/ZoomWin'
Plug 'justinmk/vim-sneak'
"Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'
Plug 'terryma/vim-expand-region'
Plug 'vim-python/python-syntax', { 'for': ['python']  }
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh'  }
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'
Plug 'skywind3000/asyncrun.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'qw8880000/neosnippet-snippets'
"Plug 'Lokaltog/vim-powerline'
"Plug 'Shougo/neosnippet.vim'
"Plug 'itchyny/lightline.vim'
"Plug 'msanders/snipmate.vim'
"Plug 'vim-scripts/ShowMarks'
"Plug 'vim-scripts/Align'
"Plug 'vim-scripts/OmniCppComplete'
"Plug 'kien/ctrlp.vim'
"Plug 'vimsmoothscroll/vim-smooth-scroll'
"Plug 'Shougo/echodoc.vim'
Plug 'Valloric/YouCompleteMe', {'do':'./install.py --clang-completer'}
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
""Plug 'vim-scripts/gtags.vim'
"Plug 'justinmk/vim-dirvish'
"Plug 'rking/ag.vim'
"Plug 'qw8880000/ccvext.vim'

call plug#end()


set hlsearch        "高亮搜索
set incsearch       "在输入要搜索的文字时，实时匹配

if has("autocmd")
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("syntax")
	syntax on
endif

set mouse=a                    " 在任何模式下启用鼠标
set t_Co=256                   " 在终端启用256色
"set backspace=2                " 设置退格键可用
set nocompatible                                      "禁用 Vi 兼容模式
filetype off                                          "禁用文件类型侦测


" 必须 加载vim自带和插件相应的语法和文件类型相关脚本
filetype plugin indent on    
" 注：使用utf-8格式后，软件与程序源码、文件路径不能有中文，否则报错
set encoding=utf-8                                    "设置gvim内部编码，默认不更改
set fileencoding=utf-8                                "设置当前文件编码，可以更改，如：gbk（同cp936）
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1     "设置支持打开的文件的编码


" 文件格式，默认 ffs=dos,unix
set fileformat=unix                                   "设置新（当前）文件的<EOL>格式，可以更改，如：dos（windows系统常用）
set fileformats=unix,dos,mac                          "给出文件的<EOL>格式类型
" -----------------------------------------------------------------------------
"  < 编写文件时的配置 >
" -----------------------------------------------------------------------------
filetype on                                           "启用文件类型侦测
filetype plugin on                                    "针对不同的文件类型加载对应的插件
filetype plugin indent on                             "启用缩进
set smartindent                                       "启用智能对齐方式
set pastetoggle=<F9>
set expandtab                                         "将Tab键转换为空格
"set paste
set timeoutlen=1000 ttimeoutlen=0                      "esc 太慢问题
set tabstop=4                                         "设置Tab键的宽度，可以更改，如：宽度为2
set shiftwidth=4                                      "换行时自动缩进宽度，可更改（宽度同tabstop）
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度
set foldenable                                        "启用折叠
"set foldmethod=indent                                 "indent 折叠方式
set foldmethod=marker                                "marker 折叠方式
set t_ti= t_te=               "退出vim后，内容显示在终端屏幕 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制好处：误删什么的，如果以前屏幕打开，可以找回
set ruler           "显示标尺  
set showcmd         "输入的命令显示出来，看的清楚些 
set backspace=eol,start,indent   "Configure backspace so it acts as it should act
"set backspace=2

" 选中模式 Ctrl+c 复制选中的文本
"vnoremap <c-c> "+y
" 普通模式下 Ctrl+c 复制文件路径
"nnoremap <c-c> :let @+ = expand('%:p')<cr>
set clipboard=unnamed

" 窗口大小调整
"nnoremap + :resize +1<cr>
"nnoremap _ :resize -1<cr>
"nnoremap > :vertical resize +1<cr>
"nnoremap < :vertical resize -1<cr>


" Shift + Insert 插入系统剪切板中的内容
"noremap <S-Insert> "+p
"vnoremap <S-Insert> d"+P
"inoremap <S-Insert> <esc>"+pa
"inoremap <C-S-Insert> <esc>pa 

" 常规模式下用空格键来开关光标行所在折叠（注：zR 展开所有折叠，zM 关闭所有折叠）
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 当文件在外部被修改，自动更新该文件
set autoread

" 常规模式下输入 cS 清除行尾空格
nmap cS :%s/\s\+$//g<CR>:noh<CR>

" 常规模式下输入 cM 清除行尾 ^M 符号
nmap cM :%s/\r$//g<CR>:noh<CR>

set ignorecase                                        "搜索模式里忽略大小写
set smartcase                                         "如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用
" set noincsearch                                       "在输入要搜索的文字时，取消实时匹配

" Ctrl + K 插入模式下光标向上移动
imap <c-k> <Up>

" Ctrl + J 插入模式下光标向下移动
imap <c-j> <Down>

" Ctrl + H 插入模式下光标向左移动
imap <c-h> <Left>

" Ctrl + L 插入模式下光标向右移动
imap <c-l> <Right>

" 启用每行超过80列的字符提示（字体变蓝并加下划线），不启用就注释掉
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

" -----------------------------------------------------------------------------
"  < 界面配置 >
" -----------------------------------------------------------------------------
"set rnu                                            "显示行号
set nu
set laststatus=2                                      "启用状态栏信息
set cmdheight=2                                       "设置命令行的高度为2，默认为1
set cursorline                                        "突出显示当前行
set guifont=YaHei_Consolas_Hybrid:h12                 "设置字体:字号（字体名称空格用下划线代替）
set nowrap                                            "设置不自动换行
set shortmess=atI                                     "去掉欢迎界面

set writebackup                             "保存文件前建立备份，保存成功后删除该备份
set nobackup                                "设置无备份文件
" set noswapfile                              "设置无临时文件
" set vb t_vb=                                "关闭提示音

" 自动切换目录为当前编辑文件所在目录
au BufRead,BufNewFile,BufEnter * cd %:p:h



"DoxygenToolkit
"光标在函数上，用 :Dox 自动生成函数的说明。
"光标在文件头，用 :DoxAthor 自动生成文件说明
"光标在函数上，用 :Dox 自动生成函数的说明。
"
"光标在文件头，用 :DoxAthor 自动生成文件说明

" =============================================================================
"                          << 以下为常用插件配置 >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < a.vim 插件配置 >
" -----------------------------------------------------------------------------
" 用于切换C/C++头文件
" :A     ---切换头文件并独占整个窗口
" :AV    ---切换头文件并垂直分割窗口
" :AS    ---切换头文件并水平分割窗口
nnoremap <silent> <F12> :A<CR>
" -----------------------------------------------------------------------------
"  < ctags 工具配置 >
" -----------------------------------------------------------------------------
" 对浏览代码非常的方便,可以在函数,变量之间跳转等
set tags=./.tags;,.tags

" -----------------------------------------------------------------------------
"vim-gutentags 插件配置 >
" -----------------------------------------------------------------------------
"<leader>cg - 查看光标下符号的定义
"<leader>cs - 查看光标下符号的引用
"<leader>cc - 查看有哪些函数调用了该函数
"<leader>cf- 查找光标下的文件
"<leader>ci- 查找哪些文件 include 了本文件 
"查找到索引后跳到弹出的 quikfix 窗口，停留在想查看索引行上，
"按 小P直接打开预览窗口，大P关闭预览，\d 和 \u 向上向下滚动预览窗口。
"自动载入ctags gtags
"if version >= 800
"    Plug 'ludovicchabant/vim-gutentags'
"    Plug 'skywind3000/gutentags_plus'

	"set cscopetag " 使用 cscope 作为 tags 命令
	set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope
	
	"gtags.vim 设置项
	"let GtagsCscope_Auto_Load = 1
	"let CtagsCscope_Auto_Map = 1
	"let GtagsCscope_Quiet = 1
	let g:gutentags_gtags_executable = '/home/wangwq_86/.local/bin/gtags'

    "let $GTAGSLABEL = 'native'
	let $GTAGSLABEL = 'native-pygments'
    let $GTAGSCONF = '/home/wangwq_86/.local/share/gtags/gtags.conf'
	
	
	"let g:gutentags_trace = 1
	"let g:gutentags_define_advanced_commands = 1
"    " gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
    let g:gutentags_project_root = ['.root']

"    " 所生成的数据文件的名称
    let g:gutentags_ctags_tagfile = '.tags'

"    " 同时开启 ctags 和 gtags 支持：
    let g:gutentags_modules = []
    if executable('ctags')
        let g:gutentags_modules += ['ctags']
    endif
    if executable('gtags-cscope') && executable('gtags')
        let g:gutentags_modules += ['gtags_cscope']
    endif

"    " 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
    let g:gutentags_cache_dir = expand('~/.cache/tags')

"    " 配置 ctags 的参数
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"    " 如果使用 universal ctags 需要增加下面一行
"    let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

"    " 禁用 gutentags 自动加载 gtags 数据库的行为
"    " 避免多个项目数据库相互干扰
"    " 使用plus插件解决问题
    let g:gutentags_auto_add_gtags_cscope = 0

"    "预览 quickfix 窗口 ctrl-w z 关闭
"    Plug 'skywind3000/vim-preview'
"    "P 预览 大p关闭
    autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
    autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
    noremap <Leader>u :PreviewScroll -1<cr> " 往上滚动预览窗口
    noremap <leader>d :PreviewScroll +1<cr> "  往下滚动预览窗口
"endif
" shell命令调用函数
function! RunShell(Msg, Shell)
	echo a:Msg . '...'
	call system(a:Shell)
	echon 'done'
endfunction
" 生成GTAGS数据库文件快捷键F8
"nmap <F8> :call RunShell("Generate GTAGS.*", 'find . -name "*.[chsS]" -o -name "*.cpp" -o -name "*.cc" -o -name "*.C", -o -name "*.cxx"> gtags.files && gtags')<cr>



" -----------------------------------------------------------------------------
"LeaderF 插件配置 >
" -----------------------------------------------------------------------------
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<c-b>'
noremap <c-n> :LeaderfMru<cr>
noremap <c-f> :LeaderfFunction!<cr>
"noremap <m-n> :LeaderfBuffer<cr>
noremap <c-g> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.root', '.project',  '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_WildIgnore = {
            \ 'dir': ['.vim','.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.gitignore','*.vim','*.so','*.py[co]']
            \}


" -----------------------------------------------------------------------------
"YouCompleteMe.vim 插件配置 >
" -----------------------------------------------------------------------------
"let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
"let g:ycm_key_invoke_completion = '<c-z>'
"set completeopt=menu,menuone

"noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" -----------------------------------------------------------------------------
"asyncrun.vim 插件配置 >
" -----------------------------------------------------------------------------
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 20

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
"简单的编译单个文件，和 sublime 的默认 build system 差不多，我们定义 F9 为编译单文件:
"nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"这样按 F9 就可以编译当前文件，同时按 F5 运行：
"nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
let g:asyncrun_rootmarks = ['.bp', '.svn', '.git', '.root', '_darcs', 'build.xml']
"nnoremap <silent> <F7> :AsyncRun . J6Set && mm <cr>
"nnoremap <silent> <F7> :AsyncRun -cwd=<root> -raw mm <cr>
nnoremap <silent> mm :AsyncRun -cwd=<root> -raw . J6 && mm -j8 <cr>
" -----------------------------------------------------------------------------
"ag.vim 插件配置 >
" -----------------------------------------------------------------------------
":Ag [options] {pattern} [{directory}]
"You can configure ag.vim to always start searching from your project root instead of the cwd
"let g:ag_working_path_mode="r" 
"You can specify a custom ag name and path in your .vimrc like so:
"let g:ag_prg="<custom-ag-path-goes-here> --vimgrep"

" -----------------------------------------------------------------------------
"vim-sneak 插件配置 >
" -----------------------------------------------------------------------------
"map f <Plug>Sneak_f
"map F <Plug>Sneak_F
"map t <Plug>Sneak_t
"map T <Plug>Sneak_T
let g:sneak#label = 1
"------------------------------------------------------------------
"UltiSnips
""插入模式下直接通过<C-z>键来触发UltiSnips的代码块补全
let g:UltiSnipsExpandTrigger="<C-z>"
"弹出Ulnips的可用列表,由于不常用, 所以这里设置成了特殊的<C-i>映射
"let g:UltiSnipsListSnippets="<C-i>"
""<C-f>跳转的到下一个代码块可编辑区
let g:UltiSnipsJumpForwardTrigger="<C-f>"
"<C-b>跳转到上一个代码块可编辑区
"let g:UltiSnipsJumpBackwardTrigger="<C-b>"
"--------------------- 

" -----------------------------------------------------------------------------
"  < airline 插件配置 >
" -----------------------------------------------------------------------------
"let g:airline#extensions#tabline#left_sep = "\ue0b0"
"let g:airline#extensions#tabline#left_alt_sep = "\ue0b1"

"let g:airline_left_sep = "\ue0b0"
"let g:airline_left_alt_sep = "\ue0b1"
"let g:airline_right_sep = "|"
"let g:airline_right_alt_sep = "|"
"let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled=1 "顶部tab显示"
set ambiwidth=double "防止特殊符号无法正常显示
nmap <tab> :bn<cr> "设置tab键映射"
set langmenu=zh_CN.UTF-8
set encoding=utf-8   
"let g:airline_theme='moloai'  " murmur配色也不错"
" -----------------------------------------------------------------------------
"  < Align 插件配置 >
" -----------------------------------------------------------------------------
" 一个对齐的插件，用来——排版与对齐代码，功能强大，不过用到的机会不多

" -----------------------------------------------------------------------------
"  < auto-pairs 插件配置 >
" -----------------------------------------------------------------------------
" 用于括号与引号自动补全，不过会与函数原型提示插件echofunc冲突
" 所以我就没有加入echofunc插件

" -----------------------------------------------------------------------------
"cppHighlight 配置
" -----------------------------------------------------------------------------
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
"let g:cpp_no_function_highlight = 1



" -----------------------------------------------------------------------------
"  < BufExplorer 插件配置 >
" -----------------------------------------------------------------------------
" 快速轻松的在缓存中切换（相当于另一种多个文件间的切换方式）
" <Leader>be 在当前窗口显示缓存列表并打开选定文件
" <Leader>bs 水平分割窗口显示缓存列表，并在缓存列表窗口中打开选定文件
" <Leader>bv 垂直分割窗口显示缓存列表，并在缓存列表窗口中打开选定文件

" -----------------------------------------------------------------------------
"  < ccvext.vim 插件配置 >
" -----------------------------------------------------------------------------
" 用于对指定文件自动生成tags与cscope文件并连接
" 如果是Windows系统, 则生成的文件在源文件所在盘符根目录的.symbs目录下(如: X:\.symbs\)
" 如果是Linux系统, 则生成的文件在~/.symbs/目录下
" 具体用法可参考www.vim.org中此插件的说明
" <Leader>sy 自动生成tags与cscope文件并连接
" <Leader>sc 连接已存在的tags与cscope文件

" -----------------------------------------------------------------------------
"  < cSyntaxAfter 插件配置 >
" -----------------------------------------------------------------------------
" 高亮括号与运算符等
au! BufRead,BufNewFile,BufEnter *.{c,cpp,h,java,javascript} call CSyntaxAfter()

" -----------------------------------------------------------------------------
"  < ctrlp.vim 插件配置 >
" -----------------------------------------------------------------------------
" 一个全路径模糊文件，缓冲区，最近最多使用，... 检索插件；详细帮助见 :h ctrlp
" 常规模式下输入：Ctrl + p 调用插件

" -----------------------------------------------------------------------------
"  < emmet-vim（前身为Zen coding） 插件配置 >
" -----------------------------------------------------------------------------
" HTML/CSS代码快速编写神器，详细帮助见 :h emmet.txt


" -----------------------------------------------------------------------------
"  < signify 插件配置 >
" -----------------------------------------------------------------------------
let g:signify_vcs_list = [ 'git', 'svn' ]
let g:signify_realtime = 0

" -----------------------------------------------------------------------------
"  < indentLine 插件配置 >
" -----------------------------------------------------------------------------
" 用于显示对齐线，与 indent_guides 在显示方式上不同，根据自己喜好选择了
" 在终端上会有屏幕刷新的问题，这个问题能解决有更好了
" 开启/关闭对齐线
nmap <leader>il :IndentLinesToggle<CR>

" 设置终端对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
let g:indentLine_color_term = 239

" 设置 GUI 对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
" let g:indentLine_color_gui = '#A4E57E'

" -----------------------------------------------------------------------------
"  < vim-javacompleteex（也就是 javacomplete 增强版）插件配置 >
" -----------------------------------------------------------------------------
" java 补全插件

" -----------------------------------------------------------------------------
"  < Mark--Karkat（也就是 Mark） 插件配置 >
"\m 高亮单词
"\n 清除
"\r 根据正则高亮git
"\* 下一个
"\# 上一个
" -----------------------------------------------------------------------------
" 给不同的单词高亮，表明不同的变量时很有用，详细帮助见 :h mark.txt

" " -----------------------------------------------------------------------------
" "  < MiniBufExplorer 插件配置 >
" " -----------------------------------------------------------------------------
" " 快速浏览和操作Buffer
" " 主要用于同时打开多个文件并相与切换

" " let g:miniBufExplMapWindowNavArrows = 1     "用Ctrl加方向键切换到上下左右的窗口中去
let g:miniBufExplMapWindowNavVim = 1        "用<C-k,j,h,l>切换到上下左右的窗口中去
let g:miniBufExplMapCTabSwitchBufs = 1      "功能增强（不过好像只有在Windows中才有用）
" "                                            <C-Tab> 向前循环切换到每个buffer上,并在但前窗口打开
" "                                            <C-S-Tab> 向后循环切换到每个buffer上,并在当前窗口打开

" 在不使用 MiniBufExplorer 插件时也可用<C-k,j,h,l>切换到上下左右的窗口中去
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""
"vim-expand-region 配置
"""""""""""""""""""""""""""""""""""""""""""""""""
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" -----------------------------------------------------------------------------
"  < neocomplcache 插件配置 >
" -----------------------------------------------------------------------------
" 关键字补全、文件路径补全、tag补全等等，各种，非常好用，速度超快。
"let g:neocomplcache_enable_at_startup = 1     "vim 启动时启用插件
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1 "不自动弹出补全列表
" 在弹出补全列表后用 <c-p> 或 <c-n> 进行上下选择效果比较好

" -----------------------------------------------------------------------------
"  < nerdcommenter 插件配置 >
" -----------------------------------------------------------------------------
" 我主要用于C/C++代码注释(其它的也行)
" 以下为插件默认快捷键，其中的说明是以C/C++为例的，其它语言类似
" <Leader>ci 以每行一个 /* */ 注释选中行(选中区域所在行)，再输入则取消注释
" <Leader>cm 以一个 /* */ 注释选中行(选中区域所在行)，再输入则称重复注释
" <Leader>cc 以每行一个 /* */ 注释选中行或区域，再输入则称重复注释
" <Leader>cu 取消选中区域(行)的注释，选中区域(行)内至少有一个 /* */
" <Leader>ca 在/*...*/与//这两种注释方式中切换（其它语言可能不一样了）
" <Leader>cA 行尾注释
let NERDSpaceDelims = 1                     "在左注释符之后，右注释符之前留有空格

" -----------------------------------------------------------------------------
"  < nerdtree 插件配置 >
" -----------------------------------------------------------------------------
" 有目录村结构的文件浏览插件

" 常规模式下输入 F2 调用插件
nmap <F2> :NERDTreeToggle<CR>
" 显示行号
let g:NERDTreeShowLineNumbers=1
" 打开文件后关闭NERDTree窗口
let g:NERDTreeQuitOnOpen=1
" 高亮显示当前行目录或文件
let NERDTreeHightCursorline=1
" 窗口宽度
let g:NERDTreeWinSize=45

" -----------------------------------------------------------------------------
"  < omnicppcomplete 插件配置 >
" -----------------------------------------------------------------------------
" 用于C/C++代码补全，这种补全主要针对命名空间、类、结构、共同体等进行补全，详细
" 说明可以参考帮助或网络教程等
" 使用前先执行如下 ctags 命令（本配置中可以直接使用 ccvext 插件来执行以下命令）
" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
" ctags -R --fields=+iaS --extra=+q    
" 我使用上面的参数生成标签后，对函数使用跳转时会出现多个选择
" 所以我就将--c++-kinds=+p参数给去掉了，如果大侠有什么其它解决方法希望不要保留呀
set completeopt=menu                        "关闭预览窗口
"let OmniCpp_NamespaceSearch = 2     " search namespaces in the current buffer   and in included files
"let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
"let OmniCpp_MayCompleteScope = 1    " 输入 :: 后自动补全
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" -----------------------------------------------------------------------------
"  < powerline 插件配置 >
" -----------------------------------------------------------------------------
" 状态栏插件，更好的状态栏效果

" -----------------------------------------------------------------------------
"  < repeat 插件配置 >
" -----------------------------------------------------------------------------
" 主要用"."命令来重复上次插件使用的命令

" -----------------------------------------------------------------------------
"  < snipMate 插件配置 >
" -----------------------------------------------------------------------------
" 用于各种代码补全，这种补全是一种对代码中的词与代码块的缩写补全，详细用法可以参
" 考使用说明或网络教程等。不过有时候也会与 supertab 插件在补全时产生冲突，如果大
" 侠有什么其它解决方法希望不要保留呀

" -----------------------------------------------------------------------------
"  < SrcExpl 插件配置 >
" -----------------------------------------------------------------------------
" 增强源代码浏览，其功能就像Windows中的"Source Insight"
nmap <F3> :SrcExplToggle<CR>                "打开/闭浏览窗口
" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 
" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 
" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
        \ "_NERD_tree_" 
    \ ] 
" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 
" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" // create/update the tags file 
"let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
" // Set "<F12>" key for updating the tags file artificially 
"let g:SrcExpl_updateTagsKey = "<F12>" 


" // Set "<F10>" key for displaying the previous definition in the jump list 
"let g:SrcExpl_prevDefKey = "<F10>" 


" // Set "<F11>" key for displaying the next definition in the jump list 
"let g:SrcExpl_nextDefKey = "<F11>" 

" -----------------------------------------------------------------------------
"  < insearch 插件配置 >
" -----------------------------------------------------------------------------
"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)

"set hlsearch
"let g:incsearch#auto_nohlsearch = 1
"map n  <Plug>(incsearch-nohl-n)
"map N  <Plug>(incsearch-nohl-N)
"map *  <Plug>(incsearch-nohl-*)
"map #  <Plug>(incsearch-nohl-#)
"map g* <Plug>(incsearch-nohl-g*)
"map g# <Plug>(incsearch-nohl-g#)


" -----------------------------------------------------------------------------
"fzf.vim 插件配置 >
" -----------------------------------------------------------------------------
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

"nnoremap <silent> <Leader>f :Files<CR>
"nnoremap <silent> <Leader>b :Buffers<CR>

" -----------------------------------------------------------------------------
"  < ale 插件配置 >
" -----------------------------------------------------------------------------
" -----------------------------------------------------------------------------
"  < std_c 插件配置 >
" -----------------------------------------------------------------------------
" 用于增强C语法高亮

" 启用 // 注视风格
let c_cpp_comments = 0

"启用F4开启查找
nnoremap <silent> <F4> :Rgrep<CR>

" -----------------------------------------------------------------------------
"  < surround 插件配置 >
" -----------------------------------------------------------------------------
" 快速给单词/句子两边增加符号（包括html标签），缺点是不能用"."来重复命令
" 不过 repeat 插件可以解决这个问题，详细帮助见 :h surround.txt

" -----------------------------------------------------------------------------
"  < Syntastic 插件配置 >
" -----------------------------------------------------------------------------
" 用于保存文件时查检语法

" -----------------------------------------------------------------------------
"  < Tagbar 插件配置 >
" -----------------------------------------------------------------------------

" 常规模式下输入 tb 调用插件，如果有打开 TagList 窗口则先将其关闭
nmap tb :TagbarToggle<CR>

let g:tagbar_width=40                       "设置窗口宽度
let g:tagbar_autofocus=1
" let g:tagbar_left=1                         "在左侧窗口中显示

nmap wm :WMToggle<cr>

" -----------------------------------------------------------------------------
"  < txtbrowser 插件配置 >
" -----------------------------------------------------------------------------
" 用于文本文件生成标签与与语法高亮（调用TagList插件生成标签，如果可以）
au BufRead,BufNewFile *.txt setlocal ft=txt

" -----------------------------------------------------------------------------
"  < ZoomWin 插件配置 >
" -----------------------------------------------------------------------------
" 用于分割窗口的最大化与还原
" 常规模式下按快捷键 <c-w>o 在最大化与还原间切换

" =============================================================================
"                          << 以下为常用工具配置 >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < cscope 工具配置 >
" -----------------------------------------------------------------------------
" 用Cscope自己的话说 - "你可以把它当做是超过频的ctags"
if has("cscope")
    "设定可以使用 quickfix 窗口来查看 cscope 结果
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    "使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳转
    set cscopetag
    "如果你想反向搜索顺序设置为1
    set csto=0
    "在当前目录中添加任何数据库
    if filereadable("cscope.out")
        cs add cscope.out
    "否则添加数据库环境中所指出的
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set cscopeverbose
    "快捷键设置
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

set autochdir
"接着为系统头文件目录生成tags,终端输入：
"ctags -I __THROW --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --fields=+S  -R -


" =========================================================================
"
" .vimrc
"
" =========================================================================
" -------------------------------------------------------------------------
"
" 日本語設定
"
" -------------------------------------------------------------------------

    " vim内部で使用される文字コード
    set encoding=utf-8

    " 文字コードの自動判別
    set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932

    " 改行コードの自動判別
    set fileformats=unix,dos,mac

    " 全角幅に対応させる
    set ambiwidth=double


" -------------------------------------------------------------------------
"
" 表示
"
" -------------------------------------------------------------------------

    " 256色対応
    set t_Co=256
    colorscheme desert256
    syntax on

    " Perlの変数シンタックス
    let perl_no_extended_vars=1

    " Tabの表示文字幅
    set tabstop=2

    " 自動挿入されるTabの表示文字幅
    set shiftwidth=2

    " TabでSpaceを挿入
    set expandtab

    " ステータスを常時表示
    set laststatus=2

    " ステータスに表示する情報
    set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

    " 入力中のコマンドをステータスに表示
    set showcmd

    " Tab、行末の半角スペースを明示的に表示
    set list
    set listchars=tab:>-,trail:_

" -------------------------------------------------------------------------
"
" 編集
"
" -------------------------------------------------------------------------

    " 自動インデント
    set autoindent

    " コメント時のインデントを解除
    autocmd FileType * setlocal formatoptions-=ro


" -------------------------------------------------------------------------
"
" 検索
"
" -------------------------------------------------------------------------

    " インクリメンタルサーチ
    set incsearch

    " 大文字小文字を無視
    set ignorecase

    " 大文字を含めて検索したときは大文字小文字を区別
    set smartcase


" -------------------------------------------------------------------------
"
" 入力補完
"
" -------------------------------------------------------------------------

    inoremap ,date <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR>
    inoremap ,use use strict;<CR>use utf8;<CR>
    inoremap ,bi binmode STDOUT, ":utf8";
    inoremap ,dd use Data::Dumper;<CR>say Dumper
    inoremap ..c .. code-block:: console

    inoremap { {}<LEFT>
    inoremap [ []<LEFT>
    inoremap ( ()<LEFT>
    inoremap " ""<LEFT>
    inoremap ' ''<LEFT>
    vnoremap { "zdi^V{<C-R>z}<ESC>
    vnoremap [ "zdi^V[<C-R>z]<ESC>
    vnoremap ( "zdi^V(<C-R>z)<ESC>
    vnoremap " "zdi^V"<C-R>z^V"<ESC>
    vnoremap ' "zdi'<C-R>z'<ESC>

    iabbrev $$  # =========================================================================
    iabbrev ##! # -------------------------------------------------------------------------
    iabbrev !!  ===========================================================================
    iabbrev @@  ---------------------------------------------------------------------------


" -------------------------------------------------------------------------
"
" ファイルタイプ
"
" -------------------------------------------------------------------------

    autocmd BufNewFile,BufRead *.t    set filetype=perl
    autocmd BufNewFile,BufRead *.psgi set filetype=perl
    autocmd BufNewFile,BufRead *.md   set filetype=markdown


" -------------------------------------------------------------------------
"
" netrw.vim
"
" -------------------------------------------------------------------------

    " 常にツリー表示
    let g:netrw_liststyle = 3


" -------------------------------------------------------------------------
"
" vim-markdown
"
" -------------------------------------------------------------------------

    let g:vim_markdown_folding_disabled=1


" -------------------------------------------------------------------------
"
" vim-indent-guides（インデントのしましま）
"
" -------------------------------------------------------------------------
    let g:indent_guides_auto_colors=0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=234
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=240
    let g:indent_guides_enable_on_vim_startup=1
    let g:indent_guides_guide_size=1"


" -------------------------------------------------------------------------
"
" NeoBundle（プラグイン管理）
"
" -------------------------------------------------------------------------

    if has('vim_starting')
      if &compatible
        set nocompatible
      endif

      set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif

    call neobundle#begin(expand('~/.vim/bundle'))
    NeoBundleFetch 'Shougo/neobundle.vim'

    " Bundles
    NeoBundle 'editorconfig/editorconfig-vim'
    NeoBundle 'othree/html5.vim'
    NeoBundle 'hail2u/vim-css3-syntax'
    NeoBundle 'mattn/emmet-vim'
    NeoBundle 'nathanaelkane/vim-indent-guides'
    NeoBundle 'kchmck/vim-coffee-script'
    NeoBundle 'digitaltoad/vim-jade'
    NeoBundle 'plasticboy/vim-markdown'
    NeoBundle 'kannokanno/previm'
    NeoBundle 'tyru/open-browser.vim'

    call neobundle#end()
    filetype plugin indent on

    NeoBundleCheck

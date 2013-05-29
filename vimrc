" 將 tab 設為4個空白的大小
set tabstop=4
" 搜尋時不要 highlight 搜尋的字串
set nohlsearch
" 使用滑鼠做字串複制時不要自動縮排
set paste
" 在狀態列顯示游標所在處之行列狀態
set ruler
"使用空白取代 tab (如需要 tab 則按 Ctrl-V 再按 tab 鍵即可)
set expandtab
" 開啟語法顏色功能
syntax on
" 開啟 vim 時會回到上次開啟時所在的位置

if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal g'\"" |
        \ endif
endif
" 縮排功能 - 縮排的空隔大小
set shiftwidth=4
" 顯示狀態列
set laststatus=2
" 不要顯示時自動捲行。
set nowrap
set smartindent


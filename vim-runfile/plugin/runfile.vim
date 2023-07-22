if exists('g:loaded_runfile')
    finish
endif
let g:loaded_runfile = 1

autocmd FileType * :call runfile#BufferMapByFileType()

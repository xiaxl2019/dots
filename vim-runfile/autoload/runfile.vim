function runfile#BufferMapByFileType()
    if has_key(g:runfile_rules, &filetype)
        nnoremap <buffer> <F5> :call SaveAndRun(v:false)<CR>
        nnoremap <buffer> <F6> :call SaveAndRun(v:true)<CR>
    endif
endfunction


function SaveAndRun(run_with_arguments)
    let l:rule = get(g:runfile_rules, &filetype)
    if l:rule == ''
        let l:rule = g:runfile_default_rule
    endif

    if a:run_with_arguments
        let l:arguments = input('input argv: ')
        exec l:rule .. ' ' .. l:arguments
    else
        exec l:rule
    endif
endfunction

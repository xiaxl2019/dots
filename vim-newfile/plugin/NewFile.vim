if exists('g:loaded_newfile')
    finish
endif
let g:loaded_newfile = 1

" see :h E500 for help
let s:template_dir = expand("<sfile>:p:h:h") .. "/template"

autocmd BufNewFile * :call NewFile()

function NewFile()
    let l:template_file = s:template_dir .. "/skeleton." .. expand("%:e")

    if (filereadable(l:template_file))
        exec "0r " .. l:template_file

        exec "silent! %s/nameholder/" .. expand("%<:t") .. "/g"
        exec "silent! %s/NAMEHOLDER/" .. toupper(expand("%<:t")) .. "/g"

        normal Gdd
        exec "silent! %s/CURSOR//"
    endif
endfunction

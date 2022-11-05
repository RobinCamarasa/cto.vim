function! s:VimFunctionStruct(name, around)
    execute "normal! $"
    execute "normal ?^\\s*" . a:name . "!*\\s\rv"
    while expand("<cword>") != "endfunction"
        execute "normal %"
    endwhile
    execute "normal! e"
    if a:around == 0
        execute "normal! b?\\S\ro/)\\(\\s*\".*\\)*$\r/\\S\r"
    endif
endfunction

onoremap if :<c-u>call <SID>VimFunctionStruct("function", 0)<cr>
onoremap af :<c-u>call <SID>VimFunctionStruct("function", 1)<cr>

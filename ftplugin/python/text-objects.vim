function! s:PythonInnerStruct(name, around)
    execute "normal! $?\\S\r_"
    let s:nbindents=getcurpos('.')[2] - 2
    execute "normal! ?\\v^\\s{," . s:nbindents . "}" . a:name . "\r_"
    let s:nbindents=getcurpos('.')[2] - 1
    let s:begin = line('.')
    if a:around
        execute "normal! _v"
    else
        execute "normal! /:\\(\\s*#.*\\)*$\rj_v"
    endif
    if s:nbindents > 0
        let s:end = search("\\v^\\s{-," . s:nbindents . "}\\S")
        echom "\\v^\\s{-," . s:nbindents . "}\\S"
    else
        let s:end = search("\\v^\\S")
    endif
    if s:end <= s:begin
        execute "normal! G$"
    else
        execute "normal! ?\\S\r"
    endif
endfunction

onoremap ii :<c-u>call <SID>PythonInnerStruct('\S', 0)<cr>
onoremap if :<c-u>call <SID>PythonInnerStruct("def", 0)<cr>
onoremap ic :<c-u>call <SID>PythonInnerStruct("class", 0)<cr>

onoremap ai :<c-u>call <SID>PythonInnerStruct('\S', 1)<cr>
onoremap af :<c-u>call <SID>PythonInnerStruct("def", 1)<cr>
onoremap ac :<c-u>call <SID>PythonInnerStruct("class", 1)<cr>

onoremap fn :<c-u>execute "normal! ?^\\s*def \reeviw"<cr>
onoremap fa :<c-u>execute "normal! ?^\\s*def \rf(vi("<cr>

onoremap cn :<c-u>execute "normal! ?^\\s*class \reeviw"<cr>

vnoremap ii :<c-u>call <SID>PythonInnerStruct('\S', 0)<cr>
vnoremap if :<c-u>call <SID>PythonInnerStruct("def", 0)<cr>
vnoremap ic :<c-u>call <SID>PythonInnerStruct("class", 0)<cr>

vnoremap ai :<c-u>call <SID>PythonInnerStruct('\S', 1)<cr>
vnoremap af :<c-u>call <SID>PythonInnerStruct("def", 1)<cr>
vnoremap ac :<c-u>call <SID>PythonInnerStruct("class", 1)<cr>

vnoremap fn :<c-u>execute "normal! ?^\\s*def \reeviw"<cr>
vnoremap fa :<c-u>execute "normal! ?^\\s*def \rf(vi("<cr>

vnoremap cn :<c-u>execute "normal! ?^\\s*class \reeviw"<cr>

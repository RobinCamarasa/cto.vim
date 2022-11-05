" Equation $
onoremap i$ :<c-u>execute "normal! T$vt$"<cr>
vnoremap i$ :<c-u>execute "normal! T$vt$"<cr>

onoremap a$ :<c-u>execute "normal! F$vf$"<cr>
vnoremap a$ :<c-u>execute "normal! F$vf$"<cr>

" command
onoremap ic :<c-u>execute "normal! ?\\\\[A-Za-z]\\+{\rlviw"<cr>
vnoremap ic :<c-u>execute "normal! ?\\\\[A-Za-z]\\+{\rlviw"<cr>

onoremap ac :<c-u>execute "normal! ?\\\\[A-Za-z]\\+{\rlviwoho"<cr>
vnoremap ac :<c-u>execute "normal! ?\\\\[A-Za-z]\\+{\rlviwoho"<cr>

" Environment (requires matchit plugin)
" Not super safe as % works only with matchit plugin which involves
" transforming normal to normal!
function s:SelectTexEnv(around)
    if match(getline("."), "\\end")
        execute "normal T\\%"
    endif
    let s:position = getcurpos('.')
    execute "normal $?\\\\begin\r%"
    let s:new_position = getcurpos('.')
    while ((s:new_position[1] < s:position[1]) || (s:new_position[1] == s:position[1] && s:new_position[2] < s:position[2]))
        execute "normal %n%"
        let s:new_position = getcurpos('.')
    endwhile
    if a:around
        execute "normal /\\({.*}*\\)\\zs\rv?\\\\end\r%"
    else
        execute "normal v%/\\({.*}*\\)\\zs\r/\\S\roN"
    endif
endfunction

onoremap ae :<c-u>call <SID>SelectTexEnv(1)<cr>
vnoremap ae :<c-u>call <SID>SelectTexEnv(1)<cr>

onoremap ie :<c-u>call <SID>SelectTexEnv(0)<cr>
onoremap ie :<c-u>call <SID>SelectTexEnv(0)<cr>


" Document
" Not super safe as % works only with matchit plugin which involves
" transforming normal to normal!
onoremap id :<c-u>execute "normal! ?\\\\begin{document}\rj_v/\\\\end{document}\rkg_"<cr>
vnoremap id :<c-u>execute "normal! ?\\\\begin{document}\rj_v/\\\\end{document}\rkg_"<cr>

onoremap ad :<c-u>execute "normal! ?\\\\begin{document}\rv/\\\\end{document}\rf}"<cr>
vnoremap ad :<c-u>execute "normal! ?\\\\begin{document}\rv/\\\\end{document}\rf}"<cr>

" \[ environment (display math)
onoremap im :<c-u>execute "normal! ?\\\\[\rlv%hholo"<cr>
vnoremap im :<c-u>execute "normal! ?\\\\[\rlv%hholo"<cr>

onoremap am :<c-u>execute "normal! ?\\\\[\rvl%"<cr>
vnoremap am :<c-u>execute "normal! ?\\\\[\rvl%"<cr>

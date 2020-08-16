let  s:result_buffer_name ='TRANSLATE RESULT'


function! trans#execute(start, end) abort
    let text = join(getline(a:start, a:end), "\n")
    if empty(text)
        echo"empty text"
        return
    endif
    let cmd = ['gtran', '-text=' . text, "-source=en", '-target=ja']
    call jobstart(cmd,{
                \ 'stdout_buffered' : s:result_buffer_name,
                \ 'stderr_buffered' : s:result_buffer_name,
                \ 'on_stdout' : function('s:start_cb'),
                \ 'out_msg' : 0,
                \ })
endfunction

function! s:start_cb(id, data, event) abort
    if 1 >= len(a:data)
        return
    endif
    let result = join(a:data)
    let wid = win_findbuf(bufnr(s:result_buffer_name))
    if empty(wid)
        execute "new | e " . s:result_buffer_name
    endif

    call win_gotoid(wid[0])
    let pos = getpos(".")
    execute ":normal i" . result
    call setpos('.', pos)

endfunction

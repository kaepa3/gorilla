
function! insertdate#execute() abort

    let time = strftime("%H:%M:%S")
    let pos = getpos(".")
    execute ":normal i" .time
    call setpos('.', pos)

endfunction


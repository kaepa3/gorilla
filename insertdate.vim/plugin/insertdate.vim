
scriptencoding utf-8

if exists('g:loaded_insertdate')
    finish
endif

let g:loaded_insertdate = 1

command! InsertDate call insertdate#execute()



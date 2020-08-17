scriptencoding utf-8

if exists('g:loaded_translate')
    finish
endif

let g:loaded_translate = 1

command! -range Trans call trans#execute(<line1>, <line2>)

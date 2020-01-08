" sourcerer.nvim - Neovim plugin for sourcing files when they change
" Last Change:	2020 Jan 8
" Maintainer:	Adam P. Regasz-Rethy (RRethy) <rethy.spud@gmail.com>
" Version: 0.1

if exists('g:loaded_sourcerer')
  finish
endif
let g:loaded_sourcerer = 1

fun! s:on_event(j,d,e) abort
    source $MYVIMRC
    echom printf('Sourced $MYVIMRC: %s', $MYVIMRC)
endf

if filereadable($MYVIMRC)
    call jobstart(['fswatch', '-0', $MYVIMRC], {
                \     'on_stdout': function('s:on_event'),
                \ })
endif

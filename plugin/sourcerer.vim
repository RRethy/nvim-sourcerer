if has('autocmd')
  augroup sourcerer_augroup
    autocmd!
    autocmd VimEnter * call s:source_sourcerer()
  augroup END
endif


fun! s:source_sourcerer() abort
  if filereadable('.sourcerer')
    exe 'source .sourcerer'
  endif
endf

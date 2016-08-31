"============================================================================
"File:        uno.vim
"Description: Uno syntax checking plugin for syntastic.vim
"Maintainer:  Karsten Nikolai Strand <karsten AT fusetools DOT com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists('g:loaded_syntastic_uno_uno_checker')
    finish
endif
let g:loaded_syntastic_uno_uno_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_uno_uno_GetLocList() dict
    let makeprg = self.makeprgBuild({ 'args': 'lint' })

    let errorformat = '%f(%l\.%c): %m'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'defaults': {'bufnr': bufnr('')} })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'uno',
    \ 'name': 'uno'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:

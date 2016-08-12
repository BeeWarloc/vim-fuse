"============================================================================
"File:        ux.vim
"Description: Syntax checking plugin for syntastic.vim, based on original
"             xmllint plugin created by Sebastian Kusnier
"Maintainer:  Karsten N. Strand <karsten at fusetools dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists('g:loaded_syntastic_ux_xmllint_checker')
    finish
endif
let g:loaded_syntastic_ux_xmllint_checker = 1

let s:save_cpo = &cpo
set cpo&vim

" You can use a local installation of DTDs to significantly speed up validation
" and allow you to validate XML data without network access, see xmlcatalog(1)
" and http://www.xmlsoft.org/catalog.html for more information.

function! SyntaxCheckers_ux_xmllint_GetLocList() dict
    let makeprg = self.makeprgBuild({
        \ 'args': '--xinclude --postvalid',
        \ 'args_after': '--noout' })

    " For .ux files we ignore namespace errors
    let errorformat=
        \ '%E%f:%l: error : %m,' .
        \ '%-G%f:%l: validity error : Validation failed: no DTD found %m,' .
        \ '%-G%f:%l: namespace error : Namespace prefix ux %m,' .
        \ '%W%f:%l: warning : %m,' .
        \ '%W%f:%l: validity warning : %m,' .
        \ '%E%f:%l: validity error : %m,' .
        \ '%E%f:%l: parser error : %m,' .
        \ '%E%f:%l: %m,' .
        \ '%-Z%p^,' .
        \ '%-G%.%#'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'returns': [0, 1, 2, 3, 4, 5] })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'ux',
    \ 'name': 'xmllint'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:

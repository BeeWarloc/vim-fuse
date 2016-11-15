if exists("b:current_syntax")
  finish
endif

so $VIMRUNTIME/syntax/xml.vim

function! IncludeFileTypeAsGroup(filetype, groupName) abort
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.a:groupName.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.a:groupName.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
endfunction

call IncludeFileTypeAsGroup('javascript', 'InlineJavaScript')

syntax region JavaScriptTag matchgroup=Function start="<JavaScript>" end="</JavaScript>" contains=@InlineJavaScript keepend

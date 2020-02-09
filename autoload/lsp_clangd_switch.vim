function! lsp_clangd_switch#handle_clangd_switch_source_header(data) abort
  let l:file = a:data['response']['result']
  let l:file = substitute(l:file, 'file://', '', '')
  if l:file != v:null
    execute 'edit ' . l:file
    let s:loc = {'filename': l:file,'lnum':1, 'col':1} 
    echo 'fuga' . l:file
    call lsp#utils#location#_open_vim_list_item(s:loc)
    echo 'Retrieved switch source/header'
  else
    echo 'switch file not found'
  endif
endfunction

function! lsp_clangd_switch#lsp_clangd_switch_source_header() abort
  call lsp#send_request('clangd', {
    \ 'method': 'textDocument/switchSourceHeader',
    \ 'params':{
    \   'uri': 'file://' .expand('%:p')
    \ },
    \   'on_notification': function('lsp_clangd_switch#handle_clangd_switch_source_header')
    \ })
    echo 'Retrieving switch source/header ...'
endfunction

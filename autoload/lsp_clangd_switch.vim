function! lsp_clangd_switch#handle_clangd_switch_source_header(data) abort
  let l:file = a:data['response']['result']
  let l:file = substitute(l:file, 'file://', '', '')
  if l:file != v:null
    call lsp#utils#tagstack#_update()
    let s:loc = {'filename': l:file,'lnum':1, 'col':1} 
    call lsp#utils#location#_open_vim_list_item(s:loc)
    echo 'Retrieved switch source/header'
  else
    echo 'switch file not found'
  endif
endfunction

function! lsp_clangd_switch#lsp_clangd_switch_source_header() abort
  if lsp#get_server_status('clangd') != 'running'
    echo 'clangd is not running'
    return
  endif

  call lsp#send_request('clangd', {
    \ 'method': 'textDocument/switchSourceHeader',
    \ 'params':{
    \   'uri': 'file://' .expand('%:p')
    \ },
    \   'on_notification': function('lsp_clangd_switch#handle_clangd_switch_source_header')
    \ })
    echo 'Retrieving switch source/header ...'
endfunction

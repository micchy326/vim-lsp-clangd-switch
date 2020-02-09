if exists('g:loaded_lsp_clangd_switch')
 finish
endif
let g:loaded_lsp_clangd_switch = 1

command! LspClangdSwitch call lsp_clangd_switch#lsp_clangd_switch_source_header()
nnoremap <plug>(lsp-clangd-switch) :<c-u>call lsp_clangd_switch#lsp_clangd_switch_source_header()<cr>


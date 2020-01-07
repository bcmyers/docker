setlocal colorcolumn=100
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4

let g:rustfmt_autosave = 1
let g:rustfmt_command = 'rustfmt'
let g:rustfmt_options = '--edition 2018'
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

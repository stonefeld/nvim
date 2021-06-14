" ---------- Snippets ---------- "
augroup SNIPPETS
  autocmd!

  " General snippets.
  autocmd FileType * inoremap ,.-<Tab> •<Space>
  autocmd FileType * inoremap ,.v<Tab> ✓<Space>

  " HTML snippets.
  autocmd Filetype html inoremap ,!<Tab> <!DOCTYPE html><CR><html lang="en"><CR><head><CR><meta charset="UTF-8"><CR><meta http-equiv="X-UA-Compatible" content="IE=edge"><CR><meta name="viewport" content="width=device-width, initial-scale=1.0"><CR><title>Document</title><CR></head><CR><body><CR><CR></body><CR></html><Esc>2ki<Space><Space><Space><Space>
  autocmd FileType html inoremap lorem<Tab> Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum assumenda cumque vero eos sequi rem, cum alias aut molestias laboriosam dolore, quas corrupti. Modi eius necessitatibus asperiores labore! Adipisci, magni.
augroup END

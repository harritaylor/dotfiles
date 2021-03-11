  " lervag/wiki.vim
  function WikiCreateMap(text) abort
    return substitute(tolower(a:text), '\s\+', '-', 'g')
  endfunction

  function! WikiRoot()
    let l:local = finddir('notes', ';./')
    return !empty(l:local) ? l:local : '~/Documents/Notes/'
  endfunction

  let g:wiki_root = 'WikiRoot'
  let g:wiki_map_create_page = 'WikiCreateMap'
  let g:wiki_filetypes = ['md']
  let g:wiki_link_target_type = 'wiki'
  let g:wiki_write_on_nav = 1
  let g:wiki_link_toggle_on_open = 0
  let g:wiki_map_link_create = 'WikiCreateMap'
  let g:wiki_template_title_month = '# %(month-name) %(year)'
  let g:wiki_template_title_week = '# %(year),Week %(week)'
  let g:wiki_list_todos = ['[ ]', '[x]']


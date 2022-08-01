" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" === Plugins
call plug#begin('~/.local/share/nvim/plugged')

" LanguageServer plugins support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Global file & text search
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Lua scripts do not work without it
Plug 'nvim-lua/plenary.nvim'

" UI Theme
Plug 'joshdick/onedark.vim'

" Terraform syntax highlighting
Plug 'hashivim/vim-terraform'

call plug#end()
" === End of plugins


" Enable mouse
:set mouse=a

" CoC LanguageServer Completion
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use Enter key in edit mode to apply completion option
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" UI settings 
colorscheme onedark
" set cursorline " Underline the selected line
set ruler 
set number

" Netrw file explorer settings
let g:netrw_banner = 0 " hide the banner above the files
let g:netrw_liststyle = 3 " tree view
let g:netrw_browse_split = 3 " open file in a new tab


" Telescope bindings
nnoremap ,ff <cmd>Telescope find_files<cr>
nnoremap ,fg <cmd>Telescope live_grep<cr>

" Telescope fzf plugin
lua << EOF
require('telescope').setup {
  defaults = {
    path_display = {"smart"}
  },

  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
require('telescope').load_extension('fzf')
EOF

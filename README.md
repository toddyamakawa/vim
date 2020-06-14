
My Vim Config
================================================================================

### `plug.vim`
Contains all of my plugins. It gets sourced in my `.vimrc`:

```vim
call plug#begin('~/.vim/vim-plug')
source ~/.vim/plug.vim
call plug#end()
```

### `setup.sh`
Sets up my vim environment. Installs `vim-plug` and plugins.



Other Vim Tips
================================================================================

Useful Resources
--------------------------------------------------------------------------------
- [Death by a thousand files](https://vimways.org/2018/death-by-a-thousand-files/)


### Wrapping
Soft wrap text based on words rather than characters:
```vim
:set wrap linebreak
```


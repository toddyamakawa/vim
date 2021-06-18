
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
- [Colorful tabs](https://www.reddit.com/r/vim/comments/o122wu/how_to_change_the_tabpage_color_or_write_a_plugin/h1z9udu?utm_source=share&utm_medium=web2x&context=3)


### Wrapping
Soft wrap text based on words rather than characters:
```vim
:set wrap linebreak
```


Examples
================================================================================
- EmilOhlsson's [commit](https://github.com/EmilOhlsson/myconf/commit/8b56997713da7e3cb5746a807114aebf812c5075) switching to coc.vim


Other Resources
================================================================================
- [Helix Editor](https://github.com/helix-editor/helix) [keymap](https://docs.helix-editor.com/keymap.html)


[modeline]: # (vim: set fenc=utf-8 linebreak wrap spell spl=en:)


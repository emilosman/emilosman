# vim
- ed
- ex
- vi
- vim
- nvim

## rwxrob
- [vimrc](https://github.com/rwxrob/dot/blob/main/vim/vimrc)
- [YOUR TEXT EDITOR SUCKS!](https://www.youtube.com/watch?v=iT1mP8leRsU)
- [How to Learn Vim Quickly and Correctly [20210422163108]](https://www.youtube.com/watch?v=TWca-7q94SU)
- [visurvive](https://rwx.gg/tools/editors/vi/how/survive/)
- [Why not CONTROL-C instead of ESC?](https://www.youtube.com/watch?v=BLxZnkyX-NA)
- [Beginner Boost, Day 11: Edit Files with Vi (Then Vim) [20210519230400]](https://www.youtube.com/watch?v=RJ3EVB5-Emw)

## nvim / neovim
- brew install neovim

## movement
- `h j k l` movement
- `ESC` exit mode
- `0` move to start of line
- `$` move to end of line
- `i` insert mode
- `I` move to start of line and switch to insert mode
- `a` append text at current position (switch to insert mode)
- `A` move to last character and switch to insert mode
- `o` create new line under current line and switch to insert mode
- `O` create new line above current line and switch to insert mode
- `dd` delete current line
- `yy` yank (copy) current line
- `GG` move to last line
- `gg` move to first line
- `{{` move to beginning of block
- `}}` move to end of block
- `]]` move to last line
- `[[` move to first line

## visual mode
- [copy + paste](https://www.warp.dev/terminus/vim-copy-paste)
- `v` visual mode `V` visual line mode `CTRL+V` visual block mode
- `SHIFT+V` visual line mode
- `Y` yank (copy)
- `D` delete (cut)
- `p` paste after cursor `P` paste before cursor
- `x` remove character
- `u` undo

## ~/.vimrc
- :source ~/.vimrc

```
syntax on
set number

" Unbind arrow keys in NORMAL mode
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>

" Unbind arrow keys in INSERT mode
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" Unbind arrow keys in VISUAL mode
vnoremap <Up>    <NOP>
vnoremap <Down>  <NOP>
vnoremap <Left>  <NOP>
vnoremap <Right> <NOP>
```

## exit commands
- `:wq` write + quit
- `:q` quit with warning

## syntax highlighting
- :syntax on

## syntax highlighting engine
- set re=0
- [How to fix slow Typescript syntax highlighting in Vim](https://jameschambers.co.uk/vim-typescript-slow)
- [github issue: redrawtime exceeded syntax highlighting disabled](https://github.com/prabirshrestha/vim-lsp/issues/786)

## plugins
- ~/.vim/plugins
- [checkbox toggle](https://vimtricks.com/p/vim-checkbox-toggle/) \tt

## move lines
- ddp move line down
- ddkkp move line up

## spell check
- [how to](https://www.linux.com/training-tutorials/using-spell-checking-vim/)
- :set spell spelllang=en_us
- :set nospell

## line numbers
- :set number
- :set nonumber

## indent, dedent
- <<
- >>

## save session plugin
- [vim-obsession](https://github.com/tpope/vim-obsession)

## apply command for multiple lines in visual mode
- make selection
- hit :
- :'<,'> should appear

## search and replace
- : s/search/replace/
- Add a `g` after the third slash if you want to replace all matches, and a `c` if you want a confirmation for every replace

## list - show hidden characters
- :set list
- :set nolist


# tmux - terminal multiplexer
- [Getting started](https://github.com/tmux/tmux/wiki/Getting-Started)

## [install](https://github.com/tmux/tmux/wiki/Installing)
- brew install tmux

## iterm 2 integration 
- [iterm2 integration](https://iterm2.com/documentation-tmux-integration.html)
- tmux -CC

## rwxrob
- [Do NOT Use Vim Pane Splitting (Use TMUX Instead)](https://www.youtube.com/watch?v=zH3CH6zXTew)

## start session
- tmux new

## session list
- CTRL+b s

## plugins
- [tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
- ~/.tmux.conf
- CTRL+b I install plugins from ~/.tmux.conf

## session save + restore
- [tmux resurrect plugin](https://github.com/tmux-plugins/tmux-resurrect)
- CTRL+b CTRL+s save
- CTRL+b CTRL+r restore

## restore vim/nvim session
- tmux resurrect plugin
- ~/.tmux.conf

```
# for vim
set -g @resurrect-strategy-vim 'session'
# for neovim
set -g @resurrect-strategy-nvim 'session'
```
## split pane
- CTRL+b % vertical split
- CTRL+b " horizontal split

## change active pane
- CTRL+b left/right/up/down arrow

## switch pane position
- CTRL+b { move current pane left
- CTRL+b } move current pane right

## close pane
- CTRL+b x

## create window
- CTRL+b c

## switch windows
- CTRL+B 0..9

## rename window
- CTRL+b ,

## move window to index
- CTRL+b .

## kill session
- CTRL+b :kill-session

## kill tmux process
- if prefix command is ignored
- if [7] 0:zsh keeps incrementing with every `tmux new`
- pkill tmux
- killall tmux

## scroll pane
- CTRL+b [ arrows or scroll wheel

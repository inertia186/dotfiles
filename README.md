# Dot Files

[tmux + Vim cheat sheet](CHEAT-SHEET.md)

## Install

```bash
git clone git@github.com:inertia186/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
make install
```

`make install` is safe to re-run. It:

- fetches the Vundle submodule (`vim/bundle/vundle`)
- links `vim/` to `~/.vim` (move aside any existing `~/.vim` directory first)
- links `zed/settings.json` to `~/.config/zed/settings.json`

Then install the vim plugins:

```bash
vim +BundleInstall +qa
```

## What's here

| Path | What | Installed by `make`? |
| --- | --- | --- |
| `vim/` | `vimrc`, UltiSnips snippets, Vundle plugins | yes |
| `zed/settings.json` | Zed editor settings (vim mode, 2-space tabs, 80 col) | yes |
| `tmux/tmux.conf` | tmux config | no, link to `~/.tmux.conf` |
| `irbrc` | irb `history` helper | no, link to `~/.irbrc` |
| `iterm/Homebrew.itermcolors` | iTerm color preset | no, import in iTerm |
| `intellij/` | IntelliJ Java code style | no, import in IntelliJ |
| `scripts/` | git prompts for bash/zsh, Firefox-in-Docker helper | no, source as needed |
| `monit/monit.cfg` | OpenSSL config for monit certs | no |

## Vim bundles

Plugins are managed by [Vundle](https://github.com/VundleVim/Vundle.vim),
which is a git submodule at `vim/bundle/vundle`. Everything else under
`vim/bundle/` is installed by Vundle and gitignored.

| Bundle | What | Keys |
| --- | --- | --- |
| [Vundle.vim](https://github.com/VundleVim/Vundle.vim) | plugin manager | |
| [vim-airline](https://github.com/vim-airline/vim-airline) | status line | |
| [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) | fuzzy file/buffer finder | `<leader>f` files, `<leader>b` buffers, `<leader>m` recent |
| [vim-gitgutter](https://github.com/airblade/vim-gitgutter) | git diff markers in the gutter | |
| [vim-rails](https://github.com/tpope/vim-rails) | Rails navigation | |
| [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) | indent guides | `<leader>ig` |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | move between vim splits and tmux panes | `Ctrl-h/j/k/l` |
| [vim-speeddating](https://github.com/tpope/vim-speeddating) | `Ctrl-a`/`Ctrl-x` on dates | |
| [rename.vim](https://github.com/danro/rename.vim) | `:Rename` the current file | |
| [vim-command-w](https://github.com/nathanaelkane/vim-command-w) | close buffer, not window (MacVim) | `Cmd-w` |
| [ultisnips](https://github.com/SirVer/ultisnips) | snippets from `vim/UltiSnips/` (MacVim only) | |

To add or remove one, edit the `Bundle` lines in `vim/vimrc`, then run
`:BundleInstall` or `:BundleClean`. `:BundleUpdate` updates them all.

Vundle was repointed from `gmarik/vundle` to `VundleVim/Vundle.vim` (the old
pin broke on Vim 9). On a machine with the old checkout, run once:

```bash
git submodule sync && git submodule update
```

## Notes

- Zed writes UI changes (panel docks, agent settings) back into its settings
  file, which lands in this repo through the symlink. Expect stray diffs in
  `zed/settings.json`; commit the deliberate ones.

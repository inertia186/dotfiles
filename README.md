# Dot Files

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

## Notes

- Zed writes UI changes (panel docks, agent settings) back into its settings
  file, which lands in this repo through the symlink. Expect stray diffs in
  `zed/settings.json`; commit the deliberate ones.
- Vim plugins are declared in `vim/vimrc`. After adding or removing one, run
  `:BundleInstall` or `:BundleClean`.

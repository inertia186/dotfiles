# tmux + Vim cheat sheet

For this repo's [tmux config](tmux/tmux.conf) and [Vim config](vim/vimrc).
Plugin shortcuts assume the Vim bundles are installed. See [setup](README.md#install).

- **Prefix** means press `Ctrl-b`, release, then press the next key.
- **Leader** is `\`. For example, `\f` means backslash, then `f`.
- Vim shortcuts below start in **Normal mode**. Press `Esc` to get there.

## Move between panes

| Keys | Action |
| --- | --- |
| `Ctrl-h` / `Ctrl-j` / `Ctrl-l` | Move left / down / right across Vim splits and tmux panes |
| `Ctrl-w h/j/k/l` | Move left / down / up / right inside Vim |
| `Prefix` then an arrow | Move between tmux panes |
| `Prefix ;` | Return to the previous tmux pane |
| `Prefix z` | Zoom the current tmux pane; press again to restore |

**`Ctrl-k` resets the terminal state and clears tmux scrollback.** This repo
reserves it for clearing, so it never reaches Vim's move-up mapping. Use
`Ctrl-w k` to move up inside Vim, or `Prefix Up` to move to the tmux pane above.

## tmux sessions

Run these from the shell:

```sh
tmux new -s work       # Create a named session
tmux ls                # List sessions
tmux attach -t work    # Reattach to it
```

| Keys | Action |
| --- | --- |
| `Prefix d` | Detach; programs keep running |
| `Prefix s` | Choose a session |
| `Prefix $` | Rename the session |

A session contains windows. Each window can contain several panes.

## tmux windows and panes

| Keys | Action |
| --- | --- |
| `Prefix c` | New window |
| `Prefix ,` | Rename the window |
| `Prefix n` / `Prefix p` | Next / previous window |
| `Prefix l` | Return to the last window |
| `Prefix 0` … `Prefix 9` | Select a window by number |
| `Prefix w` | Choose a window |
| `Prefix %` | Split into left and right panes |
| `Prefix "` | Split into top and bottom panes |
| `Prefix Space` | Cycle pane layouts |
| `Prefix Ctrl-arrow` | Resize the pane in that direction |
| `Prefix x` | Close the pane, after confirmation; stops its process |
| `Prefix :` | Open the tmux command prompt |
| `Prefix r` | Reload `~/.tmux.conf` (see the load issue below) |
| `Prefix ?` | Show active tmux shortcuts |
| `Shift-Left` / `Shift-Right` | Previous / next window, without prefix |
| `Shift-Down` | Open the tmux command prompt, without prefix |

The Shift-arrow shortcuts require the terminal to send those key sequences.

## tmux scrollback and copying

| Keys | Action |
| --- | --- |
| `Prefix [` or `Shift-Up` | Enter scrollback / copy mode |
| `h/j/k/l` | Move within scrollback |
| `Ctrl-u` / `Ctrl-d` | Half a page up / down |
| `g` / `G` | Top / bottom of scrollback |
| `/text` then `Enter` | Search forward; `?text` searches backward |
| `n` / `N` | Repeat / reverse the search |
| `Space`, move, `Enter` | Start selection, extend it, copy and leave copy mode |
| `q` | Leave copy mode without copying |
| `Prefix ]` | Paste the tmux copy buffer |

The tmux copy buffer is separate from Vim's registers. System clipboard
integration depends on the terminal and host; copying here is not a guarantee
that another app can paste it.

## Vim files, buffers, and splits

| Keys / command | Action |
| --- | --- |
| `\f` or `Ctrl-p` | Find a file with CtrlP |
| `\b` | Find an open buffer |
| `\m` | Find a recently opened file |
| `:e path` | Open or create a file |
| `:ls` | List buffers |
| `:b name` or `:b 3` | Switch to a buffer by name or number |
| `:bn` / `:bp` | Next / previous buffer |
| `Ctrl-^` | Switch to the alternate buffer |
| `:bd` | Remove the buffer; refuses unsaved changes |
| `:vsp path` / `:sp path` | Open a file in a vertical / horizontal split |
| `Ctrl-w =` | Give Vim splits equal space |
| `Ctrl-w _` / `Ctrl-w >` | Maximize split height / increase width |
| `Ctrl-w q` | Close this Vim split; refuses to abandon unsaved changes |

In CtrlP, type to filter and use the arrow keys to select. `Enter` opens the
file; `Ctrl-v` opens a vertical split, `Ctrl-x` a horizontal split, and `Ctrl-t`
a tab. `Esc` cancels. Use the arrows instead of `Ctrl-k`, which tmux intercepts.

Buffers are open files; splits are views of them. This config allows switching
away from an unsaved buffer. Use `:ls` to find it again (`+` marks changes).

## Vim editing

| Keys | Action |
| --- | --- |
| `i` / `a` | Insert before / after the cursor |
| `I` / `A` | Insert at the first nonblank character / end of line |
| `o` / `O` | Add a line below / above and start inserting |
| `h/j/k/l` | Move left / down / up / right |
| `w` / `b` / `e` | Next word / previous word / end of word |
| `0` / `^` / `$` | Start / first nonblank character / end of line |
| `gg` / `G` / `42G` | First line / last line / line 42 |
| `Ctrl-u` / `Ctrl-d` | Half a screen up / down |
| `v` / `V` / `Ctrl-v` | Select characters / lines / a block |
| `yy` / `dd` / `p` | Copy line / cut line / paste after the cursor |
| `ciw` / `ci"` / `ci(` | Replace inside a word / quotes / parentheses |
| `>` / `<` on a selection | Indent / unindent |
| `==` / `gg=G` | Reindent this line / the whole file |
| `u` / `Ctrl-r` / `.` | Undo / redo / repeat the last change |

Counts work with motions and edits: `5j` moves down five lines; `3dd` cuts
three lines. This config maps **`Ctrl-e` to end of line** in Normal mode,
replacing Vim's usual one-line scroll. Inserted tabs become spaces; indentation
is two spaces. Relative line numbers appear after leaving Insert mode.

## Vim search, save, and quit

| Keys / command | Action |
| --- | --- |
| `/text` then `Enter` | Search forward; `?text` searches backward |
| `n` / `N` | Repeat / reverse the search |
| `*` / `#` | Search for the word under the cursor forward / backward |
| `:%s/old/new/gc` | Replace throughout the file, confirming each match |
| `:w` / `:wa` | Save this buffer / all changed buffers |
| `:q` / `:wq` | Quit this split / save and quit this split |
| `:q!` | Force quit this split; can discard unsaved changes |
| `:qa` | Quit Vim; refuses unsaved changes |
| `:help topic` | Open Vim help; `Ctrl-w q` closes its split |

The config requests the system clipboard for ordinary `y` / `p` operations
when supported by the host. `"+y` and `"+p` explicitly use the system clipboard.

## Installed plugin shortcuts

| Keys / command | Action |
| --- | --- |
| `]c` / `[c` | Next / previous Git change hunk |
| `\hp` | Preview the Git hunk |
| `\hs` | Stage the Git hunk |
| `\hu` | Undo the Git hunk; discards its working changes |
| `\ig` | Toggle indentation guides |
| `Ctrl-a` / `Ctrl-x` | Increment / decrement numbers or dates |
| `:Rename new-name` | Rename the current file |

## Config checks and reloads

**Existing tmux load issue:** tmux 3.7c rejects the unquoted `C-\` key in
`tmux/tmux.conf` with `unknown key: C- if-shell`. The intended `Ctrl-\`
previous-pane shortcut does not load. Other bindings, including `Prefix r`,
still load. Use `Prefix ;` for the previous tmux pane. This sheet does not
change the config.

The tmux config needs to be linked to `~/.tmux.conf` manually; `make install`
only links Vim and Zed. Reload with `tmux source-file ~/.tmux.conf` from the
shell, or use `Prefix r`. Reloading reports the same error until the malformed
binding is fixed.

In Vim, `:source ~/.vim/vimrc` reloads settings; restart Vim after changing the
plugin list. `:BundleInstall` installs declared plugins; `:BundleUpdate`
updates them. `:verbose nmap <C-k>` shows Vim's mapping and where it came from;
tmux can still intercept that key before Vim sees it.

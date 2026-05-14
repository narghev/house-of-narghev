# house-of-narghev

Personal dotfiles for macOS. Tracked configs live in this repo and are symlinked into the locations apps expect, so edits in either place reflect in the other.

## Layout

```
.
├── setup.sh           # idempotent installer — creates the symlinks below
├── zshrc              -> ~/.zshrc
├── tmux.conf          -> ~/.tmux.conf
├── ghostty/           -> ~/.config/ghostty/      (XDG path; Application Support is ignored)
├── ohmyposh/          -> ~/.config/ohmyposh/
└── karabiner/         -> ~/.config/karabiner/
```

`setup.sh` is the only entry point. It's safe to re-run — existing links are skipped, not clobbered.

## Tracked elsewhere, not here

- **Neovim** — separate repo at `git@github.com:narghev/kickstart.nvim.git`, cloned to `~/.config/nvim`. Do not add nvim configs here.
- **Secrets** — `~/.zshrc.private` is sourced by `zshrc` if present. Never commit it; it's gitignored.
- **tmux helper scripts** — `~/.tmux/kartes.sh`, `~/.tmux/toptal.sh` are intentionally not tracked (work-specific, hardcoded project paths). The zshrc aliases that reference them will be dead on a fresh machine; that's known and accepted.

## Conventions

- **Edit-through-symlink is the workflow.** Modifying `~/.zshrc` and modifying `zshrc` in this repo are the same operation — they're the same inode. Same for everything in `karabiner/`, `ohmyposh/`, `ghostty/`.
- **Directory links over file links** for apps that do atomic-save (Karabiner is the classic case). The current setup already does this for karabiner/ohmyposh/ghostty.
- **No hardcoded paths in `setup.sh`.** Use `$HOME` and the script's own location (`$CONFIG_DIR`). The script must run unmodified on any macOS machine.
- **Add new configs by editing `setup.sh`** to include a new `link` call, then run `./setup.sh` once.

## Gotchas

- `karabiner/automatic_backups/` is gitignored — Karabiner regenerates it on every config save. Don't commit anything inside it.
- `karabiner/assets/` is also gitignored (Karabiner-managed binary state).
- Ghostty reads `~/.config/ghostty/config` (XDG) in preference to `~/Library/Application Support/com.mitchellh.ghostty/config`. Keep config in the XDG path only — having both invites confusion.
- The repo previously contained an accidental self-referential symlink (`karabiner/karabiner -> karabiner/`). If one reappears (e.g., after re-running `setup.sh` from inside `karabiner/`), delete it.

## Bootstrapping a new machine

```sh
git clone <this-repo> ~/workspace/narghev/house-of-narghev
cd ~/workspace/narghev/house-of-narghev
./setup.sh
# then clone nvim separately:
git clone git@github.com:narghev/kickstart.nvim.git ~/.config/nvim
```

Anything not covered by `setup.sh` (oh-my-zsh install, fzf, oh-my-posh, tmux TPM plugins, Karabiner-Elements app itself, Ghostty.app) is installed out-of-band — typically via Homebrew or each tool's own installer.

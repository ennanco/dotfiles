# Dotfiles managed with a bare Git repository

This repository stores my home-directory dotfiles using a bare Git repo, with `$HOME`
as the work tree. It includes shell setup, editor configuration, terminal workflow
tools, and helper scripts used daily.

The approach is based on keeping the Git directory separate (for example at
`$HOME/.cfg`) while versioning files directly in `$HOME`.

## How this repo is managed

The main helper command is an alias named `config`:

```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

If aliases are not loaded yet, use the full command directly:

```bash
/usr/bin/git --git-dir="$HOME/.cfg/" --work-tree="$HOME" <git-command>
```

Recommended local setting (inside the bare repo):

```bash
config config --local status.showUntrackedFiles no
```

This keeps `config status` focused on tracked dotfiles instead of every file in
your home directory.

## Daily workflow

```bash
config status
config add .bashrc .profile .config/tmux/tmux.conf
config commit -m "Update shell and tmux settings"
config push
```

## Repository layout

- `README.md`: documentation and usage instructions.
- `.bash_profile`, `.profile`, `.bashrc`: shell startup flow.
- `.config/bash/conf.d/env/*.sh`: environment/session modules.
- `.config/bash/conf.d/interactive/*.sh`: interactive shell modules (aliases,
  fzf, lazy NVM loading, zoxide).
- `.vimrc` and `.config/vim/vimrc`: Vim entry point plus full Vim configuration.
- `.config/nvim/init.lua`, `.config/nvim/lua/config/*`,
  `.config/nvim/lua/plugins/*`: Neovim modular Lua configuration.
- `.config/tmux/tmux.conf` and `.config/tmux/themes/*`: tmux behavior and theme
  definitions.
- `.scripts/*`: helper scripts used from the command line.
- `.local/share/fonts/*`: patched fonts used by terminal/editor UI.

## Bash modular architecture

Shell startup is split into clear layers:

- `.bash_profile` is the login-shell entry point.
- `.bash_profile` sources `.profile` and then `.bashrc` for Bash sessions.
- `.profile` defines global environment variables, PATH changes, XDG settings,
  and machine/runtime modules.
- `.bashrc` applies interactive behavior (history, completion, prompt, colors)
  and loads interactive modules.

Modules are grouped by intent:

- `env/`: non-interactive and session-safe exports (for example XDG and GPU).
- `interactive/`: aliases, fuzzy finder integration, lazy tool loading, and
  navigation helpers.

The prompt is handled by Starship when available.

## Vim and Neovim

Both editors are supported:

- Vim uses a thin wrapper at `.vimrc` that sources `.config/vim/vimrc`.
- Neovim uses a Lua-first, modular setup:
  - `init.lua` loads core bootstrap.
  - `lua/config/*` stores options, keymaps, autocmds, and plugin bootstrap.
  - `lua/plugins/*` stores plugin specifications by feature area.
  - `lazy.nvim` handles plugin management.

This allows maintaining a stable Vim setup while continuing migration to Neovim.

## tmux configuration

The tmux setup is designed for editor-like navigation and session persistence:

- Prefix key is remapped to `Ctrl-a`.
- Pane movement uses Vim keys (`h`, `j`, `k`, `l`) and alt-based navigation
  without prefix.
- Window and pane numbering start at `1`.
- Session theme is selected automatically by machine type (WSL vs Linux), with
  manual toggle support.
- TPM plugins are enabled, including:
  - `tmux-sensible`
  - `tmux-yank`
  - `tmux-resurrect`
  - `tmux-continuum`

## Scripts

The `.scripts` directory currently includes:

- `compiler`: compiles or runs files by extension (for example LaTeX, groff,
  Markdown, C, Python, and shebang-based scripts).
- `extract`: extracts most common archive formats either into a new folder or
  into the current directory with `-c`.
- `ide-tmux`: boots an opinionated tmux-based development workspace around
  Neovim, system monitors, and optional test/AI windows.
- `k2_battery`: prints the current battery percentage for a Keychron K2 keyboard
  from `upower`.
- `opout`: opens the expected build output for a source file (typically PDF or
  HTML), useful from editor workflows.
- `pomodoro`: launches a background timer and sends desktop/audio notifications
  when the session ends.
- `screencasting`: records screen (or webcam) plus audio via `ffmpeg`, with
  options for PulseAudio, custom output names, and stop control.
- `texclear`: removes LaTeX temporary build artifacts for a given `.tex` file.
- `vpn`: starts/stops OpenConnect VPN using credentials stored in the system
  keychain (`secret-tool`).
- `webcam`: toggles a small always-on-top webcam preview window using `mpv`.

## Bootstrap on a new machine (template)

1. Clone your dotfiles bare repository:

```bash
git clone --bare <your-dotfiles-repo-url> "$HOME/.cfg"
```

2. Define a temporary helper in the current shell:

```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

3. Try checking out the tracked files:

```bash
config checkout
```

4. If checkout fails due to existing files, back them up first and retry:

```bash
mkdir -p "$HOME/.dotfiles-backup"
config checkout 2>&1 | grep "^\s\+" | sed 's/^\s\+//' | while read -r file; do
  mkdir -p "$HOME/.dotfiles-backup/$(dirname "$file")"
  mv "$HOME/$file" "$HOME/.dotfiles-backup/$file"
done
config checkout
```

5. Hide untracked home files from status:

```bash
config config --local status.showUntrackedFiles no
```

6. Optional: switch to your preferred branch:

```bash
config switch <dotfiles-branch>
```

7. Restart your shell (or source your profile files) to load aliases and modules.

## Notes

- This setup follows XDG conventions where practical.
- Some environment modules are host-dependent (for example CUDA paths).
- If you only want selected files, use `config checkout -- <path>`.

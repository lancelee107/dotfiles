# Dotfiles setup (new Mac)

Step-by-step to get this setup running. Clone this repo somewhere (e.g. `~/workspace/dotfiles` or `~/.dotfiles`) and use it as the source of truth.

---

## 1. Basics

- **Xcode Command Line Tools** (for git, etc.):
  ```bash
  xcode-select --install
  ```
- **Homebrew**: https://brew.sh  
  Then:
  ```bash
  brew install git
  ```

---

## 2. Clone this repo

```bash
git clone <your-dotfiles-repo-url> ~/.dotfiles
cd ~/.dotfiles
```

(Use your real repo URL and path if you prefer something like `~/workspace/dotfiles`.)

---

## 3. Link dotfiles into home

Either symlink or copy. From the repo root:

```bash
# Symlink the main files
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.p10k.zsh ~/.p10k.zsh
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/.aerospace.toml ~/.aerospace.toml

# Config dir (creates ~/.config if needed)
mkdir -p ~/.config
ln -sf ~/.dotfiles/.config/alacritty ~/.config/
ln -sf ~/.dotfiles/.config/tmux ~/.config/
ln -sf ~/.dotfiles/.config/nvim ~/.config/
ln -sf ~/.dotfiles/.config/pre-commit ~/.config/
ln -sf ~/.dotfiles/.config/raycast ~/.config/
```

If you use a different clone path, replace `~/.dotfiles` with it.

---

## 3b. AeroSpace (tiling window manager, optional)

If you use [AeroSpace](https://github.com/nikitabobko/AeroSpace), the config is in the repo and symlinked in step 3:

```bash
ln -sf ~/.dotfiles/.aerospace.toml ~/.aerospace.toml
```

Install AeroSpace (e.g. via Homebrew):

```bash
brew install --cask nikitabobko/tap/aerospace
```

Open AeroSpace from Applications (or enable “Start at login” in the config). **Restart AeroSpace** after changing the config so the new default split direction (horizontal = side-by-side) applies. You can also press **Alt+Shift+;** then **r** to flatten the workspace tree and reset layout.

---

## 4. Homebrew packages

```bash
brew install \
  nvm \
  fzf \
  fd \
  ripgrep \
  direnv \
  autojump \
  lazygit \
  neovim \
  alacritty \
  tmux
```

- **fzf**: after install, run `$(brew --prefix)/opt/fzf/install` and accept defaults (or add keybindings if you want).
- **nvm**: the script in `.zshrc` will load it; first time in a new shell you may need to `mkdir -p ~/.nvm`.

---

## 5. Shell: Oh My Zsh + Powerlevel10k

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

When it asks to set zsh as default, say yes. It may overwrite `.zshrc`; if it does, re-run the symlink step for `.zshrc` (and `.p10k.zsh`).

Then install Powerlevel10k:

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Restart the terminal. If p10k doesn’t run the config wizard, run:

```bash
p10k configure
```

Pick the options you like (or keep the existing lean style from the repo).

---

## 6. Fonts

Alacritty and the prompt use **JetBrains Mono Nerd Font**. Install it (e.g. from [Nerd Fonts](https://www.nerdfonts.com/font-downloads) or Homebrew):

```bash
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

Set JetBrains Mono Nerd Font as the font in Alacritty (already in the config) and in your terminal profile if you use another app.

---

## 7. Direnv

Your `.zshrc` already hooks direnv. In any project where you use a venv:

```bash
echo 'source .venv/bin/activate' > .envrc   # or: layout python-venv
direnv allow
```

---

## 8. Python / pre-commit

Use system Python or `brew install python`. For repos that use pre-commit:

```bash
pip install pre-commit
```

In each repo:

```bash
cp ~/.config/pre-commit/python-ruff.yaml .pre-commit-config.yaml
pre-commit install
```

---

## 9. Tmux plugins

Start tmux, then press **Ctrl+Space** then **I** (capital I). TPM will install the plugins (catppuccin, vim-tmux-navigator, etc.).

---

## 10. Neovim

Open nvim once:

```bash
nvim
```

Lazy will install plugins (catppuccin, LSP, telescope, harpoon, etc.). Wait for it to finish, then quit and reopen. Install any missing language tools (e.g. Ruff) when Mason prompts you.

---

## 11. Raycast (optional)

- Install Raycast from the web or App Store.
- Install extensions from the store: **1Password**, **Kill Process**, **Slack** (see `.config/raycast/README.md`).
- Don’t rely on the repo’s `extensions/` folder; it’s gitignored. Use the README list to reinstall on a new machine.

---

## 12. One-off / optional

- **Node**: `nvm install lts` (or the version you use).
- **1Password CLI**: if you use the Raycast 1Password extension, install the CLI and sign in.
- **aws-vault**: if you use `tgip` and similar, install and configure it (e.g. `brew install aws-vault`).

---

## Quick checklist

- [ ] Xcode CLI tools, Homebrew, git
- [ ] Clone repo, symlink dotfiles (including `.aerospace.toml` if you use AeroSpace)
- [ ] AeroSpace: install app + restart after first run (optional)
- [ ] `brew install` list + fzf install + nvm
- [ ] Oh My Zsh + Powerlevel10k + p10k configure
- [ ] JetBrains Mono Nerd Font
- [ ] Tmux: prefix + I for TPM
- [ ] Neovim: open once for Lazy
- [ ] Raycast + extensions if you use them

If something doesn’t work, check that paths in the README match where you cloned the repo (e.g. `~/.dotfiles` vs `~/workspace/dotfiles`).

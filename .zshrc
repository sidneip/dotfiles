USER=$(whoami)
# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(git vi-mode rails z fzf zsh-autosuggestions zsh-syntax-highlighting ruby)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias tx='tmuxinator'
export PATH="/opt/homebrew/opt/postgresql@13/bin:$PATH"
bindkey -v
alias lsa='exa -la --color=always --icons --header --all --git'
export EDITOR='lvim'
export VISUAL='lvim'

[ -s "/Users/{$USER}/.scm_breeze/scm_breeze.sh" ] && source "/Users/$USER/.scm_breeze/scm_breeze.sh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("/Users/$USER/anaconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/$USER/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/$USER/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/$USER/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
alias todo=dooit
eval "$(rbenv init - zsh)"


[[ -s "/Users/$USER/.gvm/scripts/gvm" ]] && source "/Users/$USER/.gvm/scripts/gvm"
alias ze='zellij'
#eval "$(zellij setup --generate-auto-start zsh)"

source /Users/$USER/.config/broot/launcher/bash/br
alias filenav='broot'
alias v='fd -t f --hidden --exclude .git | fzf-tmux -p --reverse | xargs -o lvim'
export OPENAI_API_KEY=''
unalias gt

PATH=~/.console-ninja/.bin:$PATH
alias gt='git_status_shortcuts'
bindkey -v

function ff() {
  find . -type f | fzf --multi --height=80% --border=sharp \
  --preview='tree -C {}' --preview-window='45%,border-sharp' \
  --prompt='Dirs > ' \
  --bind='enter:execute($EDITOR {+})' \
  --bind='del:execute(rm -ri {+})' \
  --bind='ctrl-p:toggle-preview' \
  --bind='ctrl-d:change-prompt(Dirs > )' \
  --bind='ctrl-d:+reload(find . -type d)' \
  --bind='ctrl-d:+change-preview(tree -C {})' \
  --bind='ctrl-d:+refresh-preview' \
  --bind='ctrl-f:change-prompt(Files > )' \
  --bind='ctrl-f:+reload(find . -type f)' \
  --bind='ctrl-f:+change-preview(cat {})' \
  --bind='ctrl-f:+refresh-preview' \
  --bind='ctrl-a:select-all' \
  --bind='ctrl-x:deselect-all' \
  --header '
  CTRL-D to display directories | CTRL-F to display files
  CTRL-A to select all | CTRL-x to deselect all
  ENTER to edit | DEL to delete
  CTRL-P to toggle preview
  '
}

function tx-fzf() {
  SELECTED_PROJECTS=$(tmuxinator list -n |
      tail -n +2 |
      fzf --prompt="Project: " -m -1 -q "$1")

  if [ -n "$SELECTED_PROJECTS" ]; then
      # Set the IFS to \n to iterate over \n delimited projects
      IFS=$'\n'

      # Start each project without attaching
      for PROJECT in $SELECTED_PROJECTS; do
          tmuxinator start "$PROJECT" --no-attach # force disable attaching
      done

      # If inside tmux then select session to switch, otherwise just attach
      if [ -n "$TMUX" ]; then
          SESSION=$(tmux list-sessions -F "#S" | fzf --prompt="Session: ")
          if [ -n "$SESSION" ]; then
              tmux switch-client -t "$SESSION"
          fi
      else
          tmux attach-session
      fi
  fi
}

figlet "Sidnei Pacheco" | lolcat

print_cli_table() {
    echo "CLI             | Uso "
    echo "--------        |---------------------------------------------------------------------------------"
    echo "ga              | git add 1 2 3"
    echo "gt              | git status"
    echo "lazygit         | lazygit ( inteface to git manager)"
    echo "ff              | find files and folders"
    echo "lvim (lunarvim) | open lunarvim"
    echo "Neogit          | neovim plugin manager git"
    echo "Octo            | neovim plugin manager pullrequests"
    echo "gh dash         | tool to manage pull requests on projects"
    echo "tmux            | tool to manage terminal sessions"
    echo "tx tmuxinator   | tool to manage terminal sessions"
    echo "zellij          | new terminal"
    echo "spt             | spotify on term" 
    echo "tree            | files and directory viewer" 
    echo "bat             | cat with syntax highlight" 
    echo "tldr            | info about commands"
    echo "lsa             | exa -> ls with colors and icons"
    echo "fzf             | fuzzy finder"
    echo "awk             | text processing ps aux | awk '{print \$1}'"
    echo "slumber         | http client tui"
    echo "jnv             | read json files cat file.json | jnv"
    echo "stu             | read aws s3 on tui"
    echo "act             | github actions on local"
    echo "gh notify       | github notifications"
    echo "atuin           | search history term"  
}

print_neovim_table() {
    echo "\n"
    echo "NEOVIM            | Uso "
    echo "--------          |---------------------------------------------------------------------------------"
    echo "Telescope         | find list files and other things undo, git"
    echo "Neogit            | neogit for git actions"
    echo "lazygit           | lazygit ( inteface to git manager)"
    echo "Neogit            | neovim plugin manager git"
    echo "Octo              | neovim plugin manager pullrequests"
    echo "Vim surround      | around things"
    echo "Harpoon           | Save places on work"
    echo "Hop               | Motion jump wto words"
    echo "Diff              | merge tool"
    echo "Vim wiki          | journaly on neovim save things about current work leader + ww"
    echo "Glance            | view definitions, types, references"
    echo "AdvancedGitSearch | advanced git search, changes file and other things"


}
print_cli_table
print_neovim_table

# pnpm
export PNPM_HOME="/Users/$USER/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

eval "$(gh completion -s zsh)"
eval "$(gh copilot alias -- zsh)"
eval "$(atuin init zsh)"

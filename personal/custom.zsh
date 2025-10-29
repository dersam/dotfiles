# Define any custom environment scripts here.
# This file is loaded after everything else, but before Antigen is applied and ~/extra.zsh sourced.
# Put anything here that you want to exist on all your environment, and to have the highest priority
# over any other customization.

if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  _LIBERTY=''
  PROMPT=''
fi

# Claude Code
# read -r -d '' CLAUDE_CUSTOM_SYSTEM_PROMPT <<'EOF'
# You are never allowed to run `git` commands that change the working directory (e.g., commit, add, etc.).
# You may only run `git` commands that interrogate the state of the repo (e.g., log, status).
# You are never allowed to run `gt` commands of any kind.
# EOF
alias haiku="devx claude --model=haiku --dangerously-skip-permissions"
alias sonnet="devx claude --model=sonnet --dangerously-skip-permissions"
alias opus="devx claude --model=opus --dangerously-skip-permissions"

export MYSQL_EDITOR='mycli'

# This script is run every time you log in. It's the entrypoint for all shell environment config.
# Don't modify this file directly, or you'll remove your ability to update against new versions of
# the Shopify dotfiles. Any customizations should be done in the personal/ directory.

export DOTFILES_DIRECTORY_NAME=$([ $SPIN ] && echo "shopify-dotfiles" || echo "dotfiles")
export DF_HOME=~/$DOTFILES_DIRECTORY_NAME
export DF_CORE=$DF_HOME/core
export DF_USER=$DF_HOME/personal

# Create common color functions.
autoload -U colors
colors

# Set up custom environment variables
source $DF_CORE/environment.zsh
source $DF_USER/environment.zsh

# Load color helper variable definitions
source $DF_CORE/formatting.zsh

# Load configs for MacOS. Does nothing if not on MacOS
if [ "$ZSH_HOST_OS" = "darwin" ]; then
  [[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
  source $DF_CORE/macos.zsh
  if [ -e $DF_USER/macos.zsh ]; then
    source $DF_USER/macos.zsh
  fi
fi

# Load zsh plugins via Antigen
source $DF_CORE/default_bundles.zsh
source $DF_USER/antigen_bundles.zsh
antigen apply

source $DF_CORE/utils.zsh

# Load custom dircolors, if present
if [ -e $DF_USER/dircolors ]; then
  eval $(dircolors $DF_USER/dircolors)
fi

source $DF_CORE/filter_history.zsh

source $DF_USER/custom.zsh

# Load changes specific to this local environment.
source ~/extra.zsh
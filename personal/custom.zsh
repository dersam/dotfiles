# Define any custom environment scripts here.
# This file is loaded after everything else, but before Antigen is applied and ~/extra.zsh sourced.
# Put anything here that you want to exist on all your environment, and to have the highest priority
# over any other customization.

function spindb() {
    open "mysql://root@$(spin info fqdn):3306"
}

function spingraphiql() {
  open "https://app.$(spin info fqdn)/services/internal/shops/1/graphql"
}
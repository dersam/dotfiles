# Custom configs for MacOS environments.
# This file will only be executed if the current environment is MacOS.

function spindb() {
    open "mysql://root@$(spin info fqdn):3306"
}

function spingraphiql() {
  open "https://app.$(spin info fqdn)/services/internal/shops/1/graphql"
}
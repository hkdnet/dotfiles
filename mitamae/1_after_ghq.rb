execute "ghq get -p cli/cli"

gh_install_commands = [
  'cd ~/ghq/github.com/cli/cli',
  'make install',
]

execute gh_install_commands.join('&&') do
  not_if 'which gh'
end



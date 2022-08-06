package 'zsh' do
end

execute 'mkdir -p /tmp/starship && curl -sS https://starship.rs/install.sh > /tmp/starship/install.sh && sh /tmp/starship/install.sh -y' do
  not_if 'which starship'
end

package 'git' do
end

package 'tig' do
end

package 'golang-go' do
end

# include_recipe "docker::install"

execute 'apt-get install linux-image-generic-lts-trusty && reboot' do
  only_if 'cat /etc/lsb_release | grep -q DISTRIB_RELEASE=12 && dpkg -l | ! (grep -q linux-image-generic-lts-trusty)'
end

execute 'apt-get update' do
  not_if 'which docker'
end

package 'curl'
execute 'curl -sSL https://get.docker.com/ | sh' do
  not_if 'which docker'
end


DELTA_PACKAGE = 'https://github.com/dandavison/delta/releases/download/0.13.0/git-delta_0.13.0_amd64.deb'
DELTA_DEB = DELTA_PACKAGE.split('/').last
execute "mkdir -p /tmp/delta && cd /tmp/delta && curl -sSLO #{DELTA_PACKAGE} && dpkg -i #{DELTA_DEB}" do
  not_if 'which delta'
end

package 'peco'

git '/tmp/ghq' do
  repository 'https://github.com/x-motemen/ghq.git'
end

package 'make'

directory '/usr/local/bin'

execute 'cd /tmp/ghq && make install && mv ~/go/bin/ghq /usr/local/bin/ghq' do
  not_if 'which ghq'
end

def ghq(name)
  execute "ghq get -p #{name}"
end



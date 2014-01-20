# config valid only for Capistrano 3.1
lock '3.1.0'

set :rvm_ruby_string, '1.9.3'

# Install RVM and Ruby before deploy
before "deploy:setup", "rvm:install_rvm"
before "deploy:setup", "rvm:install_ruby"
 
require 'rvm/capistrano'
require 'bundler/capistrano'

server "89.221.14.220", :web, :app, :db, primary: true

set :application, "mehr-schulferien.de"
set :user, "deployer"
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:wintermeyer/#{application}.git"
set :repo_url, "git@github.com:wintermeyer/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :shared_children, shared_children + %w{public/downloads}

after 'deploy', 'deploy:cleanup'
after 'deploy', 'deploy:migrate'

namespace :deploy do
  %w[start stop restart reload].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "sudo /etc/init.d/unicorn-#{application} #{command}"
    end
  end
end


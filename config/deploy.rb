# config valid only for Capistrano 3.1
lock '3.1.0'

set :rvm_type, :user
set :rvm_ruby_version, '1.9.3-p429'

set :application, 'mehr-schulferien'
set :repo_url, 'git@github.com:wintermeyer/mehr-schulferien.de.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/mehr-schulferien.de'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system db/sandbox}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
      execute 'sudo /etc/init.d/unicorn-mehr-schulferien.de restart'

      # Warm-up the cache
      #
      year = 2014
      execute "curl --silent --output /dev/null http://mehr-schulferien.de"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/baden-wuerttemberg/years/#{year}"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/bayern/years/#{year}"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/berlin/years/#{year}"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/brandenburg/years/#{year}"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/bremen/years/#{year}"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/hamburg/years/#{year}"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/hessen/years/#{year}"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/mecklenburg-vorpommern/years/#{year}"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/niedersachsen/years/#{year}"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/nordrhein-westfalen/years/#{year}"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/rheinland-pfalz/years/#{year}"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/saarland/years/#{year}"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/sachsen/years/#{year}"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/sachsen-anhalt/years/#{year}"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/schleswig-holstein/years/#{year}"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/thueringen/years/#{year}"

      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/baden-wuerttemberg"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/bayern"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/berlin"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/brandenburg"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/bremen"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/hamburg"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/hessen"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/mecklenburg-vorpommern"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/niedersachsen"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/nordrhein-westfalen"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/rheinland-pfalz"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/saarland"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/sachsen"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/sachsen-anhalt"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/schleswig-holstein"
      execute "curl --silent --output /dev/null http://mehr-schulferien.de/federal_states/thueringen"

    end
  end

  desc "Check that we can access everything"
  task :check_write_permissions do
    on roles(:all) do |host|
      if test("[ -w #{fetch(:deploy_to)} ]")
        info "#{fetch(:deploy_to)} is writable on #{host}"
      else
        error "#{fetch(:deploy_to)} is not writable on #{host}"
      end
    end
  end

  desc "Check if agent forwarding is working"
  task :forwarding do
    on roles(:all) do |h|
      if test("env | grep SSH_AUTH_SOCK")
        info "Agent forwarding is up to #{h}"
      else
        error "Agent forwarding is NOT up to #{h}"
      end
    end
  end
end

namespace :deploy do
  desc "rake db:seed"
  task :seed do
    on roles(:all) do |host|
      execute "rake db:seed RAILS_ENV='production'"
    end
  end

  desc "rake db:reset"
  task :reset do
    on roles(:all) do |host|
      execute "rake db:reset RAILS_ENV='production'"
    end
  end
end
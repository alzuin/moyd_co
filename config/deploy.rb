set :application, 'moyd.co'
set :repo_url, 'https://github.com/Moydco/moyd_co.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
# set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5
set :linked_files, %w{config/settings.local.yml config/mongoid.yml config/newrelic.yml config/unicorn.rb config/initializers/devise.rb config/initializers/gibbon.rb config/initializers/quickbooks.rb config/initializers/stripe.rb}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      #execute "ln -nfs #{shared_path}/tmp #{release_path}/tmp"
      #execute "ln -nfs #{shared_path}/settings.local.yml #{release_path}/config/settings.local.yml"
      #execute "ln -nfs #{shared_path}/newrelic.yml #{release_path}/config/newrelic.yml"
      #execute :touch, "#{shared_path}/tmp/restart.txt"
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
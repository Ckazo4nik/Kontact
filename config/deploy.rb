require 'mina/rails'
require 'mina/git'
# require 'mina/rbenv'  # for rbenv support. (https://rbenv.org)
require 'mina/rvm'    # for rvm support. (https://rvm.io)
#require 'mina/multistage'

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)
set :execution_mode, :system
set :domain, '139.59.33.241'
set :user, 'deploy'
set :application_name, 'Konect'
set :deploy_to, '/home/deploy/Konect'
set :repository, 'https://github.com/Ckazo4nik/Kontact.git'


# Optional settings:
#   set :port, '30000'           # SSH port number.
set :forward_agent, true     # SSH forward_agent.
#set :ssh_options, '-A'

# Shared dirs and files will be symlinked into the app-folder by the 'deploy:link_shared_paths' step.
# Some plugins already add folders to shared_dirs like `mina/rails` add `public/assets`, `vendor/bundle` and many more
# run `mina -d` to see all folders and files already included in `shared_dirs` and `shared_files`
set :shared_dirs, fetch(:shared_dirs, []).push('tmp', 'log', 'public/uploads', 'public/system')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'public/uploads', 'config/secrets.yml', 'config/application.yml', 'config/production.sphinx.conf')

# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.
task :remote_environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For thos#e using RVM, use this to load an RVM version@gemset.
  invoke :'rvm:use', 'ruby 2.4.0@default'
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task setup: :environment do
  command %{mkdir -p "#{fetch(:shared_path)}/log"}
  command %{chmod g+rx,u+rwx "#{fetch(:shared_path)}/log"}

  command %{mkdir -p "#{fetch(:shared_path)}/config"}
  command %{chmod g+rx,u+rwx "#{fetch(:shared_path)}/config"}

  command %{touch "#{fetch(:shared_path)}/config/puma.rb"}
  command %{touch "#{fetch(:shared_path)}/config/database.yml"}
  command %{touch "#{fetch(:shared_path)}/config/secrets.yml"}
  command %{touch "#{fetch(:shared_path)}/config/production.sphinx.conf"}

  command %{mkdir -p "#{fetch(:shared_path)}/tmp/sockets"}
  command %{chmod g+rx,u+rwx "#{fetch(:shared_path)}/tmp/sockets"}
  command %{mkdir -p "#{fetch(:shared_path)}/tmp/pids"}
  command %{chmod g+rx,u+rwx "#{fetch(:shared_path)}/tmp/pids"}
end

desc 'Deploys the current version to the server.'
task :deploy do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        command %{mkdir -p tmp/}
        command %{touch tmp/restart.txt}
      end
    end
  end

  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end

# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
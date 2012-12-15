require "rvm/capistrano"
set :rvm_ruby_string, 'ruby-1.9.3-p327'
set :rvm_type, :user

set :application, "Wu"
set :repository,  "git@bitbucket.org:caiwangqin/Wu.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :deploy_via, :remote_cache
set :use_sudo, false

set :branch, "master"

# production server
# set :user, "ec2-user"
# ssh_options[:keys] = ["/Users/jesse/Scripts/jetlunsvn.pem"]
# set :branch, "master"
# set :deploy_to, "/home/ec2-user/#{application}"
# role :web, "ec2-184-73-163-105.compute-1.amazonaws.com"                          # Your HTTP server, Apache/etc
# role :app, "ec2-184-73-163-105.compute-1.amazonaws.com"                          # This may be the same as your `Web` server
# role :db,  "ec2-184-73-163-105.compute-1.amazonaws.com", :primary => true # This is where Rails migrations will run


# internal dailybuild server
set :user, "jesse"
set :deploy_to, "/home/jesse/#{application}"
set :password, "jetlun"
role :web, "192.168.8.254"                          # Your HTTP server, Apache/etc
role :app, "192.168.8.254"                          # This may be the same as your `Web` server
role :db,  "192.168.8.254", :primary => true # This is where Rails migrations will run


# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"
after "deploy:update_code", "bundler:create_symlink"
after "bundler:create_symlink", "bundler:install"
after "bundler:install", "deploy:assets:precompile"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do 
    run "cd #{current_path} ; bundle exec unicorn_rails -c config/unicorn.rb -D -E production"
  end
  task :stop do 
    run "kill -s QUIT `cat #{shared_path}/pids/unicorn.pid`"
  end
  # task :restart, :roles => :app, :except => { :no_release => true } do
    # run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  # end  
  desc "Zero-downtime restart of Unicorn"
  task :restart, :except => { :no_release => true } do
    run "kill -s USR2 `cat #{shared_path}/pids/unicorn.pid`"
  end
end

namespace :bundler do
  task :create_symlink, :roles => :app do
    run "ln -nfs #{File.join(shared_path,'/mongoid.yml')} #{File.join(release_path,'config','mongoid.yml')}"
    run "ln -nfs #{File.join(shared_path,'/production.rb')} #{File.join(release_path,'config','environments','production.rb')}"
    run "ln -nfs #{File.join(shared_path,'/unicorn.rb')} #{File.join(release_path,'config','unicorn.rb')}"
    
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(release_path, 'vendor','bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end

  task :install, :roles => :app do
    run "cd #{release_path} && bundle install --deployment"
  end
end
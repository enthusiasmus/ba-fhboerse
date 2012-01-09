set :application, "fhboerse"
set :repository,  "git@github.com:MMTLukas/fhboerse.git"

set :deploy_to, "/var/www/virthosts/fhboerse.mediacube.at"
set :port, "5412"
set :user, "deploy_fhboerse"
set :use_sudo, false
set :branch, "master"

ssh_options[:forward_agent] = true
default_run_options[:pty] = true
default_environment["LANG"] = "en_US.UTF-8"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "mediacube.at"				                # Your HTTP server, Apache/etc
role :app, "mediacube.at"                          		# This may be the same as your `Web` server
role :db,  "mediacube.at", :primary => true 			# This is where Rails migrations will run

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :copy_config do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  
  #updating the crontab commands
  #desc "Update the crontab file"
  task :update_crontab, :roles => :db do
    run "cd #{release_path} && whenever --update-crontab #{application}"
  end
  
end

require "bundler/capistrano"

load 'deploy/assets'

after "deploy:update_code", "deploy:copy_config"

#updating the crontab commands
after "deploy:copy_config", "deploy:update_crontab"
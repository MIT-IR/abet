# config valid only for current version of Capistrano
lock "3.8.1"

set :application, "outcomes"
set :repo_url, "git@github.com:MIT-IR/abet.git"
set :log_level, :info

after :deploy, "deploy:restart"

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
end

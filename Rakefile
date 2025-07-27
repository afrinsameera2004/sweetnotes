# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

Rake::Task["css:install"].clear if Rake::Task.task_defined?("css:install")


require_relative "config/application"

Rails.application.load_tasks

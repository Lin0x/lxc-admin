source 'https://rubygems.org'

gem 'rails', '4.2.0'

gem 'sqlite3'

gem 'sass-rails'
gem 'bootstrap-sass'
gem 'simple_form'

gem 'jquery-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'turbolinks'

group :development do
  gem 'spring'
end

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'
end

gem 'ruby-lxc', github: 'lxc/ruby-lxc', require: 'lxc' unless RUBY_PLATFORM =~ /darwin|win32/
gem 'linux_proc_mem'

gem 'sidekiq'
gem 'sinatra', require: false # for sidekiq web ui

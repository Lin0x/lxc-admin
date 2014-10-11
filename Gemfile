source 'https://rubygems.org'

gem 'rails', '4.2.0.beta2'

gem 'sqlite3'

gem 'sass-rails', '~> 5.0.0.beta1'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'simple_form', '~> 3.1.0.rc2'

gem 'jquery-rails'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks'

group :development do
  gem 'spring'
  gem 'web-console', '~> 2.0.0.beta2'
end

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '~> 3.0.0'
end

gem 'ruby-lxc', github: 'lxc/ruby-lxc', require: 'lxc' unless RUBY_PLATFORM =~ /darwin|win32/
gem 'linux_proc_mem'

gem 'sidekiq'
gem 'sinatra', require: false # for sidekiq web ui

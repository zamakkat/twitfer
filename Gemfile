source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '4.2.6'

gem 'puma'
gem 'pg', '~> 0.15'

# Front-end
gem 'slim-rails'
gem 'bootstrap-sass'
gem 'sass-rails'
gem 'font-awesome-sass'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'rails_utils'

# Jobs
gem 'redis'
gem 'hiredis'
gem 'sidekiq'
gem 'sidekiq-unique-jobs'
gem 'sinatra', require: false

# App specific
gem 'twitter'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'foreman'

  # Guards
  gem 'guard-rspec', require: false
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'terminal-notifier-guard'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

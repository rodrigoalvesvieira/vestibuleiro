ruby "2.2.2"

source 'https://rubygems.org'

gem 'kaminari'

gem 'delayed_job_mongoid'

# Use mongoid-paperclip for files
gem 'mongoid-paperclip', require: 'mongoid_paperclip'
gem 'aws-sdk', '~> 1.3.4'
gem 'paperclip', '4.2.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'

# Use MongoDB as database
gem 'mongoid', '~> 4.0.2'

# Use ElasticSearch
gem 'elasticsearch-model'
gem 'elasticsearch-rails'

# Use Devise for authentication
gem 'devise', '~> 3.4.1'

# Use Pundit for authorization
gem 'pundit', '~> 1.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'twitter-bootstrap-rails', '~> 3.2.0'

gem 'tabulous'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

platforms :ruby do # linux
  # Use Unicorn as the app server
  gem 'unicorn', '~> 4.8.3'
  
  #Use therubyracer for Javascript runtime
  gem 'therubyracer'
end

gem 'tzinfo-data'

gem 'active_model_serializers', '~> 0.9.3'

group :development, :test do
  gem 'wirble'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Testing gems
  gem 'rspec-rails', '~> 3.2.1'
  # For fixtures/factories
  gem 'fabrication', '~> 2.12.2'
  # For generating fake data
  gem 'faker', '~> 1.4.3'
end

group :production do
  gem 'rails_12factor'
end

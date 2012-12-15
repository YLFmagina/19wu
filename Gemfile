source 'https://rubygems.org'
# source 'http://ruby.taobao.org'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gem 'sqlite3'
gem "mongoid", "~> 3.0.0"
# user system
gem 'devise'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
# Embed the V8 JavaScript interpreter into Ruby.
gem 'therubyracer'
group :libv8 do
  gem 'libv8', "~> 3.11.8"
end
gem 'less-rails'
gem 'twitter-bootstrap-rails', :git => "git://github.com/toadkicker/twitter-bootstrap-rails.git"
# A Rails form builder plugin with semantically rich and accessible markup.
gem 'formtastic'
gem 'formtastic-bootstrap'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'
gem 'newrelic_rpm'

# To use debugger
# gem 'debugger'

gem 'exception_notification'

group :development, :test do
  gem 'rspec-rails'
  gem "guard-rspec"
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'capybara'
  gem 'factory_girl_rails'
  # keep test database clean
  gem 'database_cleaner'
  # generate report in hudson ci 
  gem 'rcov', '0.9.11'
  gem 'metrical'
  # gem 'metric_fu'
  gem 'ci_reporter'
end
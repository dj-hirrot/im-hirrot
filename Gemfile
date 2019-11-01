source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.2'

gem 'rails', '~> 5.2.1'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

# bootstrap
gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'

# devise
gem 'devise'

# dotfile
gem 'dotenv-rails'

# mark down
gem 'redcarpet', '~> 2.3.0'
gem 'coderay'
gem 'rouge'

# tags
gem 'acts-as-taggable-on'

# SEO
gem 'meta-tags'
gem 'social-share-button'

# pagenation
gem 'kaminari', '~> 0.17.0'

group :development, :test do
  gem 'mysql2', '>= 0.4.4', '< 0.6.0'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'letter_opener_web'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

group :production do
  gem 'pg', '0.20.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

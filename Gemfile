# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'capybara'
gem 'launchy'
gem 'pg'
gem 'rspec'
gem 'sinatra'
gem 'sinatra-contrib'

group :development, :test do 
  gem 'rubocop', '1.20'
end

group :test do 
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

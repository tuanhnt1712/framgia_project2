source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "coffee-rails", "~> 4.2"
gem "config", "1.2.1"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "mysql2", ">= 0.3.18", "< 0.5"
gem "puma", "~> 3.0"
gem "rails", "~> 5.0.4"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "autoprefixer-rails"
  gem "better_errors"
  gem "bundler-audit"
  gem "brakeman", require: false
  gem "byebug", platform: :mri
  gem "database_cleaner"
  gem "eslint-rails"
  gem "factory_girl_rails"
  gem "guard-rspec", require: false
  gem "jshint"
  gem "rspec"
  gem "railroady"
  gem "rails_best_practices"
  gem "reek"
  gem "rspec-rails"
  gem "rspec-collection_matchers"
  gem "rubocop", "~> 0.35.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "scss_lint", require: false
  gem "scss_lint_reporter_checkstyle", require: false
end

group :development do
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
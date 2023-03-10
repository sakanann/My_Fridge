source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'

  #RSpecのインストール
  gem 'rspec-rails', '~> 4.0.1'
  gem 'factory_bot_rails'
  # gem 'rexml'

  gem 'capistrano', '3.16.0' # capistranoのツール一式 AWSデプロイ用
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'letter_opener_web'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'

  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'devise'
gem 'rexml'
#Ruby3系でdeviseを使用するにはrexmlもいれる　xmlファイルを読み込むために必要
gem 'devise-i18n'
#国際化の為 導入

gem 'rails_admin', '~> 3.0'
#管理者権限Gem

gem 'cancancan'
#アクセス制限のGem
gem "simple_calendar", "~> 2.4"
#Ruby on Rails アプリのカレンダー

gem 'dotenv-rails'
#環境変数を扱うために必要 .env
gem 'google-apis-drive_v3',  require: 'google/apis/youtube_v3'
#youtube apiのためのもの
gem 'google-api-client', '~> 0.11'

gem 'ransack'
#検索絹・並び替えソート機能


gem 'net-smtp'
gem 'net-imap'
gem 'net-pop'
#Bootstrapの導入
gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'

gem 'unicorn' # アプリケーションサーバのunicorn

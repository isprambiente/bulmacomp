source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in bulmacomp.gemspec.
gemspec

# Start debugger with binding.b [https://github.com/ruby/debug]
# gem "debug", ">= 1.0.0"
group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end
                             
group :development do
  gem 'rubocop-rails', require: false
  gem 'yard'      
end                                                                                                                    
group :test do
  gem 'capybara'
end

gem 'view_component'

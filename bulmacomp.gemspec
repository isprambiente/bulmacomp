# frozen_string_literal: true

require_relative 'lib/bulmacomp/version'

Gem::Specification.new do |spec|
  spec.name        = 'bulmacomp'
  spec.version     = Bulmacomp::VERSION
  spec.authors     = ['MDreW']
  spec.email       = ['andrea.ranaldi@gmail.com']
  spec.homepage    = 'https://github.com/isprambiente/bulmacomp'
  spec.summary     = "Rails 'View Components' for Bulma"
  spec.description = 'Collection of view components for bulma css framework'
  spec.required_ruby_version = '>= 3.0.0'
  spec.license = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/isprambiente/bulmacomp'
  spec.metadata['changelog_uri'] = 'https://github.com/isprambiente/bulmacomp'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'rails', '>= 7.0'
  spec.add_dependency 'view_component', '>= 3.9.0'
end

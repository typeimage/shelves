require 'shelves/version'

module Shelves
  autoload :CLI, 'shelves/cli'

  # Returns the path to the root of the project.
  def self.root
    @root_path ||= File.expand_path '../..', __FILE__
  end

  # Returns the path to the main stylesheets directory.
  def self.stylesheets_path
    @stylesheets_path ||= File.join root, 'scss'
  end
end

if defined?(::Rails)
  require 'shelves/extensions/rails'
elsif defined?(::Sprockets) && Sprockets.respond_to?(:append_path)
  require 'shelves/extensions/sprockets'
elsif defined?(::Compass)
  require 'shelves/extensions/compass'
end

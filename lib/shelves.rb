require 'shelves/version'

module Shelves
  # Returns the path to the root of the project.
  def self.root
    @root_path ||= File.expand_path '../..', __FILE__
  end
  
  # Returns the path to the main stylesheets directory.
  def self.stylesheets_path
    @stylesheets_path ||= File.join root, 'scss'
  end
end

if defined? ::Rails
  require 'shelves/extensions/rails'
elsif defined? ::Sprockets::Plugin
  require 'shelves/extensions/sprockets'
elsif defined? ::Sprockets && Sprockets.respond_to?(:append_path)
  Sprockets.append_path Shelves.stylesheets_path
else
  require 'shelves/extensions/compass'
end

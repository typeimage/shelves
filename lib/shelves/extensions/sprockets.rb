require 'sprockets/plugin'

module Shelves
  module Extensions
    class Sprockets < ::Sprockets::Plugin
      append_path Shelves.stylesheets_path
    end
  end
end

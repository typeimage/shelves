require 'rails/engine'

module Shelves
  module Extensions
    class Rails < ::Rails::Engine
      initializer :append_shelves_asset_path, :after => :append_assets_path, :group => :all do |app|
        app.config.assets.paths.unshift Shelves.stylesheets_path
      end
    end
  end
end

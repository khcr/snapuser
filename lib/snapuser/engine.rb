module Snapuser
  class Engine < ::Rails::Engine
    require 'snaptable'

    initializer "Snapuser.append_migrations" do |app|
      config.paths["db/migrate"].expanded.each do |expanded_path|
        app.config.paths["db/migrate"] << expanded_path
      end
    end

    initializer 'Snapuser.action_controller' do |app|
      ActionController::Base.send :include, SessionsHelper
    end
  end
end
